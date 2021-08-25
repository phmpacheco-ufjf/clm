fitThetaCovarPML <- function(fitTheta, sigmaThetaExprList, derivativesExprList, fit) {
  thetaList <- as.list(fitTheta$optim$par)
  derivSigmaThetaList <- evalDerivSigmaThetaExprList(derivativesExprList, sigmaThetaExprList, thetaList)
  deriv2SigmaThetaList <- evalDeriv2SigmaThetaExprList(derivativesExprList, sigmaThetaExprList, thetaList)

  covPhiTheta <- getCovPhiTheta(fitTheta, fit, derivSigmaThetaList)
  informationMatrix <- getInformationMatrix(fitTheta, fit, derivSigmaThetaList, deriv2SigmaThetaList)

  covTheta <- solve(informationMatrix) %*% covPhiTheta %*% solve(informationMatrix)

  return(covTheta)
}
