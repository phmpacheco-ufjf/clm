organizeResults <- function(fit, call, formula, wideModelComponents) {
  # source("./R/clm__organizeResults____functions.R", local = environment())

  fit$call <- call
  fit$formula <- formula
  fit$model <- wideModelComponents

  class(fit) <- "clm"

  return(fit)
}
