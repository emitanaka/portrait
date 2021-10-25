#' @export
print.portrait <- function(x, ...) {
  res <- do.call("grobTree", x)
  grid.newpage()
  grid.draw(res)
}


#' @export
str.portrait <- function(x, ...) {
  cat("Portrait contains:\n")
  cat(paste("-", names(x)), sep = "\n")
}