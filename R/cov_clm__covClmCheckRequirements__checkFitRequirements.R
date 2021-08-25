checkFitRequirements <- function(fit) {
  if (!methods::is(fit, "clm")) stop("Invalid 'fit' argument. 'fit' must be a 'clm' object!")

  return(NULL)
}
