getDerivativesExprList <- function(sigmaThetaExprList) {
  # source("./R/cov_clm__getFittingFunction____functions.R", local = environment())

  derivativesExprList <- lapply(sigmaThetaExprList$expr, function(expr) {
    deriv(expr, sigmaThetaExprList$paramsNames, hessian = TRUE)
  })

  return(derivativesExprList)
}
