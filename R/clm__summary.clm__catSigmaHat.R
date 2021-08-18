catSigmaHat <- function(fit) {
  cat("---\n\nSigma Estimated:")
  print(knitr::kable(fit$sigmaHat, format = "simple", digits = 4))
  cat("---")

  return(NULL)
}
