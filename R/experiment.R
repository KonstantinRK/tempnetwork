#
# TF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml"))
# TF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml"))
# TF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_forrest_small_1.gml", package = "tempnetwork"), format = "graphml"))
# TF4 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_tree_small_1.gml", package = "tempnetwork"), format = "graphml"))
# TF5 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_lattice_small_1.gml", package = "tempnetwork"), format = "graphml"), TRUE)
#
#
# LTF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_directed_acyclic_loop_small_1.gml", package = "tempnetwork"), format = "graphml"))
# LTF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_acyclic_loop_small_1.gml", package = "tempnetwork"), format = "graphml"))
# LTF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_forrest_loop_small_1.gml", package = "tempnetwork"), format = "graphml"))
# LTF4 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_tree_loop_small_1.gml", package = "tempnetwork"), format = "graphml"))
# LTF5 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_lattice_loop_small_1.gml", package = "tempnetwork"), format = "graphml"), TRUE)
# LTF6 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_differentlyweighted_directed_acyclic_loop_small_1.gml", package = "tempnetwork"), format = "graphml"), TRUE)
#
# STF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_1.gml", package = "tempnetwork"), format = "graphml"))
# STF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_noname_1.gml", package = "tempnetwork"), format = "graphml"))
# STF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_loop_1.gml", package = "tempnetwork"), format = "graphml"))
#
# WTF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_partialweighted_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml"), TRUE)
#
# ETF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_2_6.gml", package = "tempnetwork"), format = "graphml"))
# ETF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_4_1.gml", package = "tempnetwork"), format = "graphml"))
# ETF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_4_2.gml", package = "tempnetwork"), format = "graphml"))
#
# plot(ETF1)
#
# plot(induce_flow(insert_point(ETF1, "d", c("p31", "p41"), c("p32", "p42", "c"), c(10,20,30,40,50), removeEdges = FALSE), c("p31", "p41","p32", "p42", "c","d")))
#
#
#
#
#
#
# Graph <- igraph::erdos.renyi.game(10000,0.25)
#
# add_test <- function(Graph){
#   igraph::add.vertices(Graph,1000)
# }
#
# build_test <- function(Graph){
#   igraph::erdos.renyi.game(11000,0.25)
# }
#
# test_foo_1 <- function(Graph) {
#   start_time <- Sys.time()
#   add_test(Graph)
#   end_time <- Sys.time()
#   return(end_time - start_time)
# }
#
#
# test_foo_2 <- function(Graph) {
#   start_time <- Sys.time()
#   build_test(Graph)
#   end_time <- Sys.time()
#   return(end_time - start_time)
# }
#
# test_foo_1(Graph)
# test_foo_2(Graph)

#length(igraph::V(G(TF1))[name == "t3"])

