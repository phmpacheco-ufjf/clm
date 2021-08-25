transformExplanatoryToWide <- function(modelComponents) {
  setXColToWide <- function(x) {
    tibble::as_tibble(x) %>%
      dplyr::mutate(wave = unlist(modelComponents$waves), id = unlist(modelComponents$ids)) %>%
      tidyr::pivot_wider(id_cols = id, names_from = wave, values_from = value, names_prefix = "T") %>%
      dplyr::select(-id)
  }
  wideExplanatory <- lapply(modelComponents$explanatory, setXColToWide)

  return(wideExplanatory)
}
