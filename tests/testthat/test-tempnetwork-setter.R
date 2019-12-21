context("test-tempnetwork-setter")
PATH = system.file("inst","testdata","tempflow", package = "tempnetwork")
PATH_GRAPH = system.file("inst","testdata","tempgraph", package = "tempnetwork")

PATH = system.file("inst","testdata","tempflow", package = "tempnetwork")
PATH_GRAPH = system.file("inst","testdata","tempgraph", package = "tempnetwork")

TF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_directed_acyclic_small_1.gml"), format = "graphml"))
TF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_directed_acyclic_small_1.gml"), format = "graphml"))
# TF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_forrest_small_1.gml"), format = "graphml"))
# TF4 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_tree_small_1.gml"), format = "graphml"))
TF5 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_lattice_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)
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
# GL0STF1 <- tempnetwork(tempFlow = STF1, equivalenceRelation = NULL, graphList = list("t1"=GL1$simple$t1))
# GL0STF2 <- tempnetwork(tempFlow = STF2, equivalenceRelation = NULL, graphList = list("1"=GL1$simple$t1))
# GL0STF3 <- tempnetwork(tempFlow = STF3, equivalenceRelation = NULL, graphList = list("t1"=GL1$simple$t1))
#
# GL5ETF1 <- tempnetwork(tempFlow = ETF1, equivalenceRelation = NULL, graphList = GL5$simple)
# GL6ETF2 <- tempnetwork(tempFlow = ETF2, equivalenceRelation = NULL, graphList = GL6$simple)


WGL1TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$weighted)
# WGL2TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL2$weighted)
# WGL3TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL3$weighted)
#
# WGL1TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL1$weighted)
# WGL2TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL2$weighted)
# WGL3TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL3$weighted)
#
# WGL4TF3 <- tempnetwork(tempFlow = TF3, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL4TF4 <- tempnetwork(tempFlow = TF4, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL4TF5 <- tempnetwork(tempFlow = TF5, equivalenceRelation = NULL, graphList = GL4$weighted)
#
# WGL1LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL1$weighted)
# WGL2LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL2$weighted)
# WGL3LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL3$weighted)
#
#
# WGL1LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL1$weighted)
# WGL2LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL2$weighted)
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
#
#
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



test_that("test 'set_tempFlow(tempNetwork, tempFlow, safe = TRUE)'", {

  expect_equal(tF(set_tempFlow(EGL1TF1, TF2)), TF2)
  expect_equal(set_tempFlow(EGL1TF1, NULL), EGL1TF1)
  expect_error(set_tempFlow(EGL1TF1, GL1$directed$t1))
  expect_error(set_tempFlow(EGL1TF1, TF5), error_message_not_tempflow_graphlist_index_equality())

})

test_that("test 'set_graphList(tempNetwork, graphList, setDefaultGraphNames=TRUE, safe = TRUE)'", {

  expect_equal(gL(set_graphList(EGL1TF1, GL2$directed)), GL2$directed)
  expect_equal(set_tempFlow(EGL1TF1, NULL), EGL1TF1)
  # expect_error(set_graphList(EGL1TF1, NULL), error_message_graphlist_empty())
  expect_error(set_graphList(EGL1TF1, as.list(list("t1"=1, "t2"=1, "t3"=1, "t4"=1, "t5"=1))))
  expect_error(set_graphList(EGL1TF1, GL1$directed$t1))
  expect_error(set_graphList(EGL1TF1, list("t1"=GL1$simple$t1,"t2"=GL1$simple$t1,"t3"=GL1$simple$t1,"t4"=GL1$simple$t1,"t6"=GL1$simple$t1)),
               error_message_not_tempflow_graphlist_index_equality())
  expect_error(set_graphList(EGL1TF1, list("t1"=GL1$simple$t1,"t2"=GL1$simple$t1,"t3"=GL1$simple$t1,"t4"=GL1$simple$t1,"t5"=GL1$simple$t1,"t6"=GL1$simple$t1)),
               error_message_not_tempflow_graphlist_index_equality())
  expect_error(set_graphList(EGL1TF1, list("t1"=GL1$simple$t1,"t2"=GL1$simple$t1,"t3"=GL1$simple$t1,"t4"=GL1$simple$t1,"t5"=GL1$simple$t1,"t5"=GL1$simple$t1)),
               error_message_not_tempflow_graphlist_index_equality())
  expect_error(set_graphList(EGL1TF1, list("t1"=GL1$simple$t1,"t2"=GL1$simple$t1,"t3"=GL1$simple$t1,"t4"=GL1$simple$t1,"t4"=GL1$simple$t1)),
               error_message_not_tempflow_graphlist_index_equality())
  expect_error(set_graphList(EGL1TF1, list("t1"=GL1$simple$t1,"t2"=GL1$simple$t1,"t3"=GL1$simple$t1)),
               error_message_not_tempflow_graphlist_index_equality())
  expect_error(set_graphList(EGL1TF1, GL5$directed), error_message_not_tempflow_graphlist_index_equality())

})

test_that("test 'set_equivRelation(tempNetwork, equivRel, safe = TRUE)'", {

  expect_equal(eR(set_equivRelation(EGL1TF1, testER)), testER)
  expect_equal(eR(set_equivRelation(EGL1TF1, testER)), testER)


  E1addER <-  list("a"=list("t1"= "v2","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                  "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                  "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                  "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                  "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))
  expect_error(set_equivRelation(EGL1TF1, E1addER), error_message_equivclass_not_disjoined())


  E2addER <-  list("a"=list("t1"= "v","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                  "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                  "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                  "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                  "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))
  expect_error(set_equivRelation(EGL1TF1, E2addER), error_message_equivalenceclass_is_not_exhaustive())


  E3addER <-  list("a"=list("t9"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                  "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                  "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                  "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                  "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))
  expect_error(set_equivRelation(EGL1TF1, E3addER), error_message_not_tempflow_equivclass_index_equality())


  E4addER <-  list("a"=list("t1"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                  "a"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                  "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                  "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                  "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))
  expect_error(set_equivRelation(EGL1TF1, E4addER), error_message_equivrel_index_is_not_unique())


  E5addER <-  list("a"=list("t1"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                  "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                  "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                  "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                  "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"),
                  "f"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))
  expect_error(set_equivRelation(EGL1TF1, E5addER), error_message_equivrel_not_equal_length_to_vertices())


  E6addER <-  list("a"=list("t1"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                  "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                  "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                  "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                  "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5","t5"= "v5"))
  expect_error(set_equivRelation(EGL1TF1, E6addER), error_message_not_tempflow_equivclass_index_equality())


  E7addER <-  list("a"=list("t1"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                  "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                  "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                  "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                  "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5","t9"= "v5"))
  expect_error(set_equivRelation(EGL1TF1, E7addER), error_message_not_tempflow_equivclass_index_equality())


})


test_that("set_basic_properties(tempNetwork, tempFlow = NULL, graphList = NULL, equivRel = NULL, setDefaultGraphNames=TRUE, safe = TRUE)'", {

  expect_equal(tF(set_basic_properties(EGL1TF1, tempFlow = TF2)), TF2)
  expect_error(set_basic_properties(EGL1TF1, tempFlow = GL1$directed$t1))
  expect_error(set_basic_properties(EGL1TF1, tempFlow = TF5), error_message_not_tempflow_graphlist_index_equality())

  expect_equal(gL(set_basic_properties(EGL1TF1, graphList =GL2$directed)), GL2$directed)
  expect_error(set_basic_properties(EGL1TF1, graphList = as.list(list("t1"=1, "t2"=1, "t3"=1, "t4"=1, "t5"=1))))
  expect_error(set_basic_properties(EGL1TF1, graphList = GL1$directed$t1))
  expect_error(set_basic_properties(EGL1TF1, graphList = list("t1"=GL1$simple$t1,"t2"=GL1$simple$t1,"t3"=GL1$simple$t1,"t4"=GL1$simple$t1,"t6"=GL1$simple$t1)),
               error_message_not_tempflow_graphlist_index_equality())
  expect_error(set_basic_properties(EGL1TF1, graphList = list("t1"=GL1$simple$t1,"t2"=GL1$simple$t1,"t3"=GL1$simple$t1,"t4"=GL1$simple$t1,"t5"=GL1$simple$t1,"t6"=GL1$simple$t1)),
               error_message_not_tempflow_graphlist_index_equality())
  expect_error(set_basic_properties(EGL1TF1, graphList = list("t1"=GL1$simple$t1,"t2"=GL1$simple$t1,"t3"=GL1$simple$t1,"t4"=GL1$simple$t1,"t5"=GL1$simple$t1,"t5"=GL1$simple$t1)),
               error_message_not_tempflow_graphlist_index_equality())
  expect_error(set_basic_properties(EGL1TF1, graphList = list("t1"=GL1$simple$t1,"t2"=GL1$simple$t1,"t3"=GL1$simple$t1,"t4"=GL1$simple$t1,"t4"=GL1$simple$t1)),
               error_message_not_tempflow_graphlist_index_equality())
  expect_error(set_basic_properties(EGL1TF1, graphList = list("t1"=GL1$simple$t1,"t2"=GL1$simple$t1,"t3"=GL1$simple$t1)),
               error_message_not_tempflow_graphlist_index_equality())
  expect_error(set_basic_properties(EGL1TF1, graphList = GL5$directed), error_message_not_tempflow_graphlist_index_equality())


  expect_equal(eR(set_basic_properties(EGL1TF1, equivRel = testER)), testER)
  expect_equal(eR(set_basic_properties(EGL1TF1, equivRel = testER)), testER)


  E1addER <-  list("a"=list("t1"= "v2","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                   "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                   "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                   "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                   "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))
  expect_error(set_basic_properties(EGL1TF1, equivRel = E1addER), error_message_equivclass_not_disjoined())


  E2addER <-  list("a"=list("t1"= "v","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                   "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                   "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                   "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                   "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))
  expect_error(set_basic_properties(EGL1TF1, equivRel = E2addER), error_message_equivalenceclass_is_not_exhaustive())


  E3addER <-  list("a"=list("t9"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                   "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                   "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                   "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                   "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))
  expect_error(set_basic_properties(EGL1TF1, equivRel = E3addER), error_message_not_tempflow_equivclass_index_equality())


  E4addER <-  list("a"=list("t1"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                   "a"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                   "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                   "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                   "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))
  expect_error(set_basic_properties(EGL1TF1, equivRel = E4addER), error_message_equivrel_index_is_not_unique())


  E5addER <-  list("a"=list("t1"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                   "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                   "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                   "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                   "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"),
                   "f"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))
  expect_error(set_basic_properties(EGL1TF1, equivRel = E5addER), error_message_equivrel_not_equal_length_to_vertices())


  E6addER <-  list("a"=list("t1"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                   "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                   "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                   "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                   "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5","t5"= "v5"))
  expect_error(set_basic_properties(EGL1TF1, equivRel = E6addER), error_message_not_tempflow_equivclass_index_equality())


  E7addER <-  list("a"=list("t1"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                   "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                   "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                   "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                   "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5","t9"= "v5"))
  expect_error(set_basic_properties(EGL1TF1, equivRel = E7addER), error_message_not_tempflow_equivclass_index_equality())

  testTempNetwork <- EGL1TF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- set_basic_properties(EGL1TF1, tempFlow = TF2)
  expect_equal(tG(testTempNetwork),NULL)

})

test_that("test 'set_tempvertex_names(tempNetwork, oldVertexNameList, newVertexNameList, retainImpliedEquivRel = TRUE, safe = TRUE) '", {
#
#   testER <-  list("a"=list("t1"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
#                   "b"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
#                   "c"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
#                   "d"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
#                   "e"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))
#
#
  testTempNetwork <-set_tempvertex_names(GL1TF1, c("v1","v3","v5"), c("a","b","c"))
  expect_equal(all(sapply(names(tP(testTempNetwork)), function(x) names(gV(testTempNetwork, x)) == c("a","v2","b","v4","c"))),TRUE)
  expect_equal(names(eR(testTempNetwork,TRUE)), c("a","v2","b","v4","c"))

  testTempNetwork <- set_tempvertex_names(GL1TF1, c("v1","v3","v5"), c("a","b","c"), FALSE)
  expect_equal(all(sapply(names(tP(testTempNetwork)), function(x) names(gV(testTempNetwork, x)) == c("v1","v2","v3","v4","v5"))),TRUE)
  expect_equal(names(eR(testTempNetwork)), c("a","v2","b","v4","c"))
  expect_equal(all( mapply(function(x,y) unique(unname(x))==y, eR(testTempNetwork), c("v1","v2","v3","v4","v5")) ), TRUE)

  testTempNetwork <- set_tempvertex_names(EGL1TF1, c("v1","v3","v5"), c("a","b","c"), FALSE)
  expect_equal(all(sapply(names(tP(testTempNetwork)), function(x) names(gV(testTempNetwork, x)) == c("v1","v2","v3","v4","v5"))),TRUE)
  expect_equal(names(eR(testTempNetwork)), c("a","v2","b","v4","c"))
  expect_equal(all( mapply(function(x,y) unique(unname(x))==y, eR(testTempNetwork), c("v1","v2","v3","v4","v5")) ), TRUE)

  expect_error(set_tempvertex_names(GL1TF1, c("v1","v8","v5"), c("a","b","c")), error_message_tvertex_not_exists())
  expect_error(set_tempvertex_names(GL1TF1, c("v1","v3","v5"), c("a","v2","c")), error_message_graphlist_vertex_not_unique())
  expect_error(set_tempvertex_names(GL1TF1, c("v1","v3","v3"), c("a","b","c")), error_message_vector_not_unique())
  expect_error(set_tempvertex_names(GL1TF1, c("v1","v3","v5","v2"), c("a","b","c")), error_message_vector_not_equal_length())
  expect_error(set_tempvertex_names(GL1TF1, c("v1","v3","v5"), c("a","b","c","d")), error_message_vector_not_equal_length())

  expect_error(set_tempvertex_names(GL1TF1, c("v1","v8","v5"), c("a","b","c"), TRUE), error_message_tvertex_not_exists())
  expect_error(set_tempvertex_names(GL1TF1, c("v1","v3","v5"), c("a","v2","c"), TRUE), error_message_graphlist_vertex_not_unique())
  expect_error(set_tempvertex_names(GL1TF1, c("v1","v3","v3"), c("a","b","c"), TRUE), error_message_vector_not_unique())
  expect_error(set_tempvertex_names(GL1TF1, c("v1","v3","v5","v2"), c("a","b","c"), TRUE), error_message_vector_not_equal_length())
  expect_error(set_tempvertex_names(GL1TF1, c("v1","v3","v5"), c("a","b","c","d"), TRUE), error_message_vector_not_equal_length())


  expect_error(set_tempvertex_names(EGL1TF1, c("v1","v8","v5"), c("a","b","c")), error_message_tvertex_not_exists())
  expect_error(set_tempvertex_names(EGL1TF1, c("v1","v3","v5"), c("a","v2","c")), error_message_equivrel_index_is_not_unique())
  expect_error(set_tempvertex_names(EGL1TF1, c("v1","v3","v3"), c("a","b","c")), error_message_vector_not_unique())
  expect_error(set_tempvertex_names(EGL1TF1, c("v1","v3","v5","v2"), c("a","b","c")), error_message_vector_not_equal_length())
  expect_error(set_tempvertex_names(EGL1TF1, c("v1","v3","v5"), c("a","b","c","d")), error_message_vector_not_equal_length())

  expect_error(set_tempvertex_names(EGL1TF1, c("v1","v8","v5"), c("a","b","c"), TRUE), error_message_tvertex_not_exists())
  expect_error(set_tempvertex_names(EGL1TF1, c("v1","v3","v5"), c("a","v2","c"), TRUE), error_message_equivrel_index_is_not_unique())
  expect_error(set_tempvertex_names(EGL1TF1, c("v1","v3","v3"), c("a","b","c"), TRUE), error_message_vector_not_unique())
  expect_error(set_tempvertex_names(EGL1TF1, c("v1","v3","v5","v2"), c("a","b","c"), TRUE), error_message_vector_not_equal_length())
  expect_error(set_tempvertex_names(EGL1TF1, c("v1","v3","v5"), c("a","b","c","d"), TRUE), error_message_vector_not_equal_length())

  testTempNetwork <- GL1TF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- set_tempvertex_names(GL1TF1, c("v1","v3","v5"), c("a","b","c"))
  expect_equal(tG(testTempNetwork),NULL)
  })

#
# test_that("test 'set_equivclass_gvertex_names(tempNetwork, tVertexName, gVertexNameList = rep(tVertexName, length(tP(tempNetwork))), safe = TRUE)'", {
#
#   expect_equal(eR(set_equivclass_gvertex_names(GL1TF1, "v3", "v3" )), NULL)
#   testTempNetwork <- set_equivclass_gvertex_names(GL1TF1, "v3", "a" )
#   expect_equal(names(eR(testTempNetwork)), c("v1","v2","v3","v4","v5"))
#   expect_equal(all(sapply(names(tP(testTempNetwork)), function(x) names(gV(testTempNetwork, x)) == c("v1","v2","a","v4","v5"))),TRUE)
#   expect_equal(unlist(unname(eR(testTempNetwork)[["v3"]])), c("a","a","a","a","a"))
#
#   testTempNetwork <- set_equivclass_gvertex_names(GL1TF1, "v3", c("a","b","c","d","e") )
#   testList <- list("t1"=c("v1","v2","a","v4","v5"),
#                    "t2"=c("v1","v2","b","v4","v5"),
#                    "t3"=c("v1","v2","c","v4","v5"),
#                    "t4"=c("v1","v2","d","v4","v5"),
#                    "t5"=c("v1","v2","e","v4","v5"))
#
#   expect_equal(names(eR(testTempNetwork)), c("v1","v2","v3","v4","v5"))
#   expect_equal(all(sapply(names(tP(testTempNetwork)), function(x) names(gV(testTempNetwork, x)) == testList[[x]])),TRUE)
#   expect_equal(unlist(unname(eR(testTempNetwork)[["v3"]])), c("a","b","c","d","e"))
#
#   expect_error(set_equivclass_gvertex_names(GL1TF1, "v9", "v3" ), error_message_tvertex_not_exists())
#   expect_error(set_equivclass_gvertex_names(GL1TF1, "v9", c("v3","a")),error_message_vector_not_equal_length())
#   expect_error(set_equivclass_gvertex_names(GL1TF1, c("v1","v1"), c("v3","a")), error_message_vector_not_equal_length())
#   expect_error(set_equivclass_gvertex_names(GL1TF1, c("v1"), c("v2","v2","v2","v2","v2","v2","v2","v2","v2","v2")), error_message_vector_not_equal_length())
#   expect_error(set_equivclass_gvertex_names(GL1TF1, c("v1","v1"), c("v2","v2","v2","v2","v2","v2","v2","v2","v2","v2")), error_message_vector_not_equal_length())
#   expect_error(set_equivclass_gvertex_names(GL1TF1, "v1", c("v2","v2","v2","v2","v2")),error_message_equivclass_not_disjoined())
#   expect_error(set_equivclass_gvertex_names(GL1TF1, "v1", "v2"),error_message_equivclass_not_disjoined())
#
#
# })




test_that("test 'set_vertex_names(tempNetwork, pointNameList, oldVertexNameList,
                 newVertexNameList = NULL, tVertexNameList = oldVertexNameList, changeEquivRel = TRUE, safe = TRUE)'", {


  testTVList <- c("v1","v2","v3","v4","v5")
  testVList <- c("a","b","c","d","e")
  names(testVList)<- testTVList
  testPList <- c("t1","t1","t1","t1","t1")
  testTempNetwork <- set_vertex_names(GL1TF1, testPList, testTVList, unname(testVList) )
  expect_equal(all(sapply(names(eR(testTempNetwork)), function(x) { eR(testTempNetwork)[[x]][["t1"]] == testVList[[x]]})), TRUE)
  expect_equal(names(gV(testTempNetwork, "t1")), unname(testVList))

  testTVList <- c("v1","v2","v3","v4","v5")
  testVList <- c("1","2","3","4","5")
  names(testVList)<- testTVList
  testPList <- c("t1","t1","t1","t1","t1")
  testTempNetwork <- set_vertex_names(GL1TF1, testPList, testTVList, NULL )
  expect_equal(all(sapply(names(eR(testTempNetwork)), function(x) { eR(testTempNetwork)[[x]][["t1"]] == testVList[[x]]})), TRUE)
  expect_equal(names(gV(testTempNetwork, "t1")), unname(testVList))


  testTVList <- c("v1","v2","v3")
  testVList <- c("a","b","c")
  names(testVList)<- testTVList
  testPList <- c("t1","t1","t2")
  testTempNetwork <- set_vertex_names(GL1TF1, testPList, testTVList,testVList  )
  expect_equal(unlist(unname(eR(testTempNetwork)[["v1"]])), c("a","v1","v1","v1","v1"))
  expect_equal(unlist(unname(eR(testTempNetwork)[["v2"]])), c("b","v2","v2","v2","v2"))
  expect_equal(unlist(unname(eR(testTempNetwork)[["v3"]])), c("v3","c","v3","v3","v3"))

  expect_equal(unlist(names(gV(testTempNetwork, "t1"))), c("a","b","v3","v4","v5"))
  expect_equal(unlist(names(gV(testTempNetwork, "t2"))), c("v1","v2","c","v4","v5"))



  testTVList <- c("v1","v2","v1")
  testVList <- c("a","b","c")
  names(testVList)<- testTVList
  testPList <- c("t1","t1","t2")
  testTempNetwork <- set_vertex_names(GL1TF1, testPList, testTVList,testVList  )
  expect_equal(unlist(unname(eR(testTempNetwork)[["v1"]])), c("a","c","v1","v1","v1"))
  expect_equal(unlist(unname(eR(testTempNetwork)[["v2"]])), c("b","v2","v2","v2","v2"))

  expect_equal(unlist(names(gV(testTempNetwork, "t1"))), c("a","b","v3","v4","v5"))
  expect_equal(unlist(names(gV(testTempNetwork, "t2"))), c("c","v2","v3","v4","v5"))


  testTempNetwork <- GL1TF1
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- set_vertex_names(GL1TF1, testPList, testTVList,testVList  )
  expect_equal(tG(testTempNetwork),NULL)

  # testTVList <- c("v1","v2","v1")
  # testVList <- c("a","b","c")
  # names(testVList)<- testTVList
  # testPList <- c("t1","t1","t1")
  # testTempNetwork <- set_vertex_names(GL1TF1, testPList, testTVList,testVList  )
  # expect_equal(unlist(unname(eR(testTempNetwork)[["v1"]])), c("a","c","v1","v1","v1"))
  # expect_equal(unlist(unname(eR(testTempNetwork)[["v2"]])), c("b","v2","v2","v2","v2"))
  #
  # expect_equal(unlist(names(gV(testTempNetwork, "t1"))), c("a","b","v3","v4","v5"))
  # expect_equal(unlist(names(gV(testTempNetwork, "t2"))), c("c","v2","v3","v4","v5"))

})













