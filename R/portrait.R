#' Draw a standard face
#' 
#' @param shape Currently only supports "round" face. 
#' @param eyes Currently only supports "round" and "googly" eyes
#' @param mouth Currently supports "smile" and "sad".
#' @param hair Currently only supports "mohawk" and "bald" only.
#' @param nose Currently only supports "simple" nose.
#' @param ... Not used currently.
#' @export
face <- function(shape = "round",
                 eyes = "round",
                 mouth = "smile",
                 hair = "bald",
                 nose = "none",
                 ...) {
  res <- structure(list(
    shape = switch(shape,
                   "round" = shapeGrob(),
                   "oval" = shapeGrob(width = 0.75, height = 1)),
    eyes = switch(eyes,
                  "round" = eyesGrob(),
                  "googly" = grobTree(eyesGrob(fill = "white", size = 0.1),
                                      eyesGrob())),
    mouth = switch(mouth,
                   "smile" = mouthGrob(),
                   "sad" = mouthGrob(smile = -1)),
    hair = switch(hair, 
                  "mohawk" = polygonGrob(x = c(0.5, 0.55, 0.5, 0.45),
                                         y = c(0.8, 0.95, 1.3, 0.95),
                                         gp = gpar(fill = "black")),
                  "bald" = NA),
    nose = switch(nose, 
                  "simple" = bezierGrob(x = c(0.5, 0.57, 0.57, 0.5),
                                        y = c(0.5, 0.52, 0.55, 0.55)),
                  "none" = NA)
  ), class = c("portrait", "list"))
  
  res[!is.na(res)]
}

#' @export
`[.portrait` <- function(x, i, v, ...) {
  res <- unclass(x)[i]
  class(res) <- c("portrait", "list")
  res
}








