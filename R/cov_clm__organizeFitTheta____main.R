organizeFitTheta <- function(fitTheta, gofMeasures, call, sigmaThetaExpr) {
  fitTheta$gofMeasures <- gofMeasures
  fitTheta$call <- call

  fitTheta$sigmaThetaType <- getSigmaThetaType(sigmaThetaExpr)

  class(fitTheta) <- "clm.theta"
  return(fitTheta)
}
