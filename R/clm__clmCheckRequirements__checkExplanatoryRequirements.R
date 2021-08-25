checkExplanatoryRequirements <- function(explanatory) {
  checkNAValues <- function(col, name) {
    if (any(is.na(col))) {
      stop(paste0("Invalid '", name, "' variable. ", "Explanatory variable shouldn't have NA values!"))
    }
  }

  mapply(checkNAValues, explanatory, names(explanatory))

  return(NULL)
}
