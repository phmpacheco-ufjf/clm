getAGFI <- function(fit, fitTheta, fittingType) {
  if (fittingType == "PML") {
    GFI <- getGFIgofPML(fit, fitTheta)
  } else if (fittingType == "ULSC") {
    GFI <- getGFIgofULSC(fit, fitTheta)
  } else if (fittingType %in% c("GLSC2", "GLSC3")) {
    GFI <- getGFIgofGLSC(fit, fitTheta)
  } else if (fittingType == "GLSC4") {
    GFI <- getGFIgofGLSC4(fit, fitTheta)
  }

  AGFI <- AGFIcalculation(GFI, fit, fitTheta)

  return(AGFI)
}
