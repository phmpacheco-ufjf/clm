addMethodIfMissing <- function(optimParams) {
  if (!"method" %in% names(optimParams)) {
    method <- "L-BFGS-B"
  }

  return(method)
}
