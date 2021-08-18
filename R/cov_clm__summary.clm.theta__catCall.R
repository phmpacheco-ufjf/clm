catCall <- function(fitTheta) {
  cat("Call:\n")
  cat(paste(deparse(fitTheta$call), collapse = "\n"))

  return(NULL)
}
