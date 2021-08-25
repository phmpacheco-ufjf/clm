#' Summarise the results of 'clm' fit.
#'
#' @param object A clm fitted model
#' @param ... Additional params passed to summary
#' @return Return NULL and print in terminal the results.
#'
#' @export
#'
summary.clm <- function(object, ...) {
  coefficientsTable <- createCoefficientsTable(object)

  catCall(object)
  catCoefficientsTable(coefficientsTable, object)
  catSampleDesign(object)
  catSigma(object)
  catSigmaHat(object)

  return(invisible(NULL))
}
