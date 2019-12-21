#' Given a vector containing the current point-names (or point-ids) and a vector containing strings,
#' this function changes the names of the specified points to the strings in the 'nameList'-vector.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param pointList A vector containing the point-names (or point-ids) of the points which names ought to be changed.
#' @param nameList A vector containing strings that ought to become the new names of the specified points.
#' @param safe If TRUE, it will be ensured that the specified point-names (or point-ids) are present in the given 'tempflow'-object;
#' the 'pointList'-vector and 'nameList'-vector are of the same length;
#' that point-names remain unique;
#' that point-names remain strings.
#' @return A 'tempflow'-object, where the point-names of the points specified in the 'pointList'-vector are
#' assigned the names given by the 'nameList'-vector.
set_point_names.tempflow <- function(tempFlow, pointList = tP(tempFlow), nameList = NULL, safe = TRUE) {
  pointIDList <- get_point_ids(tempFlow, pointList, safe)
  if (is.null(nameList)) {nameList <- paste(tP(tempFlow)[pointIDList])}
  if (safe) {if (!check_vector_equal_length(pointIDList, nameList)) {error_vector_not_equal_length()}}
  tempFlow$graph <- igraph::set.vertex.attribute(G(tempFlow), "name", pointIDList, nameList)
  if (safe) {check_names_for_tempflow(tempFlow)}
  return(tempFlow)
}

#' Given a vector containing the current step-ids and a vector containing numeric values (excluding NA, NaN and NULL),
#' this function sets the weights of the specified steps to the values given by the "weightList"-vector.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param stepIDList A vector containing the step-ids of the steps which weights ought to be changed.
#' @param weightList Is a vector containing numeric values (excluding NA, NaN and NULL) representing the step-weights of the given steps
#' If left NULL, every newly introduced loop will be assigned the value 0, and every other new edge will be assigned the value 1.
#' Otherwise, it must be either a scalar (i.e. length 1) or a vector with the same length as the "stepIDList"-vector.
#' @param safe If TRUE, it will be ensured that the specified step-ids exist;
#' that the "weightList"-vector' is either of length 1 or has the same length as the "stepIDList"-vector;
#' that the weights of the resulting 'tempflow'-object are non-negative, numerical values.
#' @return A 'tempflow'-object, where the step-weights of the steps specified in the "stepIDList"-vector are
#' assigned the weights given by the "weightList"-vector.
set_step_weights_from_id.tempflow <- function(tempFlow, stepIDList = NULL, weightList = NULL, safe = TRUE) {
  if (is.null(stepIDList)) {stepIDList <- get_step_ids(tempFlow)}
  else { if (safe && !check_step_ids(tempFlow, stepIDList)) {error_ids_not_in_object()}}

  if (is.null(weightList)) {
    weightList <- sapply(stepIDList, function(edge_id) if(igraph::is.loop(G(tempFlow), edge_id)) {return(0)} else {return(1)})
  }
  if (safe && !check_vector_equal_length_or_one(weightList, stepIDList)) {
    error_vector_not_equal_length_and_not_one()
  }
  tempFlow$graph <- igraph::set.edge.attribute(G(tempFlow), "weight", stepIDList, weightList)
  if (safe) {check_weights_for_tempflow(tempFlow)}
  return(tempFlow)
}

#' Given a two vectors containing the point-names (or point-ids) representing the start- and end-points of edges
#' and a vector containing numeric values (excluding NA, NaN and NULL),
#' this function sets the weights of the specified steps to the values given by the "weightList"-vector.
#' If either "srcPointList" or "dstPointList" is NULL, alls steps will be considered.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param srcPointList The vector containing the names (or ids) representing the start-points of the desired edges.
#' @param dstPointList The vector containing the names (or ids) representing the end-points of the desired edges.
#' @param weightList Is a vector containing numeric values (excluding NA, NaN and NULL) representing the step-weights of the given steps.
#' If left NULL, every newly introduced loop will be assigned the value 0, and every other new edge will be assigned the value 1.
#' Otherwise, it must be either a scalar (i.e. length 1) or a vector with the same length as the "srcPointList"- or "dstPointList"-vector.
#' @param safe If TRUE, it will be ensured that the specified point-names (or point-ids) are present in the given 'tempflow'-object;
#' that the specified steps exist;
#' the "srcPointList"-vector, the "dstPointList"-vector are of the same length;
#' that the "weightList"-vector is either of length 1 or has the same lenght as the "srcPointList"-vector or the "dstPointList"-vector;
#' that the weights of the resulting 'tempflow'-object are non-negative, numerical values.
#' @return A 'tempflow'-object, where the step-weights of the steps specified by the "srcPointList"- and "dstPointList"-vector are
#' assigned the weights given by the "weightList"-vector.
set_step_weights.tempflow <- function(tempFlow, srcPointList = NULL, dstPointList = NULL, weightList = NULL, safe = TRUE) {
  # if(safe && (is.null(srcPointList) || is.null(dstPointList))) { stepIDList <- NULL }
  # else {stepIDList <- get_step_ids(tempFlow, srcPointList, dstPointList, safe)}
  stepIDList <- get_step_ids(tempFlow, srcPointList, dstPointList, safe)
  if (safe && !is.null(weightList)) { if(!check_vector_equal_length_or_one(weightList, stepIDList)) {error_vector_not_equal_lengths_and_not_one()}}
  tempFlow <- set_step_weights_from_id(tempFlow, stepIDList, weightList, safe = FALSE)
  if (safe) {check_weights_for_tempflow(tempFlow)}
  return(tempFlow)
}
