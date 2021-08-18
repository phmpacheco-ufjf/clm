fitBetaPML <- function(fit) {
  beta <- fit$individuals %>%
    list.map(list(p1 = wi * t(xi) %*% solve(fit$sigma) %*% xi, p2 = wi * t(xi) %*% solve(fit$sigma) %*% yi)) %>%
    transpose() %>%
    list.map(Reduce("+", .)) %>%
    list.append(final = solve(.$p1) %*% .$p2) %>%
    .$final
  colnames(beta) <- "coefficients"

  return(beta)
}
