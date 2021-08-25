fittingGradientGLSC3 <- function(derivativesExprList, sigmaThetaExprList, fit) {
  function(params) {
    sigmaTheta <- evalSigmaThetaExprList(sigmaThetaExprList, as.list(params))
    derivSigmaThetaList <- evalDerivSigmaThetaExprList(derivativesExprList, sigmaThetaExprList, as.list(params))

    gradient <- sapply(derivSigmaThetaList, function(derivSigmaThetaj) {
      sum(diag(solve(sigmaTheta) %*% fit$sigmaHat %*% (diag(1, nrow = fit$info$T) - solve(sigmaTheta) %*% fit$sigmaHat) %*% solve(sigmaTheta) %*% derivSigmaThetaj))
    })

    return(gradient)
  }
}
