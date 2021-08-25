getDerivativesExprList <- function(sigmaThetaExprList) {
  derivativesExprList <- lapply(sigmaThetaExprList$expr, function(expr) {
    deriv(expr, sigmaThetaExprList$paramsNames, hessian = TRUE)
  })

  return(derivativesExprList)
}
