#' A function that checks, if the object assigned to the 'tempflow'-field "graph" is an 'igraph'-object.
#'
#' @param tempFlow A 'tempflow'-object.
#' @return The boolean value TRUE, if the object assigned to the 'tempflow'-field "graph" is an 'igraph'-object.
check_is_igraph_object.tempflow <- function(tempFlow) {
  return(class(G(tempFlow)) == "igraph")
}

#' A function that checks, if the 'igraph'-object assigned to the 'tempflow'-field "graph" is directed and acyclic.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param ignoreLoops If TRUE, the cycles created by loops will be ignored.
#' @return The boolean value TRUE, if the 'igraph'-object assigned to the 'tempflow'-field "graph" is directed and acyclic.
check_is_dag.tempflow <- function(tempFlow, ignoreLoops = TRUE) {
  inpGraph <- G(tempFlow)
  if (ignoreLoops) {inpGraph <- igraph::simplify(inpGraph, remove.multiple = FALSE, remove.loops = TRUE)}
  return(igraph::is_dag(inpGraph))
}

#' A function that checks, if the 'igraph'-object assigned to the 'tempflow'-field "graph" is a simple.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param ignoreLoops If TRUE, the graph will be considered simple, even if it contains loops. That is, only duplicate edges will be detected.
#' @return The boolean value TRUE, if the 'igraph'-object assigned to the 'tempflow'-field "graph" is a simple.
check_is_simple.tempflow <- function(tempFlow, ignoreLoops = TRUE) {
  if (ignoreLoops) {
    return(igraph::is_simple(igraph::simplify(G(tempFlow), remove.multiple = FALSE, remove.loops = TRUE)) &&
             !any(igraph::which_loop(G(tempFlow)) & igraph::which_multiple(G(tempFlow))))
  } else {return(igraph::is_simple(G(tempFlow)))}
}

#' A function that checks, if there are two points in 'tempflow'-object, that are assigned the same name.
#'
#' @param tempFlow A 'tempflow'-object.
#' @return returns TRUE, if every point in the tempflow object has a unique 'name'-attribute.
check_are_names_unique.tempflow <- function(tempFlow) {
  if (is.null(tP(tempFlow)$name)) {return(TRUE)}
  else {return(length(tP(tempFlow)$name)==length(unique(tP(tempFlow)$name)))}
}

#' A function that checks, if the value of the 'name'-attribute of each point in the 'tempflow'-object is of type 'string'.
#'
#' @param tempFlow A 'tempflow'-object.
#' @return The boolean value TRUE, if the value of the 'name'-attribute of each point in the 'tempflow'-object is of type 'string'
check_are_names_strings.tempflow <- function(tempFlow) {
  if (is.null(tP(tempFlow)$name)) {return(TRUE)}
  else {return(!is.numeric(tP(tempFlow)$name))}
}

#' A function that checks, if the value of the 'weight'-attribute of each point is a numerical value.
#'
#' @param tempFlow A 'tempflow'-object.
#' @return The boolean value TRUE, if every point in the 'tempflow'-object has a numeric 'weight'-attribute (excluding NA, NaN and NULL values).
check_are_weights_numeric.tempflow <- function(tempFlow) {
  if (length(tS(tempFlow)) <= 0||is.null(tS(tempFlow)$weight)) {return(TRUE)}
  else {return(is.numeric(tS(tempFlow)$weight) &&
                 !any(is.na(tS(tempFlow)$weight)) &&
                 !any(is.nan(tS(tempFlow)$weight))  &&
                 !any(is.null(tS(tempFlow)$weight)))}
}

#' A function that checks, if the value of the 'weight'-attribute of each point has a non-negative value.
#'
#' @param tempFlow A 'tempflow'-object.
#' @return The boolean value TRUE, if every point in the 'tempflow'-object has a non-negative 'weight'-attribute.
check_are_weights_nonnegative.tempflow <- function(tempFlow) {
  if (length(tS(tempFlow)) <= 0 || is.null(tS(tempFlow)$weight)) {return(TRUE)}
  else {return(length(tS(tempFlow)$weight[tS(tempFlow)$weight < 0]) <= 0)}
}

#' A function that checks, if the object assigned to the tempflow-field 'graph',
#' \itemize{
#'   \item is an 'igraph'-object;
#'   \item is a directed and acyclic;
#'   \item contains no duplicate edges.
#' }
#'
#' @param tempFlow A 'tempflow'-object.
#' @param throwError If TRUE, violating the criteria above will result in the throwing of an error. Otherwise, FALSE will be returned.
#' @return The boolean value TRUE, if the criteria above are satisfied. Otherwise, FALSE or an exception will be returned.
check_graph_for_tempflow.tempflow <- function(tempFlow, throwError = TRUE) {
  if (!check_is_igraph_object(tempFlow)) {if(throwError) {error_not_igraph()} else{return(FALSE)}}
  if (!check_is_dag(tempFlow)) {if(throwError) {error_not_dag()} else{return(FALSE)}}
  if (!check_is_simple(tempFlow)) {if(throwError) {error_not_simple()} else{return(FALSE)}}
  return(TRUE)
}

#' A function that checks, if the 'igraph'-object assigned to the tempflow-field 'graph', has unique vertex names (of type string).
#'
#' @param tempFlow A 'tempflow'-object.
#' @param throwError If TRUE, violating the criteria above will result in the throwing of an error. Otherwise, FALSE will be returned.
#' @return The boolean value TRUE, if the criteria above are satisfied. Otherwise, FALSE or an exception will be returned.
check_names_for_tempflow.tempflow <- function(tempFlow, throwError = TRUE) {
  if (!check_are_names_strings(tempFlow)) {if(throwError) {error_names_not_strings()} else{return(FALSE)}}
  if (!check_are_names_unique(tempFlow)) {if(throwError) {error_names_not_unique()} else{return(FALSE)}}
  return(TRUE)
}

#' A function that checks, if the object assigned to the tempflow-field 'graph', has non-negative, numerical weights.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param throwError If TRUE, violating the criteria above will result in the throwing of an error. Otherwise, FALSE will be returned.
#' @return The boolean value TRUE, if the criteria above are satisfied. Otherwise, FALSE or an exception will be returned.
check_weights_for_tempflow.tempflow <- function(tempFlow, throwError = TRUE) {
  if (!check_are_weights_numeric(tempFlow))  {if(throwError) {error_weights_not_numeric()} else{return(FALSE)}}
  if (!check_are_weights_nonnegative(tempFlow)) {if(throwError) {error_weights_not_nonnegative()} else{return(FALSE)}}
  return(TRUE)
}

#' A function that checks, if the object assigned to the tempflow-field 'graph',
#' \itemize{
#'   \item is an 'igraph'-object;
#'   \item is a directed and acyclic;
#'   \item contains no duplicate edges;
#'   \item has unique vertex names (of type string);
#'   \item whether the edge attribute "weight" takes on non-negative, numerical values for each edge in the graph.
#' }
#'
#' @param tempFlow A 'tempflow'-object.
#' @param throwError If TRUE, violating the criteria above will result in the throwing of an error. Otherwise, FALSE will be returned.
#' @return The boolean value TRUE, if the criteria above are satisfied. Otherwise, FALSE or an exception will be returned.
check_graph_for_tempflow_completely.tempflow <- function(tempFlow, throwError = TRUE) {
  check_graph_for_tempflow(tempFlow, throwError)
  check_names_for_tempflow(tempFlow, throwError)
  check_weights_for_tempflow(tempFlow, throwError)
  return(TRUE)
}


#' A function that checks, if the given point-id corresponds to a vertex-id in the underlying graph.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param pointID An integer value.
#' @return The boolean value TRUE, if the given integer corresponds to a vertex-id in the underlying 'igraph'-object.
check_point_id.tempflow <- function(tempFlow, pointID) {
  return(length(tP(tempFlow)) >= pointID && 0 <= pointID)
}

#' A function that checks, if each point-id in the given vector corresponds to a vertex-id in the underlying graph.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param pointID A vector of integer values.
#' @return The boolean value TRUE, if each integer in the given vector corresponds to a vertex-id in the underlying 'igraph'-object.
check_point_ids.tempflow <- function(tempFlow, pointIDList) {
  return(all(sapply(pointIDList, function(x) check_point_id(tempFlow, x))))
}

#' A function that checks, if the given step-id corresponds to an edge-id in the underlying graph.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param pointID An integer value.
#' @return The boolean value TRUE, if the given integer corresponds to an edge-id in the underlying 'igraph'-object.
check_step_id.tempflow <- function(tempFlow, stepID) {
  return(length(tS(tempFlow)) >= stepID)
}

#' A function that checks, if each step-id in the given vector corresponds to an edge-id in the underlying graph.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param pointID A vector of integer values.
#' @return The boolean value TRUE, if each integer in the given vector corresponds to an edge-id in the underlying 'igraph'-object.
check_step_ids.tempflow <- function(tempFlow, stepIDList) {
  return(all(sapply(stepIDList, function(x) check_step_id(tempFlow, x))))
}


#' A function that checks, if the given point-name occurs as a name-attribute of some vertex in the underlying graph.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param pointID A string value.
#' @return The boolean value TRUE, if the given string occurs as a name-attribute of some vertex in the underlying 'igraph'-object.
check_point_name.tempflow <- function(tempFlow, pointName) {
  if (is.null(tP(tempFlow)$name)) {return(FALSE)}
  return(pointName %in% tP(tempFlow)$name)
}

#' A function that checks, if the given point-name occurs as a name-attribute of some vertex in the underlying graph.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param pointID A string value.
#' @return The boolean value TRUE, if the given string occurs as a name-attribute of some vertex in the underlying 'igraph'-object.
check_point_names.tempflow <- function(tempFlow, pointNameList) {
  if (is.null(tP(tempFlow)$name)) {return(FALSE)}
  return(length(intersect(pointNameList, tP(tempFlow)$name))==length(pointNameList))
}

#' A function that checks, if the given point (specified by either name or id) has a loop.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param inpPoint An integer or string value.
#' @param safe if TRUE, the existence of the point will be ensured.
#' @return The boolean value TRUE, if the given point (specified by either name or id) has a loop.
check_has_loop.tempflow <- function(tempFlow, inpPoint, safe = TRUE) {
  inpPointID <- get_point_id(tempFlow, inpPoint, safe)
  if (igraph::get.edge.ids(G(tempFlow), c(inpPointID, inpPointID)) == 0) {return(FALSE)}
  else {return(TRUE)}
}





