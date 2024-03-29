% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tempnetwork-getter.R
\name{gG.tempnetwork}
\alias{gG.tempnetwork}
\title{Returns a graph from the "graphList" (from the given 'tempnetwork'-object) specified by the parameter "pointName".}
\usage{
\method{gG}{tempnetwork}(tempNetwork, pointName, safe = TRUE)
}
\arguments{
\item{tempNetwork}{A 'tempnetwork'-object.}

\item{pointName}{A string corresponding with the name of a point in the 'tempflow'-object of the given 'tempnetwork'-object.}
}
\value{
The 'igraph'-object from the "graphList" (from the given 'tempnetwork'-object) specified by the parameter "pointName".
}
\description{
Returns a graph from the "graphList" (from the given 'tempnetwork'-object) specified by the parameter "pointName".
}
