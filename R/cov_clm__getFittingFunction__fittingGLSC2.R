fittingGLSC2 <- function(sigmaThetaExprList, fit) {
  source("./R/cov_clm__getFittingFunction__evalSigmaThetaExprList.R", local = environment())

  function(params) {
    sigmaTheta <- evalSigmaThetaExprList(sigmaThetaExprList, as.list(params))

    sum(diag((diag(1, nrow = fit$info$T, ncol = fit$info$T) - (sigmaTheta %*% solve(fit$sigmaHat))) %*%
      t(diag(1, nrow = fit$info$T, ncol = fit$info$T) - (sigmaTheta %*% solve(fit$sigmaHat))))) / 2
  }
}
