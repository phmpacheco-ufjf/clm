simulateFitList <- function(sigmaThetaExpr, numWaves) {
  fit <- list()

  if (is.character(sigmaThetaExpr)) {
    fit$info$T <- numWaves
  } else {
    fit$info$T <- sqrt(length(sigmaThetaExpr$expr))
  }

  return(fit)
}
