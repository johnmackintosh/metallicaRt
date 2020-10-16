hardwired_palette <- c("#FFFFFF", "#000000", "#440000", "#353535", "#ACACAC" ,
                       "#7B0000", "#585858" , "#6D450A" ,"#C19824", "#C05A41")

#' @title hardwired palette
#' @description hardwired palette
#' @inheritDotParams ggplot2::discrete_scale
#' @param n number of colors
#' @param type discrete or continuous
#' @param reverse reverse order, Default: FALSE
#' @rdname hardwired_pal
#' @examples
#' library(scales)
#' show_col(hardwired_pal()(10))
#' @export
#' @importFrom scales manual_pal
#' @importFrom glue glue
#' @importFrom grDevices colorRampPalette

hardwired_pal <- function(n, type = c("discrete", "continuous"),
                       reverse = FALSE){
  hardwired <- hardwired_palette
  
  if (reverse == TRUE) {
    hardwired <- rev(hardwired)
  }
  
  if (missing(n)) {
    n <- length(hardwired)
  }
  
  type <- match.arg(type)
  
  if (type == "discrete" && n > length(hardwired)) {
    stop(glue::glue("Palette does not have {n} colors, maximum is {length(hardwired)}!"))
  }
  
  hardwired <- switch(type,
                   continuous = grDevices::colorRampPalette(hardwired)(n),
                   discrete = hardwired[1:n])
  
  hardwired <- scales::manual_pal(hardwired)
  
  return(hardwired)
}

#' @title scale_color_hardwired
#' @rdname hardwired_pal
#' @export
#' @examples
#'
#' library(ggplot2)
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_color_hardwired()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_color_hardwired <- function(n, type = "discrete",
                               reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("color", "hardwired",
                            hardwired_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_color_gradientn(colors = hardwired_pal(n = n, type = type,
                                                       reverse = reverse)(8))
  }
}

#' @title scale_colour_hardwired
#' @rdname hardwired_pal
#' @export
#' @examples
#'
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_colour_hardwired()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_colour_hardwired <- scale_color_hardwired

#' @title scale_fill_hardwired
#' @rdname hardwired_pal
#' @export
#' @examples
#'
#' ggplot(mpg, aes(displ)) +
#'     geom_histogram(aes(fill = class),
#'                    col = "black", size = 0.1) +
#'     scale_fill_hardwired()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn

scale_fill_hardwired <- function(n, type = "discrete",
                              reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("fill", "hardwired",
                            hardwired_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_fill_gradientn(colors = hardwired_pal(n = n, type = type,
                                                      reverse = reverse)(10))
  }
}
