getInformationMatrix <- function(fitTheta, fit, derivSigmaThetaList, deriv2SigmaThetaList) {
  wavesCombination <- expand.grid(tlinha = seq(length(fitTheta$optim$par)), t = seq(length(fitTheta$optim$par)))

  informationMatrix <- matrix(mapply(function(t, tlinha) {
    pt1 <- solve(fitTheta$sigmaTheta) %*% (fitTheta$sigmaTheta - fit$sigmaHat) %*%
      solve(fitTheta$sigmaTheta) %*% deriv2SigmaThetaList[[(t - 1) * length(fitTheta$optim$par) + tlinha]]

    pt2 <- solve(fitTheta$sigmaTheta) %*% derivSigmaThetaList[[tlinha]] %*% solve(fitTheta$sigmaTheta) %*%
      (fitTheta$sigmaTheta - fit$sigmaHat) %*% solve(fitTheta$sigmaTheta) %*% derivSigmaThetaList[[t]]

    pt3 <- solve(fitTheta$sigmaTheta) %*% derivSigmaThetaList[[tlinha]] %*% solve(fitTheta$sigmaTheta) %*%
      derivSigmaThetaList[[t]]

    pt4 <- solve(fitTheta$sigmaTheta) %*% (fitTheta$sigmaTheta - fit$sigmaHat) %*% solve(fitTheta$sigmaTheta) %*%
      derivSigmaThetaList[[tlinha]] %*% solve(fitTheta$sigmaTheta) %*% derivSigmaThetaList[[t]]

    result <- sum(diag(pt1 - pt2 + pt3 - pt4))

    return(result)
  }, wavesCombination$t, wavesCombination$tlinha), ncol = length(fitTheta$optim$par))

  return(informationMatrix)
}
