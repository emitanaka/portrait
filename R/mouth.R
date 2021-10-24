#' Mouth grob
#' 
#' @param x x-coordinate
#' @param y y-coordinate
#' @param size size of the pupils
#' @param vp viewport
#' 
#' @export
mouthGrob <- function(x = 0.5, y = 0.5, 
                      size = 1, 
                      colour = NULL,
                      color = colour,
                      vp = NULL,
                      smile = 1) {
  bezierGrob(rep(.5, each = 4) + c(-.25, -.1, .1, .25),
             rep(.28, each = 4) + smile * c(.08, -.12, -.12, .08),
             gp = gpar(fill = color, lwd = size),
             vp = vp)
}

#' @export
sketch_mouth <- function(x = NULL, smile = 1, colour = "black", size = 1) {
  x$mouth <- mouthGrob(size = size, colour = colour, smile = smile)
  x
}