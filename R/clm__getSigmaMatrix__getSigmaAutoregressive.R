getSigmaAutoregressive <- function(modelComponents) {
  fit <- fitModelWithSigmaIdentity(modelComponents)
  rho <- rhoCalculation(fit)

  waveCombinations <- expand.grid(t = seq(fit$info$T), tlinha = seq(fit$info$T))

  sigmaCalc <- function(t, tlinha) rho^abs(t - tlinha)
  sigma <- matrix(mapply(sigmaCalc, waveCombinations$t, waveCombinations$tlinha), ncol = fit$info$T)

  attr(sigma, "type") <- "autoregressive"
  attr(sigma, "rho") <- rho

  return(sigma)
}
