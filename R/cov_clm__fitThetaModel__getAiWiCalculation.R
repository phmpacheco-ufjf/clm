getAiWiCalculation <- function(sigmaTheta, individuals, derivSigmaThetaList) {
  individuals <- individuals %>%
    list.map(list.append(., zi = unlist(lapply(
      derivSigmaThetaList,
      function(derivSigmaThetaj) {
        -t(resi) %*% solve(sigmaTheta) %*% derivSigmaThetaj %*% solve(sigmaTheta) %*% resi
      }
    )))) %>%
    list.map(list.append(., ai = wi * zi)) %>%
    list.select(ai, wi, hi, ji)

  return(individuals)
}
