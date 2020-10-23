reload_palette <-  c("#000000", "#A8A8A8", "#AE0115", "#FFFFFF", "#FDC101", 
                     "#FD8900", "#808080", "#CF0010", "#FA4500", "#2D1219")

#' @title reload palette
#' @description reload palette
#' @inheritDotParams ggplot2::discrete_scale
#' @param n number of colors
#' @param type discrete or continuous
#' @param reverse reverse order, Default: FALSE
#' @rdname reload_pal
#' @examples
#' library(scales)
#' show_col(reload_pal()(10),labels = FALSE)
#' @export
#' @importFrom scales manual_pal
#' @importFrom glue glue
#' @importFrom grDevices colorRampPalette

reload_pal <- function(n, type = c("discrete", "continuous"),
                     reverse = FALSE){
  reload <- reload_palette
  
  if (reverse == TRUE) {
    reload <- rev(reload)
  }
  
  if (missing(n)) {
    n <- length(reload)
  }
  
  type <- match.arg(type)
  
  if (type == "discrete" && n > length(reload)) {
    stop(glue::glue("Palette does not have {n} colors, maximum is {length(reload)}!"))
  }
  
  reload <- switch(type,
                 continuous = grDevices::colorRampPalette(reload)(n),
                 discrete = reload[1:n])
  
  reload <- scales::manual_pal(reload)
  
  return(reload)
}

#' @title scale_color_reload
#' @rdname reload_pal
#' @export
#' @examples
#'
#' library(ggplot2)
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_color_reload()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_color_reload <- function(n, type = "discrete",
                             reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("color", "reload",
                            reload_pal(n = n, type = type,
                                     reverse = reverse), ...)
  } else {
    ggplot2::scale_color_gradientn(colors = reload_pal(n = n, type = type,
                                                     reverse = reverse)(8))
  }
}

#' @title scale_colour_reload
#' @rdname reload_pal
#' @export
#' @examples
#'
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_colour_reload()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_colour_reload <- scale_color_reload

#' @title scale_fill_reload
#' @rdname reload_pal
#' @export
#' @examples
#'
#' ggplot(mpg, aes(displ)) +
#'     geom_histogram(aes(fill = class),
#'                    col = "black", size = 0.1) +
#'     scale_fill_reload()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn

scale_fill_reload <- function(n, type = "discrete",
                            reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("fill", "reload",
                            reload_pal(n = n, type = type,
                                     reverse = reverse), ...)
  } else {
    ggplot2::scale_fill_gradientn(colors = reload_pal(n = n, type = type,
                                                    reverse = reverse)(10))
  }
}
