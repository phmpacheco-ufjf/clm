addConfigToOptimParams <- function(optimParams, fittingFunction, gradientFunction, sigmaThetaExprList) {
  optimParams$method <- addMethodIfMissing(optimParams)
  optimParams$fn <- fittingFunction
  optimParams$gr <- gradientFunction

  optimParams <- setLowerAndUpperIfExists(optimParams, sigmaThetaExprList)
  optimParams <- setDefaultOrderToPar(optimParams, sigmaThetaExprList)

  return(optimParams)
}
