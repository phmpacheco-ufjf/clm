addConfigToOptimParams <- function(optimParams, fittingFunction, gradientFunction, sigmaThetaExprList) {
  source("./R/cov_clm__addConfigToOptimParams____functions.R", local = environment())

  optimParams$method <- addMethodIfMissing(optimParams)
  optimParams$fn <- fittingFunction
  optimParams$gr <- gradientFunction

  optimParams <- setLowerAndUpperIfExists(optimParams, sigmaThetaExprList)
  optimParams <- setDefaultOrderToPar(optimParams, sigmaThetaExprList)

  return(optimParams)
}
