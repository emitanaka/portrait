#' Draw cat eyes
#' 
#' @param x A portrait object.
#' @param size The size of the inner eye outline.
#' @param fill The color of the eye.
#' @param colour The color of the inner eye outline.
#' @export
cat_eyes <- function(x = NULL, size = 1, fill = "black", 
                     colour = "black",
                     color = colour) {
  outer_eyes <- bezierGrob(rep(c(.3, .7, .3, .7), each = 4) + rep(c(-.15, -.1, .1, .15), 4),
                           rep(.5, each = 16) + c(c(.16, -.015, -.015, .04, 
                                                    .04, -.015, -.015, .16),
                                                  c(.16, .16, .16, .04, 
                                                    .04, .16, .16, .16)),
                           id.lengths = c(4, 4, 4, 4))
  lhs_df <- polygon_data(x = .3 - 0.03, y = .6 - 0.045, 
                         width = 0.03, height = 0.07,
                         n = 50, phase = 0)
  rhs_df <- polygon_data(x = .7 + 0.03, y = .6 - 0.045, 
                         width = 0.03, height = 0.07,
                         n = 50, phase = 0)
  
  inner_eyes_lhs <- polygonGrob(x = lhs_df$x, y = lhs_df$y, 
                                gp = gpar(col = color, lwd = size, fill = fill),
                                vp = viewport(angle = -17))
  inner_eyes_rhs <- polygonGrob(x = rhs_df$x, y = rhs_df$y, 
                                gp = gpar(col = color, lwd = size, fill = fill),
                                vp = viewport(angle = 17))
  eyes <- grobTree(outer_eyes, inner_eyes_lhs, inner_eyes_rhs)
  x$eyes <- eyes
  x
}


#' @export
cat_shape <- function(x = NULL, colour = "black", color = colour,
                      fill = "white", size = 1) {
  main <- polygon_data(0.5, 0.5, n = 50, phase = 0, width = 0.9, height = 0.75) 
  main$id <- 1:nrow(main)
  #browser()
  left <- subset(main, (x < 0.3 & y > 0.5))$id
  right <- subset(main, (x > 0.7 & y > 0.5))$id
  main[left, "x"] <- 0.07
  main[left, "y"] <- 1
  main[right, "x"] <- 0.93
  main[right, "y"] <- 1
  
  x$shape <- polygonGrob(main$x, main$y,
              gp = gpar(col = color, lwd = size, fill = fill))
  x
}


#' @export
cat_whiskers <- function(x = NULL,
                         size = 2,
                         colour = "black",
                         color = colour) {
  x$whiskers <- polylineGrob(c(0.15, 0, 0.15, 0, 0.15, 0, 0.85, 1, 0.85, 1, 0.85, 1),
                          c(0.5, 0.5, 0.54, 0.6, 0.46, 0.4, 0.5, 0.5, 0.54, 0.6, 0.46, 0.4),
                          id.lengths = rep(2, 6),
                          gp = gpar(col = color, lwd = size))
  x
}

#' @export
cat_nose <- function(x = NULL, 
                     size = 2, 
                     colour = "black",
                     color =  colour,
                     fill = "black") {
  x$nose <- polygonGrob(x = c(0.45, 0.55, 0.5),
                        y = c(0.5, 0.5, 0.45),
                        gp = gpar(fill = fill, col = color, lwd = size))
  x
}