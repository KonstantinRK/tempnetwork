#' Returns the 'tempflow'-object of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The 'tempflow'-object of the given 'tempnetwork'-object.
tF.tempnetwork <- function(tempNetwork){
  return(tempNetwork$tempFlow)
}


#' Returns the flag indicating whether the graph representation of the 'tempnetwork'-object
#' should be stored.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return A boolean value indicating whether the graph representation of the 'tempnetwork'-object should be stored.
stG.tempnetwork <- function(tempNetwork){
  return(tempNetwork$storeTempGraph)
}



#' Returns the names of the temporal vertices (i.e. the names of the equivalence classes in the "equivRel") of the given 'tempnetwork'-object
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The names of the temporal vertices (i.e. the names of the equivalence classes in the "equivRel") of the given 'tempnetwork'-object
tV.tempnetwork <- function(tempNetwork){
  return(names(eR(tempNetwork)))
}

#' Returns the graph-list of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The graph-list of the given 'tempnetwork'-object.
gL.tempnetwork <- function(tempNetwork){
  return(tempNetwork$graphList)
}


#' Returns the value stored in the field "tempGraph" of the given 'tempnetwork'-object. This can either be the value NULL
#' or the graph representation of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param computeTempGraph If TRUE the graph representation of the given 'tempnetwork'-object will be computed (if necessary).
#' @return The value stored in the field "tempGraph" of the given 'tempnetwork'-object.
tG.tempnetwork <- function(tempNetwork, computeTempGraph = FALSE, connectGraphs = TRUE){
  if(is.null(tempNetwork$tempGraph) && computeTempGraph ) {return(construct_underlying_graph(tempNetwork, connectGraphs, TRUE))}
  else {return(tempNetwork$tempGraph)}
}

#' Returns the equivalence-relation of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @return The equivalence-relation of the given 'tempnetwork'-object.
eR.tempnetwork <- function(tempNetwork, computeEquivRel = FALSE){
  if(is.null(tempNetwork$equivRel)&& computeEquivRel){
    if(length(gL(tempNetwork))==0) {return(list())}
    names <- gV(tempNetwork, 1)$name
    if(is.null(names)) { names <-gV(tempNetwork, 1)}
    times <- tP(tempNetwork)$name
    if(is.null(names)) { times <-tP(tempNetwork)}
    return(compute_equivrelation(names, times))
   } else {
    return(tempNetwork$equivRel)
  }
}


#' Computes a default equivalence relation under the assumption that the vertex sets are identical.
#' That is, it starts by creating a list indexed by the names found in the parameter "defaultNameList".
#' Furthermore, each entry will be populated by a named list with it's names being the one's found in the "pointNameList" parameter
#' and with its values corresponding index of said list in the primary list.
#' E.g. compute_equivrelation(c("a","b","c","d"), c("t1","t2","t3")) ==
#' list("a"= list("t1"=a ,"t2"=a ,"t3"=a),"b"= list("t1"=b ,"t2"=b ,"t3"=b) ,"c"= list("t1"=c ,"t2"=c ,"t3"=c), "d"= list("t1"=d ,"t2"=d ,"t3"=d))
#'
#' @param defaultNameList A vector containing strings representing  temporal vertex names, as well as the vertex names of each graph in some graph list.
#' @param pointNameList A vector containing strings representing the point names of an tempflow.
#' @return An equivalence relation as described above.
compute_equivrelation <- function(defaultNameList, pointNameList){
    return(setNames(lapply(defaultNameList, function(x) {setNames(as.list(rep(x,length(pointNameList))), pointNameList)}), defaultNameList))
}

#' Returns a graph from the "graphList" (from the given 'tempnetwork'-object) specified by the parameter "pointName".
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param pointName A string corresponding with the name of a point in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return The 'igraph'-object from the "graphList" (from the given 'tempnetwork'-object) specified by the parameter "pointName".
gG.tempnetwork <- function(tempNetwork, pointName, safe = TRUE){
  if(safe) { check_point_name(tF(tempNetwork), pointName) }
  return(gL(tempNetwork)[[pointName]])
}

#' Returns the vertex set of the graph from the "graphList" (from the given 'tempnetwork'-object) specified by the parameter "pointName".
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param pointName A string corresponding with the name of a point in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return The 'igraph'-vertex set of the graph from the "graphList" (from the given 'tempnetwork'-object) specified by the parameter "pointName".
gV.tempnetwork <- function(tempNetwork, pointName, safe = TRUE){
  if(length(gL(tempNetwork))==0) {return(list())}
  return(igV(gG(tempNetwork, pointName, safe)))
}

#' Returns the vertex set of the graph from the "graphList" (from the given 'tempnetwork'-object) specified by the parameter "pointName".
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param pointName A string corresponding with the name of a point in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @return The 'igraph'-vertex set of the graph from the "graphList" (from the given 'tempnetwork'-object) specified by the parameter "pointName".
gE.tempnetwork <- function(tempNetwork, pointName, safe = TRUE){
  if(length(gL(tempNetwork))==0) {return(list())}
  return(igE(gG(tempNetwork, pointName, safe)))
}


#' Queries the equivalence relation to obtain the name of instance of the tVertex "tVertexName" at the point "pointName"
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param tVertexName A string corresponding with the name of a tVertex specified in the "equigRel"  of the given 'tempnetwork'-object.
#' @param pointName A string corresponding with the name of a point in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param safe If TRUE, it will be ensured that "tVertexName" and "pointName" exist.
#' @return A string corresponding to the name of a vertex in the graph indexed by "pointName", that was assigned membership to the
#' equivalence class "tVertexName" by the "equivRel" of the given "tempnetwork"-object.
get_vertexname.tempnetwork <- function(tempNetwork, tVertexName, pointName, safe = TRUE){

  if(safe){
    if(!check_tvertices_exists(tempNetwork,tVertexName)) {error_tvertex_not_exists()}
    if(!check_points_exists(tempNetwork,pointName)) {error_point_not_exists()}
  }

  if(is.null(eR(tempNetwork))){
    if(safe){ if(tVertexName %in% gV(tempNetwork,1)){error_vertex_not_exists()}}
    return(tVertexName)
  } else {
    v <- eR(tempNetwork)[[tVertexName]][[pointName]]
    if(safe){ if(is.null(v)){error_vertex_not_exists()}}
    return(v)
  }
}

#' Queries the equivalence relation to obtain the name of instance of the tVertex "tVertexName" at the point "pointName"
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param tVertexName A vector of strings corresponding with the names of equivalence-classes in the equivalence-relation of the given 'tempnetwork'-object.
#' @param pointName A vector of strings corresponding with the names of points in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param safe If TRUE, it will be ensured that all entries in "tVertexNameList" and "pointNameList" exist in their respective data structures.
#' @return A vector of String corresponding to the names of vertices in the graphs indexed by the entries in the "pointNameList"-vector, that was assigned membership to the
#' equivalence class "tVertexNameList" by the "equivRel" of the given "tempnetwork"-object.
get_vertexnames.tempnetwork <- function(tempNetwork, tVertexNameList, pointNameList, safe = TRUE){
  return(mapply(function(tv,tp) {get_vertexname(tempNetwork, tv, tp, safe = safe)}, tVertexNameList, pointNameList))
}

#' Using the tVertex name and the point name this function computes the name of the corresponding vertex
#' in the tempGraph representation of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param tVertexName A string corresponding with the name of a tVertex specified in the "equigRel"  of the given 'tempnetwork'-object.
#' @param pointName A string corresponding with the name of a point in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param safe If TRUE, it will be ensured that "tVertexName" and "pointName" exist.
#' @return A string representing the name of the corresponding vertex in the tempGraph representation of the given 'tempnetwork'-object.
get_tempgraph_vertex_name.tempnetwork <-  function(tempNetwork, tVertexName, pointName,  safe = TRUE){
  if(safe){
    if(!check_tvertices_exists(tempNetwork,tVertexName)) {error_tvertex_not_exists()}
    if(!check_points_exists(tempNetwork,pointName)) {error_point_not_exists()}
  }
  return(base_get_tempgraph_vertex_name(tVertexName,pointName,get_vertexname(tempNetwork,tVertexName,pointName)))
}


#' Using the tVertex name and the point name this function computes the name of the corresponding vertex
#' in the tempGraph representation of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param tVertexName A string corresponding with the name of an equivalence class specified in the "equigRel"  of the given 'tempnetwork'-object.
#' @param pointName A string corresponding with the name of a point in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param safe If TRUE, it will be ensured that "tVertexName" and "pointName" exist.
#' @return A string representing the name of the corresponding vertex in the tempGraph representation of the given 'tempnetwork'-object.
tGvN.tempnetwork <- function(tempNetwork, tVertexName, pointName,  safe = TRUE){
  return(get_tempgraph_vertex_names(tempNetwork, tVertexName, pointName,  safe ))
}




#' Concatenate the strings tVertexName, pointName and vertexName with an empty separator.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param tVertexName A string.
#' @param pointName A string.
#' @param vertexName A string.
#' @return A concatenated string composed of the strings tVertexName, pointName and vertexName joined through the empty seperator.
base_get_tempgraph_vertex_name <- function(tVertexName, pointName, vertexName){
  return(paste(pointName,tVertexName,vertexName, sep=""))
}


#' Using the strings in the tVertexNameList-vector and the strings in the pointNameList-vector function computes the names of the corresponding vertices
#' in the tempGraph representation of the given 'tempnetwork'-object.
#'
#' @param tempNetwork A 'tempnetwork'-object.
#' @param tVertexNameList A vector of strings corresponding with the names of the equivalence classes specified in the "equigRel"  of the given 'tempnetwork'-object.
#' @param pointNameList A vector of strings corresponding with the names of points in the 'tempflow'-object of the given 'tempnetwork'-object.
#' @param safe If TRUE, it will be ensured that every equivalence class specified in the "tVertexNameList"-vector and every point in the "pointNameList"-vector exist
#' in their respective structures found in the given 'tempnetwork'-object.
#' @return A vector of strings representing the names of the corresponding vertices in the tempGraph representation of the given 'tempnetwork'-object.
get_tempgraph_vertex_names.tempnetwork <-  function(tempNetwork, tVertexNameList, pointNameList, safe = TRUE){
  return(mapply(function(tv,tp) get_tempgraph_vertex_name(tempNetwork,tv,tp,safe),tVertexNameList, pointNameList))
}


