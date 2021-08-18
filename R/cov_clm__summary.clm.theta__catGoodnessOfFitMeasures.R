catGoodnessOfFitMeasures <- function(fitTheta) {
  cat("\n\nGoodness of Fit Measures:")
  cat(paste0("\n\nRMR: ", round(fitTheta$gofMeasures$RMR, 4)))
  cat(paste0("\nAGFI: ", round(fitTheta$gofMeasures$AGFI, 4)))

  return(NULL)
}
