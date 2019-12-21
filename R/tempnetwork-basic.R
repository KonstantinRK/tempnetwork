#' This function takes a 'tempflow'-object with its set of points being a subset of the set of points in the 'tempflow'-object currently stored in the given 'tempnetwork'-object.
#' and adjusts the given 'tempnetwork'-object to it.
#' This is accomplished by removing those entries from the graph-list of the given 'tempnetwork'-object that are not present in the given reduced 'tempflow'-object and
#' by removing those entries across all the equivalence-classes from the equivalence-relation of the given 'tempnetwork'-object that are not present in the given reduced 'tempflow'-object.
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param redTempFlow A 'tempflow'-object with its set of points being a subset of the points in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param safe If TRUE, it will be ensured that the points of the 'tempflow'-object is actually a subset of the points from the 'tempflow'-object of the given 'tempnetwork'-object.
#' Additionally, all tempnetwork conditions will be checked to ensure that the resulting 'tempnetwork'-object satisfies all requirements.
#' @return A new 'tempnetwork'-object, containing the given reduced 'tempflow'-object;
#' a graph-list obtained by removing the excess entries from the graph-list of the given 'tempnetwork'-object;
#' an equivalence-relation obtained by removing the excess entries from equivalence-classes of the equivalence-relation provided through the given 'tempnetwork'-object.
#' Additionally, the "tempGraph"-field will be set to NULL.
adjust_to_reduced_tempflow.tempnetwork <- function(tempNetwork, redTempFlow, safe = TRUE) {
  if(safe) { if(!check_is_pointsubset(tempNetwork, redTempFlow)) {error_not_point_subset()}}
  newGraphList <- gL(tempNetwork)
  newGraphList[!(names(newGraphList) %in% tP(redTempFlow)$name)] <- NULL
  if (!is.null(eR(tempNetwork))) {
    newEquivRel <- lapply(eR(tempNetwork), function(x) x[names(x) %in% tP(redTempFlow)$name])
  } else {newEquivRel <- NULL}
  return(set_basic_properties(tempNetwork, tempFlow = redTempFlow, graphList=newGraphList, equivRel = newEquivRel, safe=safe))
}


#' This function takes a 'tempflow'-object that is a subflow of the 'tempflow'-object currently stored in the given 'tempnetwork'-object and adjusts the
#' given 'tempnetwork'-object to it.
#' This is accomplished by removing those entries from the graph-list of the given 'tempnetwork'-object that are not present in the given reduced 'tempflow'-object and
#' by removing those entries across all the equivalence-classes from the equivalence-relation of the given 'tempnetwork'-object that are not present in the given reduced 'tempflow'-object.
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param redTempFlow A 'tempflow'-object that is a sub-tempflow of the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param safe If TRUE, it will be ensured that the given 'tempflow'-object is acutually a subtempflow of the 'tempflow'-object of the given 'tempnetwork'-object.
#' Additionally, all tempnetwork conditions will be checked to ensure that the resulting 'tempnetwork'-object satisfies all requirements.
#' @return A new 'tempnetwork'-object, containing the given reduced 'tempflow'-object;
#' a graph-list obtained by removing the excess entries from the graph-list of the given 'tempnetwork'-object;
#' an equivalence-relation obtained by removing the excess entries from equivalence-classes of the equivalence-relation provided through the given 'tempnetwork'-object.
#' Additionally, the "tempGraph"-field will be set to NULL.
adjust_to_subtempflow.tempnetwork <- function(tempNetwork, subTempFlow, safe = TRUE) {
  if(safe) { if(!check_is_subtempflow(tempNetwork, redTempFlow)) {error_not_subtempflow()}}
  return(adjust_to_reduced_tempflow(tempNetwork, subTempFlow, safe=safe))
}

#' This function adds a new vertex to every graph in the graph-list of the given 'tempnetwork'-object,
#' creates a corresponding equivalence-class and adds it to the equivalence-relation of the given 'tempnetwork'-object.
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param tVertexName A string representing the name of the new equivalence-class.
#' @param gVertexNameList A vector of strings representing the vertices to be added to the respective graphs in the graph-list.
#' As every graph must have the same size (vertex set) the length of this vector must equal to the number of points in the 'tempflow'-object of the given 'tempnetwork'-object.
#' As default it is assumed that those have the same name as the equivalence class, i.e. the string in "tVertexName".
#' @param pointNameList A vector of strings representing the names of points in the 'tempflow'-object. The length of this vector must be identical to the length of the
#' "gVertexNameList"-vector, as this vector is used to place the new vertex in the appropriate graph.
#'  As a default current ordering of points in the 'tempflow'-object of the given 'tempnetwork'-object is assumed.
#' @param safe If TRUE it will be check that vector "gVertexNameList" and "pointNameList" have the same length. Moreover, it will be check if "pointNameList" is a multiple
#' of the points in the 'tempflow'-object of the given 'tempnetwork'-object. Furthermore, it will be ensured that "tVertexName" is either a single string or a vector of strings
#' with the same length as "gVertexNameList". Finally, all tempnetwork conditions will be checked to ensure that the resulting 'tempnetwork'-object satisfies all requirements.
#' @return A new 'tempnetwork'-object, containing the same 'tempflow'-object as the previous one;
#' a graph-list where each graph from the graph-list of the given 'tempnetwork'-object is extended by one vertex (the name of said vertex is specified through the vectors "gVertexNameList" and "pointNameList");
#' an equivalence relation that extends the equivalence-relation from the given 'tempnetwork'-object, by an equivalence-class named as specified in "tVertexName" and structured as
#' defined through the vectors "gVertexNameList" and "pointNameList."
#' Additionally, the "tempGraph"-field will be set to NULL.
add_tVertex.tempnetwork <- function(tempNetwork, tVertexName, gVertexNameList = rep(tVertexName, length(tP(tempNetwork))), pointNameList = tP(tempNetwork)$name, safe = TRUE) {
  add_tvertices(tempNetwork, tVertexName, gVertexNameList,pointNameList,safe)
}


#' This function adds a series of vertices to every graph in the graph-list of the given 'tempnetwork'-object and
#' creates corresponding equivalence-classes and adds them to the equivalence-relation of the given 'tempnetwork'-object.
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param tVertexNameList A vector of strings representing the names of the new equivalence classes. It must be either of the same length as the vector "gVertexNameList" or
#' its length must be the length of the vector "gVertexNameList" divided by N, where N is the number of points in the 'tempflow'-object of the given 'tempnetwork'-object.
#' If the latter is the case, it will be assumed that the first entry of this vector corresponds with the first N entries in the "gVertexNameList"-vector.
#' @param gVertexNameList A vector of strings representing the vertices to be added to the graphs in the graph-list.
#' As every graph must have the same size (vertex set) the length of this vector must be a multiple of the number of points  in the 'tempflow'-object of the given 'tempnetwork'-object.
#' As default it is assumed that those have the same name as the equivalence classes specified in the "tVertexNameList"-vector.
#' @param pointNameList A vector of strings representing the names of points in the 'tempflow'-object. The length of this vector must be identical to the length of the
#' "gVertexNameList"-vector, as this vector is used to place the new vertex in the appropriate graph.
#'  As a default current ordering of points in the 'tempflow'-object of the given 'tempnetwork'-object is taken a replicated until the resulting vector has the same length as
#'  the vector "gVertexNameList".
#' @param safe If TRUE it will be check that vector "gVertexNameList" and "pointNameList" have the same length. Moreover, it will be check if "pointNameList" is a multiple
#' of the points in the 'tempflow'-object of the given 'tempnetwork'-object. Furthermore, it will be ensured that "tVertexName" is either a single string or a vector of strings
#' with the same length as "gVertexNameList". Finally, all tempnetwork conditions will be checked to ensure that the resulting 'tempnetwork'-object satisfies all requirements.
#' @return A new 'tempnetwork'-object, containing the same 'tempflow'-object as the previous one;
#' a graph-list where each graph from the graph-list of the given 'tempnetwork'-object is extended by the specified vertices (the names ow which are specified through the vectors "gVertexNameList" and "pointNameList");
#' an equivalence relation that extends the equivalence-relation from the given 'tempnetwork'-object, by the equivalence-classes specified in the vector "tVertexNameList" and structured as
#' defined through the vectors "gVertexNameList" and "pointNameList."
#' Additionally, the "tempGraph"-field will be set to NULL.
add_tvertices.tempnetwork <- function(tempNetwork, tVertexNameList, gVertexNameList = rep(tVertexNameList, each = length(tP(tempNetwork))), pointNameList = NULL, safe = TRUE) {
  if(length(tVertexNameList)*length(tP(tempNetwork))== length(gVertexNameList)) {
    tVertexNameList <- rep(tVertexNameList, each=length(tP(tempNetwork)))
  }
  n <- length(gVertexNameList)/length(tP(tempNetwork))
  if(is.null(pointNameList)) {
    pointNameList <- rep(tP(tempNetwork)$name, n)
  }
  if (safe) {
    if (!check_vector_equal_length(tVertexNameList, gVertexNameList)) {error_vector_not_equal_length()}
    if (!check_vector_equal_length(tVertexNameList, pointNameList)) {error_vector_not_equal_length()}
    if (n != round(n,0)) {error_not_multiple_of_tempflow()}
  }

  #GraphList
  changeList <- lapply(tP(tempNetwork)$name, function(x) {gVertexNameList[pointNameList == x]})
  names(changeList) <- tP(tempNetwork)$name
  newGraphList <- lapply(names(gL(tempNetwork)), function(x) {igraph::add_vertices(gG(tempNetwork,x), length(changeList[[x]]), attr = list("name" = changeList[[x]]))})
  names(newGraphList) <- names(gL(tempNetwork))


  #EquivRel
  if(is.null(eR(tempNetwork)) && all(tVertexNameList == gVertexNameList)){
    newEquivRel <- NULL
  } else {

    UniqueEquivClassNames <- unique(tVertexNameList)
    changeList <- lapply(UniqueEquivClassNames, function(x) {
      selectVector <- tVertexNameList == x
      l <- gVertexNameList[selectVector]
      names(l) <- pointNameList[selectVector]
      return(l)
      })
    names(changeList) <- UniqueEquivClassNames
    newEquivRel <- eR(tempNetwork, TRUE)
    for(x in UniqueEquivClassNames){
      newEquivRel[[x]] <- changeList[[x]]
    }
  }
  return(set_basic_properties(tempNetwork,  graphList=newGraphList, equivRel = newEquivRel, safe=safe))
}


#' This function takes a list of equivalence-class names (i.e. tempvertices) and creates a new 'tempnetwork'-object by removing the
#' specified equivalence-classes from the equivalence-relation of the given 'tempnetwork'-object; removing all vertices contained in
#' in the specified equivalence-classes from their respective graphs in the graph-list of the given 'tempnetwork'-object.
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param tVertexNameList A vector of strings representing the names of equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object.
#' @param safe If TRUE, it will be ensured that
#' the names in the vector "tVertexNameList" are actually names of equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object;
#' the vector "tVertexNameList" does not contain duplicates.
#' the resulting 'tempnetwork'-object satisfies all tempnetwork conditions.
#' @return A new 'tempnetwork'-object, containing
#' the same 'tempflow'-object as the one given through the provided 'tempnetwork'-object;
#' a graph-list constructed by removing the vertices contained in the given equivalence-classes from their respective graph in the graph-list of the given 'tempnetwork'-object.
#' Additionally, the "tempGraph"-field will be set to NULL.
remove_tvertices.tempnetwork <- function(tempNetwork, tVertexNameList, safe = TRUE) {

  if(safe){
    if(!check_tvertices_exists(tempNetwork, tVertexNameList)) { error_tvertex_not_exists()}
    if(!check_vector_unique(tVertexNameList)) { error_vector_not_unique()}
  }

  newGraphList <- lapply(names(gL(tempNetwork)) , function(t) igraph::delete_vertices(gG(tempNetwork,t),
                                                                                      sapply(tVertexNameList, function(v) get_vertexname(tempNetwork, v, t, safe))))
  #GraphList
  if(is.null(eR(tempNetwork))){
    newGraphList <- lapply(names(gL(tempNetwork)), function(x) { igraph::delete.vertices(gG(tempNetwork,x), tVertexNameList)  })
  } else {
    changeList <- lapply(tP(tempNetwork)$name, function(tp) { unname(sapply(tVertexNameList, function(tv) { get_vertexname(tempNetwork,tv,tp,safe) })) })
    names(changeList) <- tP(tempNetwork)$name
    newGraphList <- lapply(names(gL(tempNetwork)), function(x) {igraph::delete.vertices(gG(tempNetwork,x),changeList[[x]]) })
  }
  names(newGraphList) <- names(gL(tempNetwork))

  #EquivRel
  if(is.null(eR(tempNetwork))){
    newEquivRel <- NULL
  } else {
    newEquivRel <- eR(tempNetwork)
    newEquivRel[tVertexNameList] <- NULL
  }
  return(set_basic_properties(tempNetwork,  graphList=newGraphList, equivRel = newEquivRel, safe=safe))
}


#' This function allows one to add edges to specified graphs from the graph-list of the given 'tempnetwork'-object.
#' The vectors "pointNameList", "startTVertexList" and "endTVertexList" must all be of equal length, as their entries correspond with each other
#' That is, the i-th entry from the vector "pointNameList" specifies the graph to which the i-th edge ought to be added, while "startTVertexList" and "endTVertexList" characterise
#' the start- and end-vertex of the i-th edge.
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param pointNameList A vector of strings representing the names of points in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param startTVertexList A vector of strings representing the names equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object. Using the corresponding
#' entries in the "pointNameList"-vector, said equivalence-realtion will be queried to determine the start-vertices of the edges to be added.
#' @param endTVertexList A vector of strings representing the names equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object. Using the corresponding
#' entries in the "pointNameList"-vector, said equivalence-realtion will be queried to determine the end-vertices of the edges to be added.
#' @param weightList A vector that can be used to add a certain value to the corresponding edges "weight" attribute.
#' @param safe If TRUE, it will be ensured that
#' the vectors "pointNameList", "startTVertexList" and "endTVertexList" are of equal length;
#' the vector "weightList" is either of length 1 or of the same length as the other vectors.
#' @return A new 'tempnetwork'-object, containing the same 'tempflow'-object as provided through the given 'tempnetwork'-object;
#' a new graph-list constructed by extending the graphs from the graph-list of the given 'tempnetwork'-object, with the edges specified in the input;
#' the same equivalence-relation as provided through the given 'tempnetwork'-object.
#' Additionally, the "tempGraph"-field will be set to NULL.
add_gedges.tempnetwork <- function(tempNetwork, pointNameList, startTVertexList, endTVertexList, weightList = NULL, safe = TRUE) {
  if(safe){
    if(!check_vector_equal_length(pointNameList,startTVertexList)){error_vector_not_equal_length()}
    if(!check_vector_equal_length(startTVertexList,endTVertexList)){error_vector_not_equal_length()}
    if(!is.null(weightList) && !check_vector_equal_length_or_one(weightList,pointNameList)){error_vector_not_equal_length_and_not_one()}
  }
  startVertexList <- mapply(function(tv,tp) {get_vertexname(tempNetwork, tv, tp)},startTVertexList,pointNameList )
  endVertexList <- mapply(function(tv,tp) {get_vertexname(tempNetwork, tv, tp)},endTVertexList,pointNameList )
  if(length(weightList)==1){ weightList <- rep(weightList, length(pointNameList))}
  newGraphList <- lapply(names(gL(tempNetwork)), function(x){
    selectVector <- pointNameList == x
    if(is.null(weightList)){
      return(igraph::add_edges(gG(tempNetwork,x),c(rbind(startVertexList[selectVector], endVertexList[selectVector]))))
    } else {
      return(igraph::add_edges(gG(tempNetwork,x),c(rbind(startVertexList[selectVector], endVertexList[selectVector])), attr = list("weight"=weightList[selectVector])))
    }
  })
  names(newGraphList) <- names(gL(tempNetwork))
  return(set_basic_properties(tempNetwork,  graphList=newGraphList, safe=safe))
}


#' This function allows one to remove edges from the specified graphs contained in the graph-list of the given 'tempnetwork'-object.
#' The vectors "pointNameList", "startTVertexList" and "endTVertexList" must all be of equal length, as their entries correspond with each other
#' That is, the i-th entry from the vector "pointNameList" specifies the graph from which the i-th edge ought to be removed, while "startTVertexList" and "endTVertexList" characterise
#' the start- and end-vertex of the i-th edge.
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param pointNameList A vector of strings representing the names of points in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param startTVertexList A vector of strings representing the names equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object. Using the corresponding
#' entries in the "pointNameList"-vector, said equivalence-relation will be queried to determine the start-vertices of the edges to be removed
#' @param endTVertexList A vector of strings representing the names equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object. Using the corresponding
#' entries in the "pointNameList"-vector, said equivalence-realtion will be queried to determine the end-vertices of the edges to be removed
#' @param safe If TRUE, it will be ensured that
#' the vectors "pointNameList", "startTVertexList" and "endTVertexList" are of equal length;
#' the specified edges actually exist in the corresponding graph;
#' @return A new 'tempnetwork'-object, containing the same 'tempflow'-object as provided through the given 'tempnetwork'-object;
#' a new graph-list constructed by removing the specified edges from the corresponding graphs in the graph-list of the given 'tempnetwork'-object;
#' the same equivalence-relation as provided through the given 'tempnetwork'-object.
#' Additionally, the "tempGraph"-field will be set to NULL.
remove_gedges.tempnetwork <- function(tempNetwork, pointNameList, startTVertexList, endTVertexList , safe = TRUE) {
  if(safe){
    if(!check_vector_equal_length(pointNameList,startTVertexList)){error_vector_not_equal_length()}
    if(!check_vector_equal_length(startTVertexList,endTVertexList)){error_vector_not_equal_length()}
    if(!check_edge_exists(tempNetwork, pointNameList, startTVertexList, endTVertexList)){error_edge_not_exist()}
  }
  startVertexList <- mapply(function(tv,tp) {get_vertexname(tempNetwork, tv, tp)},startTVertexList,pointNameList )
  endVertexList <- mapply(function(tv,tp) {get_vertexname(tempNetwork, tv, tp)},endTVertexList,pointNameList )
  newGraphList <- lapply(names(gL(tempNetwork)), function(x){
    selectVector <- pointNameList == x
    return(igraph::delete.edges(gG(tempNetwork,x),igraph::get.edge.ids(gG(tempNetwork,x),c(rbind(startVertexList[selectVector], endVertexList[selectVector])))))
  })
  names(newGraphList) <- names(gL(tempNetwork))
  return(set_basic_properties(tempNetwork,  graphList=newGraphList, safe=safe))
}



#' This function constructs a graph representation of the given 'tempnetwork'-object.
#' This is accomplished by renaming all vertices (as specified in the function "base_get_tempgraph_vertex_name"),
#' adding the vertex-attributes "vertexName", "pointName" and "tempVertexName"
#' according to their position in the equivalence-relation of the given 'tempnetwork'-object.
#' After this all edited graphs are merged (using igraph::disjoint_union).
#' Moreover, if connectGraphs is TRUE, for each equivalence-class all contained vertices are connected in
#' the exact same manner as the points in the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork  A 'tempnetwork'-object.
#' @param connectGraphs If TRUE, for each equivalence-classe all contained vertices are connected in
#' the exact same manner as provided by the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param forceIGraph  If TRUE, the function will always return an 'igraph'-object.
#' @return If "forceIGraph" is TRUE or if the field "storeTempGraph" is FALSE, this function returns an 'igraph'-object as described above.
#' Otherwise, this function will return a 'tempnetwork'-object that is identical to the given 'tempnetwork'-object, but for the
#' fact that the field "tempGraph" contains an 'igraph'-object as described above.
construct_underlying_graph.tempnetwork <- function(tempNetwork, connectGraphs = TRUE, forceIGraph = FALSE) {
  mergeGraphList <- unname(lapply(names(gL(tempNetwork)), function(tp) {
    if(is.null(eR(tempNetwork))) {
      realVertexNames <- names(gV(tempNetwork,tp))
      tempVertexNames <- realVertexNames
    }
    else {
      realVertexNames <- sapply(names(eR(tempNetwork)), function(x) get_vertexname(tempNetwork,x,tp))
      tempVertexNames <- names(eR(tempNetwork))
    }
    uniqueVertexNames <- mapply(function(v, tv){base_get_tempgraph_vertex_name(tv,tp,v)},realVertexNames,tempVertexNames )
    pointNames <- rep(tp,length(realVertexNames))
    graph <- gG(tempNetwork,tp)
    graph <- igraph::set.vertex.attribute(graph,"vertexName", realVertexNames, realVertexNames )
    graph <- igraph::set.vertex.attribute(graph,"pointName", realVertexNames, tp )
    graph <- igraph::set.vertex.attribute(graph,"tempVertexName", realVertexNames, tempVertexNames )
    graph <- igraph::set.vertex.attribute(graph,"name", realVertexNames, uniqueVertexNames )
    return(graph)
  }))
  tempGraph <- igraph::as.directed(igraph::disjoint_union(mergeGraphList), mode = "mutual")
  if (connectGraphs) {
    pointList <- get_step_point_list(tempNetwork)
    newEdgeList <- unlist(as.list(mapply(function(sp, ep){
      if(is.null(eR(tempNetwork))){ tempVertexNames <- names(gV(tempNetwork,sp))}
      else {tempVertexNames <- names(eR(tempNetwork))}
      eL <- as.vector(sapply(tempVertexNames, function(tv) c(get_tempgraph_vertex_name(tempNetwork,tv,sp),get_tempgraph_vertex_name(tempNetwork,tv,ep))))
    }, pointList$startPointList, pointList$endPointList )))
    newAttrList <- get_step_attr_list(tempNetwork, rep(pointList$startPointList, each = length(gV(tempNetwork,1))),rep(pointList$endPointList, each = length(gV(tempNetwork,1))))
    tempGraph <- igraph::add.edges(tempGraph, newEdgeList, attr = newAttrList)
  }
  if(stG(tempNetwork) && !forceIGraph) {
    newTempNetwork <- tempNetwork
    newTempNetwork$tempGraph <- tempGraph
    return(newTempNetwork)
  } else {
    return(tempGraph)
  }


}



#' Is a function that computes the temporal distance between two points in time with respect to a given 'tempflow'-object.
#' Moreover, it allows for the choice, whether weights should be considered in the computation or not.
#' The distance is based on the shortest path, that is if no shortest path can be found the distance will be infinite.
#'
#' @param tempFlow A 'tempflow'-object.
#' @param startPoint A point-name (or point-id) representing the name of the start-point of the shortest path computation.
#' @param endPoint A point-name (or point-id) representing the name of the end-point of the shortest path computation.
#' @param considerWeights If TRUE weights will be considered in the shortest path computation, otherwise the distance will be given by
#' the number of steps between "startPoint" and endPoint"
#' @param safe If TRUE, it will be ensured that both start- and end-point exist in the 'tempflow'-object.
#' @return The length or size of the shortest path. If no such path exists, it returns "Inf".
# @example compute_tempdistance(tempFlow, "t5", "t6")
compute_distance.tempnetwork <- function(tempNetwork, startTVertex, endTVertex, startPoint=NULL, endPoint=NULL, considerWeights = TRUE, cutGraph = TRUE, names = TRUE,safe = TRUE) {
  if(is.null(startPoint)) {startPointList <- names(tP(tempNetwork))}
  else {startPointList <- c(startPoint)}
  if(is.null(endPoint)) {endPointList <- names(tP(tempNetwork))}
  else {endPointList <- c(endPoint)}
  if(!stG(tempNetwork)) {tempNetwork <- set_store_tempgraph(tempNetwork, TRUE)}
  if(is.null(tG(tempNetwork))) {tempNetwork <- construct_underlying_graph(tempNetwork)}

  if (length(startPointList)==1 && length(startPointList)==1) {
    newFlow <- slice_flow(tF(tempNetwork), startPointList, endPointList, safe=safe)

    if (length(tP(newFlow))==0){return(NULL)}

    tDistance <- compute_tempdistance(newFlow,startPointList, endPointList, considerWeights)
    if (considerWeights) {considerWeights <- NULL} else {considerWeights <- NA}
    startVertex <- tGvN(tempNetwork,startTVertex,startPointList)
    endVertex <- tGvN(tempNetwork,endTVertex,endPointList)
    if(cutGraph){
      newTempGraph <- igraph::induced.subgraph(tG(tempNetwork),igV(tG(tempNetwork))[igV(tG(tempNetwork))$pointName %in% names(tP(newFlow))])
      gDistance <- igraph::distances( newTempGraph, v = startVertex, to = endVertex, mode =  "out", weights = considerWeights)
    } else{
      gDistance <- igraph::distances( tG(tempNetwork), v = startVertex, to = endVertex, mode =  "out", weights = considerWeights)
    }
    return(c(tDistance, gDistance-tDistance))
  } else {
    distList <- lapply(startPointList, function(sp) {
      l <- lapply(endPointList, function(ep) { compute_distance(tempNetwork, startTVertex, endTVertex, sp, ep, considerWeights, cutGraph, safe) })
      if(names){names(l) <- endPointList }
      return(l)
    })
    if(names){names(distList) <- startPointList }
    distList <- Filter(Negate(is.null), unlist(distList, recursive = FALSE))
    select <- sapply(distList, {function(x) all(sapply(distList, function(y) { x[1] <= y[1] && x[2] <= y[2] }))})
    return(distList[select])
  }
}




