checkRequirements <- function(fit, fittingType, sigmaTheta, optimParams) {
  source("./R/cov_clm__checkRequirements____functions.R", local = environment())

  checkFitRequirements(fit)
  checkFittingTypeRequirements(fittingType)
  checkSigmaThetaRequirements(sigmaTheta, fit)
  checkOptimParamsRequirements(optimParams)

  return(NULL)
}
