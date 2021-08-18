generateARMA11SigmaThetaExprList <- function(fit) {
  wavesCombination <- expand.grid(t = seq(fit$info$T), tlinha = seq(fit$info$T))

  sigmaThetaExpr <- mapply(function(t, tlinha) {
    if (abs(t - tlinha) - 1 < 0) {
      parse(text = paste0("sigma2u + sigma2v"))
    } else {
      parse(text = paste0("sigma2u + gamma * phi^", abs(t - tlinha) - 1, "* sigma2v"))
    }
  }, wavesCombination$t, wavesCombination$tlinha, SIMPLIFY = FALSE)

  sigmaThetaExprList <- list(
    expr = sigmaThetaExpr,
    paramsNames = c("sigma2u", "sigma2v", "gamma", "phi")
  )

  return(sigmaThetaExprList)
}
