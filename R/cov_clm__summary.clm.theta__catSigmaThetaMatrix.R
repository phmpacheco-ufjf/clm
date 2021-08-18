catSigmaThetaMatrix <- function(fitTheta) {
  cat("\n\nSigma Theta Matrix:")
  print(knitr::kable(fitTheta$sigmaTheta, format = "simple", digits = 4))

  return(NULL)
}
