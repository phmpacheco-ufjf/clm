getDerivVechMatrix <- function(derivSigmaThetaList) {
  derivVechMatrix <- sapply(derivSigmaThetaList, function(derivSigmaThetaj) {
    matrix(derivSigmaThetaj[lower.tri(derivSigmaThetaj, diag = TRUE)], ncol = 1)
  })

  return(derivVechMatrix)
}
