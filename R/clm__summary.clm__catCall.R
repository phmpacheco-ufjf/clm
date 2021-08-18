catCall <- function(fit) {
  cat("Call:\n")
  cat(paste(deparse(fit$call), collapse = "\n"))

  return(NULL)
}
