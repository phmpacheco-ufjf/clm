
# clm

A package to deal with complex longitudinal survey data. It combines
longitudinal methodology models with complex sampling design. It fits
fixed and random effects models and covariance structured models so far.
It also provides tools to perform statistical tests considering these
specifications.

## Installation

The clm package is in its initial development stage and does not yet
have a version available on CRAN.

However, the development version of the package is now available for
download and can be installed via the repository on
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("phmpacheco-ufjf/clm")
```

## Avaliable Functions

There are a few major functions available for usage. Here’s an example
using BHPS survey data.

First, we fit the fixed and random effects model considering the survey
sampling design. The sigma argument can be: identity, exchangeable,
autorregressive or a custom square matrix.

``` r
library(clm)

fit <- clm(
  score ~ wave + ageg + ecacg + qualifg,
  waves = wave, ids = id,
  weights = weight, stratum = strata, cluster = cluster,
  data = example_data, sigma = "exchangeable"
)
summary(fit)
#> Call:
#> clm(formula = score ~ wave + ageg + ecacg + qualifg, waves = wave, 
#>     ids = id, weights = weight, stratum = strata, cluster = cluster, 
#>     data = example_data, sigma = "exchangeable")
#> 
#> Coefficients:
#> 
#>                Estimate   Std. Error    t value   P(t>|t|)      
#> ------------  ---------  -----------  ---------  ---------  ----
#> (Intercept)       22.29         0.30    74.0021     0.0000  *** 
#> wave              -0.04         0.02    -2.7355     0.0062  **  
#> ageg2             -0.65         0.21    -3.0434     0.0023  **  
#> ageg3             -0.82         0.24    -3.4073     0.0007  *** 
#> ageg4             -1.01         0.28    -3.6672     0.0002  *** 
#> ecacg2            -0.87         0.11    -8.0011     0.0000  *** 
#> ecacg3            -0.76         0.17    -4.4817     0.0000  *** 
#> ecacg4             0.21         0.24     0.8678     0.3855      
#> ecacg5            -2.03         0.14   -14.2889     0.0000  *** 
#> qualifg2          -0.52         0.25    -2.0632     0.0391  *   
#> qualifg3          -0.66         0.26    -2.5131     0.0120  *   
#> qualifg4          -0.50         0.25    -2.0176     0.0436  *   
#> qualifg5          -1.22         0.26    -4.6979     0.0000  *** 
#> ---
#> Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Number of individuals: 1340 
#> Number of waves: 5 
#> 
#> Sampling Design:
#>    Sample Weights: Yes
#>    Stratification: Yes
#>    Clusterization: Yes
#> 
#> Covariance Matrix Provided:
#>    Type: exchangeable
#>    rho: 0.567
#> 
#>          T1      T2      T3      T4      T5
#> ---  ------  ------  ------  ------  ------
#> T1    1.000   0.567   0.567   0.567   0.567
#> T2    0.567   1.000   0.567   0.567   0.567
#> T3    0.567   0.567   1.000   0.567   0.567
#> T4    0.567   0.567   0.567   1.000   0.567
#> T5    0.567   0.567   0.567   0.567   1.000
#> ---
#> 
#> Sigma Estimated:
#> 
#>            T1        T3        T5        T7        T9
#> ---  --------  --------  --------  --------  --------
#> T1    13.4627    7.6690    7.1577    6.3445    6.0808
#> T3     7.6690   11.5988    7.8561    6.5722    6.5063
#> T5     7.1577    7.8561   12.5644    7.9730    7.4928
#> T7     6.3445    6.5722    7.9730   11.9087    7.9353
#> T9     6.0808    6.5063    7.4928    7.9353   11.9837
#> ---
```

Then, we fit the covariance structured model. But first, we must choose
the covariance structure we want to fit. Here’s an example for the
Uniform Correlation Model - UCM:

``` r
sigmaThetaExpr_viewer("UCM", 5)
#> 
#> 
#> Table: sigma2u sigma2v
#> 
#> |   |        T1         |        T2         |        T3         |        T4         |        T5         |
#> |:--|:-----------------:|:-----------------:|:-----------------:|:-----------------:|:-----------------:|
#> |T1 | sigma2u + sigma2v |      sigma2u      |      sigma2u      |      sigma2u      |      sigma2u      |
#> |T2 |      sigma2u      | sigma2u + sigma2v |      sigma2u      |      sigma2u      |      sigma2u      |
#> |T3 |      sigma2u      |      sigma2u      | sigma2u + sigma2v |      sigma2u      |      sigma2u      |
#> |T4 |      sigma2u      |      sigma2u      |      sigma2u      | sigma2u + sigma2v |      sigma2u      |
#> |T5 |      sigma2u      |      sigma2u      |      sigma2u      |      sigma2u      | sigma2u + sigma2v |
```

Finally, we fit the model using our previous random effects fitted
model.

``` r
fitTheta <- cov_clm(fit,
  fittingType = "PML", sigmaThetaExpr = "UCM",
  optimParams = list(par = c(7, 5))
)
summary(fitTheta)
#> Call:
#> cov_clm(fit = fit, fittingType = "PML", sigmaThetaExpr = "UCM", 
#>     optimParams = list(par = c(7, 5)))
#> 
#> Fitting Function Type: PML
#> Sigma Theta Type: UCM
#> 
#> Covariance Params: sigma2u sigma2v
#> 
#> Coefficients:
#> 
#>            Estimate   Std. Error
#> --------  ---------  -----------
#> sigma2u      7.1588       0.3880
#> sigma2v      5.1449       0.1532
#> ---
#> 
#> Optimization Details:
#> 
#> Converged: TRUE
#> Optim Method: L-BFGS-B
#> Iteractions Number - Function: 8
#> Iteractions Number - Gradient: 8
#> Optim Function Value: 0.1641
#> 
#>            Start Value  Lower   Upper 
#> --------  ------------  ------  ------
#> sigma2u              7  -       -     
#> sigma2v              5  -       -     
#> 
#> 
#> Sigma Theta Matrix:
#> 
#> --------  --------  --------  --------  --------
#>  12.3037    7.1588    7.1588    7.1588    7.1588
#>   7.1588   12.3037    7.1588    7.1588    7.1588
#>   7.1588    7.1588   12.3037    7.1588    7.1588
#>   7.1588    7.1588    7.1588   12.3037    7.1588
#>   7.1588    7.1588    7.1588    7.1588   12.3037
#> --------  --------  --------  --------  --------
#> 
#> 
#> Goodness of Fit Measures:
#> 
#> RMR: 0.8796
#> AGFI: 0.9225
```
