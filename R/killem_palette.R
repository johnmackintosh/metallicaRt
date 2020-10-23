killem_palette <- c("#000000", "#E4E6D8", "#A8A8A8", "#CE0000", "#FF0204",
            "#7D0109", "#DCFFFE", "#EEE2E4", "#E9ACA7", "#F83634")

#' @title killem palette
#' @description killem palette
#' @inheritDotParams ggplot2::discrete_scale
#' @param n number of colors
#' @param type discrete or continuous
#' @param reverse reverse order, Default: FALSE
#' @rdname killem_pal
#' @examples
#' library(scales)
#' show_col(killem_pal()(10),labels = FALSE)
#' @export
#' @importFrom scales manual_pal
#' @importFrom glue glue
#' @importFrom grDevices colorRampPalette

killem_pal <- function(n, type = c("discrete", "continuous"),
                          reverse = FALSE){
    killem <- killem_palette
    
    if (reverse == TRUE) {
        killem <- rev(killem)
    }
    
    if (missing(n)) {
        n <- length(killem)
    }
    
    type <- match.arg(type)
    
    if (type == "discrete" && n > length(killem)) {
        stop(glue::glue("Palette does not have {n} colors, maximum is {length(killem)}!"))
    }
    
    killem <- switch(type,
                        continuous = grDevices::colorRampPalette(killem)(n),
                        discrete = killem[1:n])
    
    killem <- scales::manual_pal(killem)
    
    return(killem)
}

#' @title scale_color_killem
#' @rdname killem_pal
#' @export
#' @examples
#'
#' library(ggplot2)
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_color_killem()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_color_killem <- function(n, type = "discrete",
                                  reverse = FALSE, ...){
    if (type == "discrete") {
        ggplot2::discrete_scale("color", "killem",
                                killem_pal(n = n, type = type,
                                              reverse = reverse), ...)
    } else {
        ggplot2::scale_color_gradientn(colors = killem_pal(n = n, type = type,
                                                              reverse = reverse)(8))
    }
}

#' @title scale_colour_killem
#' @rdname killem_pal
#' @export
#' @examples
#'
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_colour_killem()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_colour_killem <- scale_color_killem

#' @title scale_fill_killem
#' @rdname killem_pal
#' @export
#' @examples
#'
#' ggplot(mpg, aes(displ)) +
#'     geom_histogram(aes(fill = class),
#'                    col = "black", size = 0.1) +
#'     scale_fill_killem()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn

scale_fill_killem <- function(n, type = "discrete",
                                 reverse = FALSE, ...){
    if (type == "discrete") {
        ggplot2::discrete_scale("fill", "killem",
                                killem_pal(n = n, type = type,
                                              reverse = reverse), ...)
    } else {
        ggplot2::scale_fill_gradientn(colors = killem_pal(n = n, type = type,
                                                             reverse = reverse)(10))
    }
}
