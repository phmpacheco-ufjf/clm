evalSigmaThetaExprList <- function(sigmaThetaExprList, paramsList) {
  if (is.null(names(paramsList))) {
    names(paramsList) <- sigmaThetaExprList$paramsNames
  }
  sigmaTheta <- sapply(sigmaThetaExprList$expr, function(expr) eval(expr, paramsList))
  sigmaTheta <- matrix(sigmaTheta, ncol = sqrt(length(sigmaThetaExprList$expr)))

  return(sigmaTheta)
}
