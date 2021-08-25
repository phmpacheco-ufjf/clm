addResidualsToIndividualsList <- function(fit) {
  individuals <- fit$individuals %>%
    rlist::list.map(rlist::list.append(., resi = yi - mui))

  return(individuals)
}
