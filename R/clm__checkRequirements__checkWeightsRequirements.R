checkWeightsRequirements <- function(weights) {
  if (dim(weights)[2] > 1) {
    stop("Invalid 'weights' argument. Must be one-dimensional!")
  } else if (typeof(weights$value) == "character" | typeof(weights$value) == "logical") {
    stop("Invalid 'weights' argument. Shouldn't be character or logical!")
  } else if (any(is.na(weights$value))) {
    stop("Invalid 'weights' argument. Shouldn't have NA values!")
  } else if (any(weights$value <= 0)) {
    stop("Invalid 'weights' argument. Must be greater than zero!")
  }

  return(NULL)
}
