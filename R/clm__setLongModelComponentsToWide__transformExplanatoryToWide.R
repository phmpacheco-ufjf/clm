transformExplanatoryToWide <- function(modelComponents) {
  wideExplanatory <- lapply(modelComponents$explanatory, function(x) {
    as_tibble(x) %>%
      mutate(wave = unlist(modelComponents$waves), id = unlist(modelComponents$ids)) %>%
      pivot_wider(id_cols = id, names_from = wave, values_from = value, names_prefix = "T") %>%
      select(-id)
  })

  return(wideExplanatory)
}
