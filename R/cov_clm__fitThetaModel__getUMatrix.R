getUMatrix <- function(fit) {
  wavesComb <- expand.grid(tlinha = seq(fit$info$T), t = seq(fit$info$T))
  wavesCombMatrix <- matrix(
    mapply(function(t1, t2) c(t1, t2), wavesComb$t, wavesComb$tlinha, SIMPLIFY = FALSE),
    ncol = fit$info$T
  )
  wavesComb <- data.frame(matrix(
    unlist(matrix(wavesCombMatrix[lower.tri(wavesCombMatrix, diag = TRUE)], ncol = 1)),
    ncol = 2, byrow = TRUE
  ))
  names(wavesComb) <- c("t", "tlinha")

  UMatrix <- mapply(function(t, tlinha) {
    auxMatrix <- fit$sigmaHat[, t] %*% t(fit$sigmaHat[, tlinha])

    pt1 <- matrix(auxMatrix[lower.tri(auxMatrix, diag = TRUE)], ncol = 1)
    pt2 <- matrix((t(auxMatrix)[lower.tri(auxMatrix, diag = TRUE)]), ncol = 1)

    return(pt1 + pt2)
  }, wavesComb$t, wavesComb$tlinha)

  return(UMatrix)
}
