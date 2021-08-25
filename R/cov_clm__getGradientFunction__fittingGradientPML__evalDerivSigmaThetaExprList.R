evalDerivSigmaThetaExprList <- function(derivativesExprList, sigmaThetaExprList, paramsList) {
  if (is.null(names(paramsList))) {
    names(paramsList) <- sigmaThetaExprList$paramsNames
  }

  derivativesList <- lapply(derivativesExprList, function(expr) eval(expr, paramsList))
  derivSigmaThetaCombined <- sapply(derivativesList, function(expr) attr(expr, "gradient"))
  derivSigmaThetaList <- stats::setNames(
    split(derivSigmaThetaCombined, seq(nrow(derivSigmaThetaCombined))),
    sigmaThetaExprList$paramsNames
  )
  derivSigmaThetaMatrixList <- lapply(derivSigmaThetaList, function(expr) {
    matrix(expr, ncol = sqrt(length(derivativesList)), nrow = sqrt(length(derivativesList)))
  })

  return(derivSigmaThetaMatrixList)
}
