puppets_palette <- c("#000000", "#FFFFFF", "#8C031F", "#CDC6B3", "#330B09",
                     "#9895A0", "#AD4000", "#55311B", "#6F6F6F", "#9D8D74")

#' @title puppets palette
#' @description puppets palette
#' @inheritDotParams ggplot2::discrete_scale
#' @param n number of colors
#' @param type discrete or continuous
#' @param reverse reverse order, Default: FALSE
#' @rdname puppets_pal
#' @examples
#' library(scales)
#' show_col(puppets_pal()(10))
#' @export
#' @importFrom scales manual_pal
#' @importFrom glue glue
#' @importFrom grDevices colorRampPalette

puppets_pal <- function(n, type = c("discrete", "continuous"),
                       reverse = FALSE){
  puppets <- puppets_palette
  
  if (reverse == TRUE) {
    puppets <- rev(puppets)
  }
  
  if (missing(n)) {
    n <- length(puppets)
  }
  
  type <- match.arg(type)
  
  if (type == "discrete" && n > length(puppets)) {
    stop(glue::glue("Palette does not have {n} colors, maximum is {length(puppets)}!"))
  }
  
  puppets <- switch(type,
                   continuous = grDevices::colorRampPalette(puppets)(n),
                   discrete = puppets[1:n])
  
  puppets <- scales::manual_pal(puppets)
  
  return(puppets)
}

#' @title scale_color_puppets
#' @rdname puppets_pal
#' @export
#' @examples
#'
#' library(ggplot2)
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_color_puppets()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_color_puppets <- function(n, type = "discrete",
                               reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("color", "puppets",
                            puppets_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_color_gradientn(colors = puppets_pal(n = n, type = type,
                                                       reverse = reverse)(8))
  }
}

#' @title scale_colour_puppets
#' @rdname puppets_pal
#' @export
#' @examples
#'
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_colour_puppets()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_colour_puppets <- scale_color_puppets

#' @title scale_fill_puppets
#' @rdname puppets_pal
#' @export
#' @examples
#'
#' ggplot(mpg, aes(displ)) +
#'     geom_histogram(aes(fill = class),
#'                    col = "black", size = 0.1) +
#'     scale_fill_puppets()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn

scale_fill_puppets <- function(n, type = "discrete",
                              reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("fill", "puppets",
                            puppets_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_fill_gradientn(colors = puppets_pal(n = n, type = type,
                                                      reverse = reverse)(10))
  }
}
