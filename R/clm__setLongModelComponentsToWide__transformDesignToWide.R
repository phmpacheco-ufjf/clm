transformDesignToWide <- function(modelComponents, name) {
  wideDesign <- modelComponents[[name]] %>%
    mutate(wave = unlist(modelComponents$waves), id = unlist(modelComponents$ids)) %>%
    pivot_wider(id_cols = id, names_from = wave, values_from = value, names_prefix = "T") %>%
    select(last_col())

  return(wideDesign)
}
