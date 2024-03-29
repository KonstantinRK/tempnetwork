% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tempnetwork-tempflow-predicates.R
\name{greater.tempnetwork}
\alias{greater.tempnetwork}
\title{Is a function that takes a 'tempnetwork'-object and two point-names (or point-ids) and
tests whether "inpPoint1" is strictly greater than "inpPoint2" (given the order induced by the
structure of the 'tempflow'-object of the given 'tempnetwork'-object).}
\usage{
\method{greater}{tempnetwork}(tempNetwork, inpPoint1, inpPoint2,
  safe = TRUE)
}
\arguments{
\item{tempNetwork}{A 'tempnetwork'-object.}

\item{inpPoint1}{A point-name (or point-id).}

\item{inpPoint2}{A point-name (or point-id).}

\item{safe}{If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object.}
}
\value{
Is TRUE, if "inpPoint1" is strictly greater than "inpPoint2" (given the order induced by the
structure of the 'tempflow'-object of the given 'tempnetwork'-object).
}
\description{
Is a function that takes a 'tempnetwork'-object and two point-names (or point-ids) and
tests whether "inpPoint1" is strictly greater than "inpPoint2" (given the order induced by the
structure of the 'tempflow'-object of the given 'tempnetwork'-object).
}
