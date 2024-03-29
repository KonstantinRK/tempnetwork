% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tempnetwork-inputchecker.R
\name{check_points_exists.tempnetwork}
\alias{check_points_exists.tempnetwork}
\title{A function that checks, if the points specified in "pointNameList" exist in the 'tempflow'-object of the given 'tempnetwork'-object.}
\usage{
\method{check_points_exists}{tempnetwork}(tempNetwork, pointNameList)
}
\arguments{
\item{tempNetwork}{A 'tempnetwork'-object.}

\item{pointNameList}{A vector of strings representing the names of points in the 'tempflow'-object of the given 'tempnetwork'-object.}
}
\value{
The boolean value TRUE,
if all the points specified in "pointNameList" exist in the 'tempflow'-object of the given 'tempnetwork'-object.
}
\description{
A function that checks, if the points specified in "pointNameList" exist in the 'tempflow'-object of the given 'tempnetwork'-object.
}
