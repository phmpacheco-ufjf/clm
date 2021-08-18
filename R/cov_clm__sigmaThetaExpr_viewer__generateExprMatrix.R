generateExprMatrix <- function(sigmaThetaExpr) {
  T <- sqrt(length(sigmaThetaExpr$expr))
  exprMatrix <- matrix(as.character(unlist(sigmaThetaExpr$expr)), nrow = T, ncol = T)
  rownames(exprMatrix) <- paste0("T", seq(T))
  colnames(exprMatrix) <- paste0("T", seq(T))

  return(exprMatrix)
}
