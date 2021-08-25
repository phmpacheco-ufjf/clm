getGoodnessOfFit <- function(fitTheta, fit, fittingType) {
  gofMeasures <- list()
  gofMeasures$RMR <- getRMR(fit, fitTheta)
  gofMeasures$AGFI <- getAGFI(fit, fitTheta, fittingType)

  return(gofMeasures)
}
