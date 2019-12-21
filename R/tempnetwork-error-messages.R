error_message_vertex_not_exists <- function(name = NULL) {
  if (any(is.null(c(name)))) {"A given vertex does not exist."}
  else {sprintf("Error: %s",name)}
}

# error_message_edge_not_exists <- function(name = NULL) {
#   if (any(is.null(c(name)))) {"A given edge does not exist."}
#   else {sprintf("Error: %s",name)}
# }

error_message_tvertex_not_exists <- function(name = NULL) {
  if (any(is.null(c(name)))) {"A given equivalence-class, i.e. tVertex, does not exist."}
  else {sprintf("Error: %s",name)}
}

error_message_point_not_exists <- function(name = NULL) {
  if (any(is.null(c(name)))) {"A given point does not exist."}
  else {sprintf("Error: %s",name)}
}

error_message_not_tempflow <- function(name = NULL) {
  if (any(is.null(c(name)))) {"A 'tempflow'-object is required."}
  else {sprintf("Parameter '%s' has to be an 'tempflow'-object", name)}
}

error_message_graphlist_empty <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The given graph-list is empty."}
  else {sprintf("Error: %s",name)}
}

error_message_graph_has_no_name <- function(name = NULL) {
  if (any(is.null(c(name)))) {"At least one graph in the given graph-list has no name attribute."}
  else {sprintf("Error: %s",name)}
}

error_message_tempflow_empty <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The given 'tempflow'-object is empty."}
  else {sprintf("Error: %s",name)}
}

error_message_graphlist_index_is_not_unique <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The indices in the graph-list are not unique."}
  else {sprintf("Error: %s", name)}
}

error_message_equivclass_index_is_not_unique <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The indices in an equivalence class are not unique."}
  else {sprintf("Error: %s", name)}
}

error_message_equivclass_not_disjoined <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The given equivalence-classes are not disjoined."}
  else {sprintf("Error: %s", name)}
}

error_message_graphlist_vertex_not_unique <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The vertex names in some graph of the graph-list are not unique."}
  else {sprintf("Error: %s", name)}
}


error_message_equivrel_index_is_not_unique <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The indices of the equivalence relation, are not unique."}
  else {sprintf("Error: %s", name)}
}

error_message_graphlist_not_equal_length <- function(name = NULL) {
  if (any(is.null(c(name)))) {"There are at least two graphs in the graph-list that have vertex sets of differing size."}
  else {sprintf("Error: %s", name)}
}

error_message_not_graphlist_vertex_equality <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The set of vertex-names is not identical across all graphs in the given graph-list."}
  else {sprintf("Error: %s", name)}
}



error_message_not_tempflow_graphlist_index_equality <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The indices of the graph-list, do not correspond with the names of the points in the 'tempflow'-object."}
  else {sprintf("Error: %s", name)}
}


error_message_not_tempflow_equivclass_index_equality <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The indices of the vertices in at least one equivalence class, do not correspond with the names of the points in the 'tempflow'-object."}
  else {sprintf("Error: %s", name)}
}

error_message_not_graphlist_equivclass_index_equality <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The indices of the vertices in at least one equivalence class, do not correspond with the indices of the graph-list"}
  else {sprintf("Error: %s", name)}
}


error_message_equivalenceclass_is_not_exhaustive <- function(name = NULL) {
  if (any(is.null(c(name)))) {"There exists at least one vertex in at least one equivalence class, that does not occure in the corresponding graph from the given graph-list."}
  else {sprintf("Error: %s", name)}
}

error_message_equivrel_not_equal_length_to_vertices <- function(name = NULL) {
  if (any(is.null(c(name)))) {"There is at least one graph in the graph-list, that has a vertex set unequal to the size of the equivalence relation"}
  else {sprintf("Error: %s", name)}
}

error_message_not_multiple_of_tempflow <- function(name = NULL) {
  if (any(is.null(c(name)))) {"Vector must be a multiple of the number of points in the 'tempflow'-object."}
  else {sprintf("Error: %s",name)}
}



error_vertex_not_exists <- function(name = NULL) {stop(error_message_vertex_not_exists(name))}
# error_edge_not_exists <- function(name = NULL) {stop(error_message_edge_not_exists(name))}
error_tvertex_not_exists <- function(name = NULL) {stop(error_message_tvertex_not_exists(name))}
error_point_not_exists <- function(name = NULL) {stop(error_message_point_not_exists(name))}


error_not_tempflow <- function(name = NULL) {stop(error_message_not_tempflow(name))}
error_graphlist_empty <- function(name = NULL) {stop(error_message_graphlist_empty(name))}
error_tempflow_empty <- function(name = NULL) {stop(error_message_tempflow_empty(name))}
error_graph_has_no_name <- function(name = NULL) {stop(error_message_graph_has_no_name(name))}


error_graphlist_index_is_not_unique <- function(name = NULL) {stop(error_message_graphlist_index_is_not_unique(name))}
error_equivclass_index_is_not_unique <- function(name = NULL) {stop(error_message_equivclass_index_is_not_unique(name))}
error_equivclass_not_disjoined <- function(name = NULL) {stop(error_message_equivclass_not_disjoined(name))}
error_equivrel_index_is_not_unique <- function(name = NULL) {stop(error_message_equivrel_index_is_not_unique(name))}
error_graphlist_vertex_not_unique <- function(name = NULL) {stop(error_message_graphlist_vertex_not_unique(name))}


error_graphlist_not_equal_length <- function(name = NULL) {stop(error_message_graphlist_not_equal_length(name))}
error_not_graphlist_vertex_equality <- function(name = NULL) {stop(error_message_not_graphlist_vertex_equality(name))}

error_not_tempflow_graphlist_index_equality <- function(name = NULL) {stop(error_message_not_tempflow_graphlist_index_equality(name))}
error_not_tempflow_equivclass_index_equality <- function(name = NULL) {stop(error_message_not_tempflow_equivclass_index_equality(name))}
error_not_graphlist_equivclass_index_equality <- function(name = NULL) {stop(error_message_not_graphlist_equivclass_index_equality(name))}

error_equivalenceclass_is_not_exhaustive <- function(name = NULL) {stop(error_message_equivalenceclass_is_not_exhaustive(name))}
error_equivrel_not_equal_length_to_vertices <- function(name = NULL) {stop(error_message_equivrel_not_equal_length_to_vertices(name))}


error_not_multiple_of_tempflow <- function(name = NULL) {stop(error_message_not_multiple_of_tempflow(name))}





