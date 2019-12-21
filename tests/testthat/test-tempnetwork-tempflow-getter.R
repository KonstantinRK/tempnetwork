context("test-tempnetwork-tempflow-getter")
PATH = system.file("inst","testdata","tempflow", package = "tempnetwork")
PATH_GRAPH = system.file("inst","testdata","tempgraph", package = "tempnetwork")

# TF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_directed_acyclic_small_1.gml"), format = "graphml"))
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

GL1 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v1")
# GL2 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v2")
# GL3 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v3")
# GL4 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_p13_n5_random50")
# GL5 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_p11_n5_random50", graphNameList = list("a","p11","p21","p22","p23","b","p31","p32","p41","p42","c"))
#
#
#
# GL1TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$simple)
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
#
# GL5ETF1 <- tempnetwork(tempFlow = ETF1, equivalenceRelation = NULL, graphList = GL5$simple)
#
#
#
# WGL1TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$weighted)
# WGL2TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL2$weighted)
# WGL3TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL3$weighted)

WGL1TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL1$weighted)
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
# WGL1LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL1$weighted)
# WGL2LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL2$weighted)
# WGL3LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL3$weighted)
#
# WGL4LTF3 <- tempnetwork(tempFlow = LTF3, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL4LTF4 <- tempnetwork(tempFlow = LTF4, equivalenceRelation = NULL, graphList = GL4$weighted)
# WGL4LTF5 <- tempnetwork(tempFlow = LTF5, equivalenceRelation = NULL, graphList = GL4$weighted)
#
# WGL5ETF1 <- tempnetwork(tempFlow = ETF1, equivalenceRelation = NULL, graphList = GL5$weighted)
#



test_that("test 'get_point_ids(tempFlow, inpPoint = tP(tempFlow), safe = TRUE)'", {

  expect_equal(get_point_ids(WGL1TF2), c(1,2,3,4,5))
  expect_equal(get_point_ids(WGL1TF2, 3), 3)
  expect_equal(get_point_ids(WGL1TF2, "t3"), 3)
  expect_equal(get_point_ids(WGL1TF2, c(1,2,3)), c(1,2,3))
  expect_equal(get_point_ids(WGL1TF2, c("t1","t2","t3")), c(1,2,3))
  expect_error(get_point_ids(WGL1TF2, "4"), error_message_name_not_in_object())
  expect_error(get_point_ids(WGL1TF2, 9), error_message_ids_not_in_object())
  expect_error(get_point_ids(WGL1TF2, -3), error_message_ids_not_in_object())
  expect_error(get_point_ids(WGL1TF2, c("t1",2,"t3")), error_message_name_not_in_object())
  expect_error(get_point_ids(WGL1TF2, c("1",2,"3")), error_message_name_not_in_object())

  expect_equal(get_point_ids(WGL1TF2, "4", safe = FALSE), integer(0))
  expect_equal(get_point_ids(WGL1TF2, 9, safe = FALSE), 9)
  expect_equal(get_point_ids(WGL1TF2, -3, safe = FALSE), -3)

})

test_that("test 'get_step_ids(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE)'", {


  expect_equal(get_step_ids(WGL1TF2, 3,5), 5)
  expect_equal(get_step_ids(WGL1TF2, "t3", "t5"), 5)
  expect_equal(get_step_ids(WGL1TF2, NULL, "t5"), c(1,2,3,4,5))
  expect_equal(get_step_ids(WGL1TF2, "t3", NULL), c(1,2,3,4,5))
  expect_error(get_step_ids(WGL1TF2, "4","5"), error_message_name_not_in_object())
  expect_error(get_step_ids(WGL1TF2, 9,4), error_message_ids_not_in_object())
  expect_error(get_step_ids(WGL1TF2, "4",5), error_message_name_not_in_object())
  expect_error(get_step_ids(WGL1TF2, 4, "5"), error_message_name_not_in_object())

  expect_equal(get_step_ids(WGL1TF2, "t4",5, safe = FALSE), 4)
  expect_error(get_step_ids(WGL1TF2, 4,7, safe = FALSE))
  expect_error(get_step_ids(WGL1TF2, 9,4, safe = FALSE),)
  expect_error(get_step_ids(WGL1TF2, -3,-4, safe = FALSE))

})


test_that("test 'get_point_names(tempFlow, inpPointList  = tP(tempFlow), safe = TRUE)'", {

  expect_equal(get_point_names(WGL1TF2), c("t1","t2","t3","t4","t5"))
  expect_equal(get_point_names(WGL1TF2, c(1,2,3)), c("t1","t2","t3"))
  expect_equal(get_point_names(WGL1TF2, c("t1","t2","t3")), c("t1","t2","t3"))
  expect_equal(get_point_names(WGL1TF2, c(1,2,5)), c("t1","t2","t5"))
  expect_equal(get_point_names(WGL1TF2, c("t1","t2","t5")), c("t1","t2","t5"))

  expect_error(get_point_names(WGL1TF2, c("1","2","3")), error_message_name_not_in_object())
  expect_error(get_point_names(WGL1TF2, c(1,"t2",5)), error_message_name_not_in_object())
  expect_error(get_point_names(WGL1TF2, c("t1","t2","t9")), error_message_name_not_in_object())
  expect_error(get_point_names(WGL1TF2, c(1,2,9)), error_message_ids_not_in_object())

})


test_that("test 'get_step_weights(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE)'", {

  expect_equal(get_step_weights(WGL1TF2, c("t1","t2","t3"), c("t2", "t4","t5")), c(1,3,1))
  expect_equal(get_step_weights(WGL1TF2, c(1,2,3), c(2,4,5)), c(1,3,1))
  expect_equal(get_step_weights(WGL1TF2, c(1,2,3), c("t2","t4","t5")), c(1,3,1))
  expect_equal(get_step_weights(WGL1TF2, c("t1","t2","t3"), c(2,4,5)), c(1,3,1))
  expect_equal(get_step_weights(WGL1TF2), c(1,3,3,2,1))


  expect_error(get_step_weights(WGL1TF2, c(1,2,3), c(2,"4",5)), error_message_name_not_in_object())
  expect_error(get_step_weights(WGL1TF2, c(1,"2",3), c(2,4,5)), error_message_name_not_in_object())
  expect_error(get_step_weights(WGL1TF2, c("t1",2,"t3"), c(2,"t4",5)), error_message_name_not_in_object())
  expect_error(get_step_weights(WGL1TF2, c("t1","t9","t3"), c("t2", "t4","t5")), error_message_name_not_in_object())
  expect_error(get_step_weights(WGL1TF2, c("t1","t2","t3"), c("t2", "t9","t5")), error_message_name_not_in_object())
  expect_error(get_step_weights(WGL1TF2, c("t1","t1","t3"), c("t2", "t4","t5")), error_message_edge_not_exist())
  expect_error(get_step_weights(WGL1TF2, c("t1","t2","t3"), c("t2", "t5","t5")), error_message_edge_not_exist())


  })


test_that("test 'get_step_weights_from_id(tempFlow, stepIDList=tS(tempFlow), safe = TRUE)'", {

  expect_equal(get_step_weights_from_id(WGL1TF2, c(1,3,5)), c(1,3,1))
  expect_equal(get_step_weights_from_id(WGL1TF2), c(1,3,3,2,1))

  expect_error(get_step_weights_from_id(WGL1TF2, c(1,2,9)), error_message_ids_not_in_object())
  expect_error(get_step_weights_from_id(WGL1TF2, c(1,"t2",3)), error_message_ids_not_in_object())

})




test_that("test 'get_step_point_list(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE) '", {

  expect_equal(get_step_point_list(WGL1TF2, c("t1","t2","t3"), c("t2", "t4","t5")), list("startPointList"=c("t1","t2","t3"), "endPointList"=c("t2", "t4","t5")))
  expect_equal(get_step_point_list(WGL1TF2, c(1,2,3), c(2,4,5)), list("startPointList"=c("t1","t2","t3"), "endPointList"=c("t2", "t4","t5")))
  expect_equal(get_step_point_list(WGL1TF2, c(1,2,3), c("t2","t4","t5")), list("startPointList"=c("t1","t2","t3"), "endPointList"=c("t2", "t4","t5")))
  expect_equal(get_step_point_list(WGL1TF2, c("t1","t2","t3"), c(2,4,5)), list("startPointList"=c("t1","t2","t3"), "endPointList"=c("t2", "t4","t5")))
  expect_equal(get_step_point_list(WGL1TF2), list("startPointList"=c("t1","t2","t2","t4","t3"), "endPointList"=c("t2","t3", "t4","t5", "t5")))


  expect_error(get_step_point_list(WGL1TF2, c(1,2,3), c(2,"4",5)), error_message_name_not_in_object())
  expect_error(get_step_point_list(WGL1TF2, c(1,"2",3), c(2,4,5)), error_message_name_not_in_object())
  expect_error(get_step_point_list(WGL1TF2, c("t1",2,"t3"), c(2,"t4",5)), error_message_name_not_in_object())
  expect_error(get_step_point_list(WGL1TF2, c("t1","t9","t3"), c("t2", "t4","t5")), error_message_name_not_in_object())
  expect_error(get_step_point_list(WGL1TF2, c("t1","t2","t3"), c("t2", "t9","t5")), error_message_name_not_in_object())
  expect_error(get_step_point_list(WGL1TF2, c("t1","t1","t3"), c("t2", "t4","t5")), error_message_edge_not_exist())
  expect_error(get_step_point_list(WGL1TF2, c("t1","t2","t3"), c("t2", "t5","t5")), error_message_edge_not_exist())


})


test_that("test 'get_step_point_list_from_id(tempFlow, stepIDList = tS(tempFlow), safe = TRUE)'", {

  expect_equal(get_step_point_list_from_id(WGL1TF2, c(1,3,5)), list("startPointList"=c("t1","t2","t3"), "endPointList"=c("t2", "t4","t5")))
  expect_equal(get_step_point_list_from_id(WGL1TF2), list("startPointList"=c("t1","t2","t2","t4","t3"), "endPointList"=c("t2","t3", "t4","t5", "t5")))

  expect_error(get_step_point_list_from_id(WGL1TF2, c(1,2,9)), error_message_ids_not_in_object())
  expect_error(get_step_point_list_from_id(WGL1TF2, c(1,"t2",3)), error_message_ids_not_in_object())

})


