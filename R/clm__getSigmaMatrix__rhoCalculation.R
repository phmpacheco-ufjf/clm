rhoCalculation <- function(fit) {
  rho <- ((sum(apply(fit$residuals, 1, sum)^2) - sum(fit$residuals^2)) /
    (fit$info$N * fit$info$T * (fit$info$T - 1))) /
    (sum(fit$residuals^2) / (fit$info$N * fit$info$T))

  return(rho)
}
