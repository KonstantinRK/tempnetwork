% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tempflow-getter.R
\name{get_point_name.tempflow}
\alias{get_point_name.tempflow}
\title{Given a point-id (or a point-name) this function returns the corresponding point-name
as defined in (the 'igraph'-object underlying) the given 'tempflow'-object.
If the given point-id or point-name is not present and if 'safe' has the value TRUE, an error will be thrown.}
\usage{
\method{get_point_name}{tempflow}(tempFlow, inpPoint, safe = TRUE)
}
\arguments{
\item{tempFlow}{A 'tempflow'-object.}

\item{inpPoint}{Either a string representing the point-name or
an integers representing the point-id.}

\item{safe}{If TRUE, it will be tested, whether the given point-id (or point-name) is present in the 'tempflow'-object.}
}
\value{
The point-name of the point specified in "inpPoint" as currently defined in the 'tempflow'-object "tempFlow".
}
\description{
Given a point-id (or a point-name) this function returns the corresponding point-name
as defined in (the 'igraph'-object underlying) the given 'tempflow'-object.
If the given point-id or point-name is not present and if 'safe' has the value TRUE, an error will be thrown.
}
