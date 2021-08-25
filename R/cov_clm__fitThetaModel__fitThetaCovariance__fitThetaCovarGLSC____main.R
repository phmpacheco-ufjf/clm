fitThetaCovarGLSC <- function(fitTheta, sigmaThetaExprList, derivativesExprList, fit) {
  thetaList <- as.list(fitTheta$optim$par)
  derivSigmaThetaList <- evalDerivSigmaThetaExprList(derivativesExprList, sigmaThetaExprList, thetaList)
  derivVechMatrix <- getDerivVechMatrix(derivSigmaThetaList)

  UMatrix <- getUMatrix(fit)

  covTheta <- getCovTheta(derivVechMatrix, UMatrix, fit)

  return(covTheta)
}
