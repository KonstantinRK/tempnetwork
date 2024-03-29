% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tempnetwork-inputchecker.R
\name{check_graphlist_equivrel_correspondence.tempnetwork}
\alias{check_graphlist_equivrel_correspondence.tempnetwork}
\title{This function checks, if the indecies and entries of the equivalence-relation from the given 'tempnetwork'-object,
correspond with the indecies and graphs of the graph-list from the given 'tempnetwork'-object.}
\usage{
\method{check_graphlist_equivrel_correspondence}{tempnetwork}(tempNetwork,
  hasTempflowCorrespondence = FALSE, throwError = TRUE)
}
\arguments{
\item{tempNetwork}{A 'tempnetwork'-object.}

\item{hasTempflowCorrespondence}{If TRUE, it will be assumed that the function "check_tempflow_graphlist_equivrel_correspondence" would evaluate to TRUE.}

\item{throwError}{If TRUE the respective errors will be thrown. Otherwise, a truth value will be returned.}
}
\value{
The boolean value TRUE,
if the indecies and entries of the equivalence-relation from the given 'tempnetwork'-object,
correspond with the indecies and graphs of the graph-list from the given 'tempnetwork'-object.
}
\description{
If the equivalence-relation of the given 'tempnetwork'-object is NULL,
whether the vertex sets of all graphs in the graph-list of the given 'tempnetwork'-object are identical and
if "hasTempflowCorrespondence" is FALSE whether the names of the graphs in the graph-list of the given 'tempnetwork'-object are unique.
Otherwise, if "hasTempflowCorrespondence" is TRUE it will check
if the number of vertices of each graph in the graph-list of the given 'tempnetwork'-object is identical to
the number of equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object. Additionally,
it will check if for each entry in the equivalence-class of the equivalence-relation of the given 'tempnetwork'-object,
 there exists a vertex with the same name in the corresponding graph from the graph-list of the given 'tempnetwork'-object.
If "hasTempflowCorrespondence" is FALSE, it will be additionally ensured that the names of the graphs in the graph-list of the given 'tempnetwork'-object are unique and
that the indices of each equivalence-class from the equivalence-relation of the given 'tempnetwork'-object,
are identical to the indices from the graph-list of the given 'tempnetwork'-object.
}
