
#' @export
cat_eyes <- function(x = NULL, size = 1, fill = "black", colour = "black") {
  outer_eyes <- bezierGrob(rep(c(.3, .7, .3, .7), each = 4) + rep(c(-.15, -.1, .1, .15), 4),
                           rep(.6, each = 16) + c(c(.16, -.015, -.015, .04, 
                                                    .04, -.015, -.015, .16),
                                                  c(.16, .16, .16, .04, 
                                                    .04, .16, .16, .16)),
                           id.lengths = c(4, 4, 4, 4))
  lhs_df <- polygon_data(x = .3 - 0.05, y = .68 - 0.045, 
                         width = 0.03, height = 0.07,
                         n = 50, phase = 0)
  rhs_df <- polygon_data(x = .7 + 0.05, y = .68 - 0.045, 
                         width = 0.03, height = 0.07,
                         n = 50, phase = 0)
  
  inner_eyes_lhs <- polygonGrob(x = lhs_df$x, y = lhs_df$y, 
                                gp = gpar(col = colour, lwd = size, fill = fill),
                                vp = viewport(angle = -17))
  inner_eyes_rhs <- polygonGrob(x = rhs_df$x, y = rhs_df$y, 
                                gp = gpar(col = colour, lwd = size, fill = fill),
                                vp = viewport(angle = 17))
  eyes <- grobTree(outer_eyes, inner_eyes_lhs, inner_eyes_rhs)
  x$eyes <- eyes
  x
}