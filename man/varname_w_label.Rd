% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{varname_w_label}
\alias{varname_w_label}
\title{Get variable name with label}
\usage{
varname_w_label(
  var_names,
  dataset,
  wrap_width = 80,
  prefix = NULL,
  suffix = NULL
)
}
\arguments{
\item{var_names}{(\code{character}) Name of variable to extract labels from.}

\item{dataset}{(\code{dataset}) Name of analysis dataset.}

\item{wrap_width}{(\code{numeric}) Number of characters to wrap original
label to. Defaults to 80.}

\item{prefix}{(\code{character}) String to paste to the beginning of the
variable name with label.}

\item{suffix}{(\code{character}) String to paste to the end of the variable
name with label.}
}
\value{
(\code{character}) String with variable name and label.
}
\description{
Get variable name with label
}
\examples{
\dontrun{
ADSL <- teal.modules.general::rADSL

varname_w_label("AGE", ADSL)
}
}
\keyword{internal}
