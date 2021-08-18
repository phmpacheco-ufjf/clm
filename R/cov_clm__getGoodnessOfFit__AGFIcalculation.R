AGFIcalculation <- function(GFI, fit, fitTheta) {
  numVechSigma <- fit$info$T * (fit$info$T + 1) / 2
  modelDF <- length(fitTheta$optim$par)

  AGFI <- 1 - (numVechSigma / (numVechSigma - modelDF)) * (1 - GFI)

  return(AGFI)
}
