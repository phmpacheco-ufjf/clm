getSigmaAutoregressive <- function(modelComponents) {
  source("./R/clm__getSigmaMatrix__fitModelWithSigmaIdentity.R", local = environment())
  source("./R/clm__getSigmaMatrix__rhoCalculation.R", local = environment())

  fit <- fitModelWithSigmaIdentity(modelComponents)
  rho <- rhoCalculation(fit)

  waveCombinations <- expand.grid(t = seq(fit$info$T), tlinha = seq(fit$info$T))
  sigma <- matrix(mapply(
    function(t, tlinha) rho^abs(t - tlinha),
    waveCombinations$t, waveCombinations$tlinha
  ), ncol = fit$info$T)

  attr(sigma, "type") <- "autoregressive"
  attr(sigma, "rho") <- rho

  return(sigma)
}
