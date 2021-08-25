organizeResults <- function(fit, call, formula, wideModelComponents) {
  fit$call <- call
  fit$formula <- formula
  fit$model <- wideModelComponents

  class(fit) <- "clm"

  return(fit)
}
