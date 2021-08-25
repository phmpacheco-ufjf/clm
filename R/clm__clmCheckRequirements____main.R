clmCheckRequirements <- function(modelComponents, sigma) {
  checkResponseRequirements(modelComponents$response)
  checkExplanatoryRequirements(modelComponents$explanatory)
  checkWavesRequirements(modelComponents$waves)
  checkIdsRequirements(modelComponents$ids)
  checkWeightsRequirements(modelComponents$weights)
  checkStratumRequirements(modelComponents$stratum)
  checkClusterRequirements(modelComponents$cluster)

  checkSigmaRequirements(sigma, modelComponents$waves)

  return(NULL)
}
