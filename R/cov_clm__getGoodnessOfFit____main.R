getGoodnessOfFit <- function(fitTheta, fit, fittingType) {
  source("./R/cov_clm__getGoodnessOfFit____functions.R", local = environment())

  gofMeasures <- list()
  gofMeasures$RMR <- getRMR(fit, fitTheta)
  gofMeasures$AGFI <- getAGFI(fit, fitTheta, fittingType)

  return(gofMeasures)
}
