setWideModelComponentsToList <- function(wideModelComponents) {
  N <- dim(wideModelComponents$response)[1]
  T <- dim(wideModelComponents$response)[2]
  Q <- length(wideModelComponents$explanatory)

  individuals <- lapply(seq(N), function(i) list(i = i))
  names(individuals) <- paste0("individual_", seq(N))

  rbindXVariables <- function(i) t(do.call(rbind, lapply(wideModelComponents$explanatory, function(x) x[i, ])))

  individuals <- mapply(function(i, yi, xi, wi, hi, ji) {
    within(i, {
      yi <- as.matrix(unlist(yi))
      xi <- as.matrix(xi)
      wi <- as.numeric(wi)
      hi <- as.numeric(hi)
      ji <- as.numeric(ji)
    })
  },
  individuals,
  purrr::transpose(wideModelComponents$response),
  sapply(seq(N), rbindXVariables, simplify = FALSE),
  purrr::transpose(wideModelComponents$weights),
  purrr::transpose(wideModelComponents$stratum),
  purrr::transpose(wideModelComponents$cluster),
  SIMPLIFY = FALSE
  )

  attr(individuals, "N") <- N
  attr(individuals, "T") <- T
  attr(individuals, "Q") <- Q

  return(individuals)
}
