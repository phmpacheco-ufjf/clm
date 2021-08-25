fittingGradientULSC <- function(derivativesExprList, sigmaThetaExprList, fit) {
  function(params) {
    sigmaTheta <- evalSigmaThetaExprList(sigmaThetaExprList, as.list(params))
    derivSigmaThetaList <- evalDerivSigmaThetaExprList(derivativesExprList, sigmaThetaExprList, as.list(params))

    gradient <- sapply(derivSigmaThetaList, function(derivSigmaThetaj) {
      sum(diag((sigmaTheta - fit$sigmaHat) %*% derivSigmaThetaj))
    })

    return(gradient)
  }
}
