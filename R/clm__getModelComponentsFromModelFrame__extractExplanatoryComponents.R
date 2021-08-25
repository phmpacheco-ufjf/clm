extractExplanatoryComponents <- function(modelFrame) {
  componentValue <- if (!stats::is.empty.model(modelFrame$terms)) {
    tibble::as_tibble(do.call(stats::model.matrix, list(object = modelFrame$terms, data = modelFrame$data)))
  } else {
    tibble::as_tibble(matrix(, dim(modelFrame$data)[1], 0L))
  }

  setNADummiesToZero <- function(col) {
    if (identical(sort(unique(col), na.last = FALSE), c(NA, 0, 1))) {
      ifelse(is.na(col), 0, col)
    } else {
      col
    }
  }

  componentValue <- tibble::as_tibble(apply(componentValue, 2, setNADummiesToZero))

  return(componentValue)
}
