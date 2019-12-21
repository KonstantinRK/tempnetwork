#' Is a function that takes a 'tempflow'-object and a vector of strings,
#' and adds new points, with the specified point-names, to the 'tempflow'-object.
#'
#' @param tempFlow  A 'tempflow'-object.
#' @param addPointList A vector containing the strings that represent the names of the points that ought to be added.
#' @param attrList A vector to specify other vertex attributes. If left NULL, no attributes (other than name) will be assigned to the newly introduced points in time.
#' Otherwise, this list has to be structured as required by the function igraph::add.vertices.
#' @param safe If TRUE, it will be ensured that point-names remain unique; that point-names remain strings.
#' Additionally, the usual tempflow condition are checked (e.g. duplicate names, cycles, ... ).
#' @return A new 'tempflow'-object, constructed by adding points with the specified names to the given 'tempflow'-object.
add_points.tempflow <- function(tempFlow, newPointList, attrList = NULL, safe = TRUE) {
  if (is.null(attrList)) {attrList <- list()}
  attrList$name <- newPointList
  if(safe){ sapply(attrList, function(x) {
    if(!check_vector_equal_length_or_one(x, newPointList)) error_vector_not_equal_length_and_not_one() })
  }
  newGraph <- igraph::add_vertices(G(tempFlow), length(newPointList), attr=attrList)
  return(tempflow(newGraph, safe=safe))
}

#' Is a function that takes a 'tempflow'-object and a vector of point-names (or point-ids),
#' and removes the specified points from the 'tempflow'-object.
#'
#' @param tempFlow  A 'tempflow'-object.
#' @param deletePointList A vector containing the point-names (or point-ids) of the points that ought to be removed.
#' @param attrList A vector to specify other vertex attributes. If left NULL, no attributes (other than name) will be assigned to the newly introduced points in time.
#' Otherwise, this list has to be structured as required by the function igraph::add.vertices.
#' @param safe If TRUE, it will be ensured that the specified point-names (or point-ids) are present in the given 'tempflow'-object.
#' Additionally, the usual tempflow condition are checked (e.g. duplicate names, cycles, ... ).
#' @return A new 'tempflow'-object, constructed by removing the specified points from the given 'tempflow'-object.
delete_points.tempflow <- function(tempFlow, deletePointList, safe = TRUE) {
  deletePointIDList <- get_point_ids(tempFlow, deletePointList, safe)
  newGraph <- igraph::delete.vertices(G(tempFlow), deletePointIDList)
  return(tempflow(newGraph,safe = safe))
}


#' Is a function that takes a 'tempflow'-object and two vectors of point-names (or point-ids)
#' and adds new steps, in between the points specified by the "srcPointList"-vector and
#' the corresponding points specified by the "dstPointList"-vector, to the 'tempflow'-object.
#'
#' @param tempFlow  A 'tempflow'-object.
#' @param srcPointList A vector containing the point-names (or point-ids) of the points from which the new edges should start.
#' @param dstPointList A vector containing the point-names (or point-ids) of the points at which the new edges should end.
#' @param weightList Is a vector containing numeric values (excluding NA, NaN and NULL) representing the step-weights of the newly introduced steps
#' If left NULL, every newly introduced loop will be assigned the value 0, and every other new edge will be assigned the value 1.
#' Otherwise, it must be either a scalar (i.e. length 1) or a vector with the same length as "srcPointList" and "dstPointList".
#' @param attrList Is a vector to specify other edge atrributes. If left NULL, no attributes (other than weight) will be assigned to the newly introduced steps in time.
#' Otherwise, this list has to be structured as required by the function igraph::add.edges.
#' @param safe If TRUE, it will be ensured that the specified point-names (or point-ids) are present in the given 'tempflow'-object;
#' the "srcPointList"-vector, the "dstPointList"-vector are of the same length;
#' that the 'weightList'-vector is either of length 1 or has the same lenght as the "srcPointList"-vector or the "dstPointList"-vector;
#' that the weights of the resulting 'tempflow'-object are non-negative, numerical values.
#' Additionally, the usual tempflow condition are checked (e.g. duplicate names, cycles, ... ).
#' @return  A new 'tempflow'-object, constructed by adding the specified edges to the given 'tempflow'-object.
# @example add_steps(tempFlow, c("t1", "t3", "t4"), c("t2", "t5", "t5"), c(4,10,1))  # adds the edges ("t1", "t2"), ("t3, "t5"), ("t4", "t5") to the underlying graph, and assigns the weight 4 to the first edge, the weight 10 to the second and the weight 1 to the last.
add_steps.tempflow <- function(tempFlow, srcPointList, dstPointList, weightList = NULL, attrList = NULL, safe = TRUE) {
  if (safe) {
    if (!check_vector_equal_length(srcPointList, dstPointList)) {error_vector_not_equal_length()}
    if (!is.null(weightList) && !check_vector_equal_length_or_one(weightList, srcPointList)) {error_vector_not_equal_lengths_and_not_one()}
    if (!is.null(attrList)) {sapply(attrList, function(x) {
      if(!check_vector_equal_length_or_one(x, srcPointList)) error_vector_not_equal_lengths_and_not_one() })
    }}
  srcPointIDList <- get_point_ids(tempFlow, srcPointList, safe)
  dstPointIDList <- get_point_ids(tempFlow, dstPointList, safe)
  edgeList <- as.vector(rbind(srcPointIDList,dstPointIDList))
  if (is.null(attrList)) {attrList <- list()}
  if (is.null(weightList)) {
    weightList <- mapply(function(src,dst) {if (src == dst) {return(0)} else {return(1)}}, srcPointIDList, dstPointIDList )
  }
  attrList$weight <- weightList
  newGraph <- igraph::add.edges(G(tempFlow), edgeList, attr=attrList)
  return(tempflow(newGraph, safe=safe))
}


#' Given a 'tempflow'-object and a vector containing the current step-ids,
#' this function removes the specified steps from the given 'tempflow'-object.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param stepIDList A vector containing the step-ids of the steps which ought to be removed.
#' @param safe If TRUE, it will be ensured that the specified step-ids exists.
#' Additionally, the usual tempflow condition are checked (e.g. duplicate names, cycles, ... ).
#' @return A new 'tempflow'-object, constructed by removing the specified edges from the given 'tempflow'-object.
delete_steps_from_id.tempflow <- function(tempFlow, stepIDList, safe = TRUE) {
  if (safe) { if(!check_step_ids(tempFlow, stepIDList)) error_ids_not_in_object() }
  newGraph <- igraph::delete.edges(G(tempFlow), stepIDList)
  return(tempflow(newGraph, safe=safe))
}


#' Is a function that takes a 'tempflow'-object and two vectors of point-names (or point-ids)
#' and removes the steps from the 'tempflow'-object. The steps are characterised by the points in the "srcPointList"-vector and
#' the corresponding points in the "dstPointList"-vector,
#'
#' @param tempFlow  A 'tempflow'-object.
#' @param srcPointList A vector containing the point-names (or point-ids) of the start-points of the edges that ought to be removed.
#' @param dstPointList A vector containing the point-names (or point-ids) of the end-points of the edges that ought to be removed.
#' @param safe If TRUE, it will be ensured that the specified point-names (or point-ids) are present in the given 'tempflow'-object;
#' that the specified steps exist;
#' the "srcPointList"-vector, the "dstPointList"-vector are of the same length.
#' Additionally, the usual tempflow condition are checked (e.g. duplicate names, cycles, ... ).
#' @return  A new 'tempflow'-object, constructed by removing the specified edges from the given 'tempflow'-object.
delete_steps.tempflow <- function(tempFlow, srcPointList, dstPointList, safe = TRUE) {
  return(delete_steps_from_id(tempFlow, get_step_ids(tempFlow, srcPointList, dstPointList), safe))
}


#' Is a function that takes a 'tempflow'-object; a string representing the name of the point to be added;
#' a two vectors containing the point-names (or point-ids) of the points which ought to be predecessors and successors of the newly added point.
#' Given this input the function, returns a new 'tempflow'-object where the newly introduced point is embedded in between the specified
#' predecessor and successor points.
#'
#' @param tempFlow  A 'tempflow'-object.
#' @param newPoint A point-name (or point-id) of the point to be inserted.
#' @param predPointList A vector containing the point-names (or point-ids) of the points serving as predecessors of the new point.
#' @param sucPointList A vector containing the point-names (or point-ids) of the points serving as successors of the new point.
#' @param weightList A vector specifying the step-weights of newly introduced edges.
#' If left NULL, every newly introduced loop will be assigned the value 0, and every other new edge will be assigned the value 1.
#' Otherwise, it must be either a scalar (i.e. length 1) or a vector with the same length as the sum of the length of the "predPointList" and the "sucPointList".
#' @param pointAttrList Is a vector to specify other point attributes. If left NULL, no attributes (other than name) will be assigned to the newly introduced point in time.
#' Otherwise, this list has to be structured as required by the function igraph::add.vertices().
#' @param stepAttrList Is a vector to specify other step attributes. If left NULL, no attributes (other than weight) will be assigned to the newly introduced steps in time.
#' Otherwise, this list has to be structured as required by the function igraph::add.edges().
#' @param safe If TRUE, it will be ensured that the specified point-names (or point-ids) are present in the given 'tempflow'-object;
#' that point names remain unique; that point-names remain strings.
#' that the 'weightList'-vector is either of length 1 or has the same length as the sum of the length of the "predPointList"-vector and the "sucPointList"-vector.
#' that the weights of the resulting 'tempflow'-object are non-negative, numerical values;
#' Additionally, the usual tempflow condition are checked (e.g. duplicate names, cycles, ... ).
#' @return  A new 'tempflow'-object, constructed by removing the specified edges from the given 'tempflow'-object.
insert_point.tempflow <- function(tempFlow, newPoint, predPointList, sucPointList, weightList = NULL, pointAttrList = NULL, stepAttrList = NULL, removeEdges = TRUE, safe = TRUE) {
  if (safe) {
    if (!is.null(weightList) && !check_vector_equal_length_or_one(weightList, c(predPointList,sucPointList))) error_vector_not_equal_sum_lengths_and_not_one()
  }
  pointTempFlow <- add_points(tempFlow, newPoint, attrList = pointAttrList, safe = FALSE)
  if(length(predPointList)==0 &&length(sucPointList)==0) {return(pointTempFlow)}

  srcPointIDList <- get_point_ids(pointTempFlow, predPointList, safe)
  dstPointIDList <- get_point_ids(pointTempFlow, sucPointList, safe)
  newPointID <- get_point_id(pointTempFlow, newPoint, safe)

  newSrcPointIDList <- c(srcPointIDList, rep(newPointID, length(dstPointIDList)))
  newDstPointIDList <- c(rep(newPointID, length(srcPointIDList)), dstPointIDList)
  newTempFlow <- add_steps(pointTempFlow, newSrcPointIDList, newDstPointIDList, weightList, stepAttrList, safe = FALSE)

  if (removeEdges) {
    edgeList <- unname(unlist(sapply(srcPointIDList, function(src) {
      sapply(intersect(get_point_ids(pointTempFlow, names(igraph::neighbors(G(pointTempFlow), src, mode = "out"))), dstPointIDList),
             function(y, x) c(x,y), src)
    })))
    if (!is.null(edgeList[c(TRUE,FALSE)]) && !is.null(edgeList[c(TRUE,FALSE)])) {
      srcPointIDList <- get_point_ids(newTempFlow, edgeList[c(TRUE,FALSE)], safe)
      dstPointIDList <- get_point_ids(newTempFlow,  edgeList[c(FALSE,TRUE)], safe)
      newTempFlow <- delete_steps(newTempFlow, srcPointIDList, dstPointIDList, safe = FALSE)
    }
  }
  return(tempflow(G(newTempFlow), safe=safe))
}


#' This function takes a 'tempflow'-object and a point-name (or point-id), which will be removed from said flow.
#' If the point has only a successor or only a predecessor, then only the incident edges will be removed. Otherwise,
#' all successors and all predecessors will be connected in a manner such that distances, i.e. weights are preserved.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param removePoint A point-name (or point-id) representing the point in time to be removed.
#' @param safe If TRUE, it will be ensured, that the given point is present in the specified 'tempflow'-object.
#' Additionally, the usual tempflow condition are checked (e.g. duplicate names, cycles, ... ).
#' @return A new 'tempflow'-object, by removing the specified point and (if necessary) reconnecting the given 'tempflow'-object.
# @example remove_point(tempFlow, "t5")
remove_point.tempflow <- function(tempFlow, removePoint, safe = TRUE) {
  removePointID <- get_point_id(tempFlow, removePoint, safe)
  inNeighbours <- get_point_ids(tempFlow, names(igraph::neighbors(G(tempFlow), removePointID, mode = "in")), safe = FALSE)
  inNeighbours <- inNeighbours[inNeighbours != removePointID]
  outNeighbours <- get_point_ids(tempFlow, names(igraph::neighbors(G(tempFlow), removePointID, mode = "out")), safe = FALSE)
  outNeighbours <- outNeighbours[outNeighbours != removePointID]
  if(length(outNeighbours)>0 && length(inNeighbours)>0){
    inWeight <- get_step_weights(tempFlow, inNeighbours, rep(removePoint, length(inNeighbours)))
    outWeight <- get_step_weights(tempFlow, rep(removePoint, length(outNeighbours)), outNeighbours)
    srcPointList <- unlist(lapply(inNeighbours, function(x) rep(x, length(outNeighbours))))
    dstPointList <- rep(outNeighbours, length(inNeighbours))
    weightList <-  sapply(inWeight, function(x) {sapply(outWeight, function(a,b) a+b, x)})
    tempFlow <- add_steps(tempFlow, srcPointList, dstPointList, weightList, safe = safe)
  }
  tempFlow <- delete_points(tempFlow, removePoint, safe = safe)
  return(tempFlow)
}

#' Is a function that takes a 'tempflow'-object and a vector of point-names (or point-ids)
#' and restricts the given flow to the sub-flow induced by the vector of points.
#' That is, the underlying 'igraph'-object will be restricted to a graph containing only the vertices
#' corresponding to the specified points.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param inpPointList A vector containing point-names (or point-ids).
#' @param safe If TRUE, it will be ensured that all the specified points exist in the 'tempflow'-object and
#' that all relevant 'tempflow'-conditions are uphold.
#' @return A new 'tempflow'-object, obtained by restricting the underlying 'igraph'-object
#' to the vertices corresponding to the points specified in the "inpPointList"-vector.
# @example induced_flow(tempFlow, c("t5", "t6"))
induce_flow.tempflow <- function(tempFlow, inpPointList, safe = TRUE){
  inpPointIDList <- get_point_ids(tempFlow, inpPointList, safe)
  return(tempflow(igraph::induced_subgraph(G(tempFlow), inpPointIDList), safe=safe))
}

#' Is a function that takes a 'tempflow'-object and a vector of start-points in time and a vector of end-points in time.
#' Given those, the cross-product of "startPointList" and "endPointList" will be computed, from there any point that lies
#' between the points of any tuple will be included in the new 'tempflow'-object.
#' Given those, a new flow will be returned that contains all points (including start point and end point).
#'
#'
#' @param tempFlow A 'tempflow'-object.
#' @param startPointList A vector containing point-names (or point-ids) representing the names of the start-points of the new 'tempflow'-object.
#' @param endPointList A vector containing point-names (or point-ids) representing the names of the end-points of the new 'tempflow'-object.
#' @param safe If TRUE, it will be ensured that all the specified points exist in the 'tempflow'-object and
#' that all relevant 'tempflow'-conditions are uphold.
#' @return A new 'tempflow'-object, reduced to the points in time between the "startPoint" and the "endPoint".
# @example slice_flow(tempFlow, "t5", "t6")
slice_flow.tempflow <- function(tempFlow, startPointList, endPointList,safe = TRUE){
  startPointIDList <- get_point_ids(tempFlow, startPointList, safe)
  endPointIDList <- get_point_ids(tempFlow, endPointList, safe)
  pointList <- sapply(startPointIDList, function(src) sapply(endPointIDList, function(endPointID,startPointID) {
    if (startPointID == endPointID) {
      return(c(startPointID))
      # if (check_has_loop(tempFlow, startPointID, safe=FALSE)) {return(c(startPointID))}
      # else {return(c())}
    }
    L <- unname(unlist(igraph::all_simple_paths(G(tempFlow), startPointID, endPointID)))
    return(L)
  }, src))
  return(induce_flow(tempFlow, unique(unlist(pointList)), safe))
}



#' Is a function that computes the temporal distance between two points in time with respect to a given 'tempflow'-object.
#' Moreover, it allows for the choice, whether weights should be considered in the computation or not.
#' The distance is based on the shortest path, that is if no shortest path can be found the distance will be infinite.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param startPoint A point-name (or point-id) representing the name of the start-point of the shortest path computation.
#' @param endPoint A point-name (or point-id) representing the name of the end-point of the shortest path computation.
#' @param considerWeights If TRUE weights will be considered in the shortest path computation, otherwise the distance will be given by
#' the number of steps between "startPoint" and endPoint"
#' @param safe If TRUE, it will be ensured that both start- and end-point exist in the 'tempflow'-object.
#' @return The length or size of the shortest path. If no such path exists, it returns "Inf".
# @example compute_tempdistance(tempFlow, "t5", "t6")
compute_tempdistance.tempflow <- function(tempFlow, startPoint, endPoint, considerWeights = TRUE, safe = TRUE) {
  startPoint <- get_point_id(tempFlow, startPoint, safe)
  endPoint <- get_point_id(tempFlow, endPoint, safe)
  if (startPoint == endPoint) {
    if (check_has_loop(tempFlow, startPoint) && considerWeights) {
      return(get_step_weights(tempFlow, startPoint, endPoint, safe = FALSE))}
    else {return(0)}
  }
  if (considerWeights) {
    p <- suppressWarnings(igraph::shortest_paths(G(tempFlow), startPoint, endPoint))$vpath[[1]]
    rVal <- sum(tS(tempFlow, path=p)$weight)
  } else {
    rVal <- length(suppressWarnings(igraph::shortest_paths(G(tempFlow), startPoint, endPoint, weights = NA))$vpath[[1]])-1
  }
  if (rVal <= 0) {return(Inf)}
  else {return(rVal)}
}




