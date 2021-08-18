fittingULSC <- function(sigmaThetaExprList, fit) {
  source("./R/cov_clm__getFittingFunction__evalSigmaThetaExprList.R", local = environment())

  function(params) {
    sigmaTheta <- evalSigmaThetaExprList(sigmaThetaExprList, as.list(params))

    sum(diag((fit$sigmaHat - sigmaTheta) %*% t(fit$sigmaHat - sigmaTheta))) / 2
  }
}
