#' Draw the shape of the face
#' 
#' Only supports the round face at the moment.
#' @param x x-coordinate
#' @param y y-coordinate
#' @param width the width of the face
#' @param height the height of the face
#' @param fill the color of the face
#' @param colour,color the color of the face outline
#' @param size the size of the outer face shape
#' 
#' @export
shapeGrob <- function(x = 0.5, y = 0.5, 
                      width = 1, height = 1,
                      colour = 'black',
                      color = colour,
                      fill = NA, size = 1) {
  
  df <- polygon_data(x = x, y = y, width = width, height = height,
                     n = 50, phase = 0)
  polygonGrob(x = df$x, y = df$y, 
              gp = gpar(col = colour, lwd = size))
  
}