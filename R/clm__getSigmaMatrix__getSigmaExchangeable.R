getSigmaExchangeable <- function(modelComponents) {
  source("./R/clm__getSigmaMatrix__fitModelWithSigmaIdentity.R", local = environment())
  source("./R/clm__getSigmaMatrix__rhoCalculation.R", local = environment())

  fit <- fitModelWithSigmaIdentity(modelComponents)
  rho <- rhoCalculation(fit)

  sigma <- matrix(rho, ncol = fit$info$T, nrow = fit$info$T)
  diag(sigma) <- 1

  attr(sigma, "type") <- "exchangeable"
  attr(sigma, "rho") <- rho

  return(sigma)
}
