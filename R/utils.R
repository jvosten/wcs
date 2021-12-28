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

# CRAN Note avoidance
if(getRversion() >= "2.15.1")
  utils::globalVariables(
    c("mun_2_lab", "chip_nr", "chip", "foci_exp", "dict",
      "speaker", "lang", "lang_nr", "term_abb", "term")
  )
