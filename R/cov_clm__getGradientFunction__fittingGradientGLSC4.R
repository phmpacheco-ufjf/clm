fittingGradientGLSC4 <- function(derivativesExprList, sigmaThetaExprList, fit) {
  function(params) {
    sigmaTheta <- evalSigmaThetaExprList(sigmaThetaExprList, as.list(params))
    derivSigmaThetaList <- evalDerivSigmaThetaExprList(derivativesExprList, sigmaThetaExprList, as.list(params))

    vechFitSigmaHat <- matrix(fit$sigmaHat[lower.tri(fit$sigmaHat, diag = TRUE)], ncol = 1)
    vechSigmaTheta <- matrix(sigmaTheta[lower.tri(sigmaTheta, diag = TRUE)], ncol = 1)
    CHat <- fit$info$N * fit$sigmaHatVar

    gradient <- sapply(derivSigmaThetaList, function(derivSigmaThetaj) {
      vechDerivSigmaThetaj <- matrix(derivSigmaThetaj[lower.tri(derivSigmaThetaj, diag = TRUE)], ncol = 1)
      sum(diag(2 * solve(CHat) %*% (vechSigmaTheta - vechFitSigmaHat) %*% t(vechDerivSigmaThetaj)))
    })

    return(gradient)
  }
}
