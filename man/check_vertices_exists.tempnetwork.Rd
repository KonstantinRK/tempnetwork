% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tempnetwork-inputchecker.R
\name{check_vertices_exists.tempnetwork}
\alias{check_vertices_exists.tempnetwork}
\title{For each corresponding entry of the given vectors "tVertexNameList","pointNameList"  and "vertexNameListZ", this function checks if there exists a vertex with the name as specified in "vertexNameList"
in the graph with the name specified in "tVertexNameList" (from the graph-list of the given 'tempnetwork'-object).
If the equivalence-relation of the given 'tempnetwork'-object is not NULL, it will be ensured that
the value specified through "tVertexNameList" and "pointNameList" is equal to the value specified in "vertexNameList".}
\usage{
\method{check_vertices_exists}{tempnetwork}(tempNetwork, tVertexNameList,
  pointNameList, vertexNameList)
}
\arguments{
\item{tempNetwork}{A 'tempnetwork'-object.}

\item{tVertexNameList}{A vector of strings, representing the names of equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object.}

\item{pointNameList}{A vector of strings, representing the names of graphs in the graph-list of the given 'tempnetwork'-object. It has same length as the vector "tVertexNameList".}

\item{vertexNameList}{A vector of strings, representing the names of vertices in graphs from the graph-list of the given 'tempnetwork'-object. It has same length as the vector "tVertexNameList".}
}
\value{
The boolean value TRUE,
if each vertex specifed in "vertexNameList" can be found in the graphs specified through "pointNameList" and
if each vertex specifed in "vertexNameList" can be found as an entry at the index determined through "pointNameList" in the equivalence-class specified through "pointNameList".
}
\description{
For each corresponding entry of the given vectors "tVertexNameList","pointNameList"  and "vertexNameListZ", this function checks if there exists a vertex with the name as specified in "vertexNameList"
in the graph with the name specified in "tVertexNameList" (from the graph-list of the given 'tempnetwork'-object).
If the equivalence-relation of the given 'tempnetwork'-object is not NULL, it will be ensured that
the value specified through "tVertexNameList" and "pointNameList" is equal to the value specified in "vertexNameList".
}
