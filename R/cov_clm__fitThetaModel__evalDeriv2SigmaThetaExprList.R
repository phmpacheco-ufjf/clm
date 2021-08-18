evalDeriv2SigmaThetaExprList <- function(derivativesExprList, sigmaThetaExprList, paramsList) {
  names(paramsList) <- sigmaThetaExprList$paramsNames

  derivativesList <- lapply(derivativesExprList, function(expr) eval(expr, paramsList))
  deriv2SigmaThetaCombined <- sapply(derivativesList, function(expr) attr(expr, "hessian"))
  deriv2SigmaThetaList <- split(deriv2SigmaThetaCombined, seq(nrow(deriv2SigmaThetaCombined)))

  deriv2SigmaThetaMatrixList <- lapply(deriv2SigmaThetaList, function(expr) {
    matrix(expr, ncol = sqrt(length(derivativesList)), nrow = sqrt(length(derivativesList)))
  })

  return(deriv2SigmaThetaMatrixList)
}
