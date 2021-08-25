getOptimTable <- function(fitTheta) {
  optimTable <- tibble::tibble(
    "  " = fitTheta$sigmaThetaExpr$paramsNames,
    "Start Value" = fitTheta$optimParams$par,
    "Lower" = if ("lower" %in% names(fitTheta$optimParams)) fitTheta$optimParams$lower else "-",
    "Upper" = if ("upper" %in% names(fitTheta$optimParams)) fitTheta$optimParams$upper else "-"
  )

  return(optimTable)
}
