getCovTheta <- function(derivVechMatrix, UMatrix, fit) {
  partA <- solve(t(derivVechMatrix) %*% solve(UMatrix) %*% derivVechMatrix)
  partB <- t(derivVechMatrix) %*% solve(UMatrix) %*% fit$sigmaHatVar %*% solve(UMatrix) %*% derivVechMatrix

  covTheta <- partA %*% partB %*% partA

  return(covTheta)
}
