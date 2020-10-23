load_palette <-  c("#000000", "#101010", "#B1B1B1", "#FFFFFF", "#717171", 
                   "#393939", "#B30020", "#FF5C4E", "#ED4D3F", "#E89466")

#' @title load palette
#' @description load palette
#' @inheritDotParams ggplot2::discrete_scale
#' @param n number of colors
#' @param type discrete or continuous
#' @param reverse reverse order, Default: FALSE
#' @rdname load_pal
#' @examples
#' library(scales)
#' show_col(load_pal()(10),labels = FALSE)
#' @export
#' @importFrom scales manual_pal
#' @importFrom glue glue
#' @importFrom grDevices colorRampPalette

load_pal <- function(n, type = c("discrete", "continuous"),
                       reverse = FALSE){
  load <- load_palette
  
  if (reverse == TRUE) {
    load <- rev(load)
  }
  
  if (missing(n)) {
    n <- length(load)
  }
  
  type <- match.arg(type)
  
  if (type == "discrete" && n > length(load)) {
    stop(glue::glue("Palette does not have {n} colors, maximum is {length(load)}!"))
  }
  
  load <- switch(type,
                   continuous = grDevices::colorRampPalette(load)(n),
                   discrete = load[1:n])
  
  load <- scales::manual_pal(load)
  
  return(load)
}

#' @title scale_color_load
#' @rdname load_pal
#' @export
#' @examples
#'
#' library(ggplot2)
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_color_load()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_color_load <- function(n, type = "discrete",
                               reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("color", "load",
                            load_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_color_gradientn(colors = load_pal(n = n, type = type,
                                                       reverse = reverse)(8))
  }
}

#' @title scale_colour_load
#' @rdname load_pal
#' @export
#' @examples
#'
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_colour_load()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_colour_load <- scale_color_load

#' @title scale_fill_load
#' @rdname load_pal
#' @export
#' @examples
#'
#' ggplot(mpg, aes(displ)) +
#'     geom_histogram(aes(fill = class),
#'                    col = "black", size = 0.1) +
#'     scale_fill_load()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn

scale_fill_load <- function(n, type = "discrete",
                              reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("fill", "load",
                            load_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_fill_gradientn(colors = load_pal(n = n, type = type,
                                                      reverse = reverse)(10))
  }
}
