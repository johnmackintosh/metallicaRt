magnetic_palette <-  c("#FFFFFD", "#030000", "#F3F2F0", "#E0DCD9", "#231C16",
                       "#B9B5B2", "#9C9895", "#8D8986", "#54504D", "#484441")

#' @title magnetic palette
#' @description magnetic palette
#' @inheritDotParams ggplot2::discrete_scale
#' @param n number of colors
#' @param type discrete or continuous
#' @param reverse reverse order, Default: FALSE
#' @rdname magnetic_pal
#' @examples
#' library(scales)
#' show_col(magnetic_pal()(10),labels = FALSE)
#' @export
#' @importFrom scales manual_pal
#' @importFrom glue glue
#' @importFrom grDevices colorRampPalette

magnetic_pal <- function(n, type = c("discrete", "continuous"),
                       reverse = FALSE){
  magnetic <- magnetic_palette
  
  if (reverse == TRUE) {
    magnetic <- rev(magnetic)
  }
  
  if (missing(n)) {
    n <- length(magnetic)
  }
  
  type <- match.arg(type)
  
  if (type == "discrete" && n > length(magnetic)) {
    stop(glue::glue("Palette does not have {n} colors, maximum is {length(magnetic)}!"))
  }
  
  magnetic <- switch(type,
                   continuous = grDevices::colorRampPalette(magnetic)(n),
                   discrete = magnetic[1:n])
  
  magnetic <- scales::manual_pal(magnetic)
  
  return(magnetic)
}

#' @title scale_color_magnetic
#' @rdname magnetic_pal
#' @export
#' @examples
#'
#' library(ggplot2)
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_color_magnetic()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_color_magnetic <- function(n, type = "discrete",
                               reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("color", "magnetic",
                            magnetic_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_color_gradientn(colors = magnetic_pal(n = n, type = type,
                                                       reverse = reverse)(8))
  }
}

#' @title scale_colour_magnetic
#' @rdname magnetic_pal
#' @export
#' @examples
#'
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_colour_magnetic()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_colour_magnetic <- scale_color_magnetic

#' @title scale_fill_magnetic
#' @rdname magnetic_pal
#' @export
#' @examples
#'
#' ggplot(mpg, aes(displ)) +
#'     geom_histogram(aes(fill = class),
#'                    col = "black", size = 0.1) +
#'     scale_fill_magnetic()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn

scale_fill_magnetic <- function(n, type = "discrete",
                              reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("fill", "magnetic",
                            magnetic_pal(n = n, type = type,
                                       reverse = reverse), ...)
  } else {
    ggplot2::scale_fill_gradientn(colors = magnetic_pal(n = n, type = type,
                                                      reverse = reverse)(10))
  }
}
