fittingULSC <- function(sigmaThetaExprList, fit) {
  function(params) {
    sigmaTheta <- evalSigmaThetaExprList(sigmaThetaExprList, as.list(params))

    sum(diag((fit$sigmaHat - sigmaTheta) %*% t(fit$sigmaHat - sigmaTheta))) / 2
  }
}
