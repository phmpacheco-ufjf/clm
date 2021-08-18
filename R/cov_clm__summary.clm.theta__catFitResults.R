catFitResults <- function(fitTheta, thetaTable) {
  cat("\n\nCovariance Params: ")
  cat(fitTheta$sigmaThetaExpr$paramsNames)
  cat("\n\nCoefficients:")
  print(knitr::kable(thetaTable, format = "simple", digits = 4))

  return(NULL)
}
