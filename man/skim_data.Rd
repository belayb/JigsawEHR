% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/skim_data.R
\name{skim_data}
\alias{skim_data}
\title{Skim data - get basic information about a given data set}
\usage{
skim_data(df, vars = NULL)
}
\arguments{
\item{df}{Spark DataFrame object}

\item{vars}{list of variables in spark dataframe object to explore}
}
\value{
A tibble object with columns: variable name, variable type, example, missing count, missing percent, unique count, and total number of rows
}
\description{
Skim data - get basic information about a given data set
}
