#===============================================================================
#
#  PROGRAM: postpi_analytic_ols.R
#
#  AUTHORS: Stephen Salerno (ssalerno@fredhutch.org)
#           Kentaro Hoffman (khoffm3@uw.edu)
#           Awan Afiaz (aafiaz@uw.edu)
#
#
#  PURPOSE: Implementation of analytic correction algorithm from Wang et al.(2020)
#
#           Methods for correcting inference based on outcomes predicted by
#           machine learning
#
#  INPUTS:  rel_form, inf_form, dat
#
#  OUTPUTS:  Post-prediction inference functions for various target estimands:
#
#  Updated: 2024-01-20
#
#===============================================================================

#=== ANALYTIC CORRECTION =======================================================

#' PostPI Linear Regression using Wang et al. (2020) Analytic Correction
#'
#' @param X_l (matrix): n x p matrix of covariates in the labeled data.
#'
#' @param Y_l (vector): n-vector of labeled outcomes.
#'
#' @param f_l (vector): n-vector of predictions in the labeled data.
#'
#' @param X_u (matrix): N x p matrix of covariates in the unlabeled data.
#'
#' @param f_u (vector): N-vector of predictions in the unlabeled data.
#'
#' @param scale_se (boolean): Logical argument to scale relationship model error variance (defaults to TRUE; retained for posterity).
#'
#' @returns A list of outputs: estimate of the inference model parameters and
#' corresponding standard error estimate.
#'
#' @examples
#'
#' dat <- simdat()
#'
#' form <- Y - Yhat ~ X1
#'
#' X_l <- model.matrix(form, data = dat[dat$set == "labeled",])
#'
#' Y_l <- dat[dat$set == "labeled", all.vars(form)[1]] |> matrix(ncol = 1)
#'
#' f_l <- dat[dat$set == "labeled", all.vars(form)[2]] |> matrix(ncol = 1)
#'
#' X_u <- model.matrix(form, data = dat[dat$set == "unlabeled",])
#'
#' f_u <- dat[dat$set == "unlabeled", all.vars(form)[2]] |> matrix(ncol = 1)
#'
#' postpi_analytic_ols(X_l, Y_l, f_l, X_u, f_u)
#'
#' @export
#'
#' @import stats
#'

#-- PostPI - ANALYTIC for OLS

postpi_analytic_ols <- function(X_l, Y_l, f_l, X_u, f_u, scale_se = T) {

  #- 1. Estimate Relationship Model

  fit_rel <- lm(Y_l ~ f_l)

  #- 2. Estimate Inference Model

  fit_inf <- lm(f_u ~ X_u - 1)

  #- 3. Coefficient Estimator

  est <- solve(crossprod(X_u)) %*% t(X_u) %*%

    (coef(fit_rel)[1] + coef(fit_rel)[2] * X_u %*% coef(fit_inf))

  #- 4. SE of Coefficient Estimator

  if (scale_se) {

    se <- sqrt(diag(solve(crossprod(X_u)) *

      (sigma(fit_rel)^2 * nrow(X_u) / nrow(X_l) +

      (coef(fit_rel)[2]^2) * sigma(fit_inf)^2)))

  } else {

    se <- sqrt(diag(solve(crossprod(X_u)) *

      (sigma(fit_rel)^2 + (coef(fit_rel)[2]^2) * sigma(fit_inf)^2)))
  }

  #- Output

  return(list(est = as.vector(est), se = as.vector(se)))
}

