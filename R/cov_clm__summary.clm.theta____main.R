#' Summarise the results of 'cov_clm' fit.
#'
#' @param object A clm.theta fitted model
#' @param ... Additional params passed to summary
#'
#' @return Return NULL and print in terminal the results.
#'
#' @export

summary.clm.theta <- function(object, ...) {
  thetaTable <- getThetaTable(object)
  optimTable <- getOptimTable(object)

  catCall(object)
  catFitTypes(object)
  catFitResults(object, thetaTable)
  catOptimDetails(object, optimTable)
  catSigmaThetaMatrix(object)
  catGoodnessOfFitMeasures(object)

  return(invisible(NULL))
}
