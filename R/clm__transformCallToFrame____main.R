transformCallToFrame <- function(call) {
  matchedArgNames <- match(
    c("formula", "waves", "ids", "weights", "stratum", "cluster", "data"),
    names(call), 0L
  )
  treatedCall <- treatCall(call, matchedArgNames)
  modelData <- eval(treatedCall, parent.frame(2))
  modelTerms <- attr(modelData, "terms")

  modelFrame <- list(data = modelData, terms = modelTerms)

  return(modelFrame)
}
