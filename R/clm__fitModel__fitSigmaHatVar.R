fitSigmaHatVar <- function(fit) {
  individuals <- fit$individuals %>%
    list.map(list.append(., zi = wi * resi %*% t(resi))) %>%
    list.select(wi, zi, hi, ji)

  zBar <- (list.flatten(list.select(individuals, zi)) %>% Reduce("+", .)) / fit$info$N
  wBar <- (list.flatten(list.select(individuals, wi)) %>% Reduce("+", .)) / fit$info$N

  BVar <- individuals %>%
    list.group(hi, ji) %>%
    lapply(., function(hii) {
      lapply(hii, function(jii) {
        list.map(jii, (zi - ((zBar / wBar) * wi)) / wBar)
      }) %>%
        list.map(Reduce("+", .)) %>%
        `attr<-`(., "mh", list.count(.)) %>%
        `attr<-`(., "BhBar", Reduce("+", .) / attr(., "mh")) %>%
        `attr<-`(., "BhBar", matrix(attr(., "BhBar")[lower.tri(attr(., "BhBar"), diag = TRUE)], ncol = 1)) %>%
        lapply(., function(Bhj) {
          Bhj <- matrix(Bhj[lower.tri(Bhj, diag = TRUE)], ncol = 1)
          (attr(., "mh") / (attr(., "mh") - 1)) * (Bhj - attr(., "BhBar")) %*% t(Bhj - attr(., "BhBar"))
        }) %>%
        Reduce("+", .)
    }) %>%
    Reduce("+", .)

  SwVar <- BVar / (fit$info$N^2)

  return(SwVar)
}
