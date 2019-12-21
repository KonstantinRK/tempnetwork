#' Returns the graph underlying the given 'tempflow'-object.
#'
#' @param tempFlow A 'tempflow'-object.
#' @return The 'igraph'-object underlying, the given 'tempflow'-object.
G.tempflow <- function(tempFlow){
  return(tempFlow[["graph"]])
}

#' Returns the points in time of the given 'tempflow'-object.
#'
#' @param tempFlow A 'tempflow'-object.
#' @return A list of 'igraph'-vertices (from the underlying 'igraph'-object),
#' representing the points in time of the 'tempflow'-object.
tP.tempflow <- function(tempFlow, ...){
  return(igraph::V(G(tempFlow), ...))
}

#' Returns the steps in time of the given 'tempflow'-object.
#'
#' @param tempFlow A 'tempflow'-object.
#' @return A list of 'igraph'-edges (from the underlying 'igraph'-object),
#' representing the steps in time of the 'tempflow'-object.
tS.tempflow <- function(tempFlow, ...){
  return(igraph::E(G(tempFlow),...))
}

#' Given a point-name (or a point-id) this function returns the corresponding point-id
#' as defined in (the 'igraph'-object underlying) the given 'tempflow'-object.
#' If the given point-name (or point-id) is not present and if 'safe' has the value TRUE, an error will be thrown.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param inpPoint Either a string representing the point-name or
#'  an integers representing the point-id.
#' @param safe If TRUE, it will be tested, whether the given point-name (or point-id) is present in the 'tempflow'-object.
#' @return The point-id of the point specified in "inpPoint", as currently defined in the 'tempflow'-object "tempFlow".
get_point_id.tempflow <- function(tempFlow, inpPoint, safe = TRUE) {
  if(is.numeric(inpPoint)) {
    if(safe &&check_vector_contains_na_or_or_nan_null(inpPoint)) {error_ids_not_in_object()}
    if (safe) { if (!check_point_id(tempFlow, inpPoint)) {error_ids_not_in_object()}}
    return(inpPoint)
  } else{
    if(safe &&check_vector_contains_na_or_or_nan_null(inpPoint)) {error_name_not_in_object()}
    if (safe) { if (!check_point_name(tempFlow, inpPoint)) {error_name_not_in_object()}}
    return(which(tP(tempFlow)$name == inpPoint))
  }
}

#' Given a vector of point-names (or a vector of point-ids) this function returns a vector containing the corresponding point-ids
#' as defined in (the 'igraph'-object underlying) the given 'tempflow'-object.
#' If one of the given point-names (or point-ids) is not present and if 'safe' has the value TRUE, an error will be thrown.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param inpPointList Either a vector of strings representing point-names or
#'  a vector of integers representing a point-ids.
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object.
#' @return The point-ids of the points specified in "inpPointList", as currently defined in the 'tempflow'-object "tempFlow".
get_point_ids.tempflow <- function(tempFlow, inpPointList = tP(tempFlow), safe = TRUE) {
  return(unlist(unname(sapply(inpPointList, function(x) get_point_id(tempFlow, x, safe)))))
}

#' This function returns the edge-ids, as currently defined in (the 'igraph'-object underlying) the given 'tempflow'-object,
#' of the edges which are characterised by their start- and endpoints that are specified by the input vectors
#' srcPointList and dstPointList respectively, both of which are containing point-names (or point-ids).
#'
#' @param tempFlow A 'tempflow'-object.
#' @param srcPointList The vector containing the point-names (or point-ids) representing the start-points of the desired edges.
#' @param dstPointList The vector containing the point-names (or point-ids) representing the end-points of the desired edges.
#' @param safe If TRUE, it will be tested, whether the specified point-names (or point-ids) are present in the given 'tempflow'-object;
#' whether the vectors have the same length; whether the specified edges are present in the given 'tempflow'-object.
#' @return A vector of the current step-ids, as defined in (the 'igraph'-object underlying) the given 'tempflow'-object.
get_step_ids.tempflow <- function(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE) {
  if(safe && (is.null(srcPointList) || is.null(dstPointList))) {
    v <- igraph::get.edgelist(G(tempFlow))
    return(igraph::get.edge.ids(G(tempFlow), c(rbind(v[,1], v[,2]))))
  }
  srcPointIDList <- get_point_ids(tempFlow, srcPointList, safe)
  dstPointIDList <- get_point_ids(tempFlow, dstPointList, safe)
  if (safe) {if(!check_vector_equal_length(srcPointIDList, dstPointIDList)){error_vector_not_equal_length()}}
  stepIDList <- igraph::get.edge.ids(G(tempFlow), c(rbind(srcPointIDList, dstPointIDList)))
  if (safe) {if(min(stepIDList)<=0) { error_edge_not_exist() }}
  return(stepIDList)
}

#' Given a point-id (or a point-name) this function returns the corresponding point-name
#' as defined in (the 'igraph'-object underlying) the given 'tempflow'-object.
#' If the given point-id or point-name is not present and if 'safe' has the value TRUE, an error will be thrown.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param inpPoint Either a string representing the point-name or
#'  an integers representing the point-id.
#' @param safe If TRUE, it will be tested, whether the given point-id (or point-name) is present in the 'tempflow'-object.
#' @return The point-name of the point specified in "inpPoint" as currently defined in the 'tempflow'-object "tempFlow".
get_point_name.tempflow <- function(tempFlow, inpPoint, safe = TRUE) {
  if (safe) {if (is.null(tP(tempFlow)$name)) {error_no_attr_assigned()}}
  inpPointID <- get_point_id(tempFlow, inpPoint, safe)
  return(tP(tempFlow)$name[inpPointID])
}

#' Given a vector of point-ids (or a vector of point-names) this function returns a vector containing the corresponding point-names
#' as defined in (the 'igraph'-object underlying) the given 'tempflow'-object.
#' If one of the given point-ids (or point-names) is not present and if 'safe' has the value TRUE, an error will be thrown.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param inpPointList Either a vector of strings representing point-names or
#'  a vector of integers representing a point-ids.
#' @param safe If TRUE, it will be tested, whether the given point-ids (or point-names) are present in the 'tempflow'-object.
#' @return The point-names of the points specified in "inpPointList" as currently defined in the 'tempflow'-object "tempFlow".
get_point_names.tempflow <- function(tempFlow, inpPointList  = tP(tempFlow), safe = TRUE) {
  return(unname(sapply(inpPointList, function(x) get_point_name(tempFlow, x, safe))))
}



#' This function returns the edge-weights, as currently defined in (the 'igraph'-object underlying) the given 'tempflow'-object,
#' of the edges which are characterised by their start- and end-points that are specified by the input vectors,
#' "srcPointList" and "dstPointList" respectively, both of which are containing point-names (or point-ids).
#'
#' @param tempFlow A 'tempflow'-object.
#' @param srcPointList The vector containing the point-names (or point-ids) representing the start-points of the desired edges.
#' @param dstPointList The vector containing the point-names (or point-ids) representing the end-points of the desired edges.
#' @param safe If TRUE, it will be tested, whether the specified point-names (or point-ids) are present in the given 'tempflow'-object;
#' whether the vectors have the same length; whether the specified edges are present in the given 'tempflow'-object.
#' @return A vector containing the step-weights of the specified steps, as defined in (the 'igraph'-object underlying) the given 'tempflow'-object.
get_step_weights.tempflow <- function(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE) {
  return(get_step_weights_from_id(tempFlow, get_step_ids(tempFlow, srcPointList, dstPointList, safe)))
}



#' This function returns the edge-weights, as currently defined in (the 'igraph'-object underlying) the given 'tempflow'-object,
#' of the edges which are specified by a vector containing their edge-ids
#' (as currently defined in (the 'igraph'-object underlying) the given 'tempflow'-object).
#'
#' @param tempFlow A 'tempflow'-object.
#' @param stepIDList A vector containing the edge-ids of the desired edges, as currently defined in (the 'igraph'-object underlying) the given 'tempflow'-object.
#' @param safe If TRUE, it will be tested, whether the specified edges are present in the given 'tempflow'-object.
#' @return A vector of the current step-weights, as defined in (the 'igraph'-object underlying) the given 'tempflow'-object.
get_step_weights_from_id.tempflow <- function(tempFlow, stepIDList=tS(tempFlow), safe = TRUE) {
  if (safe) {if(!check_step_ids(tempFlow, stepIDList)) {error_ids_not_in_object()}}
  return(igraph::get.edge.attribute(G(tempFlow), "weight", stepIDList))
}


#' This function returns a named list. The key 'startPointList' references the start-points of the specified steps,
#' while the key 'endPointList' references their end-points.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param stepIDList A vector containing the edge-ids of the desired edges, as currently defined in (the 'igraph'-object underlying) the given 'tempflow'-object.
#' @param safe If TRUE, it will be tested, whether the specified edges are present in the given 'tempflow'-object.
#' @return A list with the keys 'startPointList' and 'endPointList' containing the respective start- and end-points of the given steps.
get_step_point_list_from_id.tempflow <- function(tempFlow, stepIDList = tS(tempFlow), safe = TRUE) {
  if (safe) {if(!check_step_ids(tempFlow, stepIDList)) {error_ids_not_in_object()}}
  pointList <- igraph::ends(G(tempFlow), stepIDList)
  return(list("startPointList"=pointList[,1], "endPointList"=pointList[,2]))
}


#' This function returns a named list. The key 'startPointList' references the start-points of the specified steps,
#' while the key 'endPointList' references their end-points.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param srcPointList The vector containing the point-names (or point-ids) representing the start-points of the desired edges.
#' @param dstPointList The vector containing the point-names (or point-ids) representing the end-points of the desired edges.
#' @param safe If TRUE, it will be tested, whether the specified point-names (or point-ids) are present in the given 'tempflow'-object;
#' whether the vectors have the same length; whether the specified edges are present in the given 'tempflow'-object.
#' @return  A list with the keys 'startPointList' and 'endPointList' containing the respective start- and end-points of the given steps.
get_step_point_list.tempflow <- function(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE) {
  return(get_step_point_list_from_id(tempFlow, get_step_ids(tempFlow, srcPointList, dstPointList, safe)))
}


#' This function returns the attribute list of the specified steps in the 'tempflow'-object.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param stepIDList A vector containing the edge-ids of the desired edges, as currently defined in (the 'igraph'-object underlying) the given 'tempflow'-object.
#' @param safe If TRUE, it will be tested, whether the specified edges are present in the given 'tempflow'-object.
#' @return This function returns the attribute list of the specified steps in the 'tempflow'-object.
get_step_attr_list_from_id.tempflow <- function(tempFlow, stepIDList = tS(tempFlow), safe = TRUE) {
  if (safe) {if(!check_step_ids(tempFlow, stepIDList)) {error_ids_not_in_object()}}
  return(igraph::edge.attributes(G(tempFlow), stepIDList))
}



#' This function returns the attribute list of the specified steps in the 'tempflow'-object.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param srcPointList The vector containing the point-names (or point-ids) representing the start-points of the desired edges.
#' @param dstPointList The vector containing the point-names (or point-ids) representing the end-points of the desired edges.
#' @param safe If TRUE, it will be tested, whether the specified point-names (or point-ids) are present in the given 'tempflow'-object;
#' whether the vectors have the same length; whether the specified edges are present in the given 'tempflow'-object.
#' @return This function returns the attribute list of the specified steps in the 'tempflow'-object.
get_step_attr_list.tempflow <- function(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE) {
  return(get_step_attr_list_from_id(tempFlow, get_step_ids(tempFlow, srcPointList, dstPointList, safe)))
}




#' Is a wrapper function of the normal plot function. Allowing to plot a tempflow objec like a graph.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param weighted  If TRUE the weights of the steps in time will be plotted.
#' @return Returns a plot of the 'tempflow'-object
# @example plot(tempFlow)
plot.tempflow <- function(tempFlow, weighted = TRUE, ...){
  if (weighted == TRUE) {
    igraph::plot.igraph(G(tempFlow), edge.label = tS(tempFlow)$weight, ...)
  } else {
    igraph::plot.igraph(G(tempFlow), ...)
  }
}
