#' Is a function that takes a 'tempnetwork'-object and a vector of strings,
#' and adds new points, with the specified point-names, to the 'tempflow'-object of the given 'tempnetwork'-object.
#' Moreover, the graphs corresponding to the newly added points will be embedded into the "graphList" of the 'tempnetwork'-object and
#' the equivalence relation will be exteded by by the equivalence relation given through the parameter "equivRel".
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param addPointList A vector containing the strings that represent the names of the points that ought to be added.
#' @param graphList A named list containing 'igraph'-objects. The names of this list must correspond with the names of the newly added points.
#' Moreover, all graphs must have the same number of vertices.
#' @param equivRel A named list of named lists,
#' where the outer-level names must be identical to the outer-level names of the already existing equivalence-relation;
#' where the inner-level names must be identical with the names of the newly added points;
#' where the values must be identical to the vertex-names of the corresponding newly added graph.
#'
#' Moreover, if the existing equivalence class is NULL and the parameter "equivRel" is NULL, then it must be the case that
#' the names of the vertices must be identical in each graph (including the already existing graphs).
#' Otherwise, the given equivalence relation will be merged with the already existing one.
#' @param attrList A vector to specify other vertex attributes. If left NULL, no attributes (other than name) will be assigned to the newly introduced points in time.
#' Otherwise, this list has to be structured as required by the function igraph::add.vertices.
#' @param safe If TRUE, it will be ensured that point-names remain unique; that point-names remain strings.
#' Additionally, the usual tempflow and tempnetwork condition are checked.
#' @return A new 'tempnetwork'-object, containing a new 'tempflow'-object constructed by adding points with the specified names to the 'tempflow'-object of the given 'tempnetwork'-object;
#' containing a new "graphList" constructed by extending the existing "graphList" by the provided list of graphs;
#' containing a new "equivRel" constructed by extending the existing "equivRel" by the provided equivalence relation fragment.
add_points.tempnetwork <- function(tempNetwork, newPointList, graphList, equivRel = NULL, attrList = NULL, safe = TRUE) {
  if(length(newPointList)>0&&length(graphList)>0){
    newTempFlow <- add_points(tF(tempNetwork), newPointList, attrList, safe)
    newGraphList <- append(gL(tempNetwork), graphList)
    newEquivRel <- eR(tempNetwork)
    if(is.null(newEquivRel) && !is.null(equivRel)) {
      newEquivRel <- eR(tempNetwork, TRUE)
    }
    if(!is.null(newEquivRel) && is.null(equivRel)) {
      equivRel <- compute_equivrelation(igV(graphList[[1]])$name, newPointList)
    }
    if(!is.null(newEquivRel) && !is.null(equivRel)) {
      for(i in names(equivRel)){
        newEquivRel[[i]] <- append(newEquivRel[[i]], equivRel[[i]])
      }
    }
    return(set_basic_properties(tempNetwork, tempFlow = newTempFlow, graphList = newGraphList, equivRel = newEquivRel, safe))
  } else {

    return(tempNetwork)
  }

}

#' Is a function that takes a 'tempnetwork'-object and a vector of point-names (or point-ids),
#' and removes the specified points from the 'tempflow'-object of the given 'tempnetwork'-object.
#' Additionally, the corresponding entries in the "graphList" and in the "equivRel" of the given 'tempnetwork'-object
#' will be removed as well.
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param deletePointList A vector containing the point-names (or point-ids) of the points that ought to be removed.
#' @param attrList A vector to specify other vertex attributes. If left NULL, no attributes (other than name) will be assigned to the newly introduced points in time.
#' Otherwise, this list has to be structured as required by the function igraph::add.vertices.
#' @param safe If TRUE, it will be ensured that the specified point-names (or point-ids) are present in the given 'tempflow'-object.
#' Additionally, the usual tempflow and tempnetwork condition are checked.
#' @return A new 'tempnetwork'-object, containing a new 'tempflow'-object constructed by removing the specified points from the 'tempflow'-object of the given 'tempnetwork'-object;
#'  containing a new "graphList" constructed by removing the specified entries from the existing "graphList" of the given 'tempnetwork'-object;
#'  containing a new "equivRel" constructed by removing the specified entries from the existing "equivRel" of the given 'tempnetwork'-object.
delete_points.tempnetwork <- function(tempNetwork, deletePointList, safe = TRUE) {
  return(adjust_to_reduced_tempflow(tempNetwork, delete_points(tF(tempNetwork), deletePointList, safe)))
}


#' Is a function that takes a 'tempnetwork'-object and two vectors of point-names (or point-ids)
#' and adds new steps, in between the points specified by the "srcPointList"-vector and
#' the corresponding points specified by the "dstPointList"-vector, to the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param srcPointList A vector containing the point-names (or point-ids) of the points from which the new edges should start.
#' @param dstPointList A vector containing the point-names (or point-ids) of the points at which the new edges should end.
#' @param weightList Is a vector containing numeric values (excluding NA, NaN and NULL) representing the step-weights of the newly introduced steps
#' If left NULL, every newly introduced loop will be assigned the value 0, and every other new edge will be assigned the value 1.
#' Otherwise, it must be either a scalar (i.e. length 1) or a vector with the same length as "srcPointList" and "dstPointList".
#' @param attrList Is a vector to specify other edge atrributes. If left NULL, no attributes (other than weight) will be assigned to the newly introduced steps in time.
#' Otherwise, this list has to be structured as required by the function igraph::add.edges.
#' @param safe If TRUE, it will be ensured that the specified point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object;
#' the "srcPointList"-vector, the "dstPointList"-vector are of the same length;
#' that the 'weightList'-vector is either of length 1 or has the same length as the "srcPointList"-vector or the "dstPointList"-vector;
#' that the weights of the resulting 'tempflow'-object are non-negative, numerical values.
#' Additionally, the usual tempflow and tempnetwork condition are checked.
#' @return  A new 'tempnetwork'-object, containing a new 'tempflow'-object constructed by adding the specified edges to the 'tempflow'-object of the given 'tempnetwork'-object.
# @example add_steps(tempNetwork, c("t1", "t3", "t4"), c("t2", "t5", "t5"), c(4,10,1))  # adds the edges ("t1", "t2"), ("t3, "t5"), ("t4", "t5") to the underlying graph, and assigns the weight 4 to the first edge, the weight 10 to the second and the weight 1 to the last.
add_steps.tempnetwork <- function(tempNetwork, srcPointList, dstPointList, weightList = NULL, attrList = NULL, safe = TRUE) {
  newTempFlow <- add_steps(tF(tempNetwork), srcPointList, dstPointList, weightList, attrList, safe)
  return(set_basic_properties(tempNetwork, tempFlow = newTempFlow, safe=safe))
}


#' Given a 'tempnetwork'-object and a vector containing the current step-ids,
#' this function removes the specified steps from the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param stepIDList A vector containing the step-ids of the steps which ought to be removed.
#' @param safe If TRUE, it will be ensured that the specified step-ids exists.
#' Additionally, the usual tempflow and tempnetwork condition are checked.
#' @return A new 'tempnetwork'-object, containing a new 'tempflow'-object constructed by removing the specified edges from the 'tempflow'-object of the given 'tempnetwork'-object.
delete_steps_from_id.tempnetwork <- function(tempNetwork, stepIDList, safe = TRUE) {
  newTempFlow <- delete_steps_from_id(tF(tempNetwork), stepIDList, safe)
  return(set_basic_properties(tempNetwork, tempFlow = newTempFlow, safe=safe))
}


#' Is a function that takes a 'tempnetwork'-object and two vectors of point-names (or point-ids)
#' and removes the steps from the 'tempflow'-object of the given 'tempnetwork'-object.
#' The steps are characterised by the points in the "srcPointList"-vector and
#' the corresponding points in the "dstPointList"-vector,
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param srcPointList A vector containing the point-names (or point-ids) of the start-points of the edges that ought to be removed.
#' @param dstPointList A vector containing the point-names (or point-ids) of the end-points of the edges that ought to be removed.
#' @param safe If TRUE, it will be ensured that the specified point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object;
#' that the specified steps exist;
#' the "srcPointList"-vector, the "dstPointList"-vector are of the same length.
#' Additionally, the usual tempflow and tempnetwork condition are checked.
#' @return  A new 'tempnetwork'-object, containing a new 'tempflow'-object constructed by removing the specified edges from the 'tempflow'-object of the given 'tempnetwork'-object.
delete_steps.tempnetwork <- function(tempNetwork, srcPointList, dstPointList, safe = TRUE) {
  newTempFlow <- delete_steps(tF(tempNetwork), srcPointList, dstPointList, safe)
  return(set_basic_properties(tempNetwork, tempFlow = newTempFlow, safe=safe))
}


#' Is a function that takes a 'tempnetwork'-object; a string representing the name of the point to be added;
#' a two vectors containing the point-names (or point-ids) of the points which ought to be predecessors and successors of the newly added point.
#' Given this input the function, returns a new 'tempnetwork'-object containing a new 'tempflow'-object, where the newly introduced point is embedded in between the specified
#' predecessor and successor points.
#'
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param newPoint A point-name (or point-id) of the point to be inserted.
#' @param predPointList A vector containing the point-names (or point-ids) of the points serving as predecessors of the new point.
#' @param sucPointList A vector containing the point-names (or point-ids) of the points serving as successors of the new point.
#' @param weightList A vector specifying the step-weights of newly introduced edges.
#' If left NULL, every newly introduced loop will be assigned the value 0, and every other new edge will be assigned the value 1.
#' Otherwise, it must be either a scalar (i.e. length 1) or a vector with the same length as the sum of the length of the "predPointList" and the "sucPointList".
#' @param graphList A named list containing 'igraph'-objects. The names of this list must correspond with the names of the newly added points.
#' Moreover, all graphs must have the same number of vertices.
#' @param equivRel A named list of named lists,
#' where the outer-level names must be identical to the outer-level names of the already existing equivalence relation;
#' where the inner-level names must be identical with the names of the newly added points;
#' where the values must be identical to the vertex-names of the corresponding newly added graph.
#' Moreover, if the existing equivalence class is NULL and the parameter "equivRel" is NULL, then it must be the case that
#' the names of the vertices must be identical in each graph (including the already existing graphs).
#' Otherwise, the given equivalence relation will be merged with the already existing one.
#' @param pointAttrList Is a vector to specify other point attributes. If left NULL, no attributes (other than name) will be assigned to the newly introduced point in time.
#' Otherwise, this list has to be structured as required by the function igraph::add.vertices().
#' @param stepAttrList Is a vector to specify other step attributes. If left NULL, no attributes (other than weight) will be assigned to the newly introduced steps in time.
#' Otherwise, this list has to be structured as required by the function igraph::add.edges().
#' @param safe If TRUE, it will be ensured that the specified point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object;
#' that point names remain unique; that point-names remain strings.
#' that the 'weightList'-vector is either of length 1 or has the same length as the sum of the length of the "predPointList"-vector and the "sucPointList"-vector.
#' that the weights of the resulting 'tempflow'-object are non-negative, numerical values;
#' Additionally, the usual tempflow  and tempnetwork condition are checked.
#' @return  A new 'tempnetwork'-object, containing a new 'tempflow'-object constructed by removing the specified edges from the 'tempflow'-object of the given 'tempnetwork'-object;
#' containing a new "graphList" constructed by extending the existing "graphList" by the provided list of graphs;
#' containing a new "equivRel" constructed by extending the existing "equivRel" by the provided equivalence relation fragment.
insert_point.tempnetwork <- function(tempNetwork, newPoint, predPointList, sucPointList, graphList, equivRel = NULL, weightList = NULL, pointAttrList = NULL, stepAttrList = NULL, removeEdges = TRUE, safe = TRUE) {
  if(length(newPoint)>0&&length(graphList)>0){
    newTempFlow <- insert_point(tF(tempNetwork), newPoint, predPointList, sucPointList, weightList, pointAttrList, stepAttrList, removeEdges, safe)
    if (class(graphList)=="igraph") {
      graphList <- list(graphList)
      names(graphList) <- c(newPoint)
    }
    newGraphList <- append(gL(tempNetwork), graphList)
    newEquivRel <- eR(tempNetwork)
    if(is.null(newEquivRel) && !is.null(equivRel)) {
      newEquivRel <- eR(tempNetwork, TRUE)
    }
    if(!is.null(newEquivRel) && is.null(equivRel)) {
      equivRel <- compute_equivrelation(igV(graphList[[1]])$name, newPoint)
    }
    if(!is.null(newEquivRel) && !is.null(equivRel)) {
      for(i in names(equivRel)){
        newEquivRel[[i]] <- append(newEquivRel[[i]], equivRel[[i]])
      }
    }
    return(set_basic_properties(tempNetwork, tempFlow = newTempFlow, graphList = newGraphList, equivRel = newEquivRel, safe ))
  } else {
    return(tempNetwork)
  }
}


#' This function takes a 'tempnetwork'-object and a point-name (or point-id), which will be removed from the 'tempflow'-object of the given 'tempnetwork'-object.
#' If the point has only a successor or only a predecessor, then only the incident edges will be removed. Otherwise,
#' all successors and all predecessors will be connected in a manner such that distances, i.e. weights are preserved.
#' Additionally, the corresponding entry in the "graphList" and in the "equivRel" of the given 'tempnetwork'-object
#' will be removed as well.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param removePoint A point-name (or point-id) representing the point in time to be removed.
#' @param safe If TRUE, it will be ensured, that the given point is present in the specified 'tempflow'-object.
#' Additionally, the usual tempflow and tempnetwork condition are checked.
#' @return A new 'tempnetwork'-object, containing a new 'tempflow'-object constructed by removing the specified point and (if necessary) reconnecting the 'tempflow'-object of the given 'tempnetwork'-object;
#'  containing a new "graphList" constructed by removing the graph with the name of the specified point from the existing "graphList" of the given 'tempnetwork'-object;
#'  containing a new "equivRel" constructed by removing the entries corresponding to the vertices of the removed graph from the existing "equivRel" of the given 'tempnetwork'-object.
# @example remove_point(tempNetwork, "t5")
remove_point.tempnetwork <- function(tempNetwork, removePoint, safe = TRUE) {
  return(adjust_to_reduced_tempflow(tempNetwork, remove_point(tF(tempNetwork), removePoint, safe)))
}

#' Is a function that takes a 'tempnetwork'-object and a vector of point-names (or point-ids)
#' and restricts the underlying flow to the sub-flow induced by the vector of points.
#' That is, the 'igraph'-object underlying the 'tempflow'-object will be restricted to a graph containing only the vertices
#' corresponding to the specified points.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param inpPointList A vector containing point-names (or point-ids).
#' @param safe If TRUE, it will be ensured that all the specified points exist in the 'tempflow'-object of the given 'tempnetwork'-object and
#' that all relevant 'tempflow'-conditions and 'tempnetwork'-conditions are uphold.
#' @return A new 'tempnetwork'-object, containing a new 'tempflow'-object obtained by restricting the underlying 'igraph'-object
#' to the vertices corresponding to the points specified in the "inpPointList"-vector;
#'  containing a new "graphList" constructed by restricting the existing "graphList" to those entries corresponding to the points in the  new 'tempflow'-object;
#'  containing a new "equivRel" constructed by restricting the existing "equivRel" to those entries corresponding to the points in the  new 'tempflow'-object.
# @example induced_flow(tempNetwork, c("t5", "t6"))
induce_flow.tempnetwork <- function(tempNetwork, inpPointList, safe = TRUE){
  return(adjust_to_reduced_tempflow(tempNetwork, induce_flow(tF(tempNetwork), inpPointList, safe)))
}

#' Is a function that takes a 'tempnetwork'-object and a vector of start-points in time and a vector of end-points in time.
#' Given those, the cross-product of "startPointList" and "endPointList" will be computed, from there any point that lies
#' between the points of any tuple will be included in the new 'tempflow'-object contained in the resulting 'tempnetwork'-object.
#' Given those, a new flow will be returned that contains all points (including start point and end point).
#'
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param startPointList A vector containing point-names (or point-ids) representing the names of the start-points of the new 'tempflow'-object.
#' @param endPointList A vector containing point-names (or point-ids) representing the names of the end-points of the new 'tempflow'-object.
#' @param safe If TRUE, it will be ensured that all the specified points exist in the 'tempflow'-object and
#' that all relevant 'tempflow' and 'tempnetwork'-conditions are uphold.
#' @return A new 'tempnetwork'-object, containing a new 'tempflow'-object reduced to the points in time between the "startPoint" and the "endPoint".
#'  containing a new "graphList" constructed by restricting the existing "graphList" to those entries corresponding to the points in the  new 'tempflow'-object;
#'  containing a new "equivRel" constructed by restricting the existing "equivRel" to those entries corresponding to the points in the  new 'tempflow'-object.
# @example slice_flow(tempNetwork, "t5", "t6")
slice_flow.tempnetwork <- function(tempNetwork, startPointList, endPointList,safe = TRUE){
  return(adjust_to_reduced_tempflow(tempNetwork, slice_flow(tF(tempNetwork), startPointList, endPointList, safe)))
}



#' Is a function that computes the temporal distance between two points in time with respect to the 'tempflow'-object of the given 'tempnetwork'-object.
#' Moreover, it allows for the choice, whether weights should be considered in the computation or not.
#' The distance is based on the shortest path, that is if no shortest path can be found the distance will be infinite.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param startPoint A point-name (or point-id) representing the name of the start-point of the shortest path computation.
#' @param endPoint A point-name (or point-id) representing the name of the end-point of the shortest path computation.
#' @param considerWeights If TRUE weights will be considered in the shortest path computation, otherwise the distance will be given by
#' the number of steps between "startPoint" and endPoint"
#' @param safe If TRUE, it will be ensured that both start- and end-point exist in the 'tempflow'-object.
#' @return The length or size of the shortest path. If no such path exists, it returns "Inf".
# @example compute_tempdistance(tempNetwork, "t5", "t6")
compute_tempdistance.tempnetwork <- function(tempNetwork, startPoint, endPoint, considerWeights = TRUE, safe = TRUE) {
  return(compute_tempdistance(tF(tempNetwork), startPoint, endPoint, considerWeights, safe))
}


