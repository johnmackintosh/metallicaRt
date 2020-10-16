combo_palette <-  c("#9a9693","#e3e3d1", "#a9aec0", "#39497d", "#61a28b",
                    "#fba104", "#f24108", "#582017", "#8C031F", "#000000")

#' @title combo palette
#' @description combo palette
#' @inheritDotParams ggplot2::discrete_scale
#' @param n number of colors
#' @param type discrete or continuous
#' @param reverse reverse order, Default: FALSE
#' @rdname combo_pal
#' @examples
#' library(scales)
#' show_col(combo_pal()(10))
#' @export
#' @importFrom scales manual_pal
#' @importFrom glue glue
#' @importFrom grDevices colorRampPalette

combo_pal <- function(n, type = c("discrete", "continuous"),
                       reverse = FALSE){
  combo <- combo_palette
  
  if (reverse == TRUE) {
    combo <- rev(combo)
  }
  
  if (missing(n)) {
    n <- length(combo)
  }
  
  type <- match.arg(type)
  
  if (type == "discrete" && n > length(combo)) {
    stop(glue::glue("Palette does not have {n} colors, maximum is {length(combo)}!"))
  }
  
  combo <- switch(type,
                   continuous = grDevices::colorRampPalette(combo)(n),
                   discrete = combo[1:n])
  
  combo <- scales::manual_pal(combo)
  
  return(combo)
}

#' @title scale_color_combo
#' @rdname combo_pal
#' @export
#' @examples
#'
#' library(ggplot2)
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_color_combo()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_color_combo <- function(n, type = "discrete",
                               reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("color", "combo",
                            combo_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_color_gradientn(colors = combo_pal(n = n, type = type,
                                                       reverse = reverse)(8))
  }
}

#' @title scale_colour_combo
#' @rdname combo_pal
#' @export
#' @examples
#'
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_colour_combo()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_colour_combo <- scale_color_combo

#' @title scale_fill_combo
#' @rdname combo_pal
#' @export
#' @examples
#'
#' ggplot(mpg, aes(displ)) +
#'     geom_histogram(aes(fill = class),
#'                    col = "black", size = 0.1) +
#'     scale_fill_combo()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn

scale_fill_combo <- function(n, type = "discrete",
                              reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("fill", "combo",
                            combo_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_fill_gradientn(colors = combo_pal(n = n, type = type,
                                                      reverse = reverse)(10))
  }
}
