getOptimCalculation <- function(optimParams) {
  optimResult <- do.call(stats::optim, optimParams)

  return(optimResult)
}
