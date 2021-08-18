organizeFitTheta <- function(fitTheta, gofMeasures, call, sigmaThetaExpr) {
  source("./R/cov_clm__organizeFitTheta____functions.R", local = environment())

  fitTheta$gofMeasures <- gofMeasures
  fitTheta$call <- call

  fitTheta$sigmaThetaType <- getSigmaThetaType(sigmaThetaExpr)

  class(fitTheta) <- "clm.theta"
  return(fitTheta)
}
