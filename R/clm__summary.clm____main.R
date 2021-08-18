summary.clm <- function(fit) {
  source("./R/clm__summary.clm____functions.R", local = environment())

  coefficientsTable <- createCoefficientsTable(fit)

  catCall(fit)
  catCoefficientsTable(coefficientsTable, fit)
  catSampleDesign(fit)
  catSigma(fit)
  catSigmaHat(fit)

  return(invisible(NULL))
}
