generateARH1SigmaThetaExprList <- function(fit) {
  wavesCombination <- expand.grid(t = seq(fit$info$T), tlinha = seq(fit$info$T))

  sigmaThetaExpr <- mapply(function(t, tlinha) {
    if (t == tlinha) {
      parse(text = paste0("sigma2u + sigmav", t, "^2"))
    } else {
      parse(text = paste0("sigma2u + sigmav", t, " * sigmav", tlinha, " * phi^", abs(t - tlinha)))
    }
  }, wavesCombination$t, wavesCombination$tlinha, SIMPLIFY = FALSE)

  sigmaThetaExprList <- list(
    expr = sigmaThetaExpr,
    paramsNames = c("sigma2u", paste0("sigmav", seq(fit$info$T)), "phi")
  )

  return(sigmaThetaExprList)
}
