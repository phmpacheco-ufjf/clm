getCovPhiTheta <- function(fitTheta, fit, derivSigmaThetaList) {
  source("./R/cov_clm__fitThetaModel__getAiWiCalculation.R", local = environment())

  individuals <- getAiWiCalculation(fitTheta$sigmaTheta, fit$individuals, derivSigmaThetaList)

  N <- length(individuals)
  aBar <- (list.flatten(list.select(individuals, ai)) %>% Reduce("+", .)) / N
  wBar <- (list.flatten(list.select(individuals, wi)) %>% Reduce("+", .)) / N

  BVar <- individuals %>%
    list.group(hi, ji) %>%
    lapply(., function(hii) {
      lapply(hii, function(jii) {
        list.map(jii, (ai - ((aBar / wBar) * wi)) / wBar)
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

  covPhiTheta <- BVar / (N^2)

  return(covPhiTheta)
}
