fitThetaCovarPML <- function(fitTheta, sigmaThetaExprList, derivativesExprList, fit) {
  source("./R/cov_clm__getGradientFunction__evalDerivSigmaThetaExprList.R", local = environment())
  source("./R/cov_clm__fitThetaModel__evalDeriv2SigmaThetaExprList.R", local = environment())
  source("./R/cov_clm__fitThetaModel__getCovPhiTheta.R", local = environment())
  source("./R/cov_clm__fitThetaModel__getInformationMatrix.R", local = environment())

  thetaList <- as.list(fitTheta$optim$par)
  derivSigmaThetaList <- evalDerivSigmaThetaExprList(derivativesExprList, sigmaThetaExprList, thetaList)
  deriv2SigmaThetaList <- evalDeriv2SigmaThetaExprList(derivativesExprList, sigmaThetaExprList, thetaList)

  covPhiTheta <- getCovPhiTheta(fitTheta, fit, derivSigmaThetaList)
  informationMatrix <- getInformationMatrix(fitTheta, fit, derivSigmaThetaList, deriv2SigmaThetaList)

  covTheta <- solve(informationMatrix) %*% covPhiTheta %*% solve(informationMatrix)

  return(covTheta)
}
