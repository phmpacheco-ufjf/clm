clm <- function(formula, waves, ids, weights, stratum, cluster, data, sigma = "identity") {
  source("./R/clm____functions.R", local = environment())

  call <- match.call(expand.dots = FALSE) # Capture function call
  modelFrame <- transformCallToFrame(call)

  modelComponents <- getModelComponentsFromModelFrame(modelFrame)
  checkRequirements(modelComponents, sigma)

  sigma <- getSigmaMatrix(sigma, modelComponents)

  wideModelComponents <- setLongModelComponentsToWide(modelComponents)
  individuals <- setWideModelComponentsToList(wideModelComponents)

  fit <- fitModel(individuals, sigma)
  fit <- organizeResults(fit, call, formula, wideModelComponents)

  return(fit)
}
