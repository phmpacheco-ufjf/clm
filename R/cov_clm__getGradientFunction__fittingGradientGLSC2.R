fittingGradientGLSC2 <- function(derivativesExprList, sigmaThetaExprList, fit) {
  source("./R/cov_clm__getFittingFunction__evalSigmaThetaExprList.R", local = environment())
  source("./R/cov_clm__getGradientFunction__evalDerivSigmaThetaExprList.R", local = environment())

  function(params) {
    sigmaTheta <- evalSigmaThetaExprList(sigmaThetaExprList, as.list(params))
    derivSigmaThetaList <- evalDerivSigmaThetaExprList(derivativesExprList, sigmaThetaExprList, as.list(params))

    gradient <- sapply(derivSigmaThetaList, function(derivSigmaThetaj) {
      sum(diag((solve(fit$sigmaHat) %*% sigmaTheta - diag(1, nrow = fit$info$T)) %*% solve(fit$sigmaHat) %*% derivSigmaThetaj))
    })

    return(gradient)
  }
}
