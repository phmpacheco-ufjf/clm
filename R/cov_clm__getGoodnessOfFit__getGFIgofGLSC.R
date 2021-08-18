getGFIgofGLSC <- function(fit, fitTheta) {
  nominator <- diag(1, nrow = fit$info$T, ncol = fit$info$T) - (fitTheta$sigmaTheta %*% solve(fit$sigmaHat))

  GFI <- 1 - sum(diag(nominator %*% nominator)) / fit$info$T

  return(GFI)
}
