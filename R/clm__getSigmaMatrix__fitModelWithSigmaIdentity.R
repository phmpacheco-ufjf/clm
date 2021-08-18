fitModelWithSigmaIdentity <- function(modelComponents) {
  explanatoryMatrix <- as.matrix(modelComponents$explanatory[, -1])
  fit <- clm(modelComponents$response$value ~ explanatoryMatrix,
    waves = modelComponents$waves$value, ids = modelComponents$ids$value, weights = modelComponents$weights$value,
    stratum = modelComponents$stratum$value, cluster = modelComponents$cluster$value, sigma = "identity"
  )

  return(fit)
}
