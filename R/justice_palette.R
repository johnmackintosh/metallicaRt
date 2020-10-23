justice_palette <- c("#FFFFEC", "#F3F2DE", "#D7D9CC", "#000200", "#D2D4C7", 
                     "#BDBEB0", "#A1A7A3", "#7E8985", "#535E5A", "#2B3F46")

#' @title justice palette
#' @description justice palette
#' @inheritDotParams ggplot2::discrete_scale
#' @param n number of colors
#' @param type discrete or continuous
#' @param reverse reverse order, Default: FALSE
#' @rdname justice_pal
#' @examples
#' library(scales)
#' show_col(justice_pal()(10),labels = FALSE)
#' @export
#' @importFrom scales manual_pal
#' @importFrom glue glue
#' @importFrom grDevices colorRampPalette

justice_pal <- function(n, type = c("discrete", "continuous"),
                       reverse = FALSE){
  justice <- justice_palette
  
  if (reverse == TRUE) {
    justice <- rev(justice)
  }
  
  if (missing(n)) {
    n <- length(justice)
  }
  
  type <- match.arg(type)
  
  if (type == "discrete" && n > length(justice)) {
    stop(glue::glue("Palette does not have {n} colors, maximum is {length(justice)}!"))
  }
  
  justice <- switch(type,
                   continuous = grDevices::colorRampPalette(justice)(n),
                   discrete = justice[1:n])
  
  justice <- scales::manual_pal(justice)
  
  return(justice)
}

#' @title scale_color_justice
#' @rdname justice_pal
#' @export
#' @examples
#'
#' library(ggplot2)
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_color_justice()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_color_justice <- function(n, type = "discrete",
                               reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("color", "justice",
                            justice_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_color_gradientn(colors = justice_pal(n = n, type = type,
                                                       reverse = reverse)(8))
  }
}

#' @title scale_colour_justice
#' @rdname justice_pal
#' @export
#' @examples
#'
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_colour_justice()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_colour_justice <- scale_color_justice

#' @title scale_fill_justice
#' @rdname justice_pal
#' @export
#' @examples
#'
#' ggplot(mpg, aes(displ)) +
#'     geom_histogram(aes(fill = class),
#'                    col = "black", size = 0.1) +
#'     scale_fill_justice()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn

scale_fill_justice <- function(n, type = "discrete",
                              reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("fill", "justice",
                            justice_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_fill_gradientn(colors = justice_pal(n = n, type = type,
                                                      reverse = reverse)(10))
  }
}
