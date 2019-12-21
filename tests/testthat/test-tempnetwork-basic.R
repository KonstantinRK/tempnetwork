context("test-tempnetwork-basic")
PATH = system.file("inst","testdata","tempflow", package = "tempnetwork")
PATH_GRAPH = system.file("inst","testdata","tempgraph", package = "tempnetwork")

PATH = system.file("inst","testdata","tempflow", package = "tempnetwork")
PATH_GRAPH = system.file("inst","testdata","tempgraph", package = "tempnetwork")

TF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_directed_acyclic_small_1.gml"), format = "graphml"))
TF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_directed_acyclic_small_1.gml"), format = "graphml"))
# TF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_forrest_small_1.gml"), format = "graphml"))
# TF4 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_tree_small_1.gml"), format = "graphml"))
# TF5 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_lattice_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)
#
#
# LTF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_directed_acyclic_loop_small_1.gml"), format = "graphml"))
# LTF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_directed_acyclic_loop_small_1.gml"), format = "graphml"))
# LTF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_forrest_loop_small_1.gml"), format = "graphml"))
# LTF4 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_tree_loop_small_1.gml"), format = "graphml"))
# LTF5 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_lattice_loop_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)
# LTF6 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_differentlyweighted_directed_acyclic_loop_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)
#
# STF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_singelton_1.gml"), format = "graphml"))
# STF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_singelton_noname_1.gml"), format = "graphml"))
# STF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_singelton_loop_1.gml"), format = "graphml"))
#
# WTF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_partialweighted_directed_acyclic_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)
#
# ETF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_example_2_6.gml"), format = "graphml"))
# ETF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_example_4_1.gml"), format = "graphml"))
# ETF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_example_4_2.gml"), format = "graphml"))


GL1 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v1")
GL2 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v2")
GL3 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v3")
# GL4 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_p13_n5_random50")
# GL5 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_p11_n5_random50", graphNameList = list("a","p11","p21","p22","p23","b","p31","p32","p41","p42","c"))
# GL6 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v1", graphNameList = list("t1", "t2", "t3", "t12", "t13"))


GL1TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$simple)
# GL2TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL2$simple)
# GL3TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL3$simple)

GL1TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL1$simple)
# GL2TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL2$simple)
# GL3TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL3$simple)
#
# GL4TF3 <- tempnetwork(tempFlow = TF3, equivalenceRelation = NULL, graphList = GL4$simple)
# GL4TF4 <- tempnetwork(tempFlow = TF4, equivalenceRelation = NULL, graphList = GL4$simple)
# GL4TF5 <- tempnetwork(tempFlow = TF5, equivalenceRelation = NULL, graphList = GL4$simple)
#
# GL1LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL1$simple)
# GL2LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL2$simple)
# GL3LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL3$simple)
#
# GL1LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL1$simple)
# GL2LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL2$simple)
# GL3LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL3$simple)
#
# GL4LTF3 <- tempnetwork(tempFlow = LTF3, equivalenceRelation = NULL, graphList = GL4$simple)
# GL4LTF4 <- tempnetwork(tempFlow = LTF4, equivalenceRelation = NULL, graphList = GL4$simple)
# GL4LTF5 <- tempnetwork(tempFlow = LTF5, equivalenceRelation = NULL, graphList = GL4$simple)
# GL1LTF6 <- tempnetwork(tempFlow = LTF6, equivalenceRelation = NULL, graphList = GL1$simple)
#
# GL0STF1 <- tempnetwork(tempFlow = STF1, equivalenceRelation = NULL, graphList = list("t1"=GL1$simple$t1))
# GL0STF2 <- tempnetwork(tempFlow = STF2, equivalenceRelation = NULL, graphList = list("1"=GL1$simple$t1))
# GL0STF3 <- tempnetwork(tempFlow = STF3, equivalenceRelation = NULL, graphList = list("t1"=GL1$simple$t1))
#
# GL5ETF1 <- tempnetwork(tempFlow = ETF1, equivalenceRelation = NULL, graphList = GL5$simple)
# GL6ETF2 <- tempnetwork(tempFlow = ETF2, equivalenceRelation = NULL, graphList = GL6$simple)


WGL1TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$weighted)
WGL2TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL2$weighted)
WGL3TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL3$weighted)
#
WGL1TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL1$weighted)
WGL2TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL2$weighted)
WGL3TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL3$weighted)

plot(TF2)
#
# WGL4TF3 <- tempnetwork(tempFlow = TF3, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL4TF4 <- tempnetwork(tempFlow = TF4, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL4TF5 <- tempnetwork(tempFlow = TF5, equivalenceRelation = NULL, graphList = GL4$weighted)
#
WGL1LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL1$weighted)
WGL2LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL2$weighted)
# WGL3LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL3$weighted)
#
#
WGL1LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL1$weighted)
WGL2LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL2$weighted)
# WGL3LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL3$weighted)
#
# WGL4LTF3 <- tempnetwork(tempFlow = LTF3, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL4LTF4 <- tempnetwork(tempFlow = LTF4, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL4LTF5 <- tempnetwork(tempFlow = LTF5, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL1LTF6 <- tempnetwork(tempFlow = LTF6, equivalenceRelation = NULL, graphList = GL1$weighted)
#
# WGL5ETF1 <- tempnetwork(tempFlow = ETF1, equivalenceRelation = NULL, graphList = GL5$weighted)
# WGL1ETF2 <- tempnetwork(tempFlow = ETF2, equivalenceRelation = NULL, graphList = GL6$weighted)



EGL1TF1 <- set_equivRelation(GL1TF1, eR(GL1TF1, TRUE))
# EGL2TF1 <- set_equivRelation(GL2TF1, eR(GL2TF1, TRUE))
# EGL3TF1 <- set_equivRelation(GL3TF1, eR(GL3TF1, TRUE))
#
# EGL1TF2 <- set_equivRelation(GL1TF2, eR(GL1TF2, TRUE))
# EGL2TF2 <- set_equivRelation(GL2TF2, eR(GL2TF2, TRUE))
# EGL3TF2 <- set_equivRelation(GL3TF2, eR(GL3TF2, TRUE))
#
#
# EGL4TF3 <- set_equivRelation(GL4TF3, eR(GL4TF3, TRUE))
# EGL4TF4 <- set_equivRelation(GL4TF4, eR(GL4TF4, TRUE))
# EGL4TF5 <- set_equivRelation(GL4TF5, eR(GL4TF5, TRUE))
#
# EGL1LTF1 <- set_equivRelation(GL1LTF1, eR(GL1LTF1, TRUE))
# EGL2LTF1 <- set_equivRelation(GL2LTF1, eR(GL2LTF1, TRUE))
# EGL3LTF1 <- set_equivRelation(GL3LTF1, eR(GL3LTF1, TRUE))
#
# EGL1LTF2 <- set_equivRelation(GL1LTF2, eR(GL1LTF2, TRUE))
# EGL2LTF2 <- set_equivRelation(GL2LTF2, eR(GL2LTF2, TRUE))
# EGL3LTF2 <- set_equivRelation(GL3LTF2, eR(GL3LTF2, TRUE))
#
# EGL4LTF3 <- set_equivRelation(GL4LTF3, eR(GL4LTF3, TRUE))
# EGL4LTF4 <- set_equivRelation(GL4LTF4, eR(GL4LTF4, TRUE))
# EGL4LTF5 <- set_equivRelation(GL4LTF5, eR(GL4LTF5, TRUE))
# EGL1LTF6 <- set_equivRelation(GL1LTF6, eR(GL1LTF6, TRUE))
#
# EGL0STF1 <- set_equivRelation(GL0STF1, eR(GL0STF1, TRUE))
# EGL0STF2 <- set_equivRelation(GL0STF2, eR(GL0STF2, TRUE))
# EGL0STF3 <- set_equivRelation(GL0STF3, eR(GL0STF3, TRUE))
#
# EGL5ETF1 <- set_equivRelation(GL5ETF1, eR(GL5ETF1, TRUE))
# EGL6ETF2 <- set_equivRelation(GL6ETF2, eR(GL6ETF2, TRUE))


# EWGL1TF1 <- set_equivRelation(WGL1TF1, eR(WGL1TF1, TRUE))
# EWGL2TF1 <- set_equivRelation(WGL2TF1, eR(WGL2TF1, TRUE))
# EWGL3TF1 <- set_equivRelation(WGL3TF1, eR(WGL3TF1, TRUE))
#
# EWGL1TF2 <- set_equivRelation(WGL1TF2, eR(WGL1TF2, TRUE))
# EWGL2TF2 <- set_equivRelation(WGL2TF2, eR(WGL2TF2, TRUE))
# EWGL3TF2 <- set_equivRelation(WGL3TF2, eR(WGL3TF2, TRUE))
#
# EWGL4TF3 <- set_equivRelation(WGL4TF3, eR(WGL4TF3, TRUE))
# EWGL4TF4 <- set_equivRelation(WGL4TF4, eR(WGL4TF4, TRUE))
# EWGL4TF5 <- set_equivRelation(WGL4TF5, eR(WGL4TF5, TRUE))
#
# EWGL1LTF1 <- set_equivRelation(WGL1LTF1, eR(WGL1LTF1, TRUE))
# EWGL2LTF1 <- set_equivRelation(WGL2LTF1, eR(WGL2LTF1, TRUE))
# EWGL3LTF1 <- set_equivRelation(WGL3LTF1, eR(WGL3LTF1, TRUE))
#
#
# EWGL1LTF2 <- set_equivRelation(WGL1LTF2, eR(WGL1LTF2, TRUE))
# EWGL2LTF2 <- set_equivRelation(WGL2LTF2, eR(WGL2LTF2, TRUE))
# EWGL3LTF2 <- set_equivRelation(WGL3LTF2, eR(WGL3LTF2, TRUE))
#
# EWGL4LTF3 <- set_equivRelation(WGL4LTF3, eR(WGL4LTF3, TRUE))
# EWGL4LTF4 <- set_equivRelation(WGL4LTF4, eR(WGL4LTF4, TRUE))
# EWGL4LTF5 <- set_equivRelation(WGL4LTF5, eR(WGL4LTF5, TRUE))
# EWGL1LTF6 <- set_equivRelation(WGL1LTF6, eR(WGL1LTF6, TRUE))
#
# EWGL5ETF1 <- set_equivRelation(WGL5ETF1, eR(WGL5ETF1, TRUE))
# EWGL1ETF2 <- set_equivRelation(WGL1ETF2, eR(WGL1ETF2, TRUE))

testER <-  list("a"=list("t1"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))

AllTestTempNetwork <- set_equivRelation(GL1TF1,testER)

test_that("test 'adjust_to_reduced_tempflow(tempNetwork, redTempFlow, safe = TRUE)'", {

  testTempNetwork <- adjust_to_reduced_tempflow(EGL1TF1, induce_flow(TF1,c("t2","t3","t4")))
  expect_equal(all(sapply(eR(testTempNetwork), function(x) names(x) == c("t2","t3","t4"))),TRUE)
  expect_equal(names(gL(testTempNetwork)), c("t2","t3","t4"))

  testTempNetwork <- adjust_to_reduced_tempflow(EGL1TF1, induce_flow(TF1,c("t2","t2","t4")))
  expect_equal(all(sapply(eR(testTempNetwork), function(x) names(x) == c("t2","t4"))),TRUE)
  expect_equal(names(gL(testTempNetwork)), c("t2","t4"))

  testTempNetwork <- adjust_to_reduced_tempflow(EGL1TF1, induce_flow(TF1,c("t1","t2","t3","t4","t5")))
  expect_equal(all(sapply(eR(testTempNetwork), function(x) names(x) == c("t1","t2","t3","t4","t5"))),TRUE)
  expect_equal(names(gL(testTempNetwork)), c("t1","t2","t3","t4","t5"))



  testTempNetwork <- adjust_to_reduced_tempflow(GL1TF1, induce_flow(TF1,c("t2","t3","t4")))
  expect_equal(all(sapply(eR(testTempNetwork), function(x) names(x) == c("t2","t3","t4"))),TRUE)
  expect_equal(eR(testTempNetwork), NULL)
  expect_equal(names(gL(testTempNetwork)), c("t2","t3","t4"))

  testTempNetwork <- adjust_to_reduced_tempflow(GL1TF1, induce_flow(TF1,c("t2","t2","t4")))
  expect_equal(all(sapply(eR(testTempNetwork,TRUE), function(x) names(x) == c("t2","t4"))),TRUE)
  expect_equal(eR(testTempNetwork), NULL)
  expect_equal(names(gL(testTempNetwork)), c("t2","t4"))

  testTempNetwork <- adjust_to_reduced_tempflow(GL1TF1, induce_flow(TF1,c("t1","t2","t3","t4","t5")))
  expect_equal(all(sapply(eR(testTempNetwork,TRUE), function(x) names(x) == c("t1","t2","t3","t4","t5"))),TRUE)
  expect_equal(eR(testTempNetwork), NULL)
  expect_equal(names(gL(testTempNetwork)), c("t1","t2","t3","t4","t5"))

  # testTempNetwork <- adjust_to_reduced_tempflow(GL1TF1, induce_flow(TF1,c()))
  # expect_equal(length(eR(testTempNetwork,TRUE)), 0)
  # expect_equal(eR(testTempNetwork), NULL)
  # expect_equal(length(gL(testTempNetwork)), 0)


  expect_error(adjust_to_reduced_tempflow(GL1TF1,G(TF1)) )

  expect_error(adjust_to_reduced_tempflow(EGL1TF1, induce_flow(TF1,c())), error_message_tempflow_empty() )


  testTempNetwork <- GL1TF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <-  adjust_to_reduced_tempflow(GL1TF1, induce_flow(TF1,c("t1","t2","t3","t4","t5")))
  expect_equal(tG(testTempNetwork),NULL)



})


test_that("test 'add_tvertices(tempNetwork, tVertexNameList, gVertexNameList = rep(tVertexNameList, each = length(tP(tempNetwork))), pointNameList = NULL, safe = TRUE)'", {

  testTempNetwork <- add_tvertices(GL1TF1, "v6")
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1, c("v6","v7"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1, c("v6","v7", "v8"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))


  testTempNetwork <- add_tvertices(GL1TF1, "v6", c("v6","v6","v6","v6","v6"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1, c("v6","v7"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1, c("v6","v7", "v8"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))



  testTempNetwork <- add_tvertices(GL1TF1, c("v6","v6","v6","v6","v6"), c("v6","v6","v6","v6","v6"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1,c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1,c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))




  testTempNetwork <- add_tvertices(GL1TF1, "v6", pointNameList = c("t1","t2","t3","t4","t5"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1, c("v6","v7"), pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1, c("v6","v7", "v8"), pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))


  testTempNetwork <- add_tvertices(GL1TF1, "v6", c("v6","v6","v6","v6","v6"),pointNameList = c("t1","t2","t3","t4","t5"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1, c("v6","v7"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"),pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1, c("v6","v7", "v8"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"),pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))



  testTempNetwork <- add_tvertices(GL1TF1, c("v6","v6","v6","v6","v6"), c("v6","v6","v6","v6","v6"),pointNameList = c("t1","t2","t3","t4","t5"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1,c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"),pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1,c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"),pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))




  checkList <- list("t1"=c("v1","v2","v3","v4","v5","a"),
                    "t2"=c("v1","v2","v3","v4","v5","b"),
                    "t3"=c("v1","v2","v3","v4","v5","c"),
                    "t4"=c("v1","v2","v3","v4","v5","d"),
                    "t5"=c("v1","v2","v3","v4","v5","e"))

  testTempNetwork <- add_tvertices(GL1TF1, "v6", c("a","b","c","d","e"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==checkList[[x]]} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1, c("v6","v7"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(GL1TF1, c("v6","v7", "v8"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))




  testTempNetwork <- add_tvertices(EGL1TF1, "v6")
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1, c("v6","v7"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1, c("v6","v7", "v8"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))


  testTempNetwork <- add_tvertices(EGL1TF1, "v6", c("v6","v6","v6","v6","v6"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1, c("v6","v7"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1, c("v6","v7", "v8"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))



  testTempNetwork <- add_tvertices(EGL1TF1, c("v6","v6","v6","v6","v6"), c("v6","v6","v6","v6","v6"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1,c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1,c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))



  ####


  testTempNetwork <- add_tvertices(EGL1TF1, "v6", pointNameList = c("t1","t2","t3","t4","t5"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1, c("v6","v7"), pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1, c("v6","v7", "v8"), pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))


  testTempNetwork <- add_tvertices(EGL1TF1, "v6", c("v6","v6","v6","v6","v6"),pointNameList = c("t1","t2","t3","t4","t5"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1, c("v6","v7"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"),pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1, c("v6","v7", "v8"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"),pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))



  testTempNetwork <- add_tvertices(EGL1TF1, c("v6","v6","v6","v6","v6"), c("v6","v6","v6","v6","v6"),pointNameList = c("t1","t2","t3","t4","t5"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1,c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"),pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1,c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"),pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))


  ######

  checkList <- list("t1"=c("v1","v2","v3","v4","v5","a"),
                    "t2"=c("v1","v2","v3","v4","v5","b"),
                    "t3"=c("v1","v2","v3","v4","v5","c"),
                    "t4"=c("v1","v2","v3","v4","v5","d"),
                    "t5"=c("v1","v2","v3","v4","v5","e"))

  testTempNetwork <- add_tvertices(EGL1TF1, "v6", c("a","b","c","d","e"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==checkList[[x]]} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1, c("v6","v7"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7"))
  sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))})
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))

  testTempNetwork <- add_tvertices(EGL1TF1, c("v6","v7", "v8"),c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v8","v8","v8","v8","v8"))
  expect_equal(all(sapply(names(gL(testTempNetwork)), function(x){ names(gV(testTempNetwork,x))==c("v1","v2","v3","v4","v5","v6","v7","v8")} )), TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v1","v2","v3","v4","v5","v6","v7","v8"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v6"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v7"]]), c("t1","t2","t3","t4","t5"))
  expect_equal(names(eR(testTempNetwork,TRUE)[["v8"]]), c("t1","t2","t3","t4","t5"))

  expect_error(add_tvertices(EGL1TF1, c("v6","v7", "v3"),
                             c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v3","v3","v3","v3","v3"),
                             pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
               , error_message_equivrel_not_equal_length_to_vertices())
  expect_error(add_tvertices(EGL1TF1, c("v6","v7", "v3"),
                             c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v3","v8","v8","v8","v8"),
                             pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
               , error_message_equivrel_not_equal_length_to_vertices())
  expect_error(add_tvertices(EGL1TF1, c("v6","v7", "v8"),
                             c("v1","v6","v6","v6","v6","v7","v7","v7","v7","v7","v3","v8","v8","v8","v8"),
                             pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
               , error_message_equivclass_not_disjoined())
  expect_error(add_tvertices(EGL1TF1, c("v6","v7", "v8"),
                             c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v3","v8","v8","v8","v8"),
                             pointNameList = c("t1","t1","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
               , )
  expect_error(add_tvertices(EGL1TF1, c("v6","v7", "v8"),
                             c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v3","v8","v8","v8","v8"),
                             pointNameList = c("t9","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
               , error_message_not_tempflow_equivclass_index_equality())

  expect_error(add_tvertices(EGL1TF1, c("v6","v7", "v8","v8"),
                             c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v3","v8","v8","v8","v8"),
                             pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
               , error_message_vector_not_equal_length())
  expect_error(add_tvertices(EGL1TF1, c("v6","v7", "v8","v9"),
                             c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v3","v8","v8","v8","v8"),
                             pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
               , error_message_vector_not_equal_length())
  expect_error(add_tvertices(EGL1TF1, c("v6","v7", "v8"),
                             c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v3","v8","v8","v8"),
                             pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4","t5"))
               , error_message_vector_not_equal_length())
  expect_error(add_tvertices(EGL1TF1, c("v6","v7", "v8"),
                             c("v6","v6","v6","v6","v6","v7","v7","v7","v7","v7","v3","v8","v8","v8","v8"),
                             pointNameList = c("t1","t2","t3","t4","t5","t1","t2","t3","t4","t5","t1","t2","t3","t4"))
               , error_message_vector_not_equal_length())


  testTempNetwork <- GL1TF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- add_tvertices(GL1TF1, "v6")
  expect_equal(tG(testTempNetwork),NULL)
})


test_that("test 'remove_tvertices(tempNetwork, tVertexNameList, safe = TRUE)'", {

  testTempNetwork <- remove_tvertices(EGL1TF1, c("v1","v5"))
  expect_equal(names(eR(testTempNetwork)), c("v2","v3","v4"))
  expect_equal(all(sapply(gL(testTempNetwork), function(x) names(igV(x)) == c("v2","v3","v4"))), TRUE )

  testTempNetwork <- remove_tvertices(GL1TF1, c("v1","v5"))
  expect_equal(eR(testTempNetwork),NULL)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("v2","v3","v4"))
  expect_equal(all(sapply(gL(testTempNetwork), function(x) names(igV(x)) == c("v2","v3","v4"))), TRUE )

  testTempNetwork <- remove_tvertices(AllTestTempNetwork, c("a","e"))
  expect_equal(names(eR(testTempNetwork)), c("b","c","d"))
  expect_equal(all(sapply(gL(testTempNetwork), function(x) names(igV(x)) == c("v2","v3","v4"))), TRUE )

  expect_error(remove_tvertices(GL1TF1, c("v1","v5", "v5")),error_message_vector_not_unique())
  expect_error(remove_tvertices(GL1TF1, c("v1","v5", "v9")),error_message_tvertex_not_exists())

  expect_error(remove_tvertices(EGL1TF1, c("v1","v5", "v5")),error_message_vector_not_unique())
  expect_error(remove_tvertices(EGL1TF1, c("v1","v5", "v9")),error_message_tvertex_not_exists())

  testTempNetwork <- GL1TF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- remove_tvertices(GL1TF1, c("v1","v5"))
  expect_equal(tG(testTempNetwork),NULL)

})




test_that("test 'add_gedges(tempNetwork, pointNameList, startTVertexList, endTVertexList, safe = TRUE)'", {
  testTempNetwork <- add_gedges(GL1TF1, c("t1","t3","t1"), c("v1","v1","v1"), c("v3","v4","v5"))
  expect_equal(length(gE(testTempNetwork,"t1")),length(gE(GL1TF1,"t1"))+2)
  expect_equal(length(gE(testTempNetwork,"t3")),length(gE(GL1TF1,"t3"))+1)

  testTempNetwork <- add_gedges(GL1TF1, c("t1","t3","t1"), c("v1","v1","v1"), c("v2","v4","v5"))
  expect_equal(length(gE(testTempNetwork,"t1")),length(gE(GL1TF1,"t1"))+2)
  expect_equal(length(gE(testTempNetwork,"t3")),length(gE(GL1TF1,"t3"))+1)

  testTempNetwork <- add_gedges(WGL1TF1, c("t1","t3","t1"), c("v1","v1","v1"), c("v2","v4","v5"), c(2,3,4))
  expect_equal(length(gE(testTempNetwork,"t1")),length(gE(GL1TF1,"t1"))+2)
  expect_equal(sum(gE(testTempNetwork,"t1")$weight, na.rm = TRUE),sum(gE(WGL1TF1,"t1")$weight, na.rm = TRUE)+6)
  expect_equal(length(gE(testTempNetwork,"t3")),length(gE(GL1TF1,"t3"))+1)
  expect_equal(sum(gE(testTempNetwork,"t3")$weight, na.rm = TRUE),sum(gE(WGL1TF1,"t3")$weight, na.rm = TRUE)+3)

  testTempNetwork <- add_gedges(WGL1TF1, c("t1","t3","t1"), c("v1","v1","v1"), c("v2","v4","v5"), 5)
  expect_equal(length(gE(testTempNetwork,"t1")),length(gE(GL1TF1,"t1"))+2)
  expect_equal(sum(gE(testTempNetwork,"t1")$weight, na.rm = TRUE),sum(gE(WGL1TF1,"t1")$weight, na.rm = TRUE)+10)
  expect_equal(length(gE(testTempNetwork,"t3")),length(gE(GL1TF1,"t3"))+1)
  expect_equal(sum(gE(testTempNetwork,"t3")$weight, na.rm = TRUE),sum(gE(WGL1TF1,"t3")$weight, na.rm = TRUE)+5)


  expect_error(add_gedges(GL1TF1, c("t1","t9","t1"), c("v1","v1","v1"), c("v3","v4","v5")), error_message_point_not_exists())
  expect_error(add_gedges(GL1TF1, c("t1","t3","t1"), c("v9","v1","v1"), c("v3","v4","v5")), error_message_tvertex_not_exists())
  expect_error(add_gedges(GL1TF1, c("t1","t3","t1"), c("v1","v1","v1"), c("v3","v9","v5")), error_message_tvertex_not_exists())

  expect_error(add_gedges(GL1TF1, c("t1","t3"), c("v1","v1","v1"), c("v3","v4","v5")), error_message_vector_not_equal_length())
  expect_error(add_gedges(GL1TF1, c("t1","t3","t1"), c("v1","v1"), c("v3","v4","v5")), error_message_vector_not_equal_length())
  expect_error(add_gedges(GL1TF1, c("t1","t3","t1"), c("v1","v1","v1"), c("v4","v5")), error_message_vector_not_equal_length())
  expect_error(add_gedges(WGL1TF1, c("t1","t3","t1"), c("v1","v1","v1"), c("v2","v4","v5"), c(3,4)), error_message_vector_not_equal_length_and_not_one())

  testTempNetwork <- GL1TF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- add_gedges(GL1TF1, c("t1","t3","t1"), c("v1","v1","v1"), c("v3","v4","v5"))
  expect_equal(tG(testTempNetwork),NULL)

})


test_that("test 'remove_gedges(tempNetwork, pointNameList, startTVertexList, endTVertexList , safe = TRUE)'", {

  testTempNetwork <- remove_gedges(GL1TF1, c("t1","t3","t1"), c("v1","v2","v1"), c("v2","v3","v4"))
  expect_equal(length(gE(testTempNetwork,"t1")),length(gE(GL1TF1,"t1"))-2)
  expect_equal(length(gE(testTempNetwork,"t3")),length(gE(GL1TF1,"t3"))-1)

  expect_error(remove_gedges(GL1TF1, c("t1","t2","t1"), c("v1","v1","v1"), c("v5","v5","v5")), error_message_edge_not_exist())

  expect_error(remove_gedges(GL1TF1, c("t1","t9","t1"), c("v1","v1","v1"), c("v3","v4","v5")), error_message_point_not_exists())
  expect_error(remove_gedges(GL1TF1, c("t1","t3","t1"), c("v9","v1","v1"), c("v3","v4","v5")), error_message_tvertex_not_exists())
  expect_error(remove_gedges(GL1TF1, c("t1","t3","t1"), c("v1","v1","v1"), c("v3","v9","v5")), error_message_tvertex_not_exists())

  expect_error(remove_gedges(GL1TF1, c("t1","t3"), c("v1","v1","v1"), c("v3","v4","v5")), error_message_vector_not_equal_length())
  expect_error(remove_gedges(GL1TF1, c("t1","t3","t1"), c("v1","v1"), c("v3","v4","v5")), error_message_vector_not_equal_length())
  expect_error(remove_gedges(GL1TF1, c("t1","t3","t1"), c("v1","v1","v1"), c("v4","v5")), error_message_vector_not_equal_length())

  testTempNetwork <- GL1TF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- remove_gedges(GL1TF1, c("t1","t3","t1"), c("v1","v2","v1"), c("v2","v3","v4"))
  expect_equal(tG(testTempNetwork),NULL)


})



test_that("test 'construct_underlying_graph(tempNetwork)'", {

  testTempGraph <- construct_underlying_graph(GL1TF2)
  expect_equal(names(igV(testTempGraph)),  c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5", "t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5", "t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5", "t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5", "t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t1") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t2") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t3") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t4") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t5") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5"))), TRUE)


  testTempGraph <- construct_underlying_graph(AllTestTempNetwork)
  expect_equal(names(igV(testTempGraph)),  c("t1av1", "t1bv2", "t1cv3", "t1dv4", "t1ev5", "t2av1", "t2bv2", "t2cv3", "t2dv4", "t2ev5", "t3av1", "t3bv2", "t3cv3", "t3dv4", "t3ev5", "t4av1", "t4bv2", "t4cv3", "t4dv4", "t4ev5", "t5av1", "t5bv2", "t5cv3", "t5dv4", "t5ev5"))
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t1") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t1av1", "t1bv2", "t1cv3", "t1dv4", "t1ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t2") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t2av1", "t2bv2", "t2cv3", "t2dv4", "t2ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t3") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t3av1", "t3bv2", "t3cv3", "t3dv4", "t3ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t4") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t4av1", "t4bv2", "t4cv3", "t4dv4", "t4ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t5") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t5av1", "t5bv2", "t5cv3", "t5dv4", "t5ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1av1","t2av1","t3av1","t4av1","t5av1"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1bv2","t2bv2","t3bv2","t4bv2","t5bv2"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1cv3","t2cv3","t3cv3","t4cv3","t5cv3"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1dv4","t2dv4","t3dv4","t4dv4","t5dv4"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1ev5","t2ev5","t3ev5","t4ev5","t5ev5"))), TRUE)


  testTempGraph <- construct_underlying_graph(GL1TF2, connectGraphs = FALSE)
  expect_equal(names(igV(testTempGraph)),  c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5", "t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5", "t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5", "t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5", "t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t1") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t2") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t3") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t4") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t5") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))), TRUE )
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5")))), 0)


  testTempGraph <- construct_underlying_graph(AllTestTempNetwork, connectGraphs = FALSE)
  expect_equal(names(igV(testTempGraph)),  c("t1av1", "t1bv2", "t1cv3", "t1dv4", "t1ev5", "t2av1", "t2bv2", "t2cv3", "t2dv4", "t2ev5", "t3av1", "t3bv2", "t3cv3", "t3dv4", "t3ev5", "t4av1", "t4bv2", "t4cv3", "t4dv4", "t4ev5", "t5av1", "t5bv2", "t5cv3", "t5dv4", "t5ev5"))
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t1") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t1av1", "t1bv2", "t1cv3", "t1dv4", "t1ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t2") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t2av1", "t2bv2", "t2cv3", "t2dv4", "t2ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t3") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t3av1", "t3bv2", "t3cv3", "t3dv4", "t3ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t4") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t4av1", "t4bv2", "t4cv3", "t4dv4", "t4ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t5") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t5av1", "t5bv2", "t5cv3", "t5dv4", "t5ev5"))), TRUE )
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1av1","t2av1","t3av1","t4av1","t5av1")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1bv2","t2bv2","t3bv2","t4bv2","t5bv2")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1cv3","t2cv3","t3cv3","t4cv3","t5cv3")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1dv4","t2dv4","t3dv4","t4dv4","t5dv4")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1ev5","t2ev5","t3ev5","t4ev5","t5ev5")))), 0)


  testTempGraph <- construct_underlying_graph(WGL1TF2)
  expect_equal(names(igV(testTempGraph)),  c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5", "t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5", "t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5", "t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5", "t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(WGL1TF2,"t1") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(WGL1TF2,"t2") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(WGL1TF2,"t3") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(WGL1TF2,"t4") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(WGL1TF2,"t5") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))), TRUE )

  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(WGL1TF2,"t1") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(WGL1TF2,"t2") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(WGL1TF2,"t3") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(WGL1TF2,"t4") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(WGL1TF2,"t5") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5")), "weight")),TRUE)

  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(WGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(WGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(WGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(WGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(WGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5")), "weight")),TRUE)


  expect_equal(igraph::is_isomorphic_to(G(tF(WGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(WGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(WGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(WGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(WGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5"))), TRUE)


  attrL <- list(
    "t1"=c(1,2,3,4),
    "t2"=c(5,6,7,8),
    "t3"=c(9,10,11,12,13),
    "t4"=c(14,15,16,17,18),
    "t5"=c(19,20,21,22,23,24))
  AGL <- lapply(names(gL(WGL1TF2)), function(x) igraph::set.edge.attribute(gG(WGL1TF2, x), "test", value=attrL[[x]]))
  names(AGL) <- names(gL(WGL1TF2))
  AWGL1TF2 <- set_graphList(WGL1TF2, AGL)
  testTempGraph <- construct_underlying_graph(AWGL1TF2)
  expect_equal(names(igV(testTempGraph)),  c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5", "t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5", "t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5", "t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5", "t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(AWGL1TF2,"t1") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(AWGL1TF2,"t2") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(AWGL1TF2,"t3") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(AWGL1TF2,"t4") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(AWGL1TF2,"t5") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))), TRUE )

  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t1") , mode = "mutual"), "test"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5")), "test")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t2") , mode = "mutual"), "test"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5")), "test")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t3") , mode = "mutual"), "test"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5")), "test")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t4") , mode = "mutual"), "test"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5")), "test")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t5") , mode = "mutual"), "test"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5")), "test")),TRUE)

  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t1") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t2") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t3") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t4") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t5") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5")), "weight")),TRUE)

  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(AWGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(AWGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(AWGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(AWGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(AWGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5")), "weight")),TRUE)

  expect_equal(setequal(c(NA), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1")), "test")),TRUE)
  expect_equal(setequal(c(NA), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2")), "test")),TRUE)
  expect_equal(setequal(c(NA), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3")), "test")),TRUE)
  expect_equal(setequal(c(NA), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4")), "test")),TRUE)
  expect_equal(setequal(c(NA), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5")), "test")),TRUE)


  expect_equal(igraph::is_isomorphic_to(G(tF(AWGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(AWGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(AWGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(AWGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(WGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5"))), TRUE)






  TGL1TF2 <- GL1TF2
  TGL1TF2$storeTempGraph <- TRUE
  testTempGraph <- tG(construct_underlying_graph(TGL1TF2))
  expect_equal(names(igV(testTempGraph)),  c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5", "t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5", "t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5", "t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5", "t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t1") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t2") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t3") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t4") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t5") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5"))), TRUE)

  TAllTestTempNetwork <- AllTestTempNetwork
  TAllTestTempNetwork$storeTempGraph <- TRUE
  testTempGraph <- tG(construct_underlying_graph(TAllTestTempNetwork))
  expect_equal(names(igV(testTempGraph)),  c("t1av1", "t1bv2", "t1cv3", "t1dv4", "t1ev5", "t2av1", "t2bv2", "t2cv3", "t2dv4", "t2ev5", "t3av1", "t3bv2", "t3cv3", "t3dv4", "t3ev5", "t4av1", "t4bv2", "t4cv3", "t4dv4", "t4ev5", "t5av1", "t5bv2", "t5cv3", "t5dv4", "t5ev5"))
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t1") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t1av1", "t1bv2", "t1cv3", "t1dv4", "t1ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t2") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t2av1", "t2bv2", "t2cv3", "t2dv4", "t2ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t3") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t3av1", "t3bv2", "t3cv3", "t3dv4", "t3ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t4") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t4av1", "t4bv2", "t4cv3", "t4dv4", "t4ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t5") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t5av1", "t5bv2", "t5cv3", "t5dv4", "t5ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1av1","t2av1","t3av1","t4av1","t5av1"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1bv2","t2bv2","t3bv2","t4bv2","t5bv2"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1cv3","t2cv3","t3cv3","t4cv3","t5cv3"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1dv4","t2dv4","t3dv4","t4dv4","t5dv4"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(GL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1ev5","t2ev5","t3ev5","t4ev5","t5ev5"))), TRUE)

  TGL1TF2 <- GL1TF2
  TGL1TF2$storeTempGraph <- TRUE
  testTempGraph <- tG(construct_underlying_graph(TGL1TF2, connectGraphs = FALSE))
  expect_equal(names(igV(testTempGraph)),  c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5", "t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5", "t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5", "t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5", "t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t1") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t2") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t3") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t4") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t5") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))), TRUE )
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5")))), 0)

  TAllTestTempNetwork <- AllTestTempNetwork
  TAllTestTempNetwork$storeTempGraph <- TRUE
  testTempGraph <- tG(construct_underlying_graph(TAllTestTempNetwork,connectGraphs = FALSE))
  expect_equal(names(igV(testTempGraph)),  c("t1av1", "t1bv2", "t1cv3", "t1dv4", "t1ev5", "t2av1", "t2bv2", "t2cv3", "t2dv4", "t2ev5", "t3av1", "t3bv2", "t3cv3", "t3dv4", "t3ev5", "t4av1", "t4bv2", "t4cv3", "t4dv4", "t4ev5", "t5av1", "t5bv2", "t5cv3", "t5dv4", "t5ev5"))
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t1") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t1av1", "t1bv2", "t1cv3", "t1dv4", "t1ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t2") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t2av1", "t2bv2", "t2cv3", "t2dv4", "t2ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t3") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t3av1", "t3bv2", "t3cv3", "t3dv4", "t3ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t4") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t4av1", "t4bv2", "t4cv3", "t4dv4", "t4ev5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(GL1TF2,"t5") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t5av1", "t5bv2", "t5cv3", "t5dv4", "t5ev5"))), TRUE )
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1av1","t2av1","t3av1","t4av1","t5av1")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1bv2","t2bv2","t3bv2","t4bv2","t5bv2")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1cv3","t2cv3","t3cv3","t4cv3","t5cv3")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1dv4","t2dv4","t3dv4","t4dv4","t5dv4")))), 0)
  expect_equal(length(igE(igraph::induced_subgraph(testTempGraph, c("t1ev5","t2ev5","t3ev5","t4ev5","t5ev5")))), 0)

  TGL1TF2 <- WGL1TF2
  TGL1TF2$storeTempGraph <- TRUE
  testTempGraph <- tG(construct_underlying_graph(TGL1TF2))
  expect_equal(names(igV(testTempGraph)),  c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5", "t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5", "t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5", "t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5", "t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(WGL1TF2,"t1") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(WGL1TF2,"t2") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(WGL1TF2,"t3") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(WGL1TF2,"t4") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(WGL1TF2,"t5") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))), TRUE )

  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(WGL1TF2,"t1") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(WGL1TF2,"t2") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(WGL1TF2,"t3") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(WGL1TF2,"t4") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(WGL1TF2,"t5") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5")), "weight")),TRUE)

  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(WGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(WGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(WGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(WGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(WGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5")), "weight")),TRUE)


  expect_equal(igraph::is_isomorphic_to(G(tF(WGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(WGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(WGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(WGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(WGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5"))), TRUE)


  attrL <- list(
    "t1"=c(1,2,3,4),
    "t2"=c(5,6,7,8),
    "t3"=c(9,10,11,12,13),
    "t4"=c(14,15,16,17,18),
    "t5"=c(19,20,21,22,23,24))
  AGL <- lapply(names(gL(WGL1TF2)), function(x) igraph::set.edge.attribute(gG(WGL1TF2, x), "test", value=attrL[[x]]))
  names(AGL) <- names(gL(WGL1TF2))
  AWGL1TF2 <- set_graphList(WGL1TF2, AGL)
  AWGL1TF2$storeTempGraph <- TRUE
  testTempGraph <- tG(construct_underlying_graph(AWGL1TF2))
  expect_equal(names(igV(testTempGraph)),  c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5", "t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5", "t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5", "t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5", "t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(AWGL1TF2,"t1") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(AWGL1TF2,"t2") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(AWGL1TF2,"t3") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(AWGL1TF2,"t4") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5"))), TRUE )
  expect_equal(igraph::is_isomorphic_to(igraph::as.directed(gG(AWGL1TF2,"t5") , mode = "mutual"), igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5"))), TRUE )

  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t1") , mode = "mutual"), "test"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5")), "test")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t2") , mode = "mutual"), "test"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5")), "test")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t3") , mode = "mutual"), "test"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5")), "test")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t4") , mode = "mutual"), "test"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5")), "test")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t5") , mode = "mutual"), "test"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5")), "test")),TRUE)

  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t1") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v1v1", "t1v2v2", "t1v3v3", "t1v4v4", "t1v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t2") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t2v1v1", "t2v2v2", "t2v3v3", "t2v4v4", "t2v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t3") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t3v1v1", "t3v2v2", "t3v3v3", "t3v4v4", "t3v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t4") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t4v1v1", "t4v2v2", "t4v3v3", "t4v4v4", "t4v5v5")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(gG(AWGL1TF2,"t5") , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t5v1v1", "t5v2v2", "t5v3v3", "t5v4v4", "t5v5v5")), "weight")),TRUE)

  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(AWGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(AWGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(AWGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(AWGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4")), "weight")),TRUE)
  expect_equal(setequal(igraph::get.edge.attribute(igraph::as.directed(G(tF(AWGL1TF2)) , mode = "mutual"), "weight"), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5")), "weight")),TRUE)

  expect_equal(setequal(c(NA), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1")), "test")),TRUE)
  expect_equal(setequal(c(NA), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2")), "test")),TRUE)
  expect_equal(setequal(c(NA), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3")), "test")),TRUE)
  expect_equal(setequal(c(NA), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4")), "test")),TRUE)
  expect_equal(setequal(c(NA), igraph::get.edge.attribute(igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5")), "test")),TRUE)


  expect_equal(igraph::is_isomorphic_to(G(tF(AWGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v1v1","t2v1v1","t3v1v1","t4v1v1","t5v1v1"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(AWGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v2v2","t2v2v2","t3v2v2","t4v2v2","t5v2v2"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(AWGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v3v3","t2v3v3","t3v3v3","t4v3v3","t5v3v3"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(AWGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v4v4","t2v4v4","t3v4v4","t4v4v4","t5v4v4"))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(tF(WGL1TF2)), igraph::induced_subgraph(testTempGraph, c("t1v5v5","t2v5v5","t3v5v5","t4v5v5","t5v5v5"))), TRUE)
})













test_that("test 'compute_distance(tempNetwork, startTVertex, endTVertex, startPoint, endPoint, considerWeights = TRUE, cutGraph = TRUE, safe = TRUE)'", {


})










