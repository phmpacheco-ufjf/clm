getDerivativesExprList <- function(sigmaThetaExprList) {
  derivativesExprList <- lapply(sigmaThetaExprList$expr, function(expr) {
    stats::deriv(expr, sigmaThetaExprList$paramsNames, hessian = TRUE)
  })

  return(derivativesExprList)
}
