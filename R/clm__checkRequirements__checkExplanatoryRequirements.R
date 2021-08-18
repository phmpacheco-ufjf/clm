checkExplanatoryRequirements <- function(explanatory) {
  mapply(function(col, name) {
    if (any(is.na(col))) {
      stop(paste0("Invalid '", name, "' variable. ", "Explanatory variable shouldn't have NA values!"))
    }
  }, explanatory, names(explanatory))

  return(NULL)
}
