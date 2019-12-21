#' Is a function that takes a 'tempnetwork'-object and two point-names (or point-ids) and
#' tests whether one point ("endPoint") can be reached from the other ("startPoint") in the 'tempflow'-object of the given 'tempnetwork'-object.
#' A point can not reach itself, without the existence of a loop.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param startPoint The point-name (or point-id) of the start-point.
#' @param endPoint  The point-name (or point-id) of the end-point.
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return Is TRUE, if there exists a path in 'tempflow'-object of the given 'tempnetwork'-object starting from "startPoint" and ending at "endPoint", else FALSE will be returned.
# @example reachable(tempNetwork, "t1", "t3")
reachable.tempnetwork <- function(tempNetwork, startPoint, endPoint, safe = TRUE){
  return(reachable(tF(tempNetwork), startPoint, endPoint, safe = safe))
}

#' Is a function that takes a 'tempnetwork'-object and two point-names (or point-ids) and
#' tests whether there exists an either a path from "inpPoint1" to "inpPoint2" or a path from "inpPoint2" to "inpPoint1" in 'tempflow'-object of the given 'tempnetwork'-object.
#' A point is not comparable to itself, without the existence of a loop.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param inpPoint1 The point-name (or point-id).
#' @param inpPoint2  The point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return Is TRUE, if there exists an either a path from "inpPoint1" to "inpPoint2" or a path from "inpPoint2" to "inpPoint1" in 'tempflow'-object of the given 'tempnetwork'-object.
comparable.tempnetwork <- function(tempNetwork, inpPoint1, inpPoint2, safe = TRUE){
  return(comparable(tF(tempNetwork), inpPoint1, inpPoint2, safe = safe))
}

#' Is a function that takes a 'tempnetwork'-object and two point-names (or point-ids) and
#' tests whether "inpPoint1" is strictly smaller than "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object of the given 'tempnetwork'-object).
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param inpPoint1 A point-name (or point-id).
#' @param inpPoint2 A point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object..
#' @return Is TRUE, if "inpPoint1" is strictly smaller than "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object of the given 'tempnetwork'-object).
# @example smaller(tempNetwork, "t1", "t3")
smaller.tempnetwork <- function(tempNetwork, inpPoint1, inpPoint2, safe = TRUE){
  return(smaller(tF(tempNetwork), inpPoint1, inpPoint2, safe = safe))
}

#' Is a function that takes a 'tempnetwork'-object and two point-names (or point-ids) and
#' tests whether "inpPoint1" is strictly greater than "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object of the given 'tempnetwork'-object).
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param inpPoint1 A point-name (or point-id).
#' @param inpPoint2 A point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return Is TRUE, if "inpPoint1" is strictly greater than "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object of the given 'tempnetwork'-object).
# @example greater(tempNetwork, "t3", "t1")
greater.tempnetwork <- function(tempNetwork, inpPoint1, inpPoint2, safe = TRUE){
  return(greater(tF(tempNetwork), inpPoint1, inpPoint2, safe = safe))
}

#' Is a function that takes a 'tempnetwork'-object and two point-names (or point-ids) and
#' tests whether "inpPoint1" is smaler than or equal to "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object of the given 'tempnetwork'-object).
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param inpPoint1 A point-name (or point-id).
#' @param inpPoint2 A point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object  of the given 'tempnetwork'-object..
#' @return Is TRUE, if "inpPoint1" is strictly greater than "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object of the given 'tempnetwork'-object).
# @example smaller_eq(tempNetwork, "t1", "t1")
smaller_eq.tempnetwork <- function(tempNetwork, inpPoint1, inpPoint2, safe = TRUE){
  return(smaller_eq(tF(tempNetwork), inpPoint1, inpPoint2, safe = safe))
}

#' Is a function that takes a 'tempnetwork'-object and two point-names (or point-ids) and
#' tests whether "inpPoint1" is greater than or equal to "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object of the given 'tempnetwork'-object).
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param inpPoint1 A point-name (or point-id).
#' @param inpPoint2 A point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return Is TRUE, if "inpPoint1" is strictly greater than "inpPoint2" (given the order induced by the
#' structure of the 'tempflow'-object of the given 'tempnetwork'-object).
# @example greater_eq(tempNetwork, "t2", "t1")
greater_eq.tempnetwork <- function(tempNetwork, inpPoint1, inpPoint2, safe = TRUE){
  return(greater_eq(tF(tempNetwork), inpPoint1, inpPoint2, safe = safe))
}

#' Is a function that takes a 'tempnetwork'-object and three points and tests whether "checkPoint" is strictly between "startPoint" and end"Point,
#' given the order induced by the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param startPoint  A point-name (or point-id).
#' @param endPoint A point-name (or point-id).
#' @param checkPoint A point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return Is TRUE if "checkPoint" is strictly between "startPoint" and "endPoint", else FALSE will be returned.
# @example between(tempNetwork, "t1", "t3", "t2")
between.tempnetwork <- function(tempNetwork, startPoint, endPoint, checkPoint, safe = TRUE){
  return(between(tF(tempNetwork), startPoint, endPoint, checkPoint, safe = safe))
}


#' Is a function that checks whether the 'tempflow'-object of the given 'tempnetwork'-object is globally homogeneous in between the two given points.
#' That is, whether every path between the two points in time has the same size (or length).
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param srcPoint The point-name (or point-id) of the start-point of the computation.
#' @param trgPoint The point-name (or point-id) of the end-point of the computation.
#' @param considerWeights If TRUE weights will be considered in the computation of the shortest paths,
#' otherwise the distance will be equal to the number of steps.
#' @param checkForLoops If FALSE, loops will be ignored in the computation. That is, only paths without loops will be considered.
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return A truth value indicating whether the undelying flow is globally homogeneous inbetween the two given points.
is_branch_globally_homogeneous.tempnetwork <- function(tempNetwork, startPoint, endPoint, considerWeights = TRUE, considerLoops = TRUE, safe = TRUE){
  return(is_branch_globally_homogeneous(tF(tempNetwork), startPoint, endPoint, considerWeights, considerLoops, safe = safe))
}

#' Is a function that checks whether the 'tempflow'-object of the given 'tempnetwork'-object is globally homogeneous.
#' That is, whether every path between any two points in time has the same size (or length).
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param considerWeights If TRUE weights will be considered in the computation of the shortest paths,
#' otherwise the distance will be equal to the number of steps.
#' @param checkForLoops If FALSE, loops will be ignored in the computation. That is, only paths without loops will be considered.
#' @return A truth value indicating whether the underlying flow is globally homogeneous.
is_globally_homogeneous.tempnetwork <- function(tempNetwork, considerWeights = TRUE, considerLoops = TRUE){
  return(is_globally_homogeneous(tF(tempNetwork), considerWeights, considerLoops))
}

#' Is a function that checks whether the 'tempflow'-object of the given 'tempnetwork'-object is locally homogeneous inbetween two given points .
#' That is, whether every step (excluding loops) has the same weight.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param startPoint  A point-name (or point-id).
#' @param endPoint A point-name (or point-id).
#' @param safe If TRUE, it will be tested, whether the given point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return  A truth value indicating whether the underlying flow between the given two points is locally homogeneous.
# @example is_locally_homogeneous(tempNetwork)
is_branch_locally_homogeneous.tempnetwork <- function(tempNetwork, startPoint, endPoint, safe = TRUE){
  return(is_branch_locally_homogeneous(tF(tempNetwork), startPoint, endPoint, safe = safe))
}


#' Is a function that checks whether the 'tempflow'-object of the given 'tempnetwork'-object is locally homogeneous.
#' That is, whether every step (excluding loops) has the same weight.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return A truth value indicating whether the underlying flow is locally homogeneous.
# @example is_locally_homogeneous(tempNetwork)
is_locally_homogeneous.tempnetwork <- function(tempNetwork){
  return(is_locally_homogeneous(tF(tempNetwork)))
}

