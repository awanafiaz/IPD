% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ppi_plusplus_mean.R
\name{ppi_plusplus_mean_est}
\alias{ppi_plusplus_mean_est}
\title{...Need title...}
\usage{
ppi_plusplus_mean_est(
  Y_l,
  f_l,
  f_u,
  lhat = NULL,
  coord = NULL,
  w_l = NULL,
  w_u = NULL
)
}
\arguments{
\item{Y_l}{(ndarray): Gold-standard labels.}

\item{f_l}{(ndarray): Predictions corresponding to the gold-standard
labels.}

\item{f_u}{(ndarray): Predictions corresponding to the unlabeled
data.}

\item{lhat}{(float, optional): Power-tuning parameter (see
\verb{[ADZ23] <https://arxiv.org/abs/2311.01453>}__). The default value \code{None}
will estimate the optimal value from data. Setting \code{lhat=1} recovers PPI
with no power tuning, and setting \code{lhat=0} recovers the classical point
estimate.}

\item{coord}{(int, optional): Coordinate for which to optimize \code{lhat}. If
\code{None}, it optimizes the total variance over all coordinates. Must be in
{1, ..., d} where d is the dimension of the estimand.}

\item{w_l}{(ndarray, optional): Sample weights for the labeled data set.
Defaults to all ones vector.}

\item{w_u}{(ndarray, optional): Sample weights for the unlabeled
data set. Defaults to all ones vector.}
}
\value{
float or ndarray: Prediction-powered point estimate of the mean.
}
\description{
Computes the prediction-powered point estimate of the p-dimensional mean.
}
\details{
\verb{[ADZ23] <https://arxiv.org/abs/2311.01453>}__ A. N. Angelopoulos, J. C.
Duchi, and T. Zrnic. PPI++: Efficient Prediction Powered Inference.
arxiv:2311.01453, 2023.
}
\examples{

#need examples

}
