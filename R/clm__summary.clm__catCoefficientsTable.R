catCoefficientsTable <- function(coefficientsTable, fit) {
  cat("\n\nCoefficients:")
  print(knitr::kable(coefficientsTable, format = "simple"))
  cat("---\nSignif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1\n\n")
  cat(paste("Number of individuals:", fit$info$N, "\nNumber of waves:", fit$info$T, "\n\n"))

  return(NULL)
}
