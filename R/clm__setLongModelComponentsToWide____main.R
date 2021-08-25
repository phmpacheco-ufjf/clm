setLongModelComponentsToWide <- function(modelComponents) {
  wideModelComponents <- list(
    response = transformResponseToWide(modelComponents),
    explanatory = transformExplanatoryToWide(modelComponents),
    weights = transformDesignToWide(modelComponents, "weights"),
    stratum = transformDesignToWide(modelComponents, "stratum"),
    cluster = transformDesignToWide(modelComponents, "cluster")
  )

  return(wideModelComponents)
}
