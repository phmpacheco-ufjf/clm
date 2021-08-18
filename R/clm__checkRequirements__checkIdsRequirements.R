checkIdsRequirements <- function(ids) {
  if (dim(ids)[2] > 1) {
    stop("Invalid 'ids' argument. Must be one-dimensional!")
  } else if (typeof(ids$value) == "logical") {
    stop("Invalid 'ids' argument. Shouldn't be logical!")
  } else if (any(is.na(ids$value))) {
    stop("Invalid 'ids' argument. Shouldn't have NA values!")
  } else if (length(unique(ids %>% group_by(value) %>% summarise(count = n(), .groups = "drop") %>% .$count)) != 1) {
    stop("Invalid 'ids' argument. Every id should be unique in a wave!")
  }

  return(NULL)
}
