setLongModelComponentsToWide <- function(modelComponents) {
  source("./R/clm__setLongModelComponentsToWide____functions.R", local = environment())

  wideModelComponents <- list(
    response = transformResponseToWide(modelComponents),
    explanatory = transformExplanatoryToWide(modelComponents),
    weights = transformDesignToWide(modelComponents, "weights"),
    stratum = transformDesignToWide(modelComponents, "stratum"),
    cluster = transformDesignToWide(modelComponents, "cluster")
  )

  return(wideModelComponents)
}
