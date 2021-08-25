fitModel <- function(individuals, sigma) {
  fit <- fitInit(individuals, sigma)

  fit$coefficients <- fitBetaPML(fit)
  fit$fitted <- getFittedMatrix(fit)
  fit$residuals <- getResidualMatrix(fit)

  fit$individuals <- addFittedToIndividualsList(fit)
  fit$individuals <- addResidualsToIndividualsList(fit)

  fit$se <- fitBetaSE(fit)

  fit$sigmaHat <- fitSigmaHat(fit)
  fit$sigmaHatVar <- fitSigmaHatVar(fit)

  return(fit)
}
