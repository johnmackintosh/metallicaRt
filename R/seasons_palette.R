seasons_palette <- c("#fffba8", "#E8E690", "#ffff01", "#EDEA15", "#CDC6B3", 
                     "#888752", "#836800", "#b39c00", "#2A230F",  "#000000")



#' @title seasons palette
#' @description seasons palette
#' @inheritDotParams ggplot2::discrete_scale
#' @param n number of colors
#' @param type discrete or continuous
#' @param reverse reverse order, Default: FALSE
#' @rdname seasons_pal
#' @examples
#' library(scales)
#' show_col(seasons_pal()(10),labels = FALSE)
#' @export
#' @importFrom scales manual_pal
#' @importFrom glue glue
#' @importFrom grDevices colorRampPalette

seasons_pal <- function(n, type = c("discrete", "continuous"),
                        reverse = FALSE){
  seasons <- seasons_palette
  
  if (reverse == TRUE) {
    seasons <- rev(seasons)
  }
  
  if (missing(n)) {
    n <- length(seasons)
  }
  
  type <- match.arg(type)
  
  if (type == "discrete" && n > length(seasons)) {
    stop(glue::glue("Palette does not have {n} colors, maximum is {length(seasons)}!"))
  }
  
  seasons <- switch(type,
                    continuous = grDevices::colorRampPalette(seasons)(n),
                    discrete = seasons[1:n])
  
  seasons <- scales::manual_pal(seasons)
  
  return(seasons)
}

#' @title scale_color_seasons
#' @rdname seasons_pal
#' @export
#' @examples
#'
#' library(ggplot2)
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_color_seasons()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_color_seasons <- function(n, type = "discrete",
                                reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("color", "seasons",
                            seasons_pal(n = n, type = type,
                                        reverse = reverse), ...)
  } else {
    ggplot2::scale_color_gradientn(colors = seasons_pal(n = n, type = type,
                                                        reverse = reverse)(8))
  }
}

#' @title scale_colour_seasons
#' @rdname seasons_pal
#' @export
#' @examples
#'
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_colour_seasons()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_colour_seasons <- scale_color_seasons

#' @title scale_fill_seasons
#' @rdname seasons_pal
#' @export
#' @examples
#'
#' ggplot(mpg, aes(displ)) +
#'     geom_histogram(aes(fill = class),
#'                    col = "black", size = 0.1) +
#'     scale_fill_seasons()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn

scale_fill_seasons <- function(n, type = "discrete",
                               reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("fill", "seasons",
                            seasons_pal(n = n, type = type,
                                        reverse = reverse), ...)
  } else {
    ggplot2::scale_fill_gradientn(colors = seasons_pal(n = n, type = type,
                                                       reverse = reverse)(10))
  }
}
