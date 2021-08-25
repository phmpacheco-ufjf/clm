fitInit <- function(individuals, sigma) {
  fit <- list()
  fit$info <- list(
    N = attr(individuals, "N"),
    T = attr(individuals, "T"),
    Q = attr(individuals, "Q")
  )
  fit$individuals <- individuals
  fit$sigma <- styleSigma(sigma, fit$info$T)

  return(fit)
}
