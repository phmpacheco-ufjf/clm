getThetaTable <- function(fitTheta) {
  thetaTable <- tibble::tibble(
    "  " = fitTheta$sigmaThetaExpr$paramsNames,
    "Estimate" = round(fitTheta$optim$par, 4),
    "Std. Error" = round(sqrt(diag(fitTheta$covTheta)), 4)
  )

  return(thetaTable)
}
