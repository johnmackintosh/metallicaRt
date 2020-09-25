met_palettes <- list(
 kill = c("#da8186","#d50d0a","#8F0106","#474747","#370c0a", "#050404","#000000"),
 kill10 = c("#000000", "#E4E6D8", "#A8A8A8", "#CE0000", "#FF0204",
            "#7D0109", "#DCFFFE", "#EEE2E4", "#E9ACA7", "#F83634"),
 lightning = c("#a9aec0","#869CCB","#8294b7","#39497d","#232455", "#0f0d1e","#000000"),
 lightning10 = c("#030305", "#1D1638", "#090712", "#1E183C", "#FBFFFF",
                 "#20255F", "#233776", "#3A5A93", "#9CAAC7", "#6A84B7"),
 puppets = c("#b3480a","#582017","#c3ae95","#D28E01","#9c9996", "#883a2a","#000000"),
 puppets10 = c("#000000", "#FFFFFF", "#8C031F", "#CDC6B3", "#330B09",
               "#9895A0", "#AD4000", "#55311B", "#6F6F6F", "#9D8D74"),
 justice = c("#9E9987","#e3e3d1","#33454D","#628c94","#3d4645", "#868d7e","#919c9b"),
 justice10 = c("#FFFFEC", "#F3F2DE", "#D7D9CC", "#000200", "#D2D4C7", 
               "#BDBEB0", "#A1A7A3", "#7E8985", "#535E5A", "#2B3F46"),
 metallica = c("#515659","#1b2423","#0b1413","#181b1d","#040404", "#050404","#000000"),
 metallica10 = c("#000000", "#000002", "#030303", "#050608", "#1D2122",
                 "#1E2223", "#0B0B0B", "#111516", "#303136", "#484F55"),
 load = c("#AEAEAE","#ddcbbd","#a1a09f","#de5646","#934841", "#0f0c0c","#000000"),
 load10 = c("#000000", "#101010", "#B1B1B1", "#FFFFFF", "#717171", 
            "#393939", "#B30020", "#FF5C4E", "#ED4D3F", "#E89466"),
 reload = c("#080606","#484848","#9d9c9c","#f0c43e","#fba104", "#e43609","#AD0215"),
 reload10 = c("#000000", "#A8A8A8", "#AE0115", "#FFFFFF", "#FDC101", 
              "#FD8900", "#808080", "#CF0010", "#FA4500", "#2D1219"),
 anger = c("#8E837F","#d5ada2","#782920","#f24108","#e4041f","#240b0a", "#000000"),
 anger10 = c("#E3001E", "#FE4002", "#000600", "#E70024", "#F3ABB9", 
             "#1B0000", "#FF0025", "#4B0000", "#882600", "#AE3000"),
 magnetic = c("#2d2520","#e8e6e4","#837F7C","#625c58","#7f7c7a","#9a9693", "#000000"),
 magnetic10 = c("#FFFFFD", "#030000", "#F3F2F0", "#E0DCD9", "#231C16",
                "#B9B5B2", "#9C9895", "#8D8986", "#54504D", "#484441"),
 hardwired = c("#C8C8C8","#61a28b","#e7cd9b","#7E4611","#a93119", "#2c2625","#000000"),
 hardwired10 = c("#FFFFFF", "#000000", "#440000", "#6F0000", "#353535", 
                 "#ACACAC", "#585858", "#960000", "#C05A41", "#9BAA4B"),
 combo = c("#d50d0a","#a9aec0","#883a2a","#9E9987","#000000", 
           "#de5646","#f0c43e", "#f24108","#9a9693","#61a28b")
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
