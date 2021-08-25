getSigmaTheta <- function(optimObject, sigmaThetaExprList) {
  sigmaTheta <- evalSigmaThetaExprList(sigmaThetaExprList, as.list(optimObject$par))

  return(sigmaTheta)
}
