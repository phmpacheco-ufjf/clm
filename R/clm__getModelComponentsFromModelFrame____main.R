getModelComponentsFromModelFrame <- function(modelFrame) {
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
