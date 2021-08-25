fitSigmaHatVar <- function(fit) {
  individuals <- fit$individuals %>%
    rlist::list.map(rlist::list.append(., zi = wi * resi %*% t(resi))) %>%
    rlist::list.select(wi, zi, hi, ji)

  zBar <- (rlist::list.flatten(rlist::list.select(individuals, zi)) %>% Reduce("+", .)) / fit$info$N
  wBar <- (rlist::list.flatten(rlist::list.select(individuals, wi)) %>% Reduce("+", .)) / fit$info$N

  BVar <- individuals %>%
    rlist::list.group(hi, ji) %>%
    lapply(., function(hii) {
      lapply(hii, function(jii) {
        rlist::list.map(jii, (zi - ((zBar / wBar) * wi)) / wBar)
      }) %>%
        rlist::list.map(Reduce("+", .)) %>%
        `attr<-`(., "mh", rlist::list.count(.)) %>%
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
