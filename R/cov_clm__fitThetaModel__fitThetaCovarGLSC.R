fitThetaCovarGLSC <- function(fitTheta, sigmaThetaExprList, derivativesExprList, fit) {
  source("./R/cov_clm__getGradientFunction__evalDerivSigmaThetaExprList.R", local = environment())
  source("./R/cov_clm__fitThetaModel__getUMatrix.R", local = environment())
  source("./R/cov_clm__fitThetaModel__getDerivVechMatrix.R", local = environment())
  source("./R/cov_clm__fitThetaModel__getCovTheta.R", local = environment())

  thetaList <- as.list(fitTheta$optim$par)
  derivSigmaThetaList <- evalDerivSigmaThetaExprList(derivativesExprList, sigmaThetaExprList, thetaList)
  derivVechMatrix <- getDerivVechMatrix(derivSigmaThetaList)

  UMatrix <- getUMatrix(fit)

  covTheta <- getCovTheta(derivVechMatrix, UMatrix, fit)

  return(covTheta)
}
