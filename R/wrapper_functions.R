#' Returns the vertices of the given 'igraph'-object.
#'
#' @param graph A 'igraph'-object.
#' @return The vertices of the given 'igraph'-object.
igV <- function(graph){
  return(igraph::V(graph))
}

#' Returns the edges of the given 'igraph'-object.
#'
#' @param graph A 'igraph'-object.
#' @return The vertices of the given 'igraph'-object.
igE <- function(graph){
  return(igraph::E(graph))
}
