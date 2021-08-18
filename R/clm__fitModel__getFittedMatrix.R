getFittedMatrix <- function(fit) {
  fitted <- do.call(rbind, lapply(fit$individuals, function(ind) t(ind$xi %*% fit$coefficients)))

  rownames(fitted) <- paste0("ind", seq(fit$info$N))

  return(fitted)
}
