#' Draw a standard face
#' 
#' @param shape Currently only supports "round" face. 
#' @param eyes Currently only supports "round" eyes
#' @param mouth Currently supports "smile" and "sad".
#' @param ... Not used currently.
#' @export
face <- function(shape = "round",
                 eyes = "round",
                 mouth = "smile",
                 ...) {
  structure(list(
    shape = switch(shape,
                   "round" = shapeGrob(),
                   "oval" = shapeGrob(width = 0.75, height = 1)),
    eyes = switch(eyes,
                  "round" = eyesGrob(),
                  "googly" = grobTree(eyesGrob(fill = "white", size = 0.1),
                                      eyesGrob())),
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







