fitSigmaHat <- function(fit) {
  Sw <- fit$individuals %>%
    rlist::list.map((sqrt(wi) * (yi - mui)) %*% t(sqrt(wi) * (yi - mui))) %>%
    Reduce("+", .)
  Sw <- (1 / rlist::list.map(fit$individuals, wi) %>% Reduce("+", .)) * Sw

  return(Sw)
}
