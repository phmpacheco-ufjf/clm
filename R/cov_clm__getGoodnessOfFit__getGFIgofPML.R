getGFIgofPML <- function(fit, fitTheta) {
  denominator <- solve(fitTheta$sigmaTheta) %*% fit$sigmaHat
  nominator <- denominator - diag(1, nrow = fit$info$T, ncol = fit$info$T)

  GFI <- 1 - (sum(diag(nominator %*% nominator)) / sum(diag(denominator %*% denominator)))

  return(GFI)
}
