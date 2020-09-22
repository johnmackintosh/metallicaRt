met_palettes <- list (
 kill = c("#da8186","#d50d0a","#8F0106","#474747","#370c0a", "#050404","#000000"),
 lightning = c("#a9aec0","#869CCB","#8294b7","#39497d","#232455", "#0f0d1e","#000000"),
 puppets = c("#b3480a","#582017","#c3ae95","#D28E01","#9c9996", "#883a2a","#000000"),
 justice = c("#9E9987","#e3e3d1","#33454D","#628c94","#3d4645", "#868d7e","#919c9b"),
 metallica = c("#515659","#1b2423","#0b1413","#181b1d","#040404", "#050404","#000000"),
 load = c("#AEAEAE","#ddcbbd","#a1a09f","#de5646","#934841", "#0f0c0c","#000000"),
 reload = c("#080606","#484848","#9d9c9c","#f0c43e","#fba104", "#e43609","#AD0215"),
 anger = c("#8E837F","#d5ada2","#782920","#f24108","#e4041f","#240b0a", "#000000"),
 magnetic = c("#2d2520","#e8e6e4","#837F7C","#625c58","#7f7c7a","#9a9693", "#000000"),
 hardwired = c("#C8C8C8","#61a28b","#e7cd9b","#7E4611","#a93119", "#2c2625","#000000"),
 combo = c("#d50d0a","#a9aec0","#883a2a","#9E9987","#000000", "#de5646","#f0c43e",
           "#f24108","#9a9693","#61a28b")
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
#' \code{kill}, \code{lightning}, \code{puppets}, \code{justice},
#' \code{metallica}, \code{load}, \code{reload}, \code{anger}, 
#' \code{magnetic}, \code{hardwired}, \code{combo}
#'
#' @param n Number of colors desired. 
#' 
#' Palettes contain 7 colors, except the \code{combo} palette, which has 10.
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
    rect(i-.5, .65, i+.5, .75, col = rgb(1, 1, 1, 0.7), border = NA)
    text(i, .7, labels = x[i], cex = 1, family = "serif")
  }
}