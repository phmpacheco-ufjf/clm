getSigmaIdentity <- function(modelComponents) {
  sigma <- diag(dim(unique(modelComponents$waves[, 1]))[1])
  attr(sigma, "type") <- "identity"

  return(sigma)
}
