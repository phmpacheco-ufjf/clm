fitThetaCovariance <- function(fitTheta, sigmaThetaExprList, derivativesExprList, fittingType, fit) {
  if (fittingType == "PML") {
    covTheta <- fitThetaCovarPML(fitTheta, sigmaThetaExprList, derivativesExprList, fit)
  } else {
    covTheta <- fitThetaCovarGLSC(fitTheta, sigmaThetaExprList, derivativesExprList, fit)
  }

  return(covTheta)
}
