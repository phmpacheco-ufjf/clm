checkIdsRequirements <- function(ids) {
  if (dim(ids)[2] > 1) {
    stop("Invalid 'ids' argument. Must be one-dimensional!")
  } else if (typeof(ids$value) == "logical") {
    stop("Invalid 'ids' argument. Shouldn't be logical!")
  } else if (any(is.na(ids$value))) {
    stop("Invalid 'ids' argument. Shouldn't have NA values!")
  } else {
    idsCount <- length(unique(ids %>%
      dplyr::group_by(value) %>%
      dplyr::summarise(count = dplyr::n(), .groups = "drop") %>%
      .$count))
    if (idsCount != 1) {
      stop("Invalid 'ids' argument. Every id should be unique in a wave!")
    }
  }

  return(NULL)
}
