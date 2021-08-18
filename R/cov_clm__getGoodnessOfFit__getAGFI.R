getAGFI <- function(fit, fitTheta, fittingType) {
  source("./R/cov_clm__getGoodnessOfFit__getGFIgofPML.R", local = environment())
  source("./R/cov_clm__getGoodnessOfFit__getGFIgofULSC.R", local = environment())
  source("./R/cov_clm__getGoodnessOfFit__getGFIgofGLSC.R", local = environment())
  source("./R/cov_clm__getGoodnessOfFit__getGFIgofGLSC4.R", local = environment())
  source("./R/cov_clm__getGoodnessOfFit__AGFIcalculation.R", local = environment())

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
