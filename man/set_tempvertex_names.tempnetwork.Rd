% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tempnetwork-setter.R
\name{set_tempvertex_names.tempnetwork}
\alias{set_tempvertex_names.tempnetwork}
\title{This function supports the changing of names of specified equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object.
If the equivalence-relation of the given 'tempnetwork'-object is NULL and the flag "retainImpliedEquivRel" is TRUE, the equivalence-relation in the
new 'tempnetwork'-object remains NULL. However, to compensate the resulting incongruity all the names of vertices specified in "oldVertexNameList" across all graphs from the graph-list
of the provided 'tempnetwork'-object, are changed to the corresponding names provided in "newVertexNameList".
Otherwise, the resulting 'tempnetwork'-object is a copy of the provided one, but for the fact that the names of the equivalence-classes specified through the vector "oldVertexNameList"
are now changed to the corresponding names found in the vector "newVertexNameList".}
\usage{
\method{set_tempvertex_names}{tempnetwork}(tempNetwork, oldVertexNameList,
  newVertexNameList, retainImpliedEquivRel = TRUE, safe = TRUE)
}
\arguments{
\item{tempNetwork}{A 'tempnetwork'-object.}

\item{oldVertexNameList}{A vector of strings, representing the names of equivalence-classes in from the equivalence-relation of the given 'tempnetwork'-object.}

\item{newVertexNameList}{A vector of strings, representing the new names of the equivalence-classes specified in the vector "oldVertexNameList".
Hence, it must have the same length as the vector "oldVertexNameList".}

\item{retainImpliedEquivRel}{If TRUE, the equivalence-relation in the
new 'tempnetwork'-object remains NULL. However, to compensate the resulting incongruity all the names of vertices specified in "oldVertexNameList" across all graphs from the graph-list
of the provided 'tempnetwork'-object, are changed to the corresponding names provided in "newVertexNameList".+}

\item{safe}{If TRUE, it will be ensured that
the vectors oldVertexNameList and  newVertexNameList have the same length.
the vectors oldVertexNameList and  newVertexNameList both have unique entries.
the equivalence-classes specified in "oldVertexNameList" actually exist.
Additionally, the usual 'tempnetwork' conditions will be checked.}
}
\value{
If the equivalence-relation of the given 'tempnetwork'-object is NULL and the flag "retainImpliedEquivRel" is TRUE, the resulting 'tempnetwork'-object will contain
the same 'tempflow'-object as found in the given 'tempnetwork'-object;
a new graph-list constructed by changing all the names of vertices specified in "oldVertexNameList" across all graphs from the graph-list
of the provided 'tempnetwork'-object to the corresponding names provided in "newVertexNameList";
a NULL-value in the field "equivRel".

Otherwise, the resulting 'tempnetwork'-object will contain
the same 'tempflow'-object as found in the given 'tempnetwork'-object;
the same graph-list as found in the given 'tempnetwork'-object;
a new equivalence-relation constructed by changing the names of the equivalence-classes specified through the vector "oldVertexNameList"
to the corresponding names found in the vector "newVertexNameList".
Additionally, the "tempGraph"-field will be set to NULL.
}
\description{
This function supports the changing of names of specified equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object.
If the equivalence-relation of the given 'tempnetwork'-object is NULL and the flag "retainImpliedEquivRel" is TRUE, the equivalence-relation in the
new 'tempnetwork'-object remains NULL. However, to compensate the resulting incongruity all the names of vertices specified in "oldVertexNameList" across all graphs from the graph-list
of the provided 'tempnetwork'-object, are changed to the corresponding names provided in "newVertexNameList".
Otherwise, the resulting 'tempnetwork'-object is a copy of the provided one, but for the fact that the names of the equivalence-classes specified through the vector "oldVertexNameList"
are now changed to the corresponding names found in the vector "newVertexNameList".
}
