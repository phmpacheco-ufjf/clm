setLowerAndUpperIfExists <- function(optimParams, sigmaThetaExpr) {
  if ("lower" %in% names(optimParams)) {
    if (!is.null(names(optimParams$par))) {
      names(optimParams$lower) <- names(optimParams$par)
    } else {
      names(optimParams$lower) <- sigmaThetaExprList$paramsNames
    }
    optimParams$lower <- optimParams$lower[sigmaThetaExprList$paramsNames]
  }
  if ("upper" %in% names(optimParams)) {
    if (!is.null(names(optimParams$par))) {
      names(optimParams$upper) <- names(optimParams$par)
    } else {
      names(optimParams$upper) <- sigmaThetaExprList$paramsNames
    }
    optimParams$upper <- optimParams$upper[sigmaThetaExprList$paramsNames]
  }

  return(optimParams)
}
