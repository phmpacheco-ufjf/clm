#' Summarise the results of 'cov_clm' fit.
#'
#' @param object A clm.theta fitted model
#' @param ... Additional params passed to summary
#'
#' @return Return NULL and print in terminal the results.
#'
#' @export

summary.clm.theta <- function(object, ...) {
  thetaTable <- getThetaTable(fitTheta)
  optimTable <- getOptimTable(fitTheta)

  catCall(fitTheta)
  catFitTypes(fitTheta)
  catFitResults(fitTheta, thetaTable)
  catOptimDetails(fitTheta, optimTable)
  catSigmaThetaMatrix(fitTheta)
  catGoodnessOfFitMeasures(fitTheta)

  return(invisible(NULL))
}
