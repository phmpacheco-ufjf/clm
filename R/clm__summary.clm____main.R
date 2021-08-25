#' Summarise the results of 'clm' fit.
#'
#' @param fit A clm fitted model
#'
#' @return Return NULL and print in terminal the results.
#'
#' @examples
#' summary.clm(fit)
#' @export
#'
summary.clm <- function(fit) {
  coefficientsTable <- createCoefficientsTable(fit)

  catCall(fit)
  catCoefficientsTable(coefficientsTable, fit)
  catSampleDesign(fit)
  catSigma(fit)
  catSigmaHat(fit)

  return(invisible(NULL))
}
