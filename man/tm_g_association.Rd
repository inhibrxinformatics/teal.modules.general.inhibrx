% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tm_g_association.R
\name{tm_g_association}
\alias{tm_g_association}
\title{Stack Plots of variables and show association with reference variable}
\usage{
tm_g_association(
  label = "Association",
  ref,
  vars,
  show_association = TRUE,
  plot_height = c(600, 400, 5000),
  plot_width = NULL,
  distribution_theme = c("gray", "bw", "linedraw", "light", "dark", "minimal", "classic",
    "void", "test"),
  association_theme = c("gray", "bw", "linedraw", "light", "dark", "minimal", "classic",
    "void", "test"),
  pre_output = NULL,
  post_output = NULL,
  ggplot2_args = teal.widgets::ggplot2_args()
)
}
\arguments{
\item{label}{(\code{character(1)}) Label shown in the navigation item for the module or module group.
For \code{modules()} defaults to \code{"root"}. See \code{Details}.}

\item{ref}{(\code{data_extract_spec} or \code{list} of multiple \code{data_extract_spec})
reference variable, must set \code{multiple = FALSE}.}

\item{vars}{(\code{data_extract_spec} or \code{list} of multiple \code{data_extract_spec})
associated variables.}

\item{show_association}{optional, (\code{logical}) Whether show association of \code{vars}
with reference variable. Defaults to \code{TRUE}.}

\item{plot_height}{optional, (\code{numeric}) A vector of length three with \verb{c(value, min and max)}
for a slider encoding the plot height.}

\item{plot_width}{optional, (\code{numeric}) A vector of length three with \verb{c(value, min and max)}
for a slider encoding the plot width.}

\item{distribution_theme}{optional, (\code{character}) \code{ggplot2} theme to be used by default.
One of \code{c("gray", "bw", "linedraw", "light", "dark", "minimal", "classic", "void", "test")}.
Each theme can be chosen by the user during the session. Defaults to \code{"gray"}.}

\item{association_theme}{optional, (\code{character}) \code{ggplot2} theme to be used by default.
One of \code{c("gray", "bw", "linedraw", "light", "dark", "minimal", "classic", "void", "test")}.
Each theme can be chosen by the user during the session. Defaults to \code{"gray"}.}

\item{pre_output}{(\code{shiny.tag}, optional)\cr
with text placed before the output to put the output into context. For example a title.}

\item{post_output}{(\code{shiny.tag}, optional) with text placed after the output to put the output
into context. For example the \code{\link[shiny:helpText]{shiny::helpText()}} elements are useful.}

\item{ggplot2_args}{optional, (\code{ggplot2_args}) object created by \code{\link[teal.widgets:ggplot2_args]{teal.widgets::ggplot2_args()}}
with settings for all the plots or named list of \code{ggplot2_args} objects for plot-specific settings.
The argument is merged with options variable \code{teal.ggplot2_args} and default module setup.

List names should match the following: \code{c("default", "Bivariate1", "Bivariate2")}.

For more details see the vignette: \code{vignette("custom-ggplot2-arguments", package = "teal.widgets")}.}
}
\description{
Stack Plots of variables and show association with reference variable
}
\note{
For more examples, please see the vignette "Using association plot" via
\code{vignette("using-association-plot", package = "teal.modules.general")}.
}
\examples{
# Association plot of selected reference variable (SEX)
# against other selected variables (BMRKR1)
data <- teal_data()
data <- within(data, {
  library(nestcolor)
  ADSL <- teal.modules.general::rADSL
})
datanames <- c("ADSL")
datanames(data) <- datanames
join_keys(data) <- default_cdisc_join_keys[datanames]

app <- teal::init(
  data = data,
  modules = teal::modules(
    teal.modules.general::tm_g_association(
      ref = teal.transform::data_extract_spec(
        dataname = "ADSL",
        select = teal.transform::select_spec(
          label = "Select variable:",
          choices = teal.transform::variable_choices(
            data[["ADSL"]],
            c("SEX", "RACE", "COUNTRY", "ARM", "STRATA1", "STRATA2", "ITTFL", "BMRKR2")
          ),
          selected = "RACE",
          fixed = FALSE
        )
      ),
      vars = teal.transform::data_extract_spec(
        dataname = "ADSL",
        select = teal.transform::select_spec(
          label = "Select variables:",
          choices = teal.transform::variable_choices(
            data[["ADSL"]],
            c("SEX", "RACE", "COUNTRY", "ARM", "STRATA1", "STRATA2", "ITTFL", "BMRKR2")
          ),
          selected = "BMRKR2",
          multiple = TRUE,
          fixed = FALSE
        )
      ),
      ggplot2_args = teal.widgets::ggplot2_args(
        labs = list(subtitle = "Plot generated by Association Module")
      )
    )
  )
)
if (interactive()) {
  shinyApp(app$ui, app$server)
}
}
