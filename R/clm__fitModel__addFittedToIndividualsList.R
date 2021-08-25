addFittedToIndividualsList <- function(fit) {
  individuals <- fit$individuals %>%
    rlist::list.map(rlist::list.append(., mui = xi %*% fit$coefficients))

  return(individuals)
}
