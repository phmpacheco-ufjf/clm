getAiWiCalculation <- function(sigmaTheta, individuals, derivSigmaThetaList) {
  individuals <- individuals %>%
    rlist::list.map(rlist::list.append(., zi = unlist(lapply(
      derivSigmaThetaList,
      function(derivSigmaThetaj) {
        -t(resi) %*% solve(sigmaTheta) %*% derivSigmaThetaj %*% solve(sigmaTheta) %*% resi
      }
    )))) %>%
    rlist::list.map(rlist::list.append(., ai = wi * zi)) %>%
    rlist::list.select(ai, wi, hi, ji)

  return(individuals)
}
