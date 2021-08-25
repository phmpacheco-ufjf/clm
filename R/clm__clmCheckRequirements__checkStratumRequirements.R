checkStratumRequirements <- function(stratum) {
  if (dim(stratum)[2] > 1) {
    stop("Invalid 'stratum' argument. Must be one-dimensional!")
  } else if (typeof(stratum$value) == "character" | typeof(stratum$value) == "logical") {
    stop("Invalid 'stratum' argument. Shouldn't be character or logical!")
  } else if (any(is.na(stratum$value))) {
    stop("Invalid 'stratum' argument. Shouldn't have NA values!")
  } else if (any(stratum$value <= 0)) {
    stop("Invalid 'stratum' argument. Must be greater than zero!")
  }

  return(NULL)
}
