treatCall <- function(call, matchedArgNames) {
  treatedCall <- call[c(1L, matchedArgNames)]
  treatedCall$drop.unused.levels <- TRUE
  treatedCall$na.action <- "na.pass"
  treatedCall[[1L]] <- quote(stats::model.frame)

  return(treatedCall)
}
