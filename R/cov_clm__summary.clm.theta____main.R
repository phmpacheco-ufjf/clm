#' Summarise the results of 'cov_clm' fit.
#'
#' @param fitTheta A clm.theta fitted model
#'
#' @return Return NULL and print in terminal the results.
#'
#' @examples
#' summary.clm.theta(fitTheta)
#' @export

summary.clm.theta <- function(fitTheta) {
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
