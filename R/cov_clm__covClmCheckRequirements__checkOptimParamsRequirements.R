checkOptimParamsRequirements <- function(optimParams) {
  if (!methods::is(optimParams, "list")) {
    stop("Invalid 'optimParams' argument. 'OptimParams' must be a named list!")
  }

  if (!"par" %in% names(optimParams)) {
    stop("Invalid 'optimParams' argument. 'OptimParams' must have at least a 'par' element!")
  } else if ("fn" %in% names(optimParams)) {
    warning("'fn' will be ignored! Please, choose a 'fittingType' instead.")
  } else if ("gr" %in% names(optimParams)) {
    warning("'gr' will be ignored! Please, choose a 'fittingType' instead.")
  }

  if (!methods::is(optimParams[["par"]], "numeric")) {
    stop("Invalid 'optimParams' argument. 'par' must be numeric!")
  } else if (any(names(optimParams$par) == "")) {
    stop("Invalid 'optimParams' argument. All 'par' elements must be named or none should!")
  }

  if ("lower" %in% names(optimParams)) {
    if (length(optimParams$lower) != length(optimParams$par)) {
      stop("Invalid 'optimParams' argument. 'lower' must have same lenght as 'par'!")
    } else if (!is.null(names(optimParams$lower))) {
      warning("'lower' names will be ignored! Order will be the same as 'par'.")
    }
  }

  if ("upper" %in% names(optimParams)) {
    if (length(optimParams$upper) != length(optimParams$par)) {
      stop("Invalid 'optimParams' argument. 'upper' must have same lenght as 'par'!")
    } else if (!is.null(names(optimParams$upper))) {
      warning("'upper' names will be ignored! Order will be the same as 'par'.")
    }
  }

  return(NULL)
}
