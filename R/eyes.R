#' Eyes grob
#' 
#' @param x x-coordinate
#' @param y y-coordinate
#' @param size size of the pupils
#' @param size.outline the size of the eye outline
#' @param dist the pupilary distance 
#' @param fill the color of the eye
#' @param colour,color the color of the eye outline
#' @param vp viewport
#' 
#' @export
eyesGrob <- function(x = 0.5, y = 0.5, 
                     size = 0.05, dist = 0.4,
                     size.outline = 1,
                     colour = 'black',
                     color = colour,
                     fill = 'black',
                     vp = NULL) {
  circleGrob(x = c(0.3, 0.3 + dist),
             y = 0.6,
             r = size,
             gp = gpar(fill = fill, lwd = size.outline, col = color),
             vp = vp)
}

#' @export
sketch_eyes <- function(x = NULL, colour = "black", fill = "black", 
                        size = 0.05, size.outline = 1) {
  x$eyes <- eyesGrob(colour = colour, fill = fill, 
                     size = size, size.outline = size.outline)
  x
}
