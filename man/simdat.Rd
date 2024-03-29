% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simdat.R
\name{simdat}
\alias{simdat}
\title{Data generation functions for OLS regression example}
\usage{
simdat(n = c(300, 300, 300), beta1 = 1)
}
\arguments{
\item{n}{vector of size 3 indicating the sample size in the training,
labeled/test, and unlabeled/validation data sets}

\item{beta1}{first regression coefficient (or, regression coefficient of
variable of interest for inference)}
}
\value{
A data frame containing 4 columns: labeled outcome, predicted
outcome and a character variable indicating which data set the observation
belongs to (training, test/labeled, validation/unlabeled).
}
\description{
Data generation functions for OLS regression example
}
\examples{

# Return a stacked data set with 100 observations for each individual sets

simdat(c(100, 100, 100), 1)

}
