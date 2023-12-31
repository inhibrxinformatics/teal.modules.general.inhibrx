% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tm_g_scatterplotmatrix.R
\name{get_scatterplotmatrix_stats}
\alias{get_scatterplotmatrix_stats}
\title{Get stats for x-y pairs in scatterplot matrix}
\usage{
get_scatterplotmatrix_stats(
  x,
  y,
  .f = stats::cor.test,
  .f_args = list(),
  round_stat = 2,
  round_pval = 4
)
}
\arguments{
\item{x}{\code{numeric}}

\item{y}{\code{numeric}}

\item{.f}{\code{function}, function that accepts x and y as formula input \code{~ x + y}.
Default \code{stats::cor.test}}

\item{.f_args}{\code{list} of arguments to be passed to \code{.f}}

\item{round_stat}{\code{integer}}

\item{round_pval}{\code{integer}}
}
\value{
\code{character} with stats. For \code{stats::cor.test} correlation coefficient and p-value.
}
\description{
uses stats::cor.test per default for all numerical input variables and converts results
to character vector. Could be extended if different stats for different variable
types are needed. Meant to be called from \code{lattice::panel.text}.
}
\details{
presently we need to use a formula input for \code{stats::cor.test} because
\code{na.fail} only gets evaluated when a formula is passed (see below).
\preformatted{
x = c(1,3,5,7,NA)
y = c(3,6,7,8,1)
stats::cor.test(x, y, na.action = "na.fail")
stats::cor.test(~ x + y,  na.action = "na.fail")
}
}
\examples{
set.seed(1)
x <- runif(25, 0, 1)
y <- runif(25, 0, 1)
x[c(3, 10, 18)] <- NA

get_scatterplotmatrix_stats(x, y, .f = stats::cor.test, .f_args = list(method = "pearson"))
get_scatterplotmatrix_stats(x, y, .f = stats::cor.test, .f_args = list(
  method = "pearson",
  na.action = na.fail
))
}
