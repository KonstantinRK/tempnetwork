% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tempflow-inputchecker.R
\name{check_is_dag.tempflow}
\alias{check_is_dag.tempflow}
\title{A function that checks, if the 'igraph'-object assigned to the 'tempflow'-field "graph" is directed and acyclic.}
\usage{
\method{check_is_dag}{tempflow}(tempFlow, ignoreLoops = TRUE)
}
\arguments{
\item{tempFlow}{A 'tempflow'-object.}

\item{ignoreLoops}{If TRUE, the cycles created by loops will be ignored.}
}
\value{
The boolean value TRUE, if the 'igraph'-object assigned to the 'tempflow'-field "graph" is directed and acyclic.
}
\description{
A function that checks, if the 'igraph'-object assigned to the 'tempflow'-field "graph" is directed and acyclic.
}
