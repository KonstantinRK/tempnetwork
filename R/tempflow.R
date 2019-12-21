#' Creates flow of time. Two major methods of addressing points within the 'tempflow'-object, are either by name or by id.
#' Names have to be string, meaning that if addressed by name it must be passed as string.
#' Similarly, if addressed by id, the value passed must be an integer.
#'
#'
#' @param G A directed acyclic 'igraph'-object.
#' @param setDefaultValues If TRUE, any invalid weight or name assignment will be replaced by its corresponding default assignments.
#' \itemize{
#'   \item Under the default weight assignment, the weight of a loop-edge is 0 and of a non-loop-edge is 1.
#'   \item Under the default name assignment, the name of a vertex is its current vertex-id (as assigned within the igraph package) as a string.
#' }
#' @param safe If TRUE, it will be tested, whether inpGraph
#' \itemize{
#'   \item is an 'igraph'-object;
#'   \item is a directed and acyclic;
#'   \item contains no duplicate edges;
#'   \item has unique vertex names (of type string);
#'   \item whether the edge attribute "weight" takes on non-negative, numerical values for each edge in the graph.
#' }
#' @return A flow of time object.
tempflow <- function(inpGraph, setDefaultValues = FALSE, safe = TRUE){
  tempFlow <- structure(list("graph" = inpGraph), class = "tempflow")
  if(safe){check_graph_for_tempflow(tempFlow)}
  if (is.null(tP(tempFlow)$name) || (setDefaultValues && !check_names_for_tempflow(tempFlow, throwError=FALSE))) {
    tempFlow <- set_point_names(tempFlow, safe = safe)
  }
  if (length(tS(tempFlow)) > 0 && is.null(tS(tempFlow)$weight) ||
      (setDefaultValues && !check_weights_for_tempflow(tempFlow, throwError=FALSE))){
    tempFlow <- set_step_weights_from_id(tempFlow, safe = safe)
  }
  if(safe){
    check_weights_for_tempflow(tempFlow)
    check_names_for_tempflow(tempFlow)
  }
  return(tempFlow)
}

