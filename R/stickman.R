
#' @export
stickman <- function(colour = "black", color = colour, size = 1) {
  head <- circleGrob(r = 0.1, x = 0.5, y = 0.75,
                     gp = gpar(col = color, lwd = size))
  body <- linesGrob(x = c(0.5, 0.5), 
                    y = c(0.65, 0.5),
                    gp = gpar(col = color, lwd = size))
  arm_left <- linesGrob(x = c(0.4, 0.5), 
                        y = c(0.6, 0.6),
                        gp = gpar(col = color, lwd = size))
  arm_right <- linesGrob(x = c(0.5, 0.6), 
                         y = c(0.6, 0.6),
                         gp = gpar(col = color, lwd = size))
  leg_left <- linesGrob(x = c(0.4, 0.5), 
                        y = c(0.35, 0.5),
                        gp = gpar(col = color, lwd = size))
  leg_right <- linesGrob(x = c(0.6, 0.5), 
                         y = c(0.35, 0.5),
                         gp = gpar(col = color, lwd = size))
  p <- list(head, 
            body, 
            arm_left,
            arm_right,
            leg_left,
            leg_right)
  class(p) <- c("stickman", p)
  p
}

#' @export
print.stickman <- function(x, ...) {
  res <- do.call("grobTree", x)
  grid.newpage()
  grid.draw(res)
}


