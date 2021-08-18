catSampleDesign <- function(fit) {
  cat("Sampling Design:\n")
  if (dim(unique(fit$model$weights))[1] > 1) cat("   Sample Weights: Yes\n") else cat("   Sample Weights: No\n")
  if (dim(unique(fit$model$stratum))[1] > 1) cat("   Stratification: Yes\n") else cat("   Stratification: No\n")
  if (dim(fit$model$cluster)[1] > dim(unique(fit$model$cluster))[1]) cat("   Clusterization: Yes\n\n") else cat("   Clusterization: No\n\n")

  return(NULL)
}
