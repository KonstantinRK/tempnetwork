context("test-tempnetwork-tempflow-basics")
PATH = system.file("inst","testdata","tempflow", package = "tempnetwork")
PATH_GRAPH = system.file("inst","testdata","tempgraph", package = "tempnetwork")

TF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_directed_acyclic_small_1.gml"), format = "graphml"))
TF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_directed_acyclic_small_1.gml"), format = "graphml"))
# TF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_forrest_small_1.gml"), format = "graphml"))
# TF4 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_tree_small_1.gml"), format = "graphml"))
# TF5 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_lattice_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)
#
#
LTF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_directed_acyclic_loop_small_1.gml"), format = "graphml"))
LTF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_directed_acyclic_loop_small_1.gml"), format = "graphml"))
# LTF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_forrest_loop_small_1.gml"), format = "graphml"))
# LTF4 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_tree_loop_small_1.gml"), format = "graphml"))
# LTF5 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_lattice_loop_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)
# LTF6 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_differentlyweighted_directed_acyclic_loop_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)
#
STF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_singelton_1.gml"), format = "graphml"))
STF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_singelton_noname_1.gml"), format = "graphml"))
STF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_singelton_loop_1.gml"), format = "graphml"))

# WTF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_partialweighted_directed_acyclic_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)
#
ETF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_example_2_6.gml"), format = "graphml"))
# ETF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_example_4_1.gml"), format = "graphml"))
# ETF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_example_4_2.gml"), format = "graphml"))


GL1 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v1")
# GL2 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v2")
# GL3 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v3")
# GL4 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_p13_n5_random50")
GL5 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_p11_n5_random50", graphNameList = list("a","p11","p21","p22","p23","b","p31","p32","p41","p42","c"))
# GL6 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v1", graphNameList = list("t1", "t2", "t3", "t12", "t13"))


GL1TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$simple)
# GL2TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL2$simple)
# GL3TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL3$simple)
#
# GL1TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL1$simple)
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
GL0STF1 <- tempnetwork(tempFlow = STF1, equivalenceRelation = NULL, graphList = list("t1"=GL1$simple$t1))
GL0STF2 <- tempnetwork(tempFlow = STF2, equivalenceRelation = NULL, graphList = list("1"=GL1$simple$t1))
GL0STF3 <- tempnetwork(tempFlow = STF3, equivalenceRelation = NULL, graphList = list("t1"=GL1$simple$t1))
#
# GL5ETF1 <- tempnetwork(tempFlow = ETF1, equivalenceRelation = NULL, graphList = GL5$simple)
# GL6ETF2 <- tempnetwork(tempFlow = ETF2, equivalenceRelation = NULL, graphList = GL6$simple)
#
#
WGL1TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$weighted)
# WGL2TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL2$weighted)
# WGL3TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL3$weighted)
#
WGL1TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL1$weighted)
# WGL2TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL2$weighted)
# WGL3TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL3$weighted)
#
# WGL4TF3 <- tempnetwork(tempFlow = TF3, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL4TF4 <- tempnetwork(tempFlow = TF4, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL4TF5 <- tempnetwork(tempFlow = TF5, equivalenceRelation = NULL, graphList = GL4$weighted)
#
WGL1LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL1$weighted)
# WGL2LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL2$weighted)
# WGL3LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL3$weighted)
#
#
WGL1LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL1$weighted)
# WGL2LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL2$weighted)
# WGL3LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL3$weighted)
#
# WGL4LTF3 <- tempnetwork(tempFlow = LTF3, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL4LTF4 <- tempnetwork(tempFlow = LTF4, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL4LTF5 <- tempnetwork(tempFlow = LTF5, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL1LTF6 <- tempnetwork(tempFlow = LTF6, equivalenceRelation = NULL, graphList = GL1$weighted)
#
WGL5ETF1 <- tempnetwork(tempFlow = ETF1, equivalenceRelation = NULL, graphList = GL5$weighted)
# WGL1ETF2 <- tempnetwork(tempFlow = ETF2, equivalenceRelation = NULL, graphList = GL6$weighted)
#
#
#
# EGL1TF1 <- set_equivRelation(GL1TF1, eR(GL1TF1, TRUE))
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
#
#
EWGL1TF1 <- set_equivRelation(WGL1TF1, eR(WGL1TF1, TRUE))
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
EWGL1LTF1 <- set_equivRelation(WGL1LTF1, eR(WGL1LTF1, TRUE))
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


test_that("test 'add_points(tempNetwork, newPointList, graphList, equivRel, attrList = NULL, safe = TRUE)'", {
  addGL <- list("t6" = GL1$simple$t1, "t7" = GL1$simple$t2)
  addER <- list("v1"=list("t6"= "v1","t7"= "v1"), "v2"=list("t6"= "v2","t7"= "v2"),
                "v3"=list("t6"= "v3","t7"= "v3"), "v4"=list("t6"= "v4","t7"= "v4"),
                "v5"=list("t6"= "v5","t7"= "v5"))

  expect_equal(length(tP(add_points(WGL1LTF1, c("t6","t7"), addGL))), 7)
  expect_equal(tP(add_points(WGL1LTF1, c("t6","t7"), addGL))$name, c("t1", "t2", "t3", "t4", "t5", "t6", "t7"))
  expect_equal(tP(add_points(WGL1LTF1, c("t6","t7"), addGL, attrList = list("RealName" = c("a", "b"))))$name, c("t1", "t2", "t3", "t4", "t5", "t6", "t7"))
  expect_equal(tP(add_points(WGL1LTF1, c("t6","t7"), addGL, attrList = list("RealName" = c("a", "b"))))$RealName, c(NA, NA, NA, NA, NA, "a", "b"))
  expect_equal(tP(add_points(WGL1LTF1, c("t6","t7"), addGL, attrList = list("RealName" = c("a"))))$RealName, c(NA, NA, NA, NA, NA, "a", "a"))
  expect_equal(igraph::is_isomorphic_to(G(WGL1LTF1), G(add_points(WGL1LTF1, c(), list()))), TRUE)

  expect_equal(length(tP(add_points(EWGL1LTF1, c("t6","t7"), addGL))), 7)
  expect_equal(length(gL(add_points(EWGL1LTF1, c("t6","t7"), addGL))), 7)
  expect_equal(all(sapply(gL(add_points(EWGL1LTF1, c("t6","t7"), addGL)), function(x) class(x)=="igraph")), TRUE)
  expect_equal(all(sapply(eR(add_points(EWGL1LTF1, c("t6","t7"), addGL)), function(x) length(x)==7)), TRUE)
  expect_equal(names(tP(add_points(EWGL1LTF1, c("t6","t7"), addGL))), c("t1", "t2", "t3", "t4", "t5", "t6", "t7"))
  expect_equal(names(gL(add_points(EWGL1LTF1, c("t6","t7"), addGL))), c("t1", "t2", "t3", "t4", "t5", "t6", "t7"))
  expect_equal(all(sapply(eR(add_points(EWGL1LTF1, c("t6","t7"), addGL)), function(x) names(x)==c("t1", "t2", "t3", "t4", "t5", "t6", "t7"))), TRUE)


  expect_equal(length(tP(add_points(EWGL1LTF1, c("t6","t7"), addGL,addER ))), 7)
  expect_equal(length(gL(add_points(EWGL1LTF1, c("t6","t7"), addGL,addER))), 7)
  expect_equal(all(sapply(gL(add_points(EWGL1LTF1, c("t6","t7"), addGL,addER)), function(x) class(x)=="igraph")), TRUE)
  expect_equal(all(sapply(eR(add_points(EWGL1LTF1, c("t6","t7"), addGL,addER)), function(x) length(x)==7)), TRUE)
  expect_equal(names(tP(add_points(EWGL1LTF1, c("t6","t7"), addGL,addER))), c("t1", "t2", "t3", "t4", "t5", "t6", "t7"))
  expect_equal(names(gL(add_points(EWGL1LTF1, c("t6","t7"), addGL,addER))), c("t1", "t2", "t3", "t4", "t5", "t6", "t7"))
  expect_equal(all(sapply(eR(add_points(EWGL1LTF1, c("t6","t7"), addGL,addER)), function(x) names(x)==c("t1", "t2", "t3", "t4", "t5", "t6", "t7"))), TRUE)



  expect_error(tP(add_points(WGL1LTF1, c("t6","t7","t8"), addGL, attrList = list("RealName" = c("a","b"))))$RealName, error_message_vector_not_equal_length_and_not_one())
  expect_error(tP(add_points(WGL1LTF1, c("t6","t7","t8"), addGL, attrList = list("RealName" = c("a", "b", "c","d"))))$name, error_message_vector_not_equal_length_and_not_one())
  expect_error(add_points(WGL1LTF1, c("t5","t7"), addGL), error_message_names_not_unique())
  expect_error(add_points(WGL1LTF1, c("t6","t6"), addGL), error_message_names_not_unique())

  E1addGL <- list("t9" = GL1$simple$t1, "t7" = GL1$simple$t2)
  expect_error(add_points(EWGL1LTF1, c("t6","t7"), E1addGL), error_message_not_tempflow_graphlist_index_equality())

  E1addER <- list("v1"=list("t6"= "v2","t7"= "v1"), "v2"=list("t6"= "v2","t7"= "v2"),
                  "v3"=list("t6"= "v3","t7"= "v3"), "v4"=list("t6"= "v4","t7"= "v4"),
                  "v5"=list("t6"= "v5","t7"= "v5"))
  expect_error(add_points(EWGL1LTF1, c("t6","t7"), addGL, E1addER), error_message_equivclass_not_disjoined())


  E2addER <- list("v1"=list("t6"= "a","t7"= "v1"), "v2"=list("t6"= "v2","t7"= "v2"),
                  "v3"=list("t6"= "v3","t7"= "v3"), "v4"=list("t6"= "v4","t7"= "v4"),
                  "v5"=list("t6"= "v5","t7"= "v5"))
  expect_error(add_points(EWGL1LTF1, c("t6","t7"), addGL, E2addER), error_message_equivalenceclass_is_not_exhaustive())

  E3addER <- list("v1"=list("t6"= "v1","t9"= "v1"), "v2"=list("t6"= "v2","t7"= "v2"),
                  "v3"=list("t6"= "v3","t7"= "v3"), "v4"=list("t6"= "v4","t7"= "v4"),
                  "v5"=list("t6"= "v5","t7"= "v5"))
  expect_error(add_points(EWGL1LTF1, c("t6","t7"), addGL, E3addER), error_message_not_tempflow_equivclass_index_equality())

  E4addER <- list("v1"=list("t6"= "v1","t7"= "v1"), "v1"=list("t6"= "v2","t7"= "v2"),
                  "v3"=list("t6"= "v3","t7"= "v3"), "v4"=list("t6"= "v4","t7"= "v4"),
                  "v5"=list("t6"= "v5","t7"= "v5"))
  expect_error(add_points(EWGL1LTF1, c("t6","t7"), addGL, E4addER), error_message_not_tempflow_equivclass_index_equality())

  E5addER <- list("v1"=list("t6"= "v1","t7"= "v1"), "v2"=list("t6"= "v2","t7"= "v2"),
                  "v3"=list("t6"= "v3","t7"= "v3"), "v4"=list("t6"= "v4","t7"= "v4"),
                  "v6"=list("t6"= "v6","t7"= "v6"), "v5"=list("t6"= "v5","t7"= "v5"))
  expect_error(add_points(EWGL1LTF1, c("t6","t7"), addGL, E5addER), error_message_not_tempflow_equivclass_index_equality())


  E6addER <- list("v1"=list("t6"= "v1","t7"= "v1"), "v2"=list("t6"= "v2","t7"= "v2"),
                  "v3"=list("t6"= "v3","t7"= "v3"), "v4"=list("t6"= "v4","t7"= "v4"),
                  "v5"=list("t6"= "v5","t7"= "v5","t8"= "v7"))
  expect_error(add_points(EWGL1LTF1, c("t6","t7"), addGL, E6addER), error_message_not_tempflow_equivclass_index_equality())

  E7addER <- list("v1"=list("t6"= "v1","t7"= "v1"), "v2"=list("t6"= "v2","t7"= "v2"),
                  "v3"=list("t6"= "v3","t7"= "v3"), "v4"=list("t6"= "v4","t7"= "v4"),
                  "v6"=list("t1"= "v6","t2"= "v6","t3"= "v6","t4"= "v6","t5"= "v6","t6"= "v6","t7"= "v6"),
                  "v5"=list("t6"= "v5","t7"= "v5"))
  expect_error(add_points(EWGL1LTF1, c("t6","t7"), addGL, E7addER), error_message_equivrel_not_equal_length_to_vertices())


  testTempNetwork <- WGL1LTF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- add_points(WGL1LTF1, c("t6","t7"), addGL)
  expect_equal(tG(testTempNetwork),NULL)
})



test_that("test 'delete_points(tempFlow, deletePointList, safe = TRUE) '", {

  expect_equal(tP(delete_points(WGL1LTF1, c()))$name, c("t1", "t2", "t3","t4", "t5"))
  expect_equal(names(gL(delete_points(WGL1LTF1, c()))), c("t1", "t2", "t3","t4", "t5"))

  expect_equal(tP(delete_points(WGL1LTF1, c(NULL)))$name, c("t1", "t2", "t3", "t4", "t5"))
  expect_equal(names(gL(delete_points(WGL1LTF1, c(NULL)))), c("t1", "t2", "t3", "t4", "t5"))

  expect_equal(tP(delete_points(WGL1LTF1, c("t3","t3")))$name, c("t1", "t2", "t4", "t5"))
  expect_equal(names(gL(delete_points(WGL1LTF1, c("t3","t3")))), c("t1", "t2", "t4", "t5"))

  expect_equal(tP(delete_points(WGL1LTF1, c(3,4)))$name, c("t1", "t2", "t5"))
  expect_equal(names(gL(delete_points(WGL1LTF1, c(3,4)))), c("t1", "t2", "t5"))

  expect_error(delete_points(WGL1LTF1, c(1,2,3,4,5)), error_message_tempflow_empty())
  expect_error(delete_points(WGL1LTF1, c("t3","t7")), error_message_name_not_in_object())

  expect_error(delete_points(WGL1LTF1, c("t3","t7")), error_message_name_not_in_object())
  expect_error(delete_points(WGL1LTF1, c(NA, "t3")), error_message_name_not_in_object())
  expect_error(delete_points(WGL1LTF1, c(NaN, "t3")), error_message_name_not_in_object())
  expect_error(delete_points(WGL1LTF1, c(3,7)), error_message_ids_not_in_object())
  expect_error(delete_points(WGL1LTF1, c(3,"t3")), error_message_name_not_in_object())

  testTempNetwork <- WGL1LTF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- delete_points(WGL1LTF1, c("t3","t3"))
  expect_equal(tG(testTempNetwork),NULL)
})



test_that("test 'add_steps(tempFlow, srcPointList, dstPointList, weightList = NULL, attrList = NULL, safe = TRUE)'", {


  expect_equal(igraph::get.edge.ids(G(add_steps(WGL1TF1, c(1,3),c(5,4))), c("t1","t5"), error = FALSE)>0, TRUE)
  expect_equal(igraph::get.edge.ids(G(add_steps(WGL1TF1, c(1,3),c(5,4))), c("t3","t4"), error = FALSE)>0, TRUE)

  expect_equal(igraph::get.edge.ids(G(add_steps(WGL1TF1, c("t1","t3"),c("t5","t4"))), c("t1","t5"), error = FALSE)>0, TRUE)
  expect_equal(igraph::get.edge.ids(G(add_steps(WGL1TF1, c("t1","t3"),c("t5","t4"))), c("t3","t4"), error = FALSE)>0, TRUE)

  expect_equal(igraph::get.edge.ids(G(add_steps(WGL1TF1, c(1,3),c("t5","t4"))), c("t1","t5"), error = FALSE)>0, TRUE)
  expect_equal(igraph::get.edge.ids(G(add_steps(WGL1TF1, c("t1","t3"),c(5,4))), c("t3","t4"), error = FALSE)>0, TRUE)

  expect_equal(igraph::get.edge.ids(G(add_steps(WGL1TF1, c("t1","t3"),c("t1","t3"))), c("t1","t1"), error = FALSE)>0, TRUE)
  expect_equal(igraph::get.edge.ids(G(add_steps(WGL1TF1, c("t1","t3"),c("t1","t3"))), c("t3","t3"), error = FALSE)>0, TRUE)

  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3"),c("t1","t4")))$weight[length(tS(WGL1TF1))+1], 0)
  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3"),c("t1","t4")))$weight[length(tS(WGL1TF1))+2], 1)
  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3"),c("t1","t4"), c(20,40)))$weight[length(tS(WGL1TF1))+1], 20)
  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3"),c("t1","t4"), c(20,40)))$weight[length(tS(WGL1TF1))+2], 40)

  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20)))$weight[length(tS(WGL1TF1))+1], 20)
  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20)))$weight[length(tS(WGL1TF1))+2], 20)
  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20)))$weight[length(tS(WGL1TF1))+3], 20)

  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c"), "rname"= c("a","b","c"))))$name[length(tS(WGL1TF1))+1], "a")
  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c"), "rname"= c("a","b","c"))))$name[length(tS(WGL1TF1))+2], "b")
  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c"), "rname"= c("a","b","c"))))$name[length(tS(WGL1TF1))+3], "c")

  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c"), "rname"= c("a","b","c"))))$rname[length(tS(WGL1TF1))+1], "a")
  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c"), "rname"= c("a","b","c"))))$rname[length(tS(WGL1TF1))+2], "b")
  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c"), "rname"= c("a","b","c"))))$rname[length(tS(WGL1TF1))+3], "c")

  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), weightList = c(20,40,60), attrList = list("name"= c("a","b","c"), "weight"= c(30,50,70))))$weight[length(tS(WGL1TF1))+1], 20)
  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), weightList = c(20,40,60), attrList = list("name"= c("a","b","c"), "weight"= c(30,50,70))))$weight[length(tS(WGL1TF1))+2], 40)
  expect_equal(tS(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), weightList = c(20,40,60), attrList = list("name"= c("a","b","c"), "weight"= c(30,50,70))))$weight[length(tS(WGL1TF1))+3], 60)

  expect_error(add_steps(WGL1TF1, c("t1",3),c("t5",4)), error_message_name_not_in_object())
  expect_error(add_steps(WGL1TF1, c("t1","t2"),c("t2","t5")), error_message_not_simple())
  expect_error(add_steps(WGL1TF1, c("t1","t2"),c("t7","t5")), error_message_name_not_in_object())
  expect_error(add_steps(WGL1TF1, c("t1","t2","t3"),c("t4","t5")), error_message_vector_not_equal_length())
  expect_error(add_steps(WGL1TF1, c("t1","t2"),c("t4","t5","t3")), error_message_vector_not_equal_length())
  expect_error(add_steps(WGL1TF1, c("t1","t2", NULL),c("t4","t5","t3")), error_message_vector_not_equal_length())

  expect_error(add_steps(WGL1TF1, c("t1",NA),c("t4","t5")), error_message_name_not_in_object())
  expect_error(add_steps(WGL1TF1, c("t1","t2"),c("t4",NA)), error_message_name_not_in_object())
  expect_error(add_steps(WGL1TF1, c("t1",NaN),c("t4","t5")), error_message_name_not_in_object())
  expect_error(add_steps(WGL1TF1, c("t1","t2"),c("t4",NaN)), error_message_name_not_in_object())

  expect_error(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20,40)), error_message_vector_not_equal_lengths_and_not_one())
  expect_error(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(-20,40,60)), error_message_weights_not_nonnegative())
  expect_error(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20,"40",60)), error_message_weights_not_numeric())
  expect_error(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20,NA,60)), error_message_weights_not_numeric())
  expect_error(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20,NaN,60)), error_message_weights_not_numeric())

  expect_error(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b"))), error_message_vector_not_equal_lengths_and_not_one())
  expect_error(add_steps(WGL1TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c","d"))), error_message_vector_not_equal_lengths_and_not_one())

  testTempNetwork <- WGL1LTF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- add_steps(WGL1TF1, c("t1","t3"),c("t1","t4"))
  expect_equal(tG(testTempNetwork),NULL)
})



test_that("test 'delete_steps_from_id(tempFlow, stepIDList, safe = TRUE)'", {

  expect_equal(sum(igraph::get.edge.ids(G(delete_steps_from_id(WGL1LTF1,c(6,7))), c("t1","t1","t2","t2"), error = FALSE)), 0)
  expect_equal(sum(igraph::get.edge.ids(G(delete_steps_from_id(WGL1LTF1,c(6,7))), c("t1","t1","t2","t2"), error = FALSE)), 0)

  expect_equal(sum(igraph::get.edge.ids(G(delete_steps_from_id(WGL1TF1,c(1,4))), c("t1","t2","t4","t5"), error = FALSE)), 0)
  expect_equal(sum(igraph::get.edge.ids(G(delete_steps_from_id(WGL1TF1,c(1,4,1))), c("t1","t2","t4","t5"), error = FALSE)), 0)


  expect_error(delete_steps(WGL1TF1,c(1,9), c(1,5)), error_message_ids_not_in_object())
  expect_error(delete_steps(WGL1TF1,c(1,4), c(1,9)), error_message_ids_not_in_object())
  expect_error(delete_steps(WGL1TF1,c(1,2,NA), c(2,3,4)), error_message_ids_not_in_object())
  expect_error(delete_steps(WGL1TF1,c(1,2,3), c(2,3,NA)), error_message_ids_not_in_object())
  expect_error(delete_steps(WGL1TF1,c(1,2,NaN), c(2,3,4)), error_message_ids_not_in_object())
  expect_error(delete_steps(WGL1TF1,c(1,2,3), c(2,3,NaN)), error_message_ids_not_in_object())
  expect_error(delete_steps(WGL1TF1,c(1,"t2"), c(2,3)), error_message_name_not_in_object())
  expect_error(delete_steps(WGL1TF1,c(1,2), c(2,"t3")), error_message_name_not_in_object())
  expect_error(delete_steps(WGL1TF1,c("t1","t2"), c("t2","t5")), error_message_edge_not_exist())

  testTempNetwork <- WGL1LTF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- delete_steps_from_id(WGL1LTF1,c(6,7))
  expect_equal(tG(testTempNetwork),NULL)

})

test_that("test 'delete_steps(tempFlow, srcPointList, dstPointList, safe = TRUE)'", {

  expect_equal(sum(igraph::get.edge.ids(G(delete_steps(WGL1TF1,c("t1","t4"), c("t2","t5"))), c("t1","t2","t4","t5"), error = FALSE)), 0)
  expect_equal(sum(igraph::get.edge.ids(G(delete_steps(WGL1LTF1,c("t1","t2"), c("t1","t2"))), c("t1","t1","t2","t2"), error = FALSE)), 0)
  expect_equal(sum(igraph::get.edge.ids(G(delete_steps(WGL1TF1,c("t1","t4","t1"), c("t2","t5","t2"))), c("t1","t2","t4","t5"), error = FALSE)), 0)

  expect_equal(sum(igraph::get.edge.ids(G(delete_steps(WGL1TF1,c(1,4), c(2,5))), c("t1","t2","t4","t5"), error = FALSE)), 0)
  expect_equal(sum(igraph::get.edge.ids(G(delete_steps(WGL1LTF1,c(1,2), c("t1","t2"))), c("t1","t1","t2","t2"), error = FALSE)), 0)
  expect_equal(sum(igraph::get.edge.ids(G(delete_steps(WGL1TF1,c(1,4,1), c(2,5,2))), c("t1","t2","t4","t5"), error = FALSE)), 0)


  expect_error(delete_steps(WGL1TF1,c("t1","t6"), c("t2","t5")), error_message_name_not_in_object())
  expect_error(delete_steps(WGL1TF1,c("t1","t4"), c("t2","t6")), error_message_name_not_in_object())
  expect_error(delete_steps(WGL1TF1,c("t1","t4"), c("t5","t5")), "One of the specified edges does not exist.")
  expect_error(delete_steps(WGL1TF1,c("t1","t4","t2"), c("t5", "t5", NA)), error_message_name_not_in_object())
  expect_error(delete_steps(WGL1TF1,c("t1","t4",NA), c("t5", "t5", "t3")), error_message_name_not_in_object())
  expect_error(delete_steps(WGL1TF1,c("t1","t4","t2"), c("t5", "t5", NaN)), error_message_name_not_in_object())
  expect_error(delete_steps(WGL1TF1,c("t1","t4",NaN), c("t5", "t5", "t3")), error_message_name_not_in_object())

  expect_error(delete_steps(WGL1TF1,c("t1","t4","t2"), c("t5", "t5", NULL)), error_message_vector_not_equal_length())
  expect_error(delete_steps(WGL1TF1,c("t1","t4",NULL), c("t5", "t5", "t3")), error_message_vector_not_equal_length())
  expect_error(delete_steps(WGL1TF1,c("t1","t4","t2"), c("t5", "t5")), error_message_vector_not_equal_length())
  expect_error(delete_steps(WGL1TF1,c("t1","t4"), c("t5", "t5", "t3")), error_message_vector_not_equal_length())

  testTempNetwork <- WGL1LTF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- delete_steps(WGL1TF1,c("t1","t4"), c("t2","t5"))
  expect_equal(tG(testTempNetwork),NULL)

})


test_that("test 'insert_point(tempFlow, newPoint, srcPointList, dstPointList, weightList = NULL, attrList = NULL, removeEdges = TRUE, safe = TRUE)'", {
  checkER <- list("v1"=list("t1"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1","tX"= "v1"),
                  "v2"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2","tX"= "v2"),
                  "v3"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3","tX"= "v3"),
                  "v4"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4","tX"= "v4"),
                  "v5"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5","tX"= "v5"))

  addGL <- list("tX" = GL1$simple$t1)
  addER <- list("v1"=list("tX"= "v1"), "v2"=list("tX"= "v2"),
                "v3"=list("tX"= "v3"), "v4"=list("tX"= "v4"),
                "v5"=list("tX"= "v5"))

  addGLeX <- list("tX" = GL5$simple$a)
  addEReX <- list("v1"=list("tX"= "1"), "v2"=list("tX"= "2"),
                "v3"=list("tX"= "3"), "v4"=list("tX"= "4"),
                "v5"=list("tX"= "5"))

  # insert_point(WGL5ETF1, "tX", c(), c(),addGLeX)
  # sapply(names(tP(WGL5ETF1)), function(x) gV(WGL5ETF1, x))

  tempNetwork <-insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"),addGL)
  gtempNetwork <-insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"), GL1$simple$t1)
  eTempNetwork <- insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"), addGL, equivRel = addER)
  eeTempNetwork <- insert_point(EWGL1TF1, "tX", c("t3","t4"), c("t5"), addGL, equivRel = addER)
  expect_equal(eR(tempNetwork), NULL)
  expect_equal(eR(eTempNetwork), checkER)
  expect_equal(eR(eeTempNetwork), checkER)

  E1addGL <- list("tY" = GL1$simple$t1)
  expect_error(insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"),E1addGL), error_message_not_tempflow_graphlist_index_equality())

  E1addER <- list("v1"=list("tX"="v2"), "v2"=list("tX"="v2"),
                  "v3"=list("tX"="v3"), "v4"=list("tX"="v4"),
                  "v5"=list("tX"="v5"))
  expect_error(insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"),addGL, equivRel = E1addER), error_message_equivclass_not_disjoined())

  E2addER <- list("v1"=list("tX"="v"), "v2"=list("tX"="v2"),
                  "v3"=list("tX"="v3"), "v4"=list("tX"="v4"),
                  "v5"=list("tX"="v5"))
  expect_error(insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"),addGL, equivRel = E2addER), error_message_equivalenceclass_is_not_exhaustive())



  E3addER <- list("v1"=list("tY"="v"), "v2"=list("tX"="v2"),
                  "v3"=list("tX"="v3"), "v4"=list("tX"="v4"),
                  "v5"=list("tX"="v5"))
  expect_error(insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"),addGL, equivRel = E3addER), error_message_not_tempflow_equivclass_index_equality())

  E4addER <- list("v1"=list("tX"="v1"), "v1"=list("tX"="v2"),
                  "v3"=list("tX"="v3"), "v4"=list("tX"="v4"),
                  "v5"=list("tX"="v5"))
  expect_error(insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"),addGL, equivRel = E4addER), error_message_not_tempflow_equivclass_index_equality())

  E5addER <- list("v1"=list("tX"="v1"), "v2"=list("tX"="v2"),
                  "v3"=list("tX"="v3"), "v4"=list("tX"="v4"),
                  "v5"=list("tX"="v5"), "v6"=list("tX"="v5"))
  expect_error(insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"),addGL, equivRel = E5addER), error_message_not_tempflow_equivclass_index_equality())

  E6addER <- list("v1"=list("tX"="v1"), "v2"=list("tX"="v2"),
                  "v3"=list("tX"="v3"), "v4"=list("tX"="v4"),
                  "v5"=list("tX"="v5", "tY" = "v5"))
  expect_error(insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"),addGL, equivRel = E6addER), error_message_not_tempflow_equivclass_index_equality())

  E7addER <- list("v1"=list("tX"="v1"), "v2"=list("tX"="v2"),
                  "v3"=list("tX"="v3"), "v4"=list("tX"="v4"),
                  "v5"=list("tX"="v5"),
                  "v6"=list("t1"= "v6","t2"= "v6","t3"= "v6","t4"= "v6","t5"= "v6","tX"= "v6"))
  expect_error(insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"),addGL, equivRel = E7addER), error_message_equivrel_not_equal_length_to_vertices())

  E8addER <- list("v1"=list("tX"="v1"), "v2"=list("tX"="v2"),
                  "v3"=list("tX"="v3"), "v4"=list("tX"="v4"),
                  "v5"=list("tX"="v5", "tX" = "v5"))
  expect_error(insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"),addGL, equivRel = E8addER), error_message_not_tempflow_equivclass_index_equality())

  tempNetwork <-insert_point(WGL1TF1, "tX", c(), c(),addGL)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1)))
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1TF1))+1)
  expect_equal(tS(tempNetwork)$weight, tS(WGL1TF1)$weight)

  tempNetwork <-insert_point(WGL1TF1, "tX", c("tX"), c(),addGL)
  wTempNetwork <- insert_point(WGL1TF1, "tX", c("tX"), c(), addGL, weightList =  c(10))
  eTempNetwork <- insert_point(WGL1TF1, "tX", c("tX"), c(), addGL, equivRel = addER)
  eeTempNetwork <- insert_point(EWGL1TF1, "tX", c("tX"), c(), addGL, equivRel = addER)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+1)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("tX","tX"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("tX"), c("tX"))]$weight, c(0))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("tX"), c("tX"))]$weight, c(10))


  tempNetwork <-insert_point(WGL1TF1, "tX", c(), c("tX"),addGL)
  wTempNetwork <- insert_point(WGL1TF1, "tX", c(), c("tX"),addGL, weightList =  c(10))
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+1)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("tX","tX"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("tX"), c("tX"))]$weight, c(0))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("tX"), c("tX"))]$weight, c(10))

  tempNetwork <-insert_point(WGL1TF1, "tX", c("t1","tX"), c("t2"),addGL)
  wTempNetwork <- insert_point(WGL1TF1, "tX", c("t1","tX"), c("t2"),addGL, weightList =  c(10,8,20))
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+2)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t1","t2"), error = FALSE) == 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t1","tX","tX","tX","tX","t2"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t1","tX","tX"), c("tX","tX","t2"))]$weight, c(1,0,1))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("t1","tX","tX"), c("tX","tX","t2"))]$weight, c(10,8,20))

  tempNetwork <-insert_point(WGL1TF1, "tX", c("t3","t4"), c("t5"),addGL)
  wTempNetwork <- insert_point(WGL1TF1, "tX", c("t3","t4"), c("t5"),addGL,  weightList = c(10,20,30))
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+1)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t3","t5","t4","t5"), error = FALSE) == 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t3","tX","t4","tX","tX","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t3","t4","tX"), c("tX","tX","t5"))]$weight, c(1,1,1))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("t3","t4","tX"), c("tX","tX","t5"))]$weight, c(10,20,30))

  tempNetwork <-insert_point(WGL1TF1, "tX", c("t1","t2"), c("t5"),addGL)
  wTempNetwork <- insert_point(WGL1TF1, "tX", c("t1","t2"), c("t5"),addGL,  weightList = c(10,20,30))
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+3)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t1","tX","t1","tX","tX","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t1","t2","tX"), c("tX","tX","t5"))]$weight, c(1,1,1))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("t1","t2","tX"), c("tX","tX","t5"))]$weight, c(10,20,30))

  tempNetwork <-insert_point(WGL1TF1, "tX", c("t1","t2"), c("t3","t4"),addGL)
  wTempNetwork <- insert_point(WGL1TF1, "tX", c("t1","t2"), c("t3","t4"),addGL,  weightList = c(10,20,30,40))
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+2)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t2","t3","t2","t4"), error = FALSE) == 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t1","tX","t2","tX","tX","t3","tX","t4"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t1","t2","tX","tX"), c("tX","tX","t3","t4"))]$weight, c(1,1,1,1))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("t1","t2","tX","tX"), c("tX","tX","t3","t4"))]$weight, c(10,20,30,40))

  tempNetwork <-insert_point(WGL1TF1, "tX", c("t3","t4"), c("t5"),addGL)
  wTempNetwork <- insert_point(WGL1TF1, "tX", c("t3","t4"), c("t5"),addGL, weightList =  c(10,20,30))
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+1)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t3","t5","t4","t5"), error = FALSE) == 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t3","tX","t4","tX","tX","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t3","t4","tX"), c("tX","tX","t5"))]$weight, c(1,1,1))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("t3","t4","tX"), c("tX","tX","t5"))]$weight, c(10,20,30))

  tempNetwork <-insert_point(WGL5ETF1, "tX", c("p31", "p41"), c("p32", "p42"),addGLeX)
  wTempNetwork <- insert_point(WGL5ETF1, "tX", c("p31", "p41"), c("p32", "p42"),addGLeX, weightList =  c(10,20,30,40))
  expect_equal(length(tS(tempNetwork)), length(tS(WGL5ETF1))+2)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("p31","p32","p41","p42"), error = FALSE) == 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("p31","tX","p41","tX","tX","p32","tX","p42"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("p31","p41","tX","tX"), c("tX","tX","p32","p42"))]$weight, c(1,1,1,1))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("p31","p41","tX","tX"), c("tX","tX","p32","p42"))]$weight, c(10,20,30,40))


  tempNetwork <-insert_point(WGL1TF1, "tX", c(), c(),addGL, removeEdges = FALSE)
  wTempNetwork <- insert_point(WGL1TF1, "tX", c(), c("tX"),addGL,  weightList = c(10))
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1)))
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1TF1))+1)
  expect_equal(tS(tempNetwork)$weight, tS(WGL1TF1)$weight)

  tempNetwork <-insert_point(WGL1TF1, "tX", c("tX"), c(),addGL, removeEdges = FALSE)
  wTempNetwork <- insert_point(WGL1TF1, "tX", c("tX"), c(),addGL,  weightList = c(10), removeEdges = FALSE)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+1)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("tX","tX"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("tX"), c("tX"))]$weight, c(0))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("tX"), c("tX"))]$weight, c(10))

  tempNetwork <-insert_point(WGL1TF1, "tX", c(), c("tX"),addGL, removeEdges = FALSE)
  wTempNetwork <- insert_point(WGL1TF1, "tX", c(), c("tX"),addGL, weightList = c(10), removeEdges = FALSE)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+1)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("tX","tX"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("tX"), c("tX"))]$weight, c(0))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("tX"), c("tX"))]$weight, c(10))

  tempNetwork <-insert_point(WGL1TF1, "tX", c("t1","tX"), c("t2"),addGL, removeEdges = FALSE)
  wTempNetwork <- insert_point(WGL1TF1, "tX", c("t1","tX"), c("t2"),addGL,  weightList = c(10,8,20), removeEdges = FALSE)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+3)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t1","t2"), error = FALSE) > 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t1","tX","tX","tX","tX","t2"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t1","tX","tX"), c("tX","tX","t2"))]$weight, c(1,0,1))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("t1","tX","tX"), c("tX","tX","t2"))]$weight, c(10,8,20))

  tempNetwork <-insert_point(WGL1TF1, "tX", c("t3","t4"), c("t5"),addGL, removeEdges = FALSE)
  wTempNetwork <- insert_point(WGL1TF1, "tX", c("t3","t4"), c("t5"),addGL,  weightList = c(10,20,30), removeEdges = FALSE)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+3)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t3","t5","t4","t5"), error = FALSE) > 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t3","tX","t4","tX","tX","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t3","t4","tX"), c("tX","tX","t5"))]$weight, c(1,1,1))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("t3","t4","tX"), c("tX","tX","t5"))]$weight, c(10,20,30))

  tempNetwork <-insert_point(WGL1TF1, "tX",c("t1","t2"), c("t5"),addGL, removeEdges = FALSE)
  wTempNetwork <-  insert_point(WGL1TF1, "tX",c("t1","t2"), c("t5"),addGL,  weightList = c(10,20,30), removeEdges = FALSE)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+3)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t1","tX","t1","tX","tX","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t1","t2","tX"), c("tX","tX","t5"))]$weight, c(1,1,1))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("t1","t2","tX"), c("tX","tX","t5"))]$weight, c(10,20,30))

  tempNetwork <-insert_point(WGL1TF1, "tX", c("t1","t2"), c("t3","t4"),addGL, removeEdges = FALSE)
  wTempNetwork <-insert_point(WGL1TF1, "tX", c("t1","t2"), c("t3","t4"),addGL,  weightList = c(10,20,30,40), removeEdges = FALSE)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))+4)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t2","t3","t2","t4"), error = FALSE) > 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t1","tX","t2","tX","tX","t3","tX","t4"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t1","t2","tX","tX"), c("tX","tX","t3","t4"))]$weight, c(1,1,1,1))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("t1","t2","tX","tX"), c("tX","tX","t3","t4"))]$weight, c(10,20,30,40))


  tempNetwork <-insert_point(WGL5ETF1, "tX",c("p31", "p41"), c("p32", "p42"),addGLeX, removeEdges = FALSE)
  wTempNetwork <- insert_point(WGL5ETF1, "tX",c("p31", "p41"), c("p32", "p42"),addGLeX, weightList =  c(10,20,30,40), removeEdges = FALSE)
  #eTempNetwork <-insert_point(WGL5ETF1, "tX",c("p31", "p41"), c("p32", "p42"),addGLeX, equivRel = addEReX, removeEdges = FALSE)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL5ETF1))+4)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("p31","p32","p41","p42"), error = FALSE) > 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("p31","tX","p41","tX","tX","p32","tX","p42"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("p31","p41","tX","tX"), c("tX","tX","p32","p42"))]$weight, c(1,1,1,1))
  expect_equal(tS(wTempNetwork)[get_step_ids(wTempNetwork, c("p31","p41","tX","tX"), c("tX","tX","p32","p42"))]$weight, c(10,20,30,40))


  expect_error(insert_point(WGL5ETF1, "tX",c("p31", "p41"), c("p32", "p42"),addGL, weightList =  c(10,20,30,40), removeEdges = FALSE), error_message_not_graphlist_vertex_equality())

  expect_error(insert_point(WGL1TF1, "tX", c("t1","t6"), c("t3","t4"),addGL), error_message_name_not_in_object())
  expect_error(insert_point(WGL1TF1, "tX", c("t1","t2"), c("t3","t6"),addGL), error_message_name_not_in_object())

  expect_error(insert_point(WGL1TF1, "tX", c("t1","t2"), c("t2","t4"),addGL), error_message_not_dag())
  expect_error(insert_point(WGL1TF1, "tX", c("t1","t1"), c("t2","t2"),addGL), error_message_not_simple())

  expect_error(insert_point(WGL1TF1, "tX", c("t1","t2"), c("t3",NA),addGL), error_message_name_not_in_object())
  expect_error(insert_point(WGL1TF1, "tX", c("t1",NA), c("t3","t4"),addGL), error_message_name_not_in_object())

  expect_error(insert_point(WGL1TF1, "tX", c("t1","t2"), c(NaN),addGL), error_message_ids_not_in_object())
  expect_error(insert_point(WGL1TF1, "tX", c("t1",NaN), c("t3","t4"),addGL), error_message_name_not_in_object())

  expect_error(insert_point(WGL1TF1, "tX", c("t1","t2"), c("t3","t4"), addGL, weightList = c(10,20)), error_message_vector_not_equal_sum_lengths_and_not_one())
  expect_error(insert_point(WGL1TF1, "tX", c("t1","t2"), c("t3","t4"), addGL, weightList = c(-10,20,30,40)), error_message_weights_not_nonnegative())
  expect_error(insert_point(WGL1TF1, "tX", c("t1","t2"), c("t3","t4"),addGL, weightList = c("-10",20,30,40)), error_message_weights_not_numeric())
  expect_error(insert_point(WGL1TF1, "tX", c("t1","t2"), c("t3","t4"),addGL, weightList = c(NA,20,30,40)), error_message_weights_not_numeric())
  expect_error(insert_point(WGL1TF1, "tX", c("t1","t2"), c("t3","t4"),addGL, weightList = c(NaN,20,30,40)), error_message_weights_not_numeric())
  expect_error(insert_point(WGL1TF1, "tX", c("t1","t2"), c("t3","t4"),addGL, weightList = c(10,20,30,NULL)), error_message_vector_not_equal_sum_lengths_and_not_one())
  expect_error(insert_point(WGL1TF1, "tX", c("tX"), c("tX"), addGL, weightList = c(10)), error_message_not_simple())


  testTempNetwork <- WGL1LTF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- insert_point(WGL1TF1, "tX",  c("t3","t4"), c("t5"),addGL)
  expect_equal(tG(testTempNetwork),NULL)
})

test_that("test 'remove_point(tempFlow, removePoint, safe = TRUE)'", {


  tempNetwork <-remove_point(WGL1TF1, "t5")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1TF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))-2)
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("t3","t5","t4","t5"), error = FALSE) == 0), "Invalid vertex names")

  tempNetwork <-remove_point(WGL1LTF1, "t5")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1LTF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1LTF1))-3)
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("t3","t5","t4","t5","t5","t5"), error = FALSE) == 0), "Invalid vertex names")

  tempNetwork <-remove_point(WGL1TF1, "t1")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1TF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))-1)
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("t1","t2"), error = FALSE) == 0), "Invalid vertex names")

  tempNetwork <-remove_point(WGL1LTF1, "t1")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1LTF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1LTF1))-2)
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("t1","t2","t1","t1"), error = FALSE) == 0), "Invalid vertex names")

  tempNetwork <-remove_point(WGL1TF1, "t2")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1TF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))-1)
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("t2","t3","t2","t4"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t1","t3","t1","t4"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t1","t1"), c("t3","t4"))]$weight, c(2,2))

  tempNetwork <-remove_point(WGL1LTF1, "t2")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1LTF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1LTF1))-2)
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("t2","t3","t2","t4", "t2","t2"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t1","t3","t1","t4"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t1","t1"), c("t3","t4"))]$weight, c(2,2))


  tempNetwork <-remove_point(WGL1TF1, "t3")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1TF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))-1)
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("t2","t3","t3","t5"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t2","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t2"), c("t5"))]$weight, c(2))

  tempNetwork <-remove_point(WGL1LTF1, "t3")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1LTF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1LTF1))-2)
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("t2","t3","t3","t5"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t2","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t2"), c("t5"))]$weight, c(2))

  expect_error(remove_point(GL0STF1, "t1"), error_message_tempflow_empty())
  # tempNetwork <-remove_point(GL0STF1, "t1")
  # expect_equal(length(tP(tempNetwork)), length(tP(GL0STF1))-1)
  # expect_equal(length(tS(tempNetwork)), length(tS(GL0STF1)))

  expect_error(remove_point(GL0STF3, "t1"), error_message_tempflow_empty())
  # tempNetwork <-remove_point(GL0STF3, "t1")
  # expect_equal(length(tP(tempNetwork)), length(tP(GL0STF3))-1)
  # expect_equal(length(tS(tempNetwork)), length(tS(GL0STF3))-1)


  tempNetwork <-remove_point(WGL5ETF1, "b")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL5ETF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL5ETF1)))
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("p11","b","p23","b","b","p31","b","p41"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("p11","p31","p11","p41","p23","p31","p23","p41"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("p11","p11","p23","p23"), c("p31","p41","p31","p41"))]$weight, c(3,3,2,2))

  tempNetwork <-remove_point(set_step_weights(WGL5ETF1, "b","p31", 10), "b")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL5ETF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL5ETF1)))
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("p11","b","p23","b","b","p31","b","p41"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("p11","p31","p11","p41","p23","p31","p23","p41"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("p11","p11","p23","p23"), c("p31","p41","p31","p41"))]$weight, c(12,3,11,2))


  tempNetwork <-remove_point(WGL1LTF1, "t3")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1LTF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1LTF1))-2)
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("t2","t3","t3","t5"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t2","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t2"), c("t5"))]$weight, c(2))


  tempNetwork <-remove_point(WGL1TF2, "t2")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1TF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1TF1))-1)
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("t2","t3","t2","t4"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t1","t3","t1","t4"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t1","t1"), c("t3","t4"))]$weight, c(4,4))

  tempNetwork <-remove_point(WGL1LTF2, "t2")
  expect_equal(length(tP(tempNetwork)), length(tP(WGL1LTF1))-1)
  expect_equal(length(tS(tempNetwork)), length(tS(WGL1LTF1))-2)
  expect_error(all(igraph::get.edge.ids(G(tempNetwork), c("t2","t3","t2","t4", "t2","t2"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempNetwork), c("t1","t3","t1","t4"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempNetwork)[get_step_ids(tempNetwork, c("t1","t1"), c("t3","t4"))]$weight, c(4,4))


  expect_error(remove_point(WGL1TF1, c("t6")), error_message_name_not_in_object())
  expect_error(remove_point(WGL1TF1, c(6)), error_message_ids_not_in_object())

  testTempNetwork <- WGL1LTF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- remove_point(WGL1LTF1, "t3")
  expect_equal(tG(testTempNetwork),NULL)

})




test_that("test 'induce_flow(tempFlow, inpPointList, safe = TRUE)'", {

  expect_error(induce_flow(WGL1TF1, c(1,2,8)))
  expect_equal(igraph::is_isomorphic_to(G(induce_flow(WGL1TF1, c(1,1,3,5))),G(induce_flow(WGL1TF1,  c(1,3,5)))), TRUE)
  expect_error(induce_flow(WGL1TF1, c()), error_message_tempflow_empty())
  # expect_equal(igraph::is_isomorphic_to(G(induce_flow(WGL1TF1, c())),igraph::graph.empty()), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(induce_flow(WGL1TF1, igraph::V(G(WGL1TF1)))),G(WGL1TF1)), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(induce_flow(WGL1TF1, c("t1", "t3", "t5"))),G(induce_flow(WGL1TF1,  c(1,3,5)))), TRUE)

  expect_error(induce_flow(WGL1TF2, c(1,2,6)), error_message_ids_not_in_object())
  expect_error(induce_flow(WGL1TF2, c("t1","t2","t6")), error_message_name_not_in_object())

  testTempNetwork <- WGL1TF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- induce_flow(WGL1TF1,  c(1,3,5))
  expect_equal(tG(testTempNetwork),NULL)
})


test_that("test 'slice_flow(tempFlow, startPointList, endPointList, safe = TRUE)'", {
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1TF1,2,5)),G(induce_flow(WGL1TF1,  c(2,3,4,5)))), TRUE)
  expect_error(slice_flow(WGL1TF1,3,4), error_message_tempflow_empty())
  # expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1TF1,3,4)),igraph::graph.empty()), TRUE)
  expect_error(slice_flow(WGL1TF1,5,2), error_message_tempflow_empty())
  # expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1TF1,5,2)),igraph::graph.empty()), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1TF1,2,5)),G(induce_flow(WGL1TF1,  c(2,3,4,5)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1TF2,1,1)),G(induce_flow(WGL1TF2,  c(1)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1LTF2,1,1)),G(induce_flow(WGL1LTF2,  c(1)))), TRUE)

  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1TF1,c(2,4),c(5,3))),G(induce_flow(WGL1TF1,  c(2,3,4,5)))), TRUE)
  expect_error(slice_flow(WGL1TF1,3,4), error_message_tempflow_empty())
  # expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1TF1,3,4)),igraph::graph.empty()), TRUE)
  expect_error(slice_flow(WGL1TF1,5,2), error_message_tempflow_empty())
  # expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1TF1,5,2)),igraph::graph.empty()), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1TF1,2,5)),G(induce_flow(WGL1TF1,  c(2,3,4,5)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1LTF1,c(3,4), c(3,4))),G(induce_flow(WGL1LTF1,  c(3,4)))), TRUE)

  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1TF2,1,c(1,1))),G(induce_flow(WGL1TF2,  c(1)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1TF2,c(1,1),1)),G(induce_flow(WGL1TF2,  c(1)))), TRUE)

  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1LTF2,1,c(1,1))),G(induce_flow(WGL1LTF2,  c(1)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1LTF2,c(1,1),1)),G(induce_flow(WGL1LTF2,  c(1)))), TRUE)

  # expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1LTF2,c(1),c())),G(induce_flow(WGL1LTF2,  c()))), TRUE)
  expect_error(slice_flow(WGL1LTF2,c(1),c()), error_message_tempflow_empty())
  # expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL1LTF2,c(),c(1))),G(induce_flow(WGL1LTF2,  c()))), TRUE)
  expect_error(slice_flow(WGL1LTF2,c(),c(1)), error_message_tempflow_empty())
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL5ETF1,c("p11","p23"),c("c"),1)),G(induce_flow(WGL5ETF1,  c("p11","p23","b","p31","p32","p41","p42","c")))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL5ETF1,c("a"),c("p11","p23"),1)),G(induce_flow(WGL5ETF1,  c("a","p11","p21","p22","p23")))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(WGL5ETF1,c("p11","p23"),c("p32","p41"),1)),G(induce_flow(WGL5ETF1,  c("p11","p23","b","p31","p32","p41")))), TRUE)

  expect_error(slice_flow(WGL1TF1, c(1,8)))

  testTempNetwork <- WGL1TF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- slice_flow(WGL1TF1,2,5)
  expect_equal(tG(testTempNetwork),NULL)
})


test_that("test 'compute_tempdistance'", {

  expect_equal(compute_tempdistance(WGL1TF1, "t5", "t1"), Inf)
  expect_equal(compute_tempdistance(WGL1TF1, "t3", "t4"), Inf)
  expect_equal(compute_tempdistance(WGL1TF1, "t1", "t1"), 0)
  expect_equal(compute_tempdistance(WGL1TF1, "t1", 5), 3)
  expect_equal(compute_tempdistance(WGL1TF1, 1, "t5"), 3)
  expect_equal(compute_tempdistance(WGL1TF1, 1, 5), 3)
  expect_equal(compute_tempdistance(WGL1TF1, "t1", "t5"), 3)

  expect_error(compute_tempdistance(WGL1TF1, "t1", "t100"))
  expect_error(compute_tempdistance(WGL1TF1, "t1", 100))
  expect_error(compute_tempdistance(WGL1TF1, 100, "t1"))
  expect_error(compute_tempdistance(WGL1TF1, 111, 222))

  expect_equal(compute_tempdistance(WGL1TF2, "t1", "t5"), 5)

  expect_equal(compute_tempdistance(WGL1LTF1, "t1", "t5"), 3)
  expect_equal(compute_tempdistance(WGL1LTF2, "t1", "t1"), 1)
  expect_equal(compute_tempdistance(WGL1LTF2, "t1", "t5"), 5)

  expect_equal(compute_tempdistance(WGL1LTF1, "t1", "t5"), 3)
  expect_equal(compute_tempdistance(WGL1LTF1, "t1", "t1"), 0)
  expect_equal(compute_tempdistance(WGL1LTF2, "t1", "t5"), 5)


})




