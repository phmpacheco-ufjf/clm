#' covariance structure viewer to preview sigmaThetaExpr to be used in 'cov_clm'.
#'
#' @param sigmaThetaExpr A character with the covariance structure type or a list of expressions
#' @param numWaves An integer with the size of the square matrix to be printed.
#'
#' @return Return NULL and print in terminal the sigmaThetaExpr.
#'
#' @examples
#' # UCM
#' sigmaThetaExpr_viewer("UCM", 5)
#' @export

sigmaThetaExpr_viewer <- function(sigmaThetaExpr, numWaves = NULL) {
  checkSigmaThetaExprRequirements(sigmaThetaExpr, numWaves)

  fit <- simulateFitList(sigmaThetaExpr, numWaves)
  sigmaThetaExpr <- getSigmaThetaExprList(sigmaThetaExpr, fit)
  exprMatrix <- generateExprMatrix(sigmaThetaExpr)

  paramsCaption <- Reduce("paste", sigmaThetaExpr$paramsNames)
  print(knitr::kable(exprMatrix, align = "c", caption = paramsCaption))

  return(invisible(NULL))
}
