anger_palette <-  c("#E3001E", "#FE4002", "#000600", "#E70024", "#F3ABB9", 
                    "#1B0000", "#FF0025", "#4B0000", "#882600", "#AE3000")

#' @title anger palette
#' @description anger palette
#' @inheritDotParams ggplot2::discrete_scale
#' @param n number of colors
#' @param type discrete or continuous
#' @param reverse reverse order, Default: FALSE
#' @rdname anger_pal
#' @examples
#' library(scales)
#' show_col(anger_pal()(10))
#' @export
#' @importFrom scales manual_pal
#' @importFrom glue glue
#' @importFrom grDevices colorRampPalette

anger_pal <- function(n, type = c("discrete", "continuous"),
                       reverse = FALSE){
  anger <- anger_palette
  
  if (reverse == TRUE) {
    anger <- rev(anger)
  }
  
  if (missing(n)) {
    n <- length(anger)
  }
  
  type <- match.arg(type)
  
  if (type == "discrete" && n > length(anger)) {
    stop(glue::glue("Palette does not have {n} colors, maximum is {length(anger)}!"))
  }
  
  anger <- switch(type,
                   continuous = grDevices::colorRampPalette(anger)(n),
                   discrete = anger[1:n])
  
  anger <- scales::manual_pal(anger)
  
  return(anger)
}

#' @title scale_color_anger
#' @rdname anger_pal
#' @export
#' @examples
#'
#' library(ggplot2)
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_color_anger()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_color_anger <- function(n, type = "discrete",
                               reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("color", "anger",
                            anger_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_color_gradientn(colors = anger_pal(n = n, type = type,
                                                       reverse = reverse)(8))
  }
}

#' @title scale_colour_anger
#' @rdname anger_pal
#' @export
#' @examples
#'
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_colour_anger()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_colour_anger <- scale_color_anger

#' @title scale_fill_anger
#' @rdname anger_pal
#' @export
#' @examples
#'
#' ggplot(mpg, aes(displ)) +
#'     geom_histogram(aes(fill = class),
#'                    col = "black", size = 0.1) +
#'     scale_fill_anger()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn

scale_fill_anger <- function(n, type = "discrete",
                              reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("fill", "anger",
                            anger_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_fill_gradientn(colors = anger_pal(n = n, type = type,
                                                      reverse = reverse)(10))
  }
}
