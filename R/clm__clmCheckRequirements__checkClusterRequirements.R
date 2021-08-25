checkClusterRequirements <- function(cluster) {
  if (dim(cluster)[2] > 1) {
    stop("Invalid 'cluster' argument. Must be one-dimensional!")
  } else if (typeof(cluster$value) == "character" | typeof(cluster$value) == "logical") {
    stop("Invalid 'cluster' argument. Shouldn't be character or logical!")
  } else if (any(is.na(cluster$value))) {
    stop("Invalid 'cluster' argument. Shouldn't have NA values!")
  } else if (any(cluster$value <= 0)) {
    stop("Invalid 'cluster' argument. Must be greater than zero!")
  }

  return(NULL)
}
