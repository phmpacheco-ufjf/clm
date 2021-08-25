fitBetaPML <- function(fit) {
  beta <- fit$individuals %>%
    rlist::list.map(list(p1 = wi * t(xi) %*% solve(fit$sigma) %*% xi, p2 = wi * t(xi) %*% solve(fit$sigma) %*% yi)) %>%
    purrr::transpose() %>%
    rlist::list.map(Reduce("+", .)) %>%
    rlist::list.append(final = solve(.$p1) %*% .$p2) %>%
    .$final
  colnames(beta) <- "coefficients"

  return(beta)
}
