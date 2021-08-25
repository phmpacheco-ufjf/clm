getCovPhiTheta <- function(fitTheta, fit, derivSigmaThetaList) {
  individuals <- getAiWiCalculation(fitTheta$sigmaTheta, fit$individuals, derivSigmaThetaList)

  N <- length(individuals)
  aBar <- (rlist::list.flatten(rlist::list.select(individuals, ai)) %>% Reduce("+", .)) / N
  wBar <- (rlist::list.flatten(rlist::list.select(individuals, wi)) %>% Reduce("+", .)) / N

  BVar <- individuals %>%
    rlist::list.group(hi, ji) %>%
    lapply(., function(hii) {
      lapply(hii, function(jii) {
        rlist::list.map(jii, (ai - ((aBar / wBar) * wi)) / wBar)
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

  covPhiTheta <- BVar / (N^2)

  return(covPhiTheta)
}
