getResidualMatrix <- function(fit) {
  responseMatrix <- do.call(rbind, lapply(fit$individuals, function(ind) t(ind$yi)))
  residuals <- responseMatrix - fit$fitted

  rownames(residuals) <- paste0("ind", seq(fit$info$N))

  return(residuals)
}
