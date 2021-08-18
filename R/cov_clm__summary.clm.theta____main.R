summary.clm.theta <- function(fitTheta) {
  source("./R/cov_clm__summary.clm.theta____functions.R", local = environment())

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
