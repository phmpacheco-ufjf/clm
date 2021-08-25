getFittingFunction <- function(fittingType, sigmaThetaExprList, fit) {
  if (fittingType == "PML") {
    fittingFunction <- fittingPML(sigmaThetaExprList, fit)
  } else if (fittingType == "ULSC") {
    fittingFunction <- fittingULSC(sigmaThetaExprList, fit)
  } else if (fittingType == "GLSC2") {
    fittingFunction <- fittingGLSC2(sigmaThetaExprList, fit)
  } else if (fittingType == "GLSC3") {
    fittingFunction <- fittingGLSC3(sigmaThetaExprList, fit)
  } else if (fittingType == "GLSC4") {
    fittingFunction <- fittingGLSC4(sigmaThetaExprList, fit)
  }

  return(fittingFunction)
}
