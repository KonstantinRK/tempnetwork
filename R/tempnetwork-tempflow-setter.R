#' Given a vector containing the current point-names (or point-ids) and a vector containing strings,
#' this function changes the names of the specified points in the 'tempflow'-object of the given 'tempnetwork'-object to the strings in the 'nameList'-vector.
#' Moreover, the corresponding names of the equivalence relation will be changed as well.

#' @param tempNetwork A 'tempnetwork'-object.
#' @param pointList A vector containing the point-names (or point-ids) of the points which names ought to be changed.
#' @param nameList A vector containing strings that ought to become the new names of the specified points.
#' @param safe If TRUE, it will be ensured that the specified point-names (or point-ids) are present in the 'tempflow'-object of the given 'tempnetwork'-object;
#' the 'pointList'-vector and 'nameList'-vector are of the same length;
#' that point-names remain unique;
#' that point-names remain strings.
#' @return A 'tempnetwork'-object, with a 'tempflow'-object where the point-names of the points specified in the 'pointList'-vector are
#' assigned the names given by the 'nameList'-vector; with a equivalence relation where the point-names of the points specified in the 'pointList'-vector are
#' assigned the names given by the 'nameList'-vector.
set_point_names.tempnetwork <- function(tempNetwork, pointList = tP(tempNetwork), nameList = NULL, safe = TRUE) {
  newTempFlow <- set_point_names(tF(tempNetwork), pointList, nameList, safe)
  newGraphList <- gL(tempNetwork)
  names(newGraphList)[which(names(newGraphList) %in%  tP(tempNetwork)$name)] <-  tP(newTempFlow)$name
  newEquivRel <- eR(tempNetwork)
  if (!is.null(newEquivRel)) {
    names <- names(eR(tempNetwork))
    times <- tP(newTempFlow)
    newEquivRel <- setNames(lapply(names, function(x) {setNames(as.list(unname(eR(tempNetwork)[[x]])), times)}), names)
  }
  return(set_basic_properties(tempNetwork, newTempFlow, newGraphList, newEquivRel, safe))
}

#' Given a vector containing the current step-ids and a vector containing numeric values (excluding NA, NaN and NULL),
#' this function sets the weights of the specified steps  in the 'tempflow'-object (of the given 'tempnetwork'-object) to the values given by the "weightList"-vector.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param stepIDList A vector containing the step-ids of the steps which weights ought to be changed.
#' @param weightList Is a vector containing numeric values (excluding NA, NaN and NULL) representing the step-weights of the given steps
#' If left NULL, every newly introduced loop will be assigned the value 0, and every other new edge will be assigned the value 1.
#' Otherwise, it must be either a scalar (i.e. length 1) or a vector with the same length as the "stepIDList"-vector.
#' @param safe If TRUE, it will be ensured that the specified step-ids exist;
#' that the "weightList"-vector' is either of length 1 or has the same length as the "stepIDList"-vector;
#' that the weights of the resulting 'tempflow'-object are non-negative, numerical values.
#' @return A 'tempnetwork'-object, with a 'tempflow'-object where the step-weights of the steps specified in the "stepIDList"-vector are
#' assigned the weights given by the "weightList"-vector.
set_step_weights_from_id.tempnetwork <- function(tempNetwork, stepIDList = NULL, weightList = NULL, safe = TRUE) {
  return(set_tempFlow(tempNetwork, set_step_weights_from_id(tF(tempNetwork),stepIDList,weightList,safe=safe),safe=safe))
}

#' Given a two vectors containing the point-names (or point-ids) representing the start- and end-points of edges
#' and a vector containing numeric values (excluding NA, NaN and NULL),
#' this function sets the weights of the specified steps to the values given by the "weightList"-vector.
#' If either "srcPointList" or "dstPointList" is NULL, alls steps will be considered.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param srcPointList The vector containing the names (or ids) representing the start-points of the desired edges.
#' @param dstPointList The vector containing the names (or ids) representing the end-points of the desired edges.
#' @param weightList Is a vector containing numeric values (excluding NA, NaN and NULL) representing the step-weights of the given steps.
#' If left NULL, every newly introduced loop will be assigned the value 0, and every other new edge will be assigned the value 1.
#' Otherwise, it must be either a scalar (i.e. length 1) or a vector with the same length as the "srcPointList"- or "dstPointList"-vector.
#' @param safe If TRUE, it will be ensured that the specified point-names (or point-ids) are present in the 'tempflow'-object (of the given 'tempnetwork'-object);
#' that the specified steps exist;
#' the "srcPointList"-vector, the "dstPointList"-vector are of the same length;
#' that the "weightList"-vector is either of length 1 or has the same length as the "srcPointList"-vector or the "dstPointList"-vector;
#' that the weights of the resulting 'tempflow'-object are non-negative, numerical values.
#' @return A 'tempnetwork'-object, with a 'tempflow'-object where the step-weights of the steps specified by the "srcPointList"- and "dstPointList"-vector are
#' assigned the weights given by the "weightList"-vector.
set_step_weights.tempnetwork <- function(tempNetwork, srcPointList = NULL, dstPointList = NULL, weightList = NULL, safe = TRUE) {
  return(set_tempFlow(tempNetwork, set_step_weights(tF(tempNetwork),srcPointList,dstPointList,weightList,safe=safe),safe=safe))
}





