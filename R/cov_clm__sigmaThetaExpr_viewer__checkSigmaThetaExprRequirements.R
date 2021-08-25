checkSigmaThetaExprRequirements <- function(sigmaTheta, numWaves) {
  if (is.character(sigmaTheta)) {
    if (!sigmaTheta %in%
      c(
        "UCM", "AR1", "ARMA11", "ARH1", "Toeplitz", "Heterogeneous Toeplitz", "Heterogeneous UCM",
        "Predependence Order 1", "Unstructured"
      )
    ) {
      stop("Invalid 'sigmaThetaExpr' argument. Please provide a valid 'sigmaThetaExpr' type!")
    } else if (is.null(numWaves)) {
      stop("Invalid 'sigmaThetaExpr' argument. Please provide a valid 'numWaves' number!")
    } else if (!is.numeric(numWaves)) {
      stop("Invalid 'sigmaThetaExpr' argument. Please provide a valid 'numWaves' number!")
    }
  } else if (is.list(sigmaTheta)) {
    if (!"expr" %in% names(sigmaTheta)) {
      stop("Invalid 'sigmaThetaExpr' argument. 'sigmaThetaExpr' list must have 'expr' element!")
    } else if (!"paramsNames" %in% names(sigmaTheta)) {
      stop("Invalid 'sigmaTheta' argument. 'sigmaThetaExpr' list must have 'paramsNames' element!")
    }

    if (!is.list(sigmaTheta$expr)) {
      stop("Invalid 'sigmaThetaExpr' argument. 'expr' list must be a list!")
    } else if (!methods::is(sigmaTheta$paramsNames, "character")) {
      stop("Invalid 'sigmaThetaExpr' argument. 'paramsNames' must be a character array!")
    }

    lapply(sigmaTheta$expr, function(expr) {
      if (!typeof(expr) %in% c("language", "expression")) {
        stop("Invalid 'sigmaThetaExpr' argument. 'sigmaThetaExpr' elements must be 'language' or 'expression'!")
      }
    })

    if (sqrt(length(sigmaTheta$expr)) %% 1 != 0) {
      stop("Invalid 'sigmaThetaExpr' argument. 'expr' must have same number of elements than 'sigma'!")
    }

    if (!is.null(numWaves)) {
      warning("'numWaves' argument will be ignored! Length of 'sigmaThetaExpr' will be used instead!")
    }
  } else {
    stop("invalid 'sigmaThetaExpr' argument. Please provide a 'sigmaThetaExpr' type or an expression!")
  }

  return(NULL)
}
