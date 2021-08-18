getSigmaThetaType <- function(sigmaThetaExpr) {
  if (is.character(sigmaThetaExpr)) {
    sigmaThetaType <- sigmaThetaExpr
  } else {
    sigmaThetaType <- "Customized"
  }

  return(sigmaThetaType)
}
