checkResponseRequirements <- function(response) {
  if (dim(response)[2] > 1) {
    stop("Response variable must be one-dimensional!")
  } else if (any(is.na(response$value))) {
    stop("Response variable shouldn't have NA values!")
  } else if (typeof(response$value) == "character" | typeof(response$value) == "logical") {
    stop("Response variable shouldn't be character or logical!")
  }

  return(NULL)
}
