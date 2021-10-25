

#' @export
dog_shape <- function(x = NULL, colour = "black", color = colour,
                      fill = "white", size = 1) {
  main <- polygon_data(0.5, 0.5, n = 50, phase = 0, width = 0.9, height = 0.75) 
  ear_left <- bezierGrob(x = c(0.07, -0.05, 0.012, 0.2),
                         y = c(0.45, 0.12, 1, 0.78))
  ear_right <- bezierGrob(x = 1 - c(0.07, -0.05, 0.012, 0.2),
                          y = c(0.45, 0.12, 1, 0.78))
  x$shape <- grobTree(ear_left, 
                      ear_right,
                      polygonGrob(main$x, main$y,
                                  gp = gpar(col = color, lwd = size, fill = fill)))
  x
}