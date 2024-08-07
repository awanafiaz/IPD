% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{print.ipd}
\alias{print.ipd}
\title{Print IPD Fit}
\usage{
\method{print}{ipd}(x, ...)
}
\arguments{
\item{x}{An object of class \code{ipd}.}

\item{...}{Additional arguments to be passed to the print function.}
}
\value{
The input \code{x}, invisibly.
}
\description{
Prints a brief summary of the IPD method/model combination.
}
\examples{

#-- Generate Example Data

set.seed(2023)

dat <- simdat(n = c(300, 300, 300), effect = 1, sigma_Y = 1)

head(dat)

formula <- Y - f ~ X1

#-- Fit IPD

nboot <- 200

fit <- ipd(formula, method = "postpi_boot", model = "ols",

  data = dat, label = "set", nboot = nboot)

#-- Print Output

print(fit)

}
