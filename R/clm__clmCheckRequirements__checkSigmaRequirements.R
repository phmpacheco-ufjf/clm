checkSigmaRequirements <- function(sigma, waves) {
  if (is.character(sigma)) {
    if (!sigma %in% c("identity", "exchangeable", "autoregressive")) {
      stop("Invalid 'sigma' argument. Please provide a valid sigma type!")
    }
  } else if (is.matrix(sigma)) {
    if (dim(sigma)[1] != dim(unique(waves[, 1]))[1] | dim(sigma)[2] != dim(unique(waves[, 1]))[1]) {
      stop("invalid 'sigma' argument. Please provide a T-square sigma matrix!")
    } else if (!isSymmetric(sigma)) {
      stop("Invalid 'sigma' argument. Must be symmetric!")
    } else if (any(sigma < 0)) {
      stop("Invalid 'sigma' argument. Must be greater or equal than zero!")
    }
  } else {
    stop("invalid 'sigma' argument. Please provide a sigma type or a matrix!")
  }

  return(NULL)
}
