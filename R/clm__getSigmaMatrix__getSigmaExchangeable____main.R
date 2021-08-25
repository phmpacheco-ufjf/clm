getSigmaExchangeable <- function(modelComponents) {
  fit <- fitModelWithSigmaIdentity(modelComponents)
  rho <- rhoCalculation(fit)

  sigma <- matrix(rho, ncol = fit$info$T, nrow = fit$info$T)
  diag(sigma) <- 1

  attr(sigma, "type") <- "exchangeable"
  attr(sigma, "rho") <- rho

  return(sigma)
}
