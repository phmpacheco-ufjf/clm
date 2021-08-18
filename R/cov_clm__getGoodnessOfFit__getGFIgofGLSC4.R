getGFIgofGLSC4 <- function(fit, fitTheta) {
  source("./R/cov_clm__fitThetaModel__getUMatrix.R", local = environment())

  UMatrix <- getUMatrix(fit)

  vechSw <- matrix(fit$sigmaHat[lower.tri(fit$sigmaHat, diag = TRUE)], ncol = 1)
  vechSigmaTheta <- matrix(fitTheta$sigmaTheta[lower.tri(fitTheta$sigmaTheta, diag = TRUE)], ncol = 1)

  nominator <- t((vechSw - vechSigmaTheta)) %*% solve(UMatrix) %*% (vechSw - vechSigmaTheta)
  denominator <- t((vechSw)) %*% solve(UMatrix) %*% (vechSw)

  GFI <- 1 - (nominator / denominator)

  return(GFI)
}
