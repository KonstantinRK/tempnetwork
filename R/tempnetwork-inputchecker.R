#' A function that checks, if the given object is a 'tempflow'-object.
#'
#' @param tempFlow A 'tempflow'-object.
#' @return The boolean value TRUE, if the given object is a 'tempflow'-object
check_tempflow <- function(tempNetwork) {
  if (class(tempFlow) != "tempflow") { error_not_tempflow() }
}

#' A function that checks, if the given 'tempflow'-object contains at least one point.
#'
#' @param tempFlow A 'tempflow'-object.
#' @return The boolean value TRUE, if the given 'tempflow'-object contains at least one point.
check_tempflow_not_empty.tempnetwork <- function(tempNetwork) {
  return(base_check_tempflow_not_empty(tF(tempNetwork)))
}

#' A function that checks, if the given 'tempflow'-object contains at least one point.
#'
#' @param tempFlow A 'tempflow'-object.
#' @return The boolean value TRUE, if the given 'tempflow'-object contains at least one point.
base_check_tempflow_not_empty <- function(tempFlow) {
  if(is.null(tempFlow)){return(FALSE)}
  return(length(tP(tempFlow)) != 0)
}

#' A function that checks, if the graph-list of the given 'tempnetwork'-object contains at least one entry.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE, if the graph-list of the given 'tempnetwork'-object contains at least one entry.
check_graphlist_not_empty.tempnetwork <- function(tempNetwork) {
  return(base_check_graphlist_not_empty(gL(tempNetwork)))
}

#' A function that checks, if the given graph-list contains at least one entry.
#'
#' @param graphList  A named list of 'igraph'-objects.
#' @return The boolean value TRUE, if the given graph-list contains at least one entry.
base_check_graphlist_not_empty <- function(graphList) {
  return(length(graphList) != 0)
}


#' A function that checks,
#' if the 'igraphs'-object in the graph-list of the given 'tempnetwork'-object have the vertex attribute "name".
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE, if the 'igraphs'-object in the graph-list of the given 'tempnetwork'-object have the vertex attribute "name".
check_graphs_have_names.tempnetwork <- function(tempNetwork) {
  if (!is.null(eR(tempNetwork))) {
    return(base_check_graphs_have_names(gL(tempNetwork)))
  }
  return(TRUE)
}

#' A function that checks, if the 'igraphs'-object in the given graph-list have the vertex attribute "name".
#'
#' @param graphList  A named list of 'igraph'-objects.
#' @return The boolean value TRUE, if the 'igraphs'-object in the given graph-list have the vertex attribute "name".
base_check_graphs_have_names <- function(graphList) {
  return(all(sapply(names(graphList), function(x) !is.null(igV(graphList[[x]])$name))))
}

#' A function that checks,
#' if each equivalence-class in the equivalence-relation of the given 'tempnetwork'-object has the same length.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#' if each equivalence-class in the equivalence-relation of the given 'tempnetwork'-object has the same length.
check_equivclass_equal_length.tempnetwork <- function(tempNetwork) {
  return(base_check_equivclass_equal_length(eR(tempNetwork)))
}

#' A function that checks,
#' if each equivalence-class in the given equivalence-relation has the same length.
#'
#' @param equivRel  A named list of named lists.
#' @return The boolean value TRUE,
#' if each equivalence-class in the given equivalence-relation has the same length.
base_check_equivclass_equal_length <- function(equivRel) {
  if(is.null(equivRel)) {return(TRUE)}
  vec <- sapply(equivRel, function(equivClass) {return(length(equivClass))})
  return(min(vec) == max(vec))
}


#' A function that checks,
#' if the vertex set of each 'igraph'-object in the graph-list of the given 'tempnetwork'-object has the same length.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#' if the vertex set of each 'igraph'-object in the graph-list of the given 'tempnetwork'-object has the same length.
check_graphlist_equal_length.tempnetwork <- function(tempNetwork) {
  return(base_check_graphlist_equal_length(gL(tempNetwork)))
}

#' A function that checks,
#' if the vertex set of each 'igraph'-object in the given graph-list has the same length.
#'
#' @param graphList A named list of 'igraph'-objects.
#' @return The boolean value TRUE,
#' if the vertex set of each 'igraph'-object in the given graph-list has the same length.
base_check_graphlist_equal_length <- function(graphList) {
  vec <- sapply(graphList, function(graph) {return(length(igV(graph)))})
  return(min(vec) == max(vec))
}

#' A function that checks,
#' if the number of vertices of each graph in the graph-list of the given 'tempnetwork'-object is identical to
#' the number of equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#' if the number of vertices of each graph in the graph-list of the given 'tempnetwork'-object is identical to
#' the number of equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object.
check_equivrel_equal_length_to_vertices.tempnetwork <- function(tempNetwork) {
  return(base_check_equivrel_equal_length_to_vertices(gL(tempNetwork),eR(tempNetwork)))
}

#' A function that checks,
#' if the number of vertices of each graph in the given graph-list is identical to
#' the number of equivalence-classes in the given equivalence-relation.
#'
#' @param graphList A named list of 'igraph'-objects.
#' @param equivRel A named list of named lists.
#' @return The boolean value TRUE,
#' if the number of vertices of each graph in the given graph-list is identical to
#' the number of equivalence-classes in the given equivalence-relation.
base_check_equivrel_equal_length_to_vertices <- function(graphList, equivRel) {
  return(is.null(equivRel)  || all(sapply(graphList, function(graph) {return(length(igV(graph)) == length(equivRel))})))
}


#' A function that checks,
#' if the number of vertices of each equvialence-class in the equivalence-relation of the given 'tempnetwork'-object is identical to
#' the number of graphs in the graph-list of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#' if the number of vertices of each equvialence-class in the equivalence-relation of the given 'tempnetwork'-object is identical to
#' the number of graphs in the graph-list of the given 'tempnetwork'-object.
check_equivclass_equal_length_to_graphs.tempnetwork <- function(tempNetwork) {
  return(base_check_equivclass_equal_length_to_graphs(gL(tempNetwork),eR(tempNetwork)))
}

#' A function that checks,
#' if the number of vertices of each equvialence-class in the given equivalence-relation is identical to
#' the number of graphs in the given graph-list.
#'
#' @param graphList A named list of 'igraph'-objects.
#' @param equivRel A named list of named lists.
#' @return The boolean value TRUE,
#' if the number of vertices of each equvialence-class in the given equivalence-relation is identical to
#' the number of graphs in the given graph-list.
base_check_equivclass_equal_length_to_graphs <- function(graphList, equivRel) {
  return(is.null(equivRel) || all(sapply(equivRel, function(equivClass) {
    all(sapply(names(equivClass), function(x){ length(igV(graphList[[x]])[name == equivClass[[x]]])>0 }))
  })))
}


#' A function that checks,
#' if each equivalence-class in the equivalence-relation of the given 'tempnetwork'-object has a unique name.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#' if each equivalence-class in the equivalence-relation of the given 'tempnetwork'-object has a unique name.
check_equivrel_index_is_unique.tempnetwork <- function(tempNetwork) {
  return(base_check_equivrel_index_is_unique(names(eR(tempNetwork))))
}

#' A function that checks,
#' if the given names are unique.
#'
#' @param equivRelNameList A vector of strings.
#' @return The boolean value TRUE,
#' if the given names are unique.
base_check_equivrel_index_is_unique <- function(equivRelNameList) {
  return(is.null(equivRelNameList) || length(unique(equivRelNameList)) == length(equivRelNameList))
}


#' A function that checks,
#' if the index set of each equivalence-class in the equivalence-relation of the given 'tempnetwork'-object is unique.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#' if the index set of each equivalence-class in the equivalence-relation of the given 'tempnetwork'-object is unique.
check_equivclass_index_is_unique.tempnetwork <- function(tempNetwork) {
  return(base_check_equivclass_index_is_unique(eR(tempNetwork)))
}

#' A function that checks,
#' if the index set of each equivalence-class in the given equivalence-relation is unique.
#'
#' @param equivRel A named list of named lists.
#' @return The boolean value TRUE,
#' if the index set of each equivalence-class in the given equivalence-relation is unique.
base_check_equivclass_index_is_unique <- function(equivRel) {
  return(is.null(equivRel) || all(sapply(equivRel, function(equivClass)  length(unique(names(equivClass))) == length(names(equivClass)))))
}


#' A function that checks,
#' if the equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object are disjoined for each index (i.e. point).
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#'if the equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object are disjoined for each index (i.e. point).
check_equivclass_disjoined.tempnetwork <- function(tempNetwork) {
  return(base_check_equivclass_disjoined(eR(tempNetwork)))
}

#' A function that checks,
#' if the equivalence-classes in the given equivalence-relation are disjoined for each index (i.e. point).
#'
#' @param equivRel A named list of named lists.
#' @return The boolean value TRUE,
#'if the equivalence-classes in the given equivalence-relation are disjoined for each index (i.e. point).
base_check_equivclass_disjoined <- function(equivRel) {
  return(is.null(equivRel) ||
           all(sapply(names(equivRel[[1]]), function(name) {
             l <- unname(sapply(equivRel, function(equivClass) equivClass[[name]]))
             return(length(l)==length(unique(l)))
           })))
}

#' A function that checks,
#' if the names of the graphs in the graph-list of the given 'tempnetwork'-object are unique.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#'if the names of the graphs in the graph-list of the given 'tempnetwork'-object are unique.
check_graphlist_index_is_unique.tempnetwork <- function(tempNetwork) {
  return(base_check_graphlist_index_is_unique(names(gL(tempNetwork))))
}

#' A function that checks,
#' if the given names are unique.
#'
#' @param graphListNameList A vector of strings.
#' @return The boolean value TRUE,
#' if the given names are unique.
base_check_graphlist_index_is_unique <- function(graphListNameList) {
  return(length(unique(graphListNameList)) == length(graphListNameList))
}

#' A function that checks,
#' if the names of each vertex in each graph of the graph-list of the given 'tempnetwork'-object is unique for its graph.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#' if the names of each vertex in each graph of the graph-list of the given 'tempnetwork'-object is unique for its graph.
check_graphlist_vertex_unique.tempnetwork <- function(tempNetwork) {
  return(base_check_graphlist_vertex_unique(gL(tempNetwork)))
}

#' A function that checks,
#' if the names of each vertex in each graph of the given graph-list is unique for its graph.
#'
#' @param graphList A named list of 'igraph'-objects.
#' @return The boolean value TRUE,
#' if the names of each vertex in each graph of the given graph-list is unique for its graph.
base_check_graphlist_vertex_unique <- function(graphList) {
  return(all(sapply(graphList, function(graph)  length(unique(names(igV(graph)))) == length(names(igV(graph))))))
}

#' A function that checks,
#' if for each entry in the equivalence-class of the equivalence-relation of the given 'tempnetwork'-object,
#'  there exists a vertex with the same name in the corresponding graph from the graph-list of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#' if for each entry in the equivalence-class of the equivalence-relation of the given 'tempnetwork'-object,
#'  there exists a vertex with the same name in the corresponding graph from the graph-list of the given 'tempnetwork'-object.
check_equivalenceclass_is_exhaustive.tempnetwork <- function(tempNetwork) {
  return(base_check_equivalenceclass_is_exhaustive(gL(tempNetwork), eR(tempNetwork)))
}

#' A function that checks,
#' if for each entry in the equivalence-class of the given equivalence-relation,
#' there exists a vertex with the same name in the corresponding graph from the given graph-list.
#'
#' @param graphList A named list of 'igraph'-objects.
#' @param equivRel A named list of named lists.
#' @return The boolean value TRUE,
#' if for each entry in the equivalence-class of the given equivalence-relation,
#' there exists a vertex with the same name in the corresponding graph from the given graph-list.
base_check_equivalenceclass_is_exhaustive <- function(graphList, equivRel) {
  return(is.null(equivRel)  || all(sapply(equivRel, function(equivClass) {
    all(sapply(names(equivClass), function(x){ length(igV(graphList[[x]])[igV(graphList[[x]])$name == equivClass[[x]]])>0 }))
  })))
}

#' A function that checks,
#' if the indices of each equivalence-class from the equivalence-relation of the given 'tempnetwork'-object,
#' are identical to the indices from the graph-list of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#' if the indices of each equivalence-class from the equivalence-relation of the given 'tempnetwork'-object,
#' are identical to the indices from the graph-list of the given 'tempnetwork'-object.
check_graphlist_equivclass_index_equality.tempnetwork <- function(tempNetwork) {
  return(base_check_graphlist_equivclass_index_equality(names(gL(tempNetwork)), eR(tempNetwork)))
}

#' A function that checks,
#' if the indices of each equivalence-class from the given equivalence-relation,
#' are identical to the strings in the given string-vector.
#'
#' @param equivRel A named list of named lists.
#' @param graphListNameList A vector of strings.
#' @return The boolean value TRUE,
#' if the indices of each equivalence-class from the given equivalence-relation,
#' are identical to the strings in the given string-vector.
base_check_graphlist_equivclass_index_equality <- function(graphListNameList, equivRel) {
  return(is.null(equivRel)  || all(sapply(equivRel, function(equivClass) {
    return( length(graphListNameList) == length(equivClass) && setequal(graphListNameList, names(equivClass))) })))
}

#' A function that checks,
#' if the indices of each equivalence-class from the equivalence-relation of the given 'tempnetwork'-object,
#' are identical to names of the points from the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#' if the indices of each equivalence-class from the equivalence-relation of the given 'tempnetwork'-object,
#' are identical to names of the points from the 'tempflow'-object of the given 'tempnetwork'-object.
check_tempflow_equivclass_index_equality.tempnetwork <- function(tempNetwork) {
  return(base_check_tempflow_equivclass_index_equality(names(tP(tempNetwork)), eR(tempNetwork)))
 }

#' A function that checks,
#' if the indices of each equivalence-class from the given equivalence-relation,
#' are identical to the strings in the given string-vector.
#'
#' @param equivRel A named list of named lists.
#' @param tempFlowPointNameList A vector of strings.
#' @return The boolean value TRUE,
#' if the indices of each equivalence-class from the given equivalence-relation,
#' are identical to the strings in the given string-vector.
base_check_tempflow_equivclass_index_equality <- function(tempFlowPointNameList, equivRel) {
  return(is.null(equivRel)  || all(sapply(equivRel, function(equivClass) {
    return( length(tempFlowPointNameList) == length(equivClass) &&  setequal(tempFlowPointNameList, names(equivClass))) })))
}


#' A function that checks,
#' if the names of the graphs in the graph-list of the given 'tempnetwork'-object
#' are identical to names of the points from the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#' if the names of the graphs in the graph-list of the given 'tempnetwork'-object
#' are identical to names of the points from the 'tempflow'-object of the given 'tempnetwork'-object.
check_tempflow_graphlist_index_equality.tempnetwork <- function(tempNetwork) {
  return(base_check_tempflow_graphlist_index_equality(names(tP(tempNetwork)), names(gL(tempNetwork))))
}

#' A function that checks,
#' if the names in one given string-vector
#' are identical to the names in the other given string-vector.
#'
#' @param equivRel A named list of named lists.
#' @param tempFlowPointNameList A vector of strings.
#' @param graphListNameList A vector of strings.
#' @return The boolean value TRUE,
#' if the names in one given string-vector
#' are identical to the names in the other given string-vector.
base_check_tempflow_graphlist_index_equality <- function(tempFlowPointNameList, graphListNameList) {
  return( length(tempFlowPointNameList) == length(graphListNameList) && setequal(tempFlowPointNameList, graphListNameList))
}


#' A function that checks,
#' if the vertex sets of all graphs in the graph-list of the given 'tempnetwork'-object are identical.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The boolean value TRUE,
#' if the vertex sets of all graphs in the graph-list of the given 'tempnetwork'-object are identical.
check_graphlist_vertex_equality.tempnetwork <- function(tempNetwork) {
  return(base_check_graphlist_vertex_equality(gL(tempNetwork)))
}

#' A function that checks,
#' if the vertex sets of all graphs in the givern graph-list are identical.
#'
#' @param graphList A named list of 'igraph'-objects.
#' @return The boolean value TRUE,
#' if the vertex sets of all graphs in the givern graph-list are identical.
base_check_graphlist_vertex_equality <- function(graphList) {
  return(all(sapply(graphList, function(graph)  {
    length(igV(graphList[[1]])$name) == length(igV(graph)$name) &&
      setequal(igV(graphList[[1]])$name, igV(graph)$name)
  })))
}

#' A function that checks,
#' that the names of the graphs in the graph-list of the given 'tempnetwork'-object
#' are identical to names of the points from the 'tempflow'-object of the given 'tempnetwork'-object.
#' and that the indices of each equivalence-class from the equivalence-relation of the given 'tempnetwork'-object,
#' are identical to names of the points from the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param throwError If TRUE the respective errors will be thrown. Otherwise, a truth value will be returned.
#' @return The boolean value TRUE,
#' if the names of the graphs in the graph-list of the given 'tempnetwork'-object
#' are identical to names of the points from the 'tempflow'-object of the given 'tempnetwork'-object.
#' and if the indices of each equivalence-class from the equivalence-relation of the given 'tempnetwork'-object,
#' are identical to names of the points from the 'tempflow'-object of the given 'tempnetwork'-object.
# NOTE: check_tempflow_graphlist_index_equality & check_tempflow_equivclass_index_equality => check_graphlist_equivclass_index_equality
#       check_tempflow_graphlist_index_equality & tempflow_unique_name_condition => check_graphlist_index_is_unique
#       check_tempflow_equivclass_index_equality & tempflow_unique_name_condition => check_equivclass_index_is_unique
#       check_tempflow_equivclass_index_equality => check_equivclass_equal_length
check_tempflow_graphlist_equivrel_correspondence.tempnetwork <- function(tempNetwork, throwError = TRUE) {
  if (!check_tempflow_graphlist_index_equality(tempNetwork)) {if(throwError) {error_not_tempflow_graphlist_index_equality()} else{return(FALSE)}}
  if (!check_tempflow_equivclass_index_equality(tempNetwork)) {if(throwError) {error_not_tempflow_equivclass_index_equality()} else{return(FALSE)}}
  return(TRUE)
}


#' This function checks, if the indecies and entries of the equivalence-relation from the given 'tempnetwork'-object,
#' correspond with the indecies and graphs of the graph-list from the given 'tempnetwork'-object.
#'
#'
#'   If the equivalence-relation of the given 'tempnetwork'-object is NULL,
#' whether the vertex sets of all graphs in the graph-list of the given 'tempnetwork'-object are identical and
#' if "hasTempflowCorrespondence" is FALSE whether the names of the graphs in the graph-list of the given 'tempnetwork'-object are unique.
#' Otherwise, if "hasTempflowCorrespondence" is TRUE it will check
#' if the number of vertices of each graph in the graph-list of the given 'tempnetwork'-object is identical to
#' the number of equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object. Additionally,
#' it will check if for each entry in the equivalence-class of the equivalence-relation of the given 'tempnetwork'-object,
#'  there exists a vertex with the same name in the corresponding graph from the graph-list of the given 'tempnetwork'-object.
#' If "hasTempflowCorrespondence" is FALSE, it will be additionally ensured that the names of the graphs in the graph-list of the given 'tempnetwork'-object are unique and
#' that the indices of each equivalence-class from the equivalence-relation of the given 'tempnetwork'-object,
#' are identical to the indices from the graph-list of the given 'tempnetwork'-object.
#'
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param throwError If TRUE the respective errors will be thrown. Otherwise, a truth value will be returned.
#' @param hasTempflowCorrespondence If TRUE, it will be assumed that the function "check_tempflow_graphlist_equivrel_correspondence" would evaluate to TRUE.
#' @return The boolean value TRUE,
#' if the indecies and entries of the equivalence-relation from the given 'tempnetwork'-object,
#' correspond with the indecies and graphs of the graph-list from the given 'tempnetwork'-object.
# NOTE: check_graphlist_index_is_unique & check_graphlist_equivclass_index_equality => check_equivclass_index_is_unique
#       check_equivrel_equal_length_to_vertices & check_equivalenceclass_is_exhaustive => check_graphlist_equal_length & every vertex is represented in the equivalence class.
check_graphlist_equivrel_correspondence.tempnetwork <- function(tempNetwork, hasTempflowCorrespondence = FALSE, throwError = TRUE) {

  if(is.null(eR(tempNetwork))) {
    if(!check_graphlist_vertex_equality(tempNetwork)) {if(throwError) {error_not_graphlist_vertex_equality()} else{return(FALSE)}}
    if (!hasTempflowCorrespondence) {
      if (!check_graphlist_index_is_unique(tempNetwork)) {if(throwError) {error_graphlist_index_is_not_unique()} else{return(FALSE)}}
    }
  } else {
      if (!hasTempflowCorrespondence) {
        if (!check_graphlist_index_is_unique(tempNetwork)) {if(throwError) {error_graphlist_index_is_not_unique()} else{return(FALSE)}}
        if (!check_graphlist_equivclass_index_equality(tempNetwork)) {if(throwError) {error_not_graphlist_equivclass_index_equality()} else{return(FALSE)}}
      }
      if (!check_equivrel_equal_length_to_vertices(tempNetwork)) {if(throwError) {error_equivrel_not_equal_length_to_vertices()} else{return(FALSE)}}
      if (!check_equivalenceclass_is_exhaustive(tempNetwork)) {if(throwError) {error_equivalenceclass_is_not_exhaustive()} else{return(FALSE)}}
  }

   return(TRUE)
}


#' If the equivalence-relation of the given 'tempnetwork'-object is NULL,
#' this function checks, if the vertex sets of all graphs in the graph-list of the given 'tempnetwork'-object are identical.
#' Otherwise, it checks if the vertex set of each 'igraph'-object in the graph-list of the given 'tempnetwork'-object has the same length.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param throwError If TRUE the respective errors will be thrown. Otherwise, a truth value will be returned.
#' @return
#' If the equivalence-relation of the given 'tempnetwork'-object is NULL,
#' this function returns TRUE, if the vertex sets of all graphs in the graph-list of the given 'tempnetwork'-object are identical.
#' Otherwise, it returns TRUE if the vertex set of each 'igraph'-object in the graph-list of the given 'tempnetwork'-object has the same length.
 # NOTE: check_graphlist_vertex_equality => check_graphlist_equal_length
check_graphlist_vertex_sets.tempnetwork <- function(tempNetwork, throwError = TRUE) {
  if (is.null(eR(tempNetwork))) {
      if(check_graphlist_vertex_equality(tempNetwork)) {if(throwError) {error_not_graphlist_vertex_equality()} else{return(FALSE)}}
  } else {
    if(check_graphlist_equal_length(tempNetwork)) {if(throwError) {error_graphlist_not_equal_length()} else{return(FALSE)}}
  }
  return(TRUE)
}


#' A function that checks,
#' if the 'tempflow'-object of the given 'tempnetwork'-object contains at least one point and
#' the graph-list of the given 'tempnetwork'-object contains at least one entry.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param throwError If TRUE the respective errors will be thrown. Otherwise, a truth value will be returned.
#' @return The boolean value TRUE,
#' if the 'tempflow'-object of the given 'tempnetwork'-object contains at least one point and
#' the graph-list of the given 'tempnetwork'-object contains at least one entry.
check_null_values.tempnetwork <- function(tempNetwork, throwError = TRUE) {
  if (!check_tempflow_empty(tempNetwork)) {if(throwError) {error_graphlist_not_empty()} else{return(FALSE)}}
  if (!check_graphlist_empty(tempNetwork)) {if(throwError) {error_graphlist_not_empty()} else{return(FALSE)}}
  return(TRUE)
}

#' A function that checks, all relevalnt 'tempnetwork'-conditions (see documentation of 'tempntwork' in general)
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param throwError If TRUE the respective errors will be thrown. Otherwise, a truth value will be returned.
#' @return The boolean value TRUE,
#' if all relevalnt 'tempnetwork'-conditions
check_tempnetwork_completely.tempnetwork <- function(tempNetwork, throwError = TRUE) {
  if (!check_tempflow_not_empty(tempNetwork)) {if(throwError) {error_tempflow_empty()} else{return(FALSE)}}
  if (!check_graphlist_not_empty(tempNetwork)) {if(throwError) {error_graphlist_empty()} else{return(FALSE)}}
  check_tempflow_graphlist_equivrel_correspondence(tempNetwork, throwError = throwError)
  check_graphlist_equivrel_correspondence(tempNetwork, throwError = throwError, hasTempflowCorrespondence = TRUE)
  if (!check_equivrel_index_is_unique(tempNetwork)) {if(throwError) {error_equivrel_index_is_not_unique()} else{return(FALSE)}}
  if (!check_equivclass_disjoined(tempNetwork)) {if(throwError) {error_equivclass_not_disjoined()} else{return(FALSE)}}
  if (!check_graphlist_vertex_unique(tempNetwork)) {if(throwError) {error_graphlist_vertex_not_unique()} else{return(FALSE)}}
  if (!check_graphs_have_names(tempNetwork)) {if(throwError) {error_equivrel_index_is_not_unique()} else{return(FALSE)}}
  return(TRUE)
}


#' For each corresponding entry of the given vectors "tVertexNameList","pointNameList"  and "vertexNameListZ", this function checks if there exists a vertex with the name as specified in "vertexNameList"
#' in the graph with the name specified in "tVertexNameList" (from the graph-list of the given 'tempnetwork'-object).
#' If the equivalence-relation of the given 'tempnetwork'-object is not NULL, it will be ensured that
#' the value specified through "tVertexNameList" and "pointNameList" is equal to the value specified in "vertexNameList".
#'
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param tVertexNameList A vector of strings, representing the names of equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object.
#' @param pointNameList A vector of strings, representing the names of graphs in the graph-list of the given 'tempnetwork'-object. It has same length as the vector "tVertexNameList".
#' @param vertexNameList A vector of strings, representing the names of vertices in graphs from the graph-list of the given 'tempnetwork'-object. It has same length as the vector "tVertexNameList".
#' @return The boolean value TRUE,
#' if each vertex specifed in "vertexNameList" can be found in the graphs specified through "pointNameList" and
#' if each vertex specifed in "vertexNameList" can be found as an entry at the index determined through "pointNameList" in the equivalence-class specified through "pointNameList".
check_vertices_exists.tempnetwork <- function(tempNetwork, tVertexNameList, pointNameList, vertexNameList) {
  if (!is.null(eR(tempNetwork))) {
    if(!all(mapply(function(tv,tp,v) {get_vertexname(tempNetwork,tv,tp,safe)==v}, tVertexNameList,pointNameList,vertexNameList))){return(FALSE)}
  }
  if (is.null(eR(tempNetwork))) {if(any(mapply(function(x,y) {x!=y},tVertexNameList,vertexNameList))){return(FALSE)}}
  uniquePoints <- unique(pointNameList)
  return(all(sapply(uniquePoints, function(x){
    length(intersect(names(gV(tempNetwork, x)),vertexNameList[pointNameList == x])) == length(vertexNameList[pointNameList == x])})))
}

#' The corresponding entries in "pointNameList", "startTVertexNameList" and "endTVertexNameList", form a (graph,start-vertex,end-vertex)-pair.
#' It will be checked that there exists an edge in between the start- and end-vertex in the specified graph from the graph-list of the given 'tempnetwork'-object.
#'
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param pointNameList A vector of strings, representing the names of graphs in the graph-list of the given 'tempnetwork'-object.
#' @param startTVertexNameList A vector of strings, representing the names of vertices in graphs from the graph-list of the given 'tempnetwork'-object. It has same length as the vector "pointNameList".
#' @param endTVertexNameList A vector of strings, representing the names of vertices in graphs from the graph-list of the given 'tempnetwork'-object. It has same length as the vector "pointNameList".
#' @return The boolean value TRUE,
#' if between every specified (graph,start-vertex,end-vertex)-pair, there exists an edge in between the start- and end-vertex in the specified graph from the graph-list of the given 'tempnetwork'-object.
check_edge_exists.tempnetwork <- function(tempNetwork, pointNameList, startTVertexNameList, endTVertexNameList) {
  startVertexList <- mapply(function(tv,tp) {get_vertexname(tempNetwork, tv, tp)},startTVertexNameList,pointNameList )
  endVertexList <- mapply(function(tv,tp) {get_vertexname(tempNetwork, tv, tp)},endTVertexNameList,pointNameList )
  retVal <- all(sapply(names(gL(tempNetwork)), function(x){
    selectVector <- pointNameList == x
    if(any(selectVector)){
       edgeVector <- igraph::get.edge.ids(gG(tempNetwork,x),c(rbind(startVertexList[selectVector], endVertexList[selectVector])))
      return(all(edgeVector != 0))
    } else {
      return(TRUE)
    }
  }))
  return(retVal)
}


#' A function that checks, if the points specified in "pointNameList" exist in the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param pointNameList A vector of strings representing the names of points in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return The boolean value TRUE,
#'if all the points specified in "pointNameList" exist in the 'tempflow'-object of the given 'tempnetwork'-object.
check_points_exists.tempnetwork <- function(tempNetwork, pointNameList) {
  pointNameList <- unique(pointNameList)
  return(length(intersect(tP(tempNetwork)$name, pointNameList)) == length(pointNameList))
}


#' A function that checks, if the equivalence-classes specified in "tVertexNameList" exist in the equivalence-relation of the given 'tempnetwork'-object.
#'If the equivalence-relation of the given 'tempnetwork'-object is NULL, it wull be check whether there exists a vertex with the same name in
#'the first graph of the graph-list from the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param tVertexNameList A vector of strings representing the names of equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object.
#' @return
#' If the equivalence-relation of the given 'tempnetwork'-object is NULL, it wull be check whether there exists a vertex with the same name in
#'the first graph of the graph-list from the given 'tempnetwork'-object.
#' Otherwise, the boolean value TRUE will be returned,
#' if the equivalence-classes specified in "tVertexNameList" exist in the equivalence-relation of the given 'tempnetwork'-object.
check_tvertices_exists.tempnetwork <- function(tempNetwork, tVertexNameList) {
  tVertexNameList <- unique(tVertexNameList)
  if(is.null(eR(tempNetwork))) {
    return(length(intersect(names(gV(tempNetwork,1)), tVertexNameList)) == length(tVertexNameList))
  } else{
    return(length(intersect(names(eR(tempNetwork)), tVertexNameList)) == length(tVertexNameList))
  }
}


#' This function simply combines the function "check_tvertices_exists" and "check_points_exists".
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param pointNameList A vector of strings representing the names of points in the 'tempflow'-object of the given 'tempnetwork'-object. If NULL this input will be ignored.
#' @param tVertexNameList A vector of strings representing the names of equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object. If NULL this input will be ignored.
#' @param throwError If TRUE the respective errors will be thrown. Otherwise, a truth value will be returned.
#' @return The boolean value TRUE,
#' if the equivalence-classes specified in "tVertexNameList" exist in the equivalence-relation of the given 'tempnetwork'-object.
check_points_and_tvertices.tempnetwork <- function(tempNetwork, pointNameList = NULL, tVertexNameList = NULL, throwError = TRUE) {
  if(!is.null(pointNameList)){ check_points_exists(tempNetwork, pointNameList)}
  else {a <- TRUE}
  if(!is.null(tVertexNameList)){ check_tvertices_exists.tempnetwork(tempNetwork, tVertexNameList)}
  else {b <- TRUE}
  if(throwError && !a) {error_point_not_exists()}
  if(throwError && !b) {error_tvertex_not_exists()}
  return(a && b)
}


#' Any graph containing a vertex with a name that is not a string, will be
#' coerced into a string.
#' Moreover, if "setDefaultGraphNames" is TRUE, any graph in the given graph-list containing a vertex without a name, will be replaced by a graph where the name of each
#' vertex is a string corresponding to its index in the respective 'igraph'-object.
#'
#' @param graphList A named list of 'igraph'-objects.
#' @param setDefaultGraphNames If TRUE, any graph in the given graph-list containing a vertex without a name, will be replaced by a graph where the name of each
#' vertex is a string corresponding to its index in the respective 'igraph'-object.
#' coerced into a string.
#' @return A graph-list as described above.
graphlist_cleaner <- function(graphList,setDefaultGraphNames=TRUE) {
  if(setDefaultGraphNames &&  all(sapply(names(graphList), function(x) !is.null(graphList[[x]]$name)))){
    graphList <- lapply(graphList, function(x) igraph::set_vertex_attr(x, "name", value = paste(igV(x))))
  }
  if(any(sapply(names(graphList), function(x) is.numeric(graphList[[x]]$name)))){
    graphList <- lapply(graphList, function(x) igraph::set_vertex_attr(x, "name", value = paste(igraph::get.vertex.attribute(x, "name"))))
  }
  return(graphList)
}

#' A function that checks,
#' if the given 'tempflow'-object is a subtempflow the 'tempflow'-object from the given 'tempnetwork'-object.
#' (That is, the underlying graph of the prior is a subgraph of the underlying graph of the latter)
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param tempFlow A 'tempflow'-object.
#' @return The boolean value TRUE,
#' if the given 'tempflow'-object is a subtempflow the 'tempflow'-object from the given 'tempnetwork'-object.
check_is_subtempflow.tempnetwork <- function(tempNetwork, tempFlow) {
  return(base_check_is_subtempflow(tF(tempNetwork), tempFlow))
}

#' A function that checks,
#' if the given 'tempflow'-object "subTempFlow" is a subtempflow the  given 'tempflow'-object "supTempFlow".
#' (That is, the underlying graph of the prior is a subgraph of the underlying graph of the latter)
#'
#' @param supTempFlow A 'tempnetwork'-object.
#' @param subTempFlow A 'tempflow'-object.
#' @return The boolean value TRUE,
#' if the given 'tempflow'-object "subTempFlow" is a subtempflow the  given 'tempflow'-object "supTempFlow".
base_check_is_subtempflow <- function(supTempFlow, subTempFlow) {
  indTempFlow <- induce_flow(supTempFlow,names(tP(subTempFlow)))
  return(igraph::is_isomorphic_to(G(indTempFlow),G(subTempFlow)))
}


#' A function that checks,
#' if the points in the given 'tempflow'-object are a subset of the points in the 'tempflow'-object from the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param tempFlow A 'tempflow'-object.
#' @return The boolean value TRUE,
#' if the points in the given 'tempflow'-object are a subset of the points in the 'tempflow'-object from the given 'tempnetwork'-object.
check_is_pointsubset.tempnetwork <- function(tempNetwork, tempFlow) {
  return(base_check_is_pointsubset(tF(tempNetwork), tempFlow))
}

#' A function that checks,
#' if the points in the given 'tempflow'-object "subTempFlow" are a subset of the points in  the  given 'tempflow'-object "supTempFlow".
#'
#' @param supTempFlow A 'tempnetwork'-object.
#' @param subTempFlow A 'tempflow'-object.
#' @return The boolean value TRUE,
#' if the points in the given 'tempflow'-object "subTempFlow" are a subset of the points in  the  given 'tempflow'-object "supTempFlow"
base_check_is_pointsubset <- function(supTempFlow, subTempFlow) {
  return(all(names(tP(subTempFlow)) %in% names(tP(supTempFlow))))
}


