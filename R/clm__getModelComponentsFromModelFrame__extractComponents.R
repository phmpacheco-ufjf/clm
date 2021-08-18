extractComponents <- function(modelFrame, componentName) {
  componentValue <- do.call(model.extract, list(frame = modelFrame$data, component = componentName))

  if (is.null(componentValue)) {
    if (componentName %in% c("weights", "stratum")) {
      componentValue <- tibble(value = rep(1, dim(modelFrame$data)[1]))
    } else if (componentName == "cluster") {
      componentValue <- tibble(value = seq(dim(modelFrame$data)[1]))
    }
  } else {
    componentValue <- as_tibble(componentValue)
    if (componentName == "waves") {
      if (typeof(componentValue$value) == "character") componentValue$value <- as.numeric(factor(componentValue$value))
    }
  }

  return(componentValue)
}
