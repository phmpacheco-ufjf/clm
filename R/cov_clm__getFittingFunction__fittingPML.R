fittingPML <- function(sigmaThetaExprList, fit) {
  source("./R/cov_clm__getFittingFunction__evalSigmaThetaExprList.R", local = environment())

  function(params) {
    sigmaTheta <- evalSigmaThetaExprList(sigmaThetaExprList, as.list(params))

    sum(diag(fit$sigmaHat %*% solve(sigmaTheta))) -
      unclass(determinant(fit$sigmaHat %*% solve(sigmaTheta), logarithm = TRUE)$modulus) - fit$info$T
  }
}
