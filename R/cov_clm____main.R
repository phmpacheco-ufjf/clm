cov_clm <- function(fit, fittingType, sigmaThetaExpr, optimParams) {
  source("./R/cov_clm____functions.R", local = environment())

  call <- match.call() # Capture function call
  checkRequirements(fit, fittingType, sigmaThetaExpr, optimParams)

  sigmaThetaExprList <- getSigmaThetaExprList(sigmaThetaExpr, fit)
  fittingFunction <- getFittingFunction(fittingType, sigmaThetaExprList, fit)

  derivativesExprList <- getDerivativesExprList(sigmaThetaExprList)
  gradientFunction <- getGradientFunction(derivativesExprList, sigmaThetaExprList, fit, fittingType)

  optimParams <- addConfigToOptimParams(optimParams, fittingFunction, gradientFunction, sigmaThetaExprList)

  fitTheta <- fitThetaModel(optimParams, sigmaThetaExprList, derivativesExprList, fittingType, fit)
  gofMeasures <- getGoodnessOfFit(fitTheta, fit, fittingType)

  fitTheta <- organizeFitTheta(fitTheta, gofMeasures, call, sigmaThetaExpr)

  return(fitTheta)
}
