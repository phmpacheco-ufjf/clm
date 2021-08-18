addResidualsToIndividualsList <- function(fit) {
  individuals <- fit$individuals %>%
    list.map(list.append(., resi = yi - mui))

  return(individuals)
}
