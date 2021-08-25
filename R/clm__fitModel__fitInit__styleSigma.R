styleSigma <- function(sigma, T) {
  rownames(sigma) <- paste0("T", seq(T))
  colnames(sigma) <- paste0("T", seq(T))

  return(sigma)
}
