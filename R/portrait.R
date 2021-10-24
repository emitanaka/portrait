#' Draw a standard face
#' 
#' @param shape Currently only supports "round" face. 
#' @param eyes Currently only supports "round" eyes
#' @param mouth Currently supports "smile" and "sad".
#' @export
face <- function(shape = "round",
                 eyes = "round",
                 mouth = "smile") {
  structure(list(
    shape = switch(shape,
                   "round" = shapeGrob(),
                   "oval" = shapeGrob(width = 1, height = 1.5)),
    eyes = switch(eyes,
                  "round" = eyesGrob()),
    mouth = switch(mouth,
                   "smile" = mouthGrob(),
                   "sad" = mouthGrob(smile = -1))
  ), class = c("portrait", "list"))
}




#' @export
print.portrait <- function(x, ...) {
  res <- do.call("grobTree", x)
  grid.newpage()
  grid.draw(res)
}







