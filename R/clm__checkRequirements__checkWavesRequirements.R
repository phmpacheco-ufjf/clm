checkWavesRequirements <- function(waves) {
  if (dim(waves)[2] > 1) {
    stop("Invalid 'waves' argument. Must be one-dimensional!")
  } else if (typeof(waves$value) == "logical") {
    stop("Invalid 'waves' argument. Shouldn't logical!")
  } else if (any(is.na(waves$value))) {
    stop("Invalid 'waves' argument. Shouldn't have NA values!")
  } else if (length(unique(waves %>% group_by(value) %>% summarise(count = n(), .groups = "drop") %>% .$count)) != 1) {
    stop("Invalid 'waves' argument. Waves shouldn't have different lenghts!")
  }

  return(NULL)
}
