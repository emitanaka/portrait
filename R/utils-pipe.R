#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
#' @param lhs A value or the magrittr placeholder.
#' @param rhs A function call using the magrittr semantics.
#' @return The result of calling `rhs(lhs)`.
NULL

#' @export
`+.portrait` <- function(x, y, ...) {
  y <- substitute(y)
  args <- formalArgs(eval(y[[1L]]))
  y[[args[1L]]] <- quote(x)
  eval(y)
}