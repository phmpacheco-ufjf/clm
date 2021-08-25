covClmCheckRequirements <- function(fit, fittingType, sigmaTheta, optimParams) {
  checkFitRequirements(fit)
  checkFittingTypeRequirements(fittingType)
  checkSigmaThetaRequirements(sigmaTheta, fit)
  checkOptimParamsRequirements(optimParams)

  return(NULL)
}
