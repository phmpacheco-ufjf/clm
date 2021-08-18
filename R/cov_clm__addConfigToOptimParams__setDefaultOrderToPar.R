setDefaultOrderToPar <- function(optimParams, sigmaThetaExprList) {
  if (!is.null(names(optimParams$par))) {
    optimParams$par <- optimParams$par[sigmaThetaExprList$paramsNames]
  } else {
    names(optimParams$par) <- sigmaThetaExprList$paramsNames
  }

  return(optimParams)
}
