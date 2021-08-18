generateToeplitzSigmaThetaExprList <- function(fit) {
  wavesCombination <- expand.grid(t = seq(fit$info$T), tlinha = seq(fit$info$T))

  sigmaThetaExpr <- mapply(function(t, tlinha) {
    if (t == tlinha) {
      parse(text = paste0("sigma2u + sigma2v"))
    } else {
      parse(text = paste0("sigma2u + sigma", abs(t - tlinha)))
    }
  }, wavesCombination$t, wavesCombination$tlinha, SIMPLIFY = FALSE)

  sigmaThetaExprList <- list(
    expr = sigmaThetaExpr,
    paramsNames = c("sigma2u", "sigma2v", paste0("sigma", seq(fit$info$T - 1)))
  )

  return(sigmaThetaExprList)
}
