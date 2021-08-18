getModelComponentsFromModelFrame <- function(modelFrame) {
  source("./R/clm__getModelComponentsFromModelFrame____functions.R", local = environment())

  components <- list(
    response = extractComponents(modelFrame, "response"),
    explanatory = extractExplanatoryComponents(modelFrame),
    waves = extractComponents(modelFrame, "waves"),
    ids = extractComponents(modelFrame, "ids"),
    weights = extractComponents(modelFrame, "weights"),
    stratum = extractComponents(modelFrame, "stratum"),
    cluster = extractComponents(modelFrame, "cluster")
  )

  return(components)
}
