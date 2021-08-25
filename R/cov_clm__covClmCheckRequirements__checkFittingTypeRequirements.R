checkFittingTypeRequirements <- function(fittingType) {
  if (!fittingType %in% c("PML", "ULSC", "GLSC2", "GLSC3", "GLSC4")) {
    stop("Invalid 'fittingType' argument. 'fittingType' must be 'PML', 'ULSC', 'GLSC2', 'GLSC3' or 'GLSC4'")
  }

  return(NULL)
}
