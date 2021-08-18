generateUnstrucSigmaThetaExprList <- function(fit) {
  wavesCombination <- expand.grid(t = seq(fit$info$T), tlinha = seq(fit$info$T))

  sigmaThetaExpr <- mapply(function(t, tlinha) {
    if (tlinha < t) {
      parse(text = paste0("sigma2u + sigmav", t, tlinha))
    } else {
      parse(text = paste0("sigma2u + sigmav", tlinha, t))
    }
  }, wavesCombination$t, wavesCombination$tlinha, SIMPLIFY = FALSE)

  indexParms <- matrix(paste0(wavesCombination$t, wavesCombination$tlinha), nrow = fit$info$T)
  sigmaThetaExprList <- list(
    expr = sigmaThetaExpr,
    paramsNames = c("sigma2u", paste0("sigmav", indexParms[lower.tri(indexParms, diag = TRUE)]))
  )

  return(sigmaThetaExprList)
}
