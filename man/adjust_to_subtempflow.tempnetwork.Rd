% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tempnetwork-basic.R
\name{adjust_to_subtempflow.tempnetwork}
\alias{adjust_to_subtempflow.tempnetwork}
\title{This function takes a 'tempflow'-object that is a subflow of the 'tempflow'-object currently stored in the given 'tempnetwork'-object and adjusts the
given 'tempnetwork'-object to it.
This is accomplished by removing those entries from the graph-list of the given 'tempnetwork'-object that are not present in the given reduced 'tempflow'-object and
by removing those entries across all the equivalence-classes from the equivalence-relation of the given 'tempnetwork'-object that are not present in the given reduced 'tempflow'-object.}
\usage{
adjust_to_subtempflow.tempnetwork(tempNetwork, subTempFlow, safe = TRUE)
}
\arguments{
\item{tempNetwork}{A 'tempnetwork'-object.}

\item{safe}{If TRUE, it will be ensured that the given 'tempflow'-object is acutually a subtempflow of the 'tempflow'-object of the given 'tempnetwork'-object.
Additionally, all tempnetwork conditions will be checked to ensure that the resulting 'tempnetwork'-object satisfies all requirements.}

\item{redTempFlow}{A 'tempflow'-object that is a sub-tempflow of the 'tempflow'-object of the given 'tempnetwork'-object.}
}
\value{
A new 'tempnetwork'-object, containing the given reduced 'tempflow'-object;
a graph-list obtained by removing the excess entries from the graph-list of the given 'tempnetwork'-object;
an equivalence-relation obtained by removing the excess entries from equivalence-classes of the equivalence-relation provided through the given 'tempnetwork'-object.
Additionally, the "tempGraph"-field will be set to NULL.
}
\description{
This function takes a 'tempflow'-object that is a subflow of the 'tempflow'-object currently stored in the given 'tempnetwork'-object and adjusts the
given 'tempnetwork'-object to it.
This is accomplished by removing those entries from the graph-list of the given 'tempnetwork'-object that are not present in the given reduced 'tempflow'-object and
by removing those entries across all the equivalence-classes from the equivalence-relation of the given 'tempnetwork'-object that are not present in the given reduced 'tempflow'-object.
}
