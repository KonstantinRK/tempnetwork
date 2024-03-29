% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tempnetwork-tempflow-predicates.R
\name{is_locally_homogeneous.tempnetwork}
\alias{is_locally_homogeneous.tempnetwork}
\title{Is a function that checks whether the 'tempflow'-object of the given 'tempnetwork'-object is locally homogeneous.
That is, whether every step (excluding loops) has the same weight.}
\usage{
\method{is_locally_homogeneous}{tempnetwork}(tempNetwork)
}
\arguments{
\item{tempNetwork}{A 'tempnetwork'-object.}
}
\value{
A truth value indicating whether the underlying flow is locally homogeneous.
}
\description{
Is a function that checks whether the 'tempflow'-object of the given 'tempnetwork'-object is locally homogeneous.
That is, whether every step (excluding loops) has the same weight.
}
