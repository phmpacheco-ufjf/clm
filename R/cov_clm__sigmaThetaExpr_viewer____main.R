sigmaThetaExpr_viewer <- function(sigmaThetaExpr, numWaves = NULL) {
  source("./R/cov_clm__sigmaThetaExpr_viewer____functions.R", local = environment())

  checkSigmaThetaExprRequirements(sigmaThetaExpr, numWaves)

  fit <- simulateFitList(sigmaThetaExpr, numWaves)
  sigmaThetaExpr <- getSigmaThetaExprList(sigmaThetaExpr, fit)
  exprMatrix <- generateExprMatrix(sigmaThetaExpr)

  paramsCaption <- Reduce("paste", sigmaThetaExpr$paramsNames)
  print(kable(exprMatrix, align = "c", caption = paramsCaption))

  return(invisible(NULL))
}
