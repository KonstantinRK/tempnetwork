context("test-tempnetwork")
PATH = system.file("inst","testdata","tempflow", package = "tempnetwork")
PATH_GRAPH = system.file("inst","testdata","tempgraph", package = "tempnetwork")

TF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_directed_acyclic_small_1.gml"), format = "graphml"))
TF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_directed_acyclic_small_1.gml"), format = "graphml"))
TF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_forrest_small_1.gml"), format = "graphml"))
TF4 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_tree_small_1.gml"), format = "graphml"))
TF5 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_lattice_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)


LTF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_directed_acyclic_loop_small_1.gml"), format = "graphml"))
LTF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_directed_acyclic_loop_small_1.gml"), format = "graphml"))
LTF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_forrest_loop_small_1.gml"), format = "graphml"))
LTF4 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_tree_loop_small_1.gml"), format = "graphml"))
LTF5 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_lattice_loop_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)
LTF6 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_differentlyweighted_directed_acyclic_loop_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)

STF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_singelton_1.gml"), format = "graphml"))
STF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_singelton_noname_1.gml"), format = "graphml"))
STF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_singelton_loop_1.gml"), format = "graphml"))

WTF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_partialweighted_directed_acyclic_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)

ETF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_example_2_6.gml"), format = "graphml"))
ETF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_example_4_1.gml"), format = "graphml"))
ETF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_example_4_2.gml"), format = "graphml"))

GL1 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v3")
ERGL1 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_special_p5_ndifferent")
ERGL2 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_special_p5different_n5")
ERGL3 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_special_p5different_ndifferent")


test_that("test 'tempflow'", {


  expect_equal(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$simple)), "tempnetwork")
  expect_equal(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$directed)), "tempnetwork")
  expect_equal(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$weighted)), "tempnetwork")
  expect_equal(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$directed_weighted)), "tempnetwork")

  GL1error1 <- lapply(GL1 , function(gl) setNames(gl, c("a","t2","t3","t4","t5")))
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error1$simple)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error1$directed)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error1$weighted)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error1$directed_weighted)), error_message_not_tempflow_graphlist_index_equality())


  GL1error2 <- lapply(GL1 , function(gl) setNames(gl, c("t1","t1","t3","t4","t5")))
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error2$simple)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error2$directed)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error2$weighted)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error2$directed_weighted)), error_message_not_tempflow_graphlist_index_equality())

  GL1error3 <- lapply(GL1 , function(gl) gl[c("t1","t2","t4")])
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error2$simple)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error2$directed)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error2$weighted)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error2$directed_weighted)), error_message_not_tempflow_graphlist_index_equality())

  GL1error4 <- lapply(GL1 , function(gl) list("t1"=gl$t1, "t2"=gl$t1, "t3"=gl$t1, "t4"=gl$t1, "t5"=igraph::delete.vertices(gl$t5, c(1,2))))
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error4$simple)), error_message_not_graphlist_vertex_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error4$directed)), error_message_not_graphlist_vertex_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error4$weighted)), error_message_not_graphlist_vertex_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error4$directed_weighted)), error_message_not_graphlist_vertex_equality())

  GL1error5 <- lapply(GL1 , function(gl) list("t1"=gl$t1, "t2"=gl$t1, "t3"=gl$t1, "t4"=gl$t1, "t5"=igraph::set_vertex_attr(gl$t5, "name", value = c("a", "v2","v3","v4","v5"))))
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error5$simple)), error_message_not_graphlist_vertex_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error5$directed)), error_message_not_graphlist_vertex_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error5$weighted)), error_message_not_graphlist_vertex_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error5$directed_weighted)), error_message_not_graphlist_vertex_equality())

  GL1error6 <- lapply(GL1 , function(gl) list("t1"=igraph::set_vertex_attr(gl$t1, "name", value = c("v1", "v2","v3","v4","v1")),
                                              "t2"=igraph::set_vertex_attr(gl$t2, "name", value = c("v1", "v2","v3","v4","v1")),
                                              "t3"=igraph::set_vertex_attr(gl$t3, "name", value = c("v1", "v2","v3","v4","v1")),
                                              "t4"=igraph::set_vertex_attr(gl$t4, "name", value = c("v1", "v2","v3","v4","v1")),
                                              "t5"=igraph::set_vertex_attr(gl$t5, "name", value = c("v1", "v2","v3","v4","v1"))))
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error6$simple)), error_message_graphlist_vertex_not_unique())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error6$directed)), error_message_graphlist_vertex_not_unique())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error6$weighted)), error_message_graphlist_vertex_not_unique())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1error6$directed_weighted)), error_message_graphlist_vertex_not_unique())


  equivRel = setNames(lapply(c(1:5), function(x) {setNames(as.list(rep(sprintf("v%s",x),5)), c("t1","t2","t3","t4","t5"))}), c("v1","v2","v3","v4","v5"))
  expect_equal(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRel, graphList = GL1$simple)), "tempnetwork")
  expect_equal(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRel, graphList = GL1$directed)), "tempnetwork")
  expect_equal(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRel, graphList = GL1$weighted)),  "tempnetwork")
  expect_equal(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRel, graphList = GL1$directed_weighted)), "tempnetwork")


  equivRelError1 = setNames(lapply(c(1:5), function(x) {setNames(as.list(rep(sprintf("v%s",x),5)), c("a","t2","t3","t4","t5"))}), c("v1","v2","v3","v4","v5"))
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError1, graphList = GL1$simple)), error_message_not_tempflow_equivclass_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError1, graphList = GL1$directed)), error_message_not_tempflow_equivclass_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError1, graphList = GL1$weighted)), error_message_not_tempflow_equivclass_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError1, graphList = GL1$directed_weighted)), error_message_not_tempflow_equivclass_index_equality())

  equivRelError2 = setNames(lapply(c(1:5), function(x) {setNames(as.list(c("a",rep(sprintf("v%s",x),4))), c("t1","t2","t3","t4","t5"))}), c("v1","v2","v3","v4","v5"))
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError2, graphList = GL1$simple)), error_message_equivalenceclass_is_not_exhaustive())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError2, graphList = GL1$directed)), error_message_equivalenceclass_is_not_exhaustive())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError2, graphList = GL1$weighted)), error_message_equivalenceclass_is_not_exhaustive())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError2, graphList = GL1$directed_weighted)), error_message_equivalenceclass_is_not_exhaustive())

  equivRelError3 = setNames(lapply(c(1:4), function(x) {setNames(as.list(rep(sprintf("v%s",x),5)), c("t1","t2","t3","t4","t5"))}), c("v1","v2","v3","v4"))
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError3, graphList = GL1$simple)), error_message_equivrel_not_equal_length_to_vertices())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError3, graphList = GL1$directed)), error_message_equivrel_not_equal_length_to_vertices())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError3, graphList = GL1$weighted)), error_message_equivrel_not_equal_length_to_vertices())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError3, graphList = GL1$directed_weighted)), error_message_equivrel_not_equal_length_to_vertices())

  equivRelError4 = setNames(lapply(c(1:5), function(x) {setNames(as.list(rep(sprintf("v%s",x),4)), c("t1","t2","t3","t4"))}), c("v1","v2","v3","v4","v5"))
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError4, graphList = GL1$simple)), error_message_not_tempflow_equivclass_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError4, graphList = GL1$directed)), error_message_not_tempflow_equivclass_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError4, graphList = GL1$weighted)), error_message_not_tempflow_equivclass_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError4, graphList = GL1$directed_weighted)), error_message_not_tempflow_equivclass_index_equality())

  equivRelError4 = setNames(lapply(c(1:5), function(x) {setNames(as.list(rep(sprintf("v%s",x),5)),  c("t1","t2","t3","t4","t5"))}), c("v1","v1","v3","v4","v5"))
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError4, graphList = GL1$simple)), error_message_equivrel_index_is_not_unique())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError4, graphList = GL1$directed)), error_message_equivrel_index_is_not_unique())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError4, graphList = GL1$weighted)), error_message_equivrel_index_is_not_unique())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError4, graphList = GL1$directed_weighted)), error_message_equivrel_index_is_not_unique())

  equivRelError5 = setNames(lapply(c(1:5), function(x) {setNames(as.list(rep(sprintf("v%s",x),5)),  c("t1","t1","t3","t4","t5"))}), c("v1","v2","v3","v4","v5"))
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError5, graphList = GL1$simple)), error_message_not_tempflow_equivclass_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError5, graphList = GL1$directed)), error_message_not_tempflow_equivclass_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError5, graphList = GL1$weighted)), error_message_not_tempflow_equivclass_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = equivRelError5, graphList = GL1$directed_weighted)), error_message_not_tempflow_equivclass_index_equality())


  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = ERGL1$simple)), error_message_not_graphlist_vertex_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = ERGL1$directed)), error_message_not_graphlist_vertex_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = ERGL1$weighted)), error_message_not_graphlist_vertex_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = ERGL1$directed_weighted)), error_message_not_graphlist_vertex_equality())

  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = ERGL2$simple)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = ERGL2$directed)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = ERGL2$weighted)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = ERGL2$directed_weighted)), error_message_not_tempflow_graphlist_index_equality())

  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = ERGL3$simple)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = ERGL3$directed)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = ERGL3$weighted)), error_message_not_tempflow_graphlist_index_equality())
  expect_error(class(tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = ERGL3$directed_weighted)), error_message_not_tempflow_graphlist_index_equality())


})




