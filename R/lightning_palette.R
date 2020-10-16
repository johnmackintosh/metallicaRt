lightning_palette <- c("#030305", "#1D1638", "#090712", "#1E183C", "#FBFFFF",
                       "#20255F", "#233776", "#3A5A93", "#9CAAC7", "#6A84B7")

#' @title lightning palette
#' @description lightning palette
#' @inheritDotParams ggplot2::discrete_scale
#' @param n number of colors
#' @param type discrete or continuous
#' @param reverse reverse order, Default: FALSE
#' @rdname lightning_pal
#' @examples
#' library(scales)
#' show_col(lightning_pal()(10))
#' @export
#' @importFrom scales manual_pal
#' @importFrom glue glue
#' @importFrom grDevices colorRampPalette

lightning_pal <- function(n, type = c("discrete", "continuous"),
                       reverse = FALSE){
  lightning <- lightning_palette
  
  if (reverse == TRUE) {
    lightning <- rev(lightning)
  }
  
  if (missing(n)) {
    n <- length(lightning)
  }
  
  type <- match.arg(type)
  
  if (type == "discrete" && n > length(lightning)) {
    stop(glue::glue("Palette does not have {n} colors, maximum is {length(lightning)}!"))
  }
  
  lightning <- switch(type,
                   continuous = grDevices::colorRampPalette(lightning)(n),
                   discrete = lightning[1:n])
  
  lightning <- scales::manual_pal(lightning)
  
  return(lightning)
}

#' @title scale_color_lightning
#' @rdname lightning_pal
#' @export
#' @examples
#'
#' library(ggplot2)
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_color_lightning()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_color_lightning <- function(n, type = "discrete",
                               reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("color", "lightning",
                            lightning_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_color_gradientn(colors = lightning_pal(n = n, type = type,
                                                       reverse = reverse)(8))
  }
}

#' @title scale_colour_lightning
#' @rdname lightning_pal
#' @export
#' @examples
#'
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_colour_lightning()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_colour_lightning <- scale_color_lightning

#' @title scale_fill_lightning
#' @rdname lightning_pal
#' @export
#' @examples
#'
#' ggplot(mpg, aes(displ)) +
#'     geom_histogram(aes(fill = class),
#'                    col = "black", size = 0.1) +
#'     scale_fill_lightning()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn

scale_fill_lightning <- function(n, type = "discrete",
                              reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("fill", "lightning",
                            lightning_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_fill_gradientn(colors = lightning_pal(n = n, type = type,
                                                      reverse = reverse)(10))
  }
}
