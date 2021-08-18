getGFIgofULSC <- function(fit, fitTheta) {
  nominator <- fit$sigmaHat - fitTheta$sigmaTheta

  GFI <- 1 - sum(diag(nominator %*% nominator)) / sum(diag(fit$sigmaHat %*% fit$sigmaHat))

  return(GFI)
}
