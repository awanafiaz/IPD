% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/popinf_poisson.R
\name{popinf_poisson}
\alias{popinf_poisson}
\title{POP-Inf Poisson Regression}
\usage{
popinf_poisson(
  X_l,
  Y_l,
  f_l,
  X_u,
  f_u,
  weights = NA,
  alpha = 0.05,
  delta = 0.05,
  K = 100
)
}
\arguments{
\item{X_l}{(matrix): n x p matrix of covariates in the labeled data.}

\item{Y_l}{(vector): n-vector of count labeled outcomes.}

\item{f_l}{(vector): n-vector of binary predictions in the labeled data.}

\item{X_u}{(matrix): N x p matrix of covariates in the unlabeled data.}

\item{f_u}{(vector): N-vector of binary predictions in the unlabeled data.}

\item{weights}{(array): p-dimensional array of weights vector for variance
reduction. POP-Inf will estimate the weights if not specified.}

\item{alpha}{(scalar): type I error rate for hypothesis testing - values in
(0, 1); defaults to 0.05}

\item{delta}{(scalar):tolerance for assessing convergence; defaults to 0.05}

\item{K}{(integer): maximum number of iterations; defaults to 100}
}
\value{
A list of outputs: estimate of inference model parameters and
corresponding standard error.
}
\description{
Helper function for POP-Inf Poisson regression
}
\details{
Assumption-lean and data-adaptive post-prediction inference
(Miao et al. 2023) \url{https://arxiv.org/abs/2311.14220}
}
\examples{

# dat <- simdat(model = "poisson")

# form <- Y - f ~ X1

# X_l <- model.matrix(form, data = dat[dat$set == "labeled",])

# Y_l <- dat[dat$set == "labeled", all.vars(form)[1]] |> matrix(ncol = 1)

# f_l <- dat[dat$set == "labeled", all.vars(form)[2]] |> matrix(ncol = 1)

# X_u <- model.matrix(form, data = dat[dat$set == "unlabeled",])

# f_u <- dat[dat$set == "unlabeled", all.vars(form)[2]] |> matrix(ncol = 1)

# popinf_poisson(X_l, Y_l, f_l, X_u, f_u)

}
