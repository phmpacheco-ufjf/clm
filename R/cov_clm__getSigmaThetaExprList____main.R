getSigmaThetaExprList <- function(sigmaTheta, fit) {
  if (is.character(sigmaTheta)) {
    if (sigmaTheta == "UCM") {
      sigmaThetaExprList <- generateUCMSigmaThetaExprList(fit)
    } else if (sigmaTheta == "AR1") {
      sigmaThetaExprList <- generateAR1SigmaThetaExprList(fit)
    } else if (sigmaTheta == "ARMA11") {
      sigmaThetaExprList <- generateARMA11SigmaThetaExprList(fit)
    } else if (sigmaTheta == "ARH1") {
      sigmaThetaExprList <- generateARH1SigmaThetaExprList(fit)
    } else if (sigmaTheta == "Toeplitz") {
      sigmaThetaExprList <- generateToeplitzSigmaThetaExprList(fit)
    } else if (sigmaTheta == "Heterogeneous Toeplitz") {
      sigmaThetaExprList <- generateHToeplitzSigmaThetaExprList(fit)
    } else if (sigmaTheta == "Heterogeneous UCM") {
      sigmaThetaExprList <- generateHUCMSigmaThetaExprList(fit)
    } else if (sigmaTheta == "Predependence Order 1") {
      sigmaThetaExprList <- generatePreOrder1SigmaThetaExprList(fit)
    } else if (sigmaTheta == "Unstructured") {
      sigmaThetaExprList <- generateUnstrucSigmaThetaExprList(fit)
    }
  } else {
    sigmaThetaExprList <- sigmaTheta
  }

  return(sigmaThetaExprList)
}
