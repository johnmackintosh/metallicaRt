met_palettes <- list(
 kill = c("#da8186","#d50d0a","#8F0106","#474747", "#370c0a", "#050404", "#000000"),
 rtl = c("#a9aec0","#869CCB", "#8294b7", "#39497d", "#232455", "#0f0d1e","#000000"),
 puppets = c("#c3ae95","#9c9996","#D28E01","#b3480a","#582017", "#8C031F","#000000"),
 justice = c("#9E9987","#e3e3d1","#33454D","#628c94","#3d4645", "#868d7e","#919c9b"),
 metallica = c("#515659","#1b2423","#0b1413","#181b1d","#040404", "#050404","#000000"),
 load = c("#AEAEAE","#ddcbbd","#a1a09f","#de5646","#934841", "#0f0c0c","#000000"),
 reload = c("#080606","#484848","#9d9c9c","#f0c43e","#fba104", "#e43609","#AD0215"),
 anger = c("#8E837F","#d5ada2","#782920","#f24108","#e4041f","#240b0a", "#000000"),
 magnetic = c("#2d2520","#e8e6e4","#837F7C","#625c58","#7f7c7a","#9a9693", "#000000"),
 hardwired = c("#C8C8C8","#61a28b","#e7cd9b","#7E4611","#a93119", "#2c2625","#000000"),
 
 whiplash = c("#E10A07", "#D4D3C3", "#070505","#443C2C"),
 bells = c("#171732", "#B0B4C8", "#8394BA","#5F74A6"),
 orion = c("#381712", "#C4A88B", "#9B9A97","#92818D"),
 blackened = c("#D6D8C7", "#363F3E", "#6D6B66","#6E7A4A"),
 roam = c("#040405", "#242C2C", "#2C2C2C","#4C4C54"),
 bleeding = c("#2D1917", "#E16A5C", "#A9A9A8","#948494"),
 fuel = c("#090707", "#E5590B", "#ABA7A7","#ECD492"),
 frantic = c("#1D0A09", "#DD2414", "#D3B1A2","#928281"),
 scarred = c("#CBC9C7", "#251E19", "#554D48","#686661"),
 revenge = c("#372421", "#E2B29B", "#7CA896","#6C8C8C")
 
 )


#' Color Palettes based on Metallica album covers
#'
#' R package that contains color palettes based on colours on Metallica studio album covers.
#' 
#' Yep, even the black album.
#'
#' This package is based on the nycpalettes package: https://github.com/kellycotton/nycpalettes
#'
#' @param name Name of palette. Select one:
#' \code{kill}, \code{kill10}, \code{lightning}, \code{lightning10}, 
#' \code{puppets}, \code{puppets10},\code{justice}, \code{justice10},
#' \code{metallica}, \code{metallica10}, \code{load},\code{load10},
#' \code{reload}, \code{reload10}, \code{anger}, \code{anger10}, 
#' \code{magnetic}, \code{magnetic10}, \code{hardwired}, \code{hardwired10}, 
#' \code{combo}
#'
#' @param n Number of colors desired. 
#' 
#' Some palettes contain 7 colors which were picked 'by hand'
#' The \code{combo} palette and those ending with '10' have 10 colours.
#' Apart from \code{combo} palette, these were produced with the
#' aid of the \code{colorfindr} package :
#' https://CRAN.R-project.org/package=colorfindr
#'
#' @param type Either continuous or discrete.
#'
#' @return A vector of colors.
#' @export
#'
#' @examples
#' metalli_palette("anger")
#'
metalli_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  
  pal <- met_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found")
  
  if (missing(n)) {
    n = length(pal)
  }
  
  if (type == "discrete" && n > length(pal)) {
    stop(paste("You have requested", n, "colors, but this palette only contains", length(pal), "colors."))
  }
  
  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))
  
  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  
  rect(0, 0.95, n + 1, 1.05, col = rgb(1, 1, 1, 0.7), border = NA)
  text((n + 1) / 2, 1, labels = attr(x,"name"), cex = 1, family = "serif")
  for (i in 1:n) {
    rect(i - .5, .65, i + .5, .75, col = rgb(1, 1, 1, 0.7), border = NA)
    text(i, .7, labels = x[i], cex = 1, family = "serif")
  }
}
