createCoefficientsTable <- function(fit) {
  coefficientsTable <- tibble::tibble(
    "  " = rownames(fit$coefficients),
    "Estimate" = round(fit$coefficients, 2),
    "Std. Error" = round(fit$se, 2),
    "t value" = round(fit$coefficients / fit$se, 4),
    "P(t>|t|)" = round(2 * stats::pnorm(-abs(fit$coefficients / fit$se)), 4),
    " " = ifelse(2 * stats::pnorm(-abs(fit$coefficients / fit$se)) < 0.001, "***",
      ifelse(2 * stats::pnorm(-abs(fit$coefficients / fit$se)) < 0.01, "**",
        ifelse(2 * stats::pnorm(-abs(fit$coefficients / fit$se)) < 0.05, "*",
          ifelse(2 * stats::pnorm(-abs(fit$coefficients / fit$se)) < 0.1, ".", "")
        )
      )
    )
  )

  return(coefficientsTable)
}
