fittingGLSC3 <- function(sigmaThetaExpr, fit) {
  source("./R/cov_clm__getFittingFunction__evalSigmaThetaExprList.R", local = environment())

  function(params) {
    sigmaTheta <- evalSigmaThetaExprList(sigmaThetaExpr, as.list(params))

    sum(diag(((fit$sigmaHat %*% solve(sigmaTheta)) - diag(1, nrow = fit$info$T, ncol = fit$info$T)) %*%
      t((fit$sigmaHat %*% solve(sigmaTheta)) - diag(1, nrow = fit$info$T, ncol = fit$info$T)))) / 2
  }
}
