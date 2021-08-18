getRMR <- function(fit, fitTheta) {
  res <- fit$sigmaHat - fitTheta$sigmaTheta
  RMR <- sqrt(2 * sum(apply(res, 2, function(resi) sum(resi^2))) / (fit$info$T * (fit$info$T + 1)))

  return(RMR)
}
