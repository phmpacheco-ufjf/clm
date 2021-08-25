AGFIcalculation <- function(GFI, fit, fitTheta) {
  numVechSigma <- fit$info$T * (fit$info$T + 1) / 2
  numParams <- length(fitTheta$optim$par)

  AGFI <- 1 - (numVechSigma / (numVechSigma - numParams)) * (1 - GFI)

  return(AGFI)
}
