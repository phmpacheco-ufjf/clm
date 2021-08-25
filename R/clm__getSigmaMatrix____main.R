getSigmaMatrix <- function(sigma, modelComponents, formula) {
  if (is.character(sigma)) {
    if (sigma == "identity") {
      sigmaMatrix <- getSigmaIdentity(modelComponents)
    } else if (sigma == "exchangeable") {
      sigmaMatrix <- getSigmaExchangeable(modelComponents)
    } else if (sigma == "autoregressive") {
      sigmaMatrix <- getSigmaAutoregressive(modelComponents)
    }
  } else {
    sigmaMatrix <- sigma
    attr(sigmaMatrix, "type") <- "customized"
  }

  return(sigmaMatrix)
}
