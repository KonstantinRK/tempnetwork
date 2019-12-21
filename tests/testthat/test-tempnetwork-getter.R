context("test-tempnetwork-getter")

PATH = system.file("inst","testdata","tempflow", package = "tempnetwork")
PATH_GRAPH = system.file("inst","testdata","tempgraph", package = "tempnetwork")

TF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_directed_acyclic_small_1.gml"), format = "graphml"))
# TF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_directed_acyclic_small_1.gml"), format = "graphml"))
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
# GL2 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v2")
# GL3 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v3")
# GL4 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_p13_n5_random50")
# GL5 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_p11_n5_random50", graphNameList = list("a","p11","p21","p22","p23","b","p31","p32","p41","p42","c"))
# GL6 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v1", graphNameList = list("t1", "t2", "t3", "t12", "t13"))
#

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
#
#
# WGL1TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$weighted)
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

# testTempNetwork <- set_vertex_names(GL1TF1,c("t2","t2","t2"), c("v1","v3","v5"), c("a","b","c"))

testTempNetwork <- set_equivRelation(GL1TF1, testER)

test_that("test 'eR(tempNetwork, computeEquivRel = FALSE)'", {
  checkER <- list("v1"=list("t1"= "v1","t2"= "v1","t3"= "v1","t4"= "v1","t5"= "v1"),
                  "v2"=list("t1"= "v2","t2"= "v2","t3"= "v2","t4"= "v2","t5"= "v2"),
                  "v3"=list("t1"= "v3","t2"= "v3","t3"= "v3","t4"= "v3","t5"= "v3"),
                  "v4"=list("t1"= "v4","t2"= "v4","t3"= "v4","t4"= "v4","t5"= "v4"),
                  "v5"=list("t1"= "v5","t2"= "v5","t3"= "v5","t4"= "v5","t5"= "v5"))

  expect_equal(eR(GL1TF1), NULL)
  expect_equal(eR(GL1TF1,TRUE), checkER)
  expect_equal(eR(EGL1TF1), checkER)

})




test_that("test 'get_vertexname(tempNetwork, tVertexName, pointName, safe = TRUE)'", {

  expect_equal(get_vertexname(GL1TF1, "v1","t2"),"v1")
  expect_equal(get_vertexname(testTempNetwork, "a","t2"),"v1")
  expect_equal(get_vertexname(EGL1TF1, "v1","t2"),"v1")
  expect_error(get_vertexname(EGL1TF1, "a","t2"),error_message_tvertex_not_exists())
  expect_error(get_vertexname(EGL1TF1, "v1","t9"),error_message_point_not_exists())


})


test_that("test 'get_vertexnames(tempNetwork, tVertexNameList, pointNameList, safe = TRUE)'", {

  expect_equal(unname(get_vertexnames(GL1TF1, c("v1","v2"),c("t2","t3"))),c("v1","v2"))
  expect_equal(unname(get_vertexnames(testTempNetwork, c("a","c"),c("t2","t3"))),c("v1","v3"))
  expect_equal(unname(get_vertexnames(EGL1TF1, c("v1","v2"),c("t2","t3"))),c("v1","v2"))
  expect_error(get_vertexnames(EGL1TF1, c("a","v2"),c("t2","t3")),error_message_tvertex_not_exists())
  expect_error(get_vertexnames(EGL1TF1, c("v1","v2"),c("t2","t9")),error_message_point_not_exists())

})



test_that("test 'get_tempgraph_vertex_name(tempNetwork, tVertexName, pointName,  safe = TRUE)'", {

  expect_equal(get_tempgraph_vertex_name(GL1TF1, "v1","t2"),"t2v1v1")
  expect_equal(get_tempgraph_vertex_name(testTempNetwork, "a","t2"),"t2av1")
  expect_equal(get_tempgraph_vertex_name(EGL1TF1, "v1","t2"),"t2v1v1")
  expect_error(get_tempgraph_vertex_name(EGL1TF1, "a","t2"),error_message_tvertex_not_exists())
  expect_error(get_tempgraph_vertex_name(EGL1TF1, "v1","t9"),error_message_point_not_exists())


})


test_that("test 'get_tempgraph_vertex_names(tempNetwork, tVertexNameList, pointNameList, safe = TRUE)'", {

  expect_equal(unname(get_tempgraph_vertex_names(GL1TF1, c("v1","v2"),c("t2","t3"))),c("t2v1v1","t3v2v2"))
  expect_equal(unname(get_tempgraph_vertex_names(testTempNetwork, c("a","c"),c("t2","t3"))),c("t2av1","t3cv3"))
  expect_equal(unname(get_tempgraph_vertex_names(EGL1TF1, c("v1","v2"),c("t2","t3"))),c("t2v1v1","t3v2v2"))
  expect_error(get_tempgraph_vertex_names(EGL1TF1, c("a","v2"),c("t2","t3")),error_message_tvertex_not_exists())
  expect_error(get_tempgraph_vertex_names(EGL1TF1, c("v1","v2"),c("t2","t9")),error_message_point_not_exists())


})







