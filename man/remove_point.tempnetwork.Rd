% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tempnetwork-tempflow-basics.R
\name{remove_point.tempnetwork}
\alias{remove_point.tempnetwork}
\title{This function takes a 'tempnetwork'-object and a point-name (or point-id), which will be removed from the 'tempflow'-object of the given 'tempnetwork'-object.
If the point has only a successor or only a predecessor, then only the incident edges will be removed. Otherwise,
all successors and all predecessors will be connected in a manner such that distances, i.e. weights are preserved.
Additionally, the corresponding entry in the "graphList" and in the "equivRel" of the given 'tempnetwork'-object
will be removed as well.}
\usage{
\method{remove_point}{tempnetwork}(tempNetwork, removePoint, safe = TRUE)
}
\arguments{
\item{tempNetwork}{A 'tempnetwork'-object.}

\item{removePoint}{A point-name (or point-id) representing the point in time to be removed.}

\item{safe}{If TRUE, it will be ensured, that the given point is present in the specified 'tempflow'-object.
Additionally, the usual tempflow and tempnetwork condition are checked.}
}
\value{
A new 'tempnetwork'-object, containing a new 'tempflow'-object constructed by removing the specified point and (if necessary) reconnecting the 'tempflow'-object of the given 'tempnetwork'-object;
 containing a new "graphList" constructed by removing the graph with the name of the specified point from the existing "graphList" of the given 'tempnetwork'-object;
 containing a new "equivRel" constructed by removing the entries corresponding to the vertices of the removed graph from the existing "equivRel" of the given 'tempnetwork'-object.
}
\description{
This function takes a 'tempnetwork'-object and a point-name (or point-id), which will be removed from the 'tempflow'-object of the given 'tempnetwork'-object.
If the point has only a successor or only a predecessor, then only the incident edges will be removed. Otherwise,
all successors and all predecessors will be connected in a manner such that distances, i.e. weights are preserved.
Additionally, the corresponding entry in the "graphList" and in the "equivRel" of the given 'tempnetwork'-object
will be removed as well.
}
