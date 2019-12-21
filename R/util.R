

generate_test_data <- function(path, p, n, r, weighted = FALSE, directed = FALSE){
  sapply(c(1:p), function(x) {
    path_add <- ""
    if(directed) {
      graph <- igraph::random.graph.game(n,r, directed = directed)
      if(path_add == "") {path_add <- "directed"} else { path_add <- paste(path_add, "directed", sep = "_")}

    } else {graph <- igraph::random.graph.game(n,r)}
    if(weighted) {
      graph <- igraph::set_edge_attr(graph, "weight",  value = round(runif(igraph::E(graph), 1 , 100), 0))
      if(path_add == "") {path_add <- "weighted"} else { path_add <- paste(path_add, "weighted", sep = "_")}
    }
    if(path_add == "") {path_add <- "simple"}
    igraph::write_graph(graph, file.path(path, sprintf("tempgraph_p%s_n%s_random%s", p,n,as.integer(100*r)) , path_add, sprintf("graph_%s.gml", x)), "graphml")
  } )
}


read_graph_list <- function(path, name, graph_type, nameList = NULL) {
  fileList <- list.files(path=file.path(path, name, graph_type))
  GL <- lapply(fileList, function(x) {
      return(igraph::read.graph(file.path(path,name,graph_type, x), format = "graphml"))
    })
  if(length(GL)==0) {return(GL)}
  if(is.null(nameList) || length(nameList) != length(fileList)) {
    names(GL) <- sapply(c(1:length(GL)), function(x) sprintf("t%s",x))
  } else {
    names(GL) <- nameList
  }
  return(GL)
}


read_graph_list_all_variants <- function(path, name, nameList=NULL, graphNameList=NULL) {
  fileList <- list.files(path=file.path(path, name))
  GL <- lapply(fileList, function(x)
  { read_graph_list(path,name,x,graphNameList) })
  if(length(GL)==0) {return(GL)}
  if(is.null(nameList) || length(nameList) != length(fileList)) { names(GL) <- fileList} else { names(GL) <- nameList }
  return(GL)
}
