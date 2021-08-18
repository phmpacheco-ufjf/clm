extractExplanatoryComponents <- function(modelFrame) {
  componentValue <- if (!is.empty.model(modelFrame$terms)) {
    as_tibble(do.call(model.matrix, list(object = modelFrame$terms, data = modelFrame$data)))
  } else {
    as_tibble(matrix(, dim(modelFrame$data)[1], 0L))
  }

  componentValue <- as_tibble(apply(componentValue, 2, function(col) {
    if (identical(sort(unique(col), na.last = FALSE), c(NA, 0, 1))) {
      ifelse(is.na(col), 0, col)
    } else {
      col
    }
  }))

  return(componentValue)
}
