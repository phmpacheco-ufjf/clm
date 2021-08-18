addFittedToIndividualsList <- function(fit) {
  individuals <- fit$individuals %>%
    list.map(list.append(., mui = xi %*% fit$coefficients))

  return(individuals)
}
