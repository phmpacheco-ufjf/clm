#' Fit covariance structered longitudinal model.
#'
#' @param fit A fit model with class 'clm'
#' @param fittingType A character with the fitting function type. See optins above
#' @param sigmaThetaExpr A character with the covariance structure type or a list of expressions
#' @param optimParams A list with configuration for optim function. 'Par' is required.
#'
#' @return The fit model with class 'clm.theta'.
#'
#' @examples
#' fitTheta <- cov_clm(fit,
#'   fittingType = "PML", sigmaThetaExpr = "UCM",
#'   optimParams = list(par = c(7, 5))
#' )
#' @export

cov_clm <- function(fit, fittingType, sigmaThetaExpr, optimParams) {
  call <- match.call() # Capture function call
  covClmCheckRequirements(fit, fittingType, sigmaThetaExpr, optimParams)

  sigmaThetaExprList <- getSigmaThetaExprList(sigmaThetaExpr, fit)
  fittingFunction <- getFittingFunction(fittingType, sigmaThetaExprList, fit)

  derivativesExprList <- getDerivativesExprList(sigmaThetaExprList)
  gradientFunction <- getGradientFunction(derivativesExprList, sigmaThetaExprList, fit, fittingType)

  optimParams <- addConfigToOptimParams(optimParams, fittingFunction, gradientFunction, sigmaThetaExprList)

  fitTheta <- fitThetaModel(optimParams, sigmaThetaExprList, derivativesExprList, fittingType, fit)
  gofMeasures <- getGoodnessOfFit(fitTheta, fit, fittingType)

  fitTheta <- organizeFitTheta(fitTheta, gofMeasures, call, sigmaThetaExpr)

  return(fitTheta)
}
