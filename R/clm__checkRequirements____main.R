checkRequirements <- function(modelComponents, sigma) {
  source("./R/clm__checkRequirements____functions.R", local = environment())

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
