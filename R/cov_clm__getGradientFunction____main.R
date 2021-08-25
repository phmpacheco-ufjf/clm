getGradientFunction <- function(derivativesExprList, sigmaThetaExprList, fit, fittingType) {
  if (fittingType == "PML") {
    gradientFunction <- fittingGradientPML(derivativesExprList, sigmaThetaExprList, fit)
  } else if (fittingType == "ULSC") {
    gradientFunction <- fittingGradientULSC(derivativesExprList, sigmaThetaExprList, fit)
  } else if (fittingType == "GLSC2") {
    gradientFunction <- fittingGradientGLSC2(derivativesExprList, sigmaThetaExprList, fit)
  } else if (fittingType == "GLSC3") {
    gradientFunction <- fittingGradientGLSC3(derivativesExprList, sigmaThetaExprList, fit)
  } else if (fittingType == "GLSC4") {
    gradientFunction <- fittingGradientGLSC4(derivativesExprList, sigmaThetaExprList, fit)
  }

  return(gradientFunction)
}
