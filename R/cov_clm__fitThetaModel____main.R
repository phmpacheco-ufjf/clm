fitThetaModel <- function(optimParams, sigmaThetaExprList, derivativesExprList, fittingType, fit) {
  fitTheta <- list()
  fitTheta$optim <- getOptimCalculation(optimParams)
  fitTheta$sigmaTheta <- getSigmaTheta(fitTheta$optim, sigmaThetaExprList)
  fitTheta$covTheta <- fitThetaCovariance(fitTheta, sigmaThetaExprList, derivativesExprList, fittingType, fit)

  fitTheta$fittingType <- fittingType
  fitTheta$sigmaThetaExpr <- sigmaThetaExprList
  fitTheta$derivativesExpr <- derivativesExprList
  fitTheta$optimParams <- optimParams

  return(fitTheta)
}
