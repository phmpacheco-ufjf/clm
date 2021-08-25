#' Summarise the results of 'clm' fit.
#'
#' @param object A clm fitted model
#' @param ... Additional params passed to summary
#' @return Return NULL and print in terminal the results.
#'
#' @export
#'
summary.clm <- function(object, ...) {
  coefficientsTable <- createCoefficientsTable(fit)

  catCall(fit)
  catCoefficientsTable(coefficientsTable, fit)
  catSampleDesign(fit)
  catSigma(fit)
  catSigmaHat(fit)

  return(invisible(NULL))
}
