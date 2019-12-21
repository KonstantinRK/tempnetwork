#' Is a function that takes a 'tempflow'-object and two point-names (or point-ids) and
#' tests whether one point ("endPoint") can be reached from the other ("startPoint").
#' A point can not reach itself, without the existence of a loop.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param startPoint The point-name (or point-id) of the start-point.
#' @param endPoint  The point-name (or point-id) of the end-point.
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object.
#' @return Is TRUE, if there exists a path starting from "startPoint" and ending at "endPoint", else FALSE will be returned.
# @example reachable(tempFlow, "t1", "t3")
reachable.tempflow <- function(tempFlow, startPoint, endPoint, safe = TRUE){
  startPointID <- get_point_id(tempFlow, startPoint, safe)
  endPointID <- get_point_id(tempFlow, endPoint, safe)
  if(startPointID == endPointID && check_has_loop(tempFlow, startPointID)) return(TRUE)
  return (length(suppressWarnings(igraph::shortest_paths(G(tempFlow), startPointID, endPointID))$vpath[[1]]) >1)
}

#' Is a function that takes a 'tempflow'-object and two point-names (or point-ids) and
#' tests whether there exists an either a path from "inpPoint1" to "inpPoint2" or a path from "inpPoint2" to "inpPoint1".
#' A point is not comparable to itself, without the existence of a loop.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param inpPoint1 The point-name (or point-id).
#' @param inpPoint2  The point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object.
#' @return Is TRUE, if there exists an either a path from "inpPoint1" to "inpPoint2" or a path from "inpPoint2" to "inpPoint1".
comparable.tempflow <- function(tempFlow, inpPoint1, inpPoint2, safe = TRUE){
  return (reachable(tempFlow, inpPoint1, inpPoint2) || reachable(tempFlow, inpPoint2, inpPoint1))
}

#' Is a function that takes a 'tempflow'-object and two point-names (or point-ids) and
#' tests whether "inpPoint1" is strictly smaller than "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object.).
#'
#' @param tempFlow A 'tempflow'-object.
#' @param inpPoint1 A point-name (or point-id).
#' @param inpPoint2 A point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object.
#' @return Is TRUE, if "inpPoint1" is strictly smaller than "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object).
# @example smaller(tempFlow, "t1", "t3")
smaller.tempflow <- function(tempFlow, inpPoint1, inpPoint2, safe = TRUE){
  inpPoint1 <- get_point_id(tempFlow, inpPoint1, safe)
  inpPoint2 <- get_point_id(tempFlow, inpPoint2, safe)
  if (inpPoint1 == inpPoint2) return(FALSE)
  return(reachable(tempFlow, inpPoint1, inpPoint2, safe=FALSE))
}

#' Is a function that takes a 'tempflow'-object and two point-names (or point-ids) and
#' tests whether "inpPoint1" is strictly greater than "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object).
#'
#' @param tempFlow A 'tempflow'-object.
#' @param inpPoint1 A point-name (or point-id).
#' @param inpPoint2 A point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object.
#' @return Is TRUE, if "inpPoint1" is strictly greater than "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object).
# @example greater(tempFlow, "t3", "t1")
greater.tempflow <- function(tempFlow, inpPoint1, inpPoint2, safe = TRUE){
  inpPoint1 <- get_point_id(tempFlow, inpPoint1, safe)
  inpPoint2 <- get_point_id(tempFlow, inpPoint2, safe)
  if (inpPoint1 == inpPoint2) return(FALSE)
  return(reachable(tempFlow, inpPoint2, inpPoint1, safe=FALSE))
}

#' Is a function that takes a 'tempflow'-object and two point-names (or point-ids) and
#' tests whether "inpPoint1" is smaler than or equal to "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object).
#'
#' @param tempFlow A 'tempflow'-object.
#' @param inpPoint1 A point-name (or point-id).
#' @param inpPoint2 A point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object.
#' @return Is TRUE, if "inpPoint1" is strictly greater than "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object).
# @example smaller_eq(tempFlow, "t1", "t1")
smaller_eq.tempflow <- function(tempFlow, inpPoint1, inpPoint2, safe = TRUE){
  inpPoint1 <- get_point_id(tempFlow, inpPoint1, safe)
  inpPoint2 <- get_point_id(tempFlow, inpPoint2, safe)
  if (inpPoint1 == inpPoint2) return(TRUE)
  return(reachable(tempFlow, inpPoint1, inpPoint2, safe=FALSE))
}

#' Is a function that takes a 'tempflow'-object and two point-names (or point-ids) and
#' tests whether "inpPoint1" is greater than or equal to "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object).
#'
#' @param tempFlow A 'tempflow'-object.
#' @param inpPoint1 A point-name (or point-id).
#' @param inpPoint2 A point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object.
#' @return Is TRUE, if "inpPoint1" is strictly greater than "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object).
# @example greater_eq(tempFlow, "t2", "t1")
greater_eq.tempflow <- function(tempFlow, inpPoint1, inpPoint2, safe = TRUE){
  inpPoint1 <- get_point_id(tempFlow, inpPoint1, safe)
  inpPoint2 <- get_point_id(tempFlow, inpPoint2, safe)
  if (inpPoint1 == inpPoint2) return(TRUE)
  return(reachable(tempFlow, inpPoint2, inpPoint1, safe=FALSE))
}

#' Is a function that takes a 'tempflow'-object and three points and tests whether "checkPoint" is strictly between "startPoint" and end"Point,
#' given the order implied by the 'tempflow'-object represented by the 'tempflow'-object.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param startPoint  A point-name (or point-id).
#' @param endPoint A point-name (or point-id).
#' @param checkPoint A point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object.
#' @return Is TRUE if "checkPoint" is strictly between "startPoint" and "endPoint", else FALSE will be returned.
# @example between(tempFlow, "t1", "t3", "t2")
between.tempflow <- function(tempFlow, startPoint, endPoint, checkPoint, safe = TRUE){
  startPointID <- get_point_id(tempFlow, startPoint, safe)
  endPointID <- get_point_id(tempFlow, endPoint, safe)
  checkPointID <- get_point_id(tempFlow, checkPoint)
  if (startPointID == endPointID) return(FALSE)
  return(smaller(tempFlow, startPointID, checkPoint, safe=FALSE) && smaller(tempFlow, checkPoint, endPointID, safe=FALSE))
}


#' Is a function that checks whether the 'tempflow'-object, between two points is globally homogeneous.
#' That is, whether every path between the two points in time has the same size (or length).
#'
#' @param tempFlow A 'tempflow'-object.
#' @param srcPoint The point-name (or point-id) of the start-point of the computation.
#' @param trgPoint The point-name (or point-id) of the end-point of the computation.
#' @param considerWeights If TRUE weights will be considered in the computation of the shortest paths,
#' otherwise the distance will be equal to the number of steps.
#' @param checkForLoops If FALSE, loops will be ignored in the computation. That is, only paths without loops will be considered.
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object.
#' @return A truth value indicating whether the flow between given two points is globally homogeneous.
is_branch_globally_homogeneous.tempflow <- function(tempFlow, startPoint, endPoint, considerWeights = TRUE, considerLoops = TRUE, safe = TRUE){
  startPointID <- get_point_id(tempFlow, startPoint, safe)
  endPointID <- get_point_id(tempFlow, endPoint, safe)
  allPaths <- igraph::all_simple_paths(G(tempFlow), startPointID, endPointID)
  if (length(allPaths) == 0) {return(TRUE)}
  if(considerLoops) {
    checkLoopPointList <- unique(unlist(allPaths))
    checkLoopPointList <- checkLoopPointList[checkLoopPointList != endPointID]
    loopPoints <- checkLoopPointList[sapply(checkLoopPointList , function(x) check_has_loop(tempFlow,x,safe = FALSE))]
    if(!considerWeights && length(loopPoints)>0) { return(FALSE) }
    if(considerWeights && length(loopPoints)>0 && sum(tS(tempFlow)[get_step_ids(tempFlow, loopPoints, loopPoints)]$weight) > 0) {return(FALSE)}
  }
  if (considerWeights) {
    pathSize <- sapply(allPaths, function(p) sum(get_step_weights(tempFlow, p[1:length(p)-1], p[2:length(p)], safe=FALSE)))
  } else { pathSize <- sapply(allPaths, length) }
  if (length(unique(pathSize)) < 2) return(TRUE)
  return(FALSE)
}

#' Is a function that checks whether the 'tempflow'-object is globally homogeneous.
#' That is, whether every path between any two points in time has the same size (or length).
#'
#' @param tempFlow A 'tempflow'-object.
#' @param considerWeights If TRUE weights will be considered in the computation of the shortest paths,
#' otherwise the distance will be equal to the number of steps.
#' @param checkForLoops If FALSE, loops will be ignored in the computation. That is, only paths without loops will be considered.
#' @return A truth value indicating whether the flow is globally homogeneous.
is_globally_homogeneous.tempflow <- function(tempFlow, considerWeights = TRUE, considerLoops = TRUE){
  inVertexNames <- tP(tempFlow)[igraph::degree(G(tempFlow), mode = "in", loops = considerLoops) > 1]$name
  if (length(inVertexNames) == 0) {return(TRUE)}
  outVertexNames <- tP(tempFlow)[igraph::degree(G(tempFlow), mode = "out", loops = considerLoops) > 1]$name
  if (length(outVertexNames) == 0) {return(TRUE)}
  truthValueList <- sapply(outVertexNames, function(srcPoint) {
                                     sapply(inVertexNames, function(trgPoint) {
                                       is_branch_globally_homogeneous(tempFlow, srcPoint, trgPoint, considerWeights, considerLoops, safe = FALSE)})
                            })
  return(all(sapply(truthValueList, unlist)))
}

#' Is a function that checks whether the 'tempflow'-object between two points is locally homogeneous.
#' That is, whether every step (excluding loops) has the same weight.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param startPoint  A point-name (or point-id).
#' @param endPoint A point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object.
#' @return  A truth value indicating whether the flow between the given two points is locally homogeneous.
# @example is_locally_homogeneous(tempFlow)
is_branch_locally_homogeneous.tempflow <- function(tempFlow, startPoint, endPoint, safe = TRUE){
  tempFlow <- slice_flow(tempFlow, startPoint, endPoint, safe = safe)
  M <- unique(unlist(igraph::edge_attr(igraph::simplify(G(tempFlow)), "weight")))
  if (length(M)<=1) return(TRUE)
  return(FALSE)
}


#' Is a function that checks whether the 'tempflow'-object is locally homogeneous.
#' That is, whether every step (excluding loops) has the same weight.
#'
#' @param tempFlow A 'tempflow'-object.
#' @return A truth value indicating whether the flow is locally homogeneous.
# @example is_locally_homogeneous(tempFlow)
is_locally_homogeneous.tempflow <- function(tempFlow){
  M <- unique(unlist(igraph::edge_attr(igraph::simplify(G(tempFlow)), "weight")))
  if (length(M)<=1) return(TRUE)
  return(FALSE)
}

