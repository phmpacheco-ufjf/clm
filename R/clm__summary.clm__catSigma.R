catSigma <- function(fit) {
  cat("Covariance Matrix Provided:\n")
  cat(paste("   Type:", attr(fit$sigma, "type")))
  if (!is.null(attr(fit$sigma, "rho"))) cat(paste("\n   rho:", round(attr(fit$sigma, "rho"), 4)))
  print(knitr::kable(fit$sigma, format = "simple", digits = 4))

  return(NULL)
}
