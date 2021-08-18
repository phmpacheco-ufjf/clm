catOptimDetails <- function(fitTheta, optimTable) {
  cat("---\n\nOptimization Details:")
  cat("\n\nConverged: ")
  if (fitTheta$optim$convergence == 0) cat("TRUE") else cat("FALSE")
  cat(paste0("\nOptim Method: ", fitTheta$optimParams$method))
  cat(paste0("\nIteractions Number - Function: ", fitTheta$optim$counts[1]))
  cat(paste0("\nIteractions Number - Gradient: ", fitTheta$optim$counts[2]))
  cat(paste0("\nOptim Function Value: ", round(fitTheta$optim$value, 4)))
  print(knitr::kable(optimTable, format = "simple", digits = 4))

  return(NULL)
}
