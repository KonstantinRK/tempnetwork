#' Returns the graph underlying the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The 'igraph'-object underlying, the 'tempflow'-object of the given 'tempnetwork'-object.
G.tempnetwork <- function(tempNetwork){
  return(G(tF(tempNetwork)))
}

#' Returns the points in time from the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return A list of 'igraph'-vertices (from the underlying 'igraph'-object),
#' representing the points in time from the 'tempflow'-object of the given 'tempnetwork'-object.
tP.tempnetwork <- function(tempNetwork, ...){
  return(tP(tF(tempNetwork), ...))
}

#' Returns the steps in time from the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return A list of 'igraph'-edges (from the underlying 'igraph'-object),
#' representing the steps in time from the 'tempflow'-object of the given 'tempnetwork'-object.
tS.tempnetwork <- function(tempNetwork, ...){
  return(tS(tF(tempNetwork), ...))
}

#' Given a point-name (or a point-id) this function returns the corresponding point-id
#' as defined in (the 'igraph'-object underlying) the 'tempflow'-object provided through the given 'tempnetwork'-object.
#' If the given point-name (or point-id) is not present and if 'safe' has the value TRUE, an error will be thrown.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param inpPoint Either a string representing the point-name or
#'  an integers representing the point-id.
#' @param safe If TRUE, it will be tested, whether the given point-name (or point-id) is present in the 'tempflow'-object.
#' @return The point-id of the point specified in "inpPoint", as currently defined in the 'tempflow'-object provided through the given 'tempnetwork'-object.
get_point_id.tempnetwork <- function(tempNetwork, inpPoint, safe = TRUE) {
  return(get_point_id(tF(tempNetwork), inpPoint, safe =safe))
}

#' Given a vector of point-names (or a vector of point-ids) this function returns a vector containing the corresponding point-ids
#' as defined in (the 'igraph'-object underlying) the 'tempflow'-object provided through the given 'tempnetwork'-object.
#' If one of the given point-names (or point-ids) is not present and if 'safe' has the value TRUE, an error will be thrown.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param inpPointList Either a vector of strings representing point-names or
#'  a vector of integers representing a point-ids.
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object.
#' @return The point-ids of the points specified in "inpPointList", as currently defined in the 'tempflow'-object provided through the given 'tempnetwork'-object.
get_point_ids.tempnetwork <- function(tempNetwork, inpPointList = tP(tempNetwork), safe = TRUE) {
  return(get_point_ids(tF(tempNetwork), inpPointList, safe =safe))
}

#' This function returns the edge-ids (as currently defined in the 'igraph'-object underlying the 'tempflow'-object of the given 'tempnetwork'-object),
#' of the edges which are characterised by their start- and endpoints that are specified by the input vectors
#' srcPointList and dstPointList respectively, both of which are containing point-names (or point-ids).
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param srcPointList The vector containing the point-names (or point-ids) representing the start-points of the desired edges.
#' @param dstPointList The vector containing the point-names (or point-ids) representing the end-points of the desired edges.
#' @param safe If TRUE, it will be tested, whether the specified point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object;
#' whether the vectors have the same length; whether the specified edges are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return A vector of the current step-ids, as defined in the 'igraph'-object underlying the 'tempflow'-object of the given 'tempnetwork'-object.
get_step_ids.tempnetwork <- function(tempNetwork, srcPointList = NULL, dstPointList = NULL, safe = TRUE) {
  return(get_step_ids(tF(tempNetwork), srcPointList, dstPointList, safe = safe))
}

#' Given a point-id (or a point-name) this function returns the corresponding point-name
#' as defined in (the 'igraph'-object underlying) the 'tempflow'-object of the given 'tempnetwork'-object.
#' If the given point-id or point-name is not present and if 'safe' has the value TRUE, an error will be thrown.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param inpPoint Either a string representing the point-name or
#'  an integers representing the point-id.
#' @param safe If TRUE, it will be tested, whether the given point-id (or point-name) is present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return The point-name of the point specified in "inpPoint" as currently defined in the 'tempflow'-object of the given 'tempnetwork'-object.
get_point_name.tempnetwork <- function(tempNetwork, inpPoint, safe = TRUE) {
  return(get_point_name(tF(tempNetwork), inpPoint, safe = safe))
}

#' Given a vector of point-ids (or a vector of point-names) this function returns a vector containing the corresponding point-names
#' as defined in (the 'igraph'-object underlying) the 'tempflow'-object of the given 'tempnetwork'-object.
#' If one of the given point-ids (or point-names) is not present and if 'safe' has the value TRUE, an error will be thrown.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param inpPointList Either a vector of strings representing point-names or
#'  a vector of integers representing a point-ids.
#' @param safe If TRUE, it will be tested, whether the given point-ids (or point-names) are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return The point-names of the points specified in "inpPointList" as currently defined in the 'tempflow'-object of the given 'tempnetwork'-object.
get_point_names.tempnetwork <- function(tempNetwork, inpPointList  = tP(tempNetwork), safe = TRUE) {
  return(get_point_names(tF(tempNetwork), inpPointList, safe = safe))
}



#' This function returns the edge-weights, as currently defined in (the 'igraph'-object underlying) the given 'tempflow'-object of the given 'tempnetwork'-object,
#' of the edges which are characterised by their start- and end-points that are specified by the input vectors,
#' "srcPointList" and "dstPointList" respectively, both of which are containing point-names (or point-ids).
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param srcPointList The vector containing the point-names (or point-ids) representing the start-points of the desired edges.
#' @param dstPointList The vector containing the point-names (or point-ids) representing the end-points of the desired edges.
#' @param safe If TRUE, it will be tested, whether the specified point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object;
#' whether the vectors have the same length; whether the specified edges are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return A vector containing the step-weights of the specified steps, as defined in (the 'igraph'-object underlying) the 'tempflow'-object of the given 'tempnetwork'-object.
get_step_weights.tempnetwork <- function(tempNetwork, srcPointList = NULL, dstPointList = NULL, safe = TRUE) {
  return(get_step_weights(tF(tempNetwork), srcPointList, dstPointList, safe = safe))
}



#' This function returns the edge-weights, as currently defined in (the 'igraph'-object underlying) the 'tempflow'-object of the given 'tempnetwork'-object,
#' of the edges which are specified by a vector containing their edge-ids
#' (as currently defined in (the 'igraph'-object underlying) the 'tempflow'-object of the given 'tempnetwork'-object).
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param stepIDList A vector containing the edge-ids of the desired edges, as currently defined in (the 'igraph'-object underlying) the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param safe If TRUE, it will be tested, whether the specified edges are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return A vector of the current step-weights, as defined in (the 'igraph'-object underlying) the 'tempflow'-object of the given 'tempnetwork'-object.
get_step_weights_from_id.tempnetwork <- function(tempNetwork, stepIDList=tS(tempNetwork), safe = TRUE) {
  return(get_step_weights_from_id(tF(tempNetwork), stepIDList,safe = safe))
}

#' This function returns a named list. The key 'startPointList' references the start-points of the specified steps,
#' while the key 'endPointList' references their end-points.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param stepIDList A vector containing the edge-ids of the desired edges, as currently defined in (the 'igraph'-object underlying) the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param safe If TRUE, it will be tested, whether the specified edges are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return A list with the keys 'startPointList' and 'endPointList' containing the respective start- and end-points of the given steps.
get_step_point_list_from_id.tempnetwork <- function(tempNetwork, stepIDList = tS(tempNetwork), safe = TRUE) {
  return(get_step_point_list_from_id(tF(tempNetwork), stepIDList, safe))
}



#' This function returns a named list. The key 'startPointList' references the start-points of the specified steps,
#' while the key 'endPointList' references their end-points.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param srcPointList The vector containing the point-names (or point-ids) representing the start-points of the desired edges.
#' @param dstPointList The vector containing the point-names (or point-ids) representing the end-points of the desired edges.
#' @param safe If TRUE, it will be tested, whether the specified point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object;
#' whether the vectors have the same length; whether the specified edges are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return  A list with the keys 'startPointList' and 'endPointList' containing the respective start- and end-points of the given steps.
get_step_point_list.tempnetwork <- function(tempNetwork, srcPointList = NULL, dstPointList = NULL, safe = TRUE) {
  return(get_step_point_list(tF(tempNetwork), srcPointList, dstPointList, safe))
}


#' This function returns the attribute list of the specified steps in the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param stepIDList A vector containing the edge-ids of the desired edges, as currently defined in (the 'igraph'-object underlying) the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param safe If TRUE, it will be tested, whether the specified edges are present in the 'tempnetwork'-object of the given 'tempnetwork'-object.
#' @return This function returns the attribute list of the specified steps from the 'tempflow'-object of the given 'tempnetwork'-object.
get_step_attr_list_from_id.tempnetwork <- function(tempNetwork, stepIDList = tS(tempNetwork), safe = TRUE) {
  return(get_step_attr_list_from_id(tF(tempNetwork), stepIDList, safe))
}


#' This function returns the attribute list of the specified steps in the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param srcPointList The vector containing the point-names (or point-ids) representing the start-points of the desired edges.
#' @param dstPointList The vector containing the point-names (or point-ids) representing the end-points of the desired edges.
#' @param safe If TRUE, it will be tested, whether the specified point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object;
#' whether the vectors have the same length; whether the specified edges are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return This function returns the attribute list of the specified steps from the 'tempflow'-object of the given 'tempnetwork'-object.
get_step_attr_list.tempnetwork <- function(tempNetwork, srcPointList = NULL, dstPointList = NULL, safe = TRUE) {
  return(get_step_attr_list(tF(tempNetwork), srcPointList, dstPointList, safe))
}



#' Is a wrapper function of the normal plot function. Allowing to plot a tempflow objec like a graph.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param weighted  If TRUE the weights of the steps in time will be plotted.
#' @return Returns a plot of the 'tempnetwork'-object
# @example plot(tempNetwork)
plot.tempnetwork <- function(tempNetwork, weighted = TRUE, levels = TRUE, ...){
  if(levels){
    if (weighted == TRUE) {
      igraph::plot.igraph(tG(tempNetwork, TRUE), edge.label = tS(tempNetwork)$weight, ...)
    } else {
      igraph::plot.igraph(tG(tempNetwork, TRUE), ...)
    }
  }
  if (weighted == TRUE) {
    igraph::plot.igraph(tG(tempNetwork, TRUE, FALSE), edge.label = tS(tempNetwork)$weight, ...)
  } else {
    igraph::plot.igraph(tG(tempNetwork, TRUE, FALSE), ...)
  }

}
