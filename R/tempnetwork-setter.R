#' This function replaces the existing 'tempflow'-object in the field "tempFlow" of the given 'tempnetwork'-object
#' by the given 'tempflow'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param tempFlow A 'tempflow'-object.
#' @param safe If TRUE, the usual 'tempnetwork' conditions will be checked.
#' @return The given 'tempnetwork'-object where the existing 'tempflow'-object in the field "tempFlow" of the given 'tempnetwork'-object
#' is replaced by the given 'tempflow'-object. If the parameter "tempFlow" is NULL the given unchanged 'tempnetwork'-object will be returned.
#' Additionally, the "tempGraph"-field will be set to NULL.
set_tempFlow.tempnetwork <- function(tempNetwork, tempFlow, safe = TRUE){
  return(set_basic_properties(tempNetwork,tempFlow=tempFlow))
}


#' This function replaces the existing graph-list in the field "graphList" of the given 'tempnetwork'-object
#' by the given graph-list.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param graphList A named list of "igraph"-objects.
#' @param setDefaultGraphNames If TRUE any graph containing a vertex without a name, will be replaced by a graph where the name of each
#' vertex is a string corresponding to its index in the respective 'igraph'-object. Moreover, any graph containing a vertex with a name that is not a string, will be
#' coerced into a string.
#' @param safe If TRUE, the usual 'tempnetwork' conditions will be checked.
#' @return The given 'tempnetwork'-object where the existing graph-list in the field "graphList" of the given 'tempnetwork'-object
#' is replaced by the given graph-list. If the parameter "graphList" is NULL the given unchanged 'tempnetwork'-object will be returned.
#' Additionally, the "tempGraph"-field will be set to NULL.
set_graphList.tempnetwork <- function(tempNetwork, graphList, setDefaultGraphNames=TRUE, safe = TRUE){
  return(set_basic_properties(tempNetwork,graphList=graphList))
}



#' This function replaces the existing equivalence-relation in the field "equivRel" of the given 'tempnetwork'-object
#' by the given equivalence-relation.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param equivRel A named list of named lists,
#' where the outer-level list length must be identical to the length of each vertex set in the graph list.
#' where the inner-level names must be identical with the names of the newly added points;
#' where the values must be identical to the vertex-names of the correspondign newly added graph.
#'
#' @param safe If TRUE, the usual 'tempnetwork' conditions will be checked.
#' @return The given 'tempnetwork'-object where the existing equivalence-relation in the field "equivRel" of the given 'tempnetwork'-object
#' is replaced by the given equivalence-relation. If the parameter "equivRel" is NULL the given unchanged 'tempnetwork'-object will be returned.
#' Additionally, the "tempGraph"-field will be set to NULL.
set_equivRelation.tempnetwork <- function(tempNetwork, equivRel, safe = TRUE){
  return(set_basic_properties(tempNetwork,equivRel=equivRel))
}




#' This function behaves as follows.
#' If "tempFlow" is not NULL, this function replaces the existing 'tempflow'-object in the field "tempFlow" of the given 'tempnetwork'-object
#' by the given 'tempflow'-object.
#' If "graphList" is not NULL, this function replaces the existing graph-list in the field "graphList" of the given 'tempnetwork'-object
#' by the given graph-list.
#' If "equivRel" is not NULL, this function replaces the existing equivalence-relation in the field "equivRel" of the given 'tempnetwork'-object
#' by the given equivalence-relation.
#' @param tempNetwork A 'tempnetwork'-object.
#' @param tempFlow A 'tempflow'-object.
#' @param graphList A named list of "igraph"-objects.
#' @param equivRel A named list of named lists,
#' where the outer-level list length must be identical to the length of each vertex set in the graph list.
#' where the inner-level names must be identical with the names of the newly added points;
#' where the values must be identical to the vertex-names of the corresponding newly added graph.
#' @param setDefaultGraphNames If TRUE any graph containing a vertex without a name, will be replaced by a graph where the name of each
#' vertex is a string corresponding to its index in the respective 'igraph'-object. Moreover, any graph containing a vertex with a name that is not a string, will be
#' coerced into a string.
#' @param safe If TRUE, the usual 'tempnetwork' conditions will be checked.
#' @return The given 'tempnetwork'-object where
#' if "tempFlow" is not NULL, the existing 'tempflow'-object in the field "tempFlow" of the given 'tempnetwork'-object
#' is replaced by the given 'tempflow'-object.
#' if "graphList" is not NULL, the existing graph-list in the field "graphList" of the given 'tempnetwork'-object
#' is replaced by the given graph-list.
#' if "equivRel" is not NULL, the existing equivalence-relation in the field "equivRel" of the given 'tempnetwork'-object
#' is replaced by the given equivalence-relation.
#' Additionally, the "tempGraph"-field will be set to NULL.
set_basic_properties.tempnetwork <- function(tempNetwork, tempFlow = NULL, graphList = NULL, equivRel = NULL, setDefaultGraphNames=TRUE, safe = TRUE){
  newTempNetwork <- tempNetwork
  if(!is.null(tempFlow)) {newTempNetwork$tempFlow <- tempFlow}
  if(!is.null(graphList)) {newTempNetwork$graphList <- graphlist_cleaner(graphList,setDefaultGraphNames)}
  if(!is.null(equivRel)) {newTempNetwork$equivRel <- equivRel}
  newTempNetwork$tempGraph <- NULL
  if (safe) {check_tempnetwork_completely(newTempNetwork)}
  return(newTempNetwork)
}


#' This function replaces the existing truth value in the field "storeTempGraph" of the given 'tempnetwork'-object
#' by the given truth value.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param equivRel A boolean value.
#' @return The given 'tempnetwork'-object where the existing truth value in the field "storeTempGraph" of the given 'tempnetwork'-object
#' is replacedby the given truth value.
set_store_tempgraph.tempnetwork <- function(tempNetwork, storeTempGraph){
  if(storeTempGraph != stG(tempNetwork)){
    newTempNetwork <- tempNetwork
    newTempNetwork$storeTempGraph <- storeTempGraph
    return(newTempNetwork)
  } else {
    return(tempNetwork)
  }
}


#' This function supports the changing of names of specified equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object.
#' If the equivalence-relation of the given 'tempnetwork'-object is NULL and the flag "retainImpliedEquivRel" is TRUE, the equivalence-relation in the
#' new 'tempnetwork'-object remains NULL. However, to compensate the resulting incongruity all the names of vertices specified in "oldVertexNameList" across all graphs from the graph-list
#' of the provided 'tempnetwork'-object, are changed to the corresponding names provided in "newVertexNameList".
#' Otherwise, the resulting 'tempnetwork'-object is a copy of the provided one, but for the fact that the names of the equivalence-classes specified through the vector "oldVertexNameList"
#' are now changed to the corresponding names found in the vector "newVertexNameList".
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param oldVertexNameList A vector of strings, representing the names of equivalence-classes in from the equivalence-relation of the given 'tempnetwork'-object.
#' @param newVertexNameList A vector of strings, representing the new names of the equivalence-classes specified in the vector "oldVertexNameList".
#' Hence, it must have the same length as the vector "oldVertexNameList".
#' @param retainImpliedEquivRel If TRUE, the equivalence-relation in the
#' new 'tempnetwork'-object remains NULL. However, to compensate the resulting incongruity all the names of vertices specified in "oldVertexNameList" across all graphs from the graph-list
#' of the provided 'tempnetwork'-object, are changed to the corresponding names provided in "newVertexNameList".+
#'@param safe If TRUE, it will be ensured that
#' the vectors oldVertexNameList and  newVertexNameList have the same length.
#' the vectors oldVertexNameList and  newVertexNameList both have unique entries.
#' the equivalence-classes specified in "oldVertexNameList" actually exist.
#' Additionally, the usual 'tempnetwork' conditions will be checked.
#' @return
#' If the equivalence-relation of the given 'tempnetwork'-object is NULL and the flag "retainImpliedEquivRel" is TRUE, the resulting 'tempnetwork'-object will contain
#' the same 'tempflow'-object as found in the given 'tempnetwork'-object;
#' a new graph-list constructed by changing all the names of vertices specified in "oldVertexNameList" across all graphs from the graph-list
#' of the provided 'tempnetwork'-object to the corresponding names provided in "newVertexNameList";
#' a NULL-value in the field "equivRel".
#'
#' Otherwise, the resulting 'tempnetwork'-object will contain
#' the same 'tempflow'-object as found in the given 'tempnetwork'-object;
#' the same graph-list as found in the given 'tempnetwork'-object;
#' a new equivalence-relation constructed by changing the names of the equivalence-classes specified through the vector "oldVertexNameList"
#' to the corresponding names found in the vector "newVertexNameList".
#' Additionally, the "tempGraph"-field will be set to NULL.
set_tempvertex_names.tempnetwork <- function(tempNetwork, oldVertexNameList, newVertexNameList, retainImpliedEquivRel = TRUE, safe = TRUE) {
  if (safe) {
    if (!check_vector_unique(oldVertexNameList)) {error_vector_not_unique()}
    if (!check_vector_unique(newVertexNameList)) {error_vector_not_unique()}
    if (!check_vector_equal_length(oldVertexNameList, newVertexNameList)) {error_vector_not_equal_length()}
    if (!check_tvertices_exists(tempNetwork,oldVertexNameList)){error_tvertex_not_exists()}
  }
  if(is.null(eR(tempNetwork)) && retainImpliedEquivRel) {
    pointNameList <- rep(names(tP(tempNetwork)), length(oldVertexNameList))
    oldVertexNameList <- rep(oldVertexNameList, each = length(tP(tempNetwork)))
    newVertexNameList <- rep(newVertexNameList, each = length(tP(tempNetwork)))
    return(set_vertex_names(tempNetwork, pointNameList, oldVertexNameList, newVertexNameList, changeEquivRel = FALSE))
  } else {
    if(!is.null(eR(tempNetwork))){
      newEquivRel <- eR(tempNetwork)
    } else  {
      newEquivRel <- eR(tempNetwork, TRUE)
    }
    names(newEquivRel)[which(names(newEquivRel) %in% c(oldVertexNameList))] <- c(newVertexNameList)
    return(set_equivRelation(tempNetwork, newEquivRel, safe))
  }

}


#' This function allows one to change the names of vertices in a graph from the graph-list provided by the given 'tempnetwork'-object.
#' For each (point, equivalence-class, string)-pair
#' (which is constructed by considering the corresponding entries in the "pointNameList"-, "tVertexNameList"- and "newVertexNameList"-vector)
#' the following is done.
#' Using the point the relecant graph from the graph-list of the given 'tempnetwork'-object will be selected.
#' Then the first two elements will be used to determine the old name of vertex. Using those two the vertex will be renamed in the chosen graph.
#' Moreover, the entry in respective the equivalence-class will be updated as will.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param pointNameList A vector of string, representing the names of points in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param tVertexNameList A vector of string, representing the names of equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object.
#' @param newVertexNameList A vector of strings, representing the new names of specified the vertices.
#' If NULL, a vector containing the string encoding of the indices of the specified vertices in their respective graphs will be computed.
#' E.g. if a vertex is indexed 3 in the vertex set of the 'igraph'-object, the vector will contain "3" at the position attributed to that vertex.
#' @param changeEquivRel If TRUE, the entries in the equivalence-relation of the given 'tempnetwork'-object will be updated as well.
#' @param safe If TRUE it will be ensured that
#' "pointNameList" and "tVertexNameList" are equal in length;
#' if not NULL the vector "newVertexNameList" has the same length as the vector "tVertexNameList";
#' that the specified points and equivalence-classes exist.
#' @return A 'tempnetwork'-object containing
#' the same 'tempflow'-object as the given 'tempnetwork'-object.
#' a graph-list constructed by changing the vertex names of the graphs in the graph-list of the given 'tempnetwork'-object;
#' a possibly updated equivalence-relation constructed by changing the values of the equivalence-relation from the given 'tempnetwork'-object.
set_vertex_names.tempnetwork <- function(tempNetwork, pointNameList, tVertexNameList, newVertexNameList = NULL, changeEquivRel = TRUE, safe = TRUE){
  if (safe) {
    if (!check_vector_equal_length(pointNameList, tVertexNameList)) {error_vector_not_equal_length()}
    if (!is.null(newVertexNameList) && !check_vector_equal_length(tVertexNameList, newVertexNameList)) {error_vector_not_equal_length()}
    if (!check_points_exists(tempNetwork,pointNameList)){error_point_not_exists()}
    if (!check_tvertices_exists(tempNetwork,tVertexNameList)){error_tvertex_not_exists()}
   }

  oldVertexNameList <- get_vertexnames(tempNetwork, tVertexNameList, pointNameList)

  if(is.null(newVertexNameList)){
    newVertexNameList <- sapply(c(1:length(oldVertexNameList)), function(x){
      rv <- match(oldVertexNameList[x] ,names(gV(tempNetwork, pointNameList[x])))
      if (is.na(rv)) { error_vertex_not_found() }
      else {return(rv)}})
    newVertexNameList <- paste(newVertexNameList)
  }
  # GraphList
  uniquePointNameList <- unique(pointNameList)
  changeList <- lapply(uniquePointNameList, function(x) {
    selectVector <- pointNameList == x
    list("oldVertexNameList" = oldVertexNameList[selectVector], "newVertexNameList" = newVertexNameList[selectVector])
  })
  names(changeList)<-uniquePointNameList
  newGraphList <- gL(tempNetwork)
  for(x in uniquePointNameList){
    newGraphList[[x]] <- igraph::set_vertex_attr(gG(tempNetwork, x, safe), "name", changeList[[x]]$oldVertexNameList, changeList[[x]]$newVertexNameList)
  }

  # EquivRel
  if(changeEquivRel){
    newEquivRel <- eR(tempNetwork, TRUE)
    for(x in c(1:length(pointNameList))){
      newEquivRel[[tVertexNameList[[x]]]][[pointNameList[[x]]]] <- newVertexNameList[[x]]
    }
    return(set_basic_properties(tempNetwork, graphList = newGraphList, equivRel = newEquivRel, safe = safe))
  }
  return(set_basic_properties(tempNetwork, graphList = newGraphList, safe = safe))
}

