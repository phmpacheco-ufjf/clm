getOptimCalculation <- function(optimParams) {
  optimResult <- do.call(optim, optimParams)

  return(optimResult)
}
