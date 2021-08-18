getSigmaTheta <- function(optimObject, sigmaThetaExprList) {
  source("./R/cov_clm__getFittingFunction__evalSigmaThetaExprList.R", local = environment())

  sigmaTheta <- evalSigmaThetaExprList(sigmaThetaExprList, as.list(optimObject$par))

  return(sigmaTheta)
}
