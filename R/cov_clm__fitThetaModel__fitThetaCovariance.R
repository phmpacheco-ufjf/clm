fitThetaCovariance <- function(fitTheta, sigmaThetaExprList, derivativesExprList, fittingType, fit) {
  source("./R/cov_clm__fitThetaModel__fitThetaCovarPML.R", local = environment())
  source("./R/cov_clm__fitThetaModel__fitThetaCovarGLSC.R", local = environment())

  if (fittingType == "PML") {
    covTheta <- fitThetaCovarPML(fitTheta, sigmaThetaExprList, derivativesExprList, fit)
  } else {
    covTheta <- fitThetaCovarGLSC(fitTheta, sigmaThetaExprList, derivativesExprList, fit)
  }

  return(covTheta)
}
