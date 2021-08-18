setWideModelComponentsToList <- function(wideModelComponents) {
  # source("./R/clm__setWideModelComponentsToList____functions.R", local = environment())

  N <- dim(wideModelComponents$response)[1]
  T <- dim(wideModelComponents$response)[2]
  Q <- length(wideModelComponents$explanatory)

  individuals <- lapply(seq(N), function(i) list(i = i))
  names(individuals) <- paste0("individual_", seq(N))

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
  transpose(wideModelComponents$response),
  sapply(seq(N), function(i) t(do.call(rbind, lapply(wideModelComponents$explanatory, function(x) x[i, ]))), simplify = FALSE),
  transpose(wideModelComponents$weights),
  transpose(wideModelComponents$stratum),
  transpose(wideModelComponents$cluster),
  SIMPLIFY = FALSE
  )

  attr(individuals, "N") <- N
  attr(individuals, "T") <- T
  attr(individuals, "Q") <- Q

  return(individuals)
}
