regular_polygon <- function(n = 50, phase = 0, radius = 1) {
  stopifnot(n > 2)
  angle <- 2 * pi / n
  locs <- complex(argument = angle * seq_len(n) + phase) * radius
  data.frame(x = Re(locs), y = Im(locs))
}

polygon_data <- function(x = 0.5, y = 0.5, 
                         width = 1, height = 1, 
                         n = 50, phase = 0) {
  
  vertices <- regular_polygon(n = n, phase = phase)
  data <- data.frame(x = rep(x, nrow(vertices)), 
                     y = rep(y, nrow(vertices)))
  data$x <- data$x + vertices$x * width / 2
  data$y <- data$y + vertices$y * height / 2
  data
}