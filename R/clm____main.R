#' Fit fixed and random effects longitudinal model.
#'
#' @param formula A formula
#' @param waves a dataframe column or an array
#' @param ids a dataframe column or an array
#' @param weights a dataframe column or an array
#' @param stratum a dataframe column or an array
#' @param cluster a dataframe column or an array
#' @param data A dataframe or tibble
#' @param sigma A character or a square matrix
#'
#' @return The fit model with class 'clm'.
#'
#' @export


clm <- function(formula, waves, ids, weights, stratum, cluster, data, sigma = "identity") {
  call <- match.call(expand.dots = FALSE) # Capture function call
  modelFrame <- transformCallToFrame(call)

  modelComponents <- getModelComponentsFromModelFrame(modelFrame)
  clmCheckRequirements(modelComponents, sigma)

  sigma <- getSigmaMatrix(sigma, modelComponents)

  wideModelComponents <- setLongModelComponentsToWide(modelComponents)
  individuals <- setWideModelComponentsToList(wideModelComponents)

  fit <- fitModel(individuals, sigma)
  fit <- organizeResults(fit, call, formula, wideModelComponents)

  return(fit)
}
