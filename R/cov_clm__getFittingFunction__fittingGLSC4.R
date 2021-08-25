fittingGLSC4 <- function(sigmaThetaExprList, fit) {
  function(params) {
    sigmaTheta <- evalSigmaThetaExprList(sigmaThetaExprList, as.list(params))

    vechSw <- matrix(fit$sigmaHat[lower.tri(fit$sigmaHat, diag = TRUE)], ncol = 1)
    vechSigmaTheta <- matrix(sigmaTheta[lower.tri(sigmaTheta, diag = TRUE)], ncol = 1)
    CHat <- fit$info$N * fit$sigmaHatVar

    t((vechSw - vechSigmaTheta)) %*% solve(CHat) %*% (vechSw - vechSigmaTheta)
  }
}
