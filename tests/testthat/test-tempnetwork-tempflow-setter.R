context("test-tempnetwork-tempflow-setter")
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
LTF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_directed_acyclic_loop_small_1.gml"), format = "graphml"))
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
#

GL1 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v1")
# GL2 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v2")
# GL3 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v3")
# GL4 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_p13_n5_random50")
# GL5 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_p11_n5_random50", graphNameList = list("a","p11","p21","p22","p23","b","p31","p32","p41","p42","c"))
# GL6 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v1", graphNameList = list("t1", "t2", "t3", "t12", "t13"))
#
#
# GL1TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$simple)
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
GL1LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL1$simple)
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
#

test_that("test 'set_point_names(tempFlow, pointList = tP(tempFLow), nameList = NULL, safe = TRUE)'", {

  expect_equal(tP(set_point_names(GL1TF2))$name, paste(c(1:5)))
  expect_equal(names(gL(set_point_names(GL1TF2))), paste(c(1:5)))
  expect_equal(all(sapply(eR( set_point_names(GL1TF2) ), function(x) return(names(x)== paste(c(1:5)) ))), TRUE)

  expect_equal(tP(set_point_names(GL1TF2, nameList = c(1,2,3,4,5)))$name, paste(c(1:5)))
  expect_equal(names(gL(set_point_names(GL1TF2, nameList = c(1,2,3,4,5)))), paste(c(1:5)))
  expect_equal(all(sapply(eR( set_point_names(GL1TF2, nameList = c(1,2,3,4,5)) ), function(x) return(names(x)== paste(c(1:5)) ))), TRUE)


  expect_equal(tP(set_point_names(GL1TF2, nameList = c(1,2,3,4,5)))$name, paste(c(1:5)))
  expect_equal(names(gL(set_point_names(GL1TF2, nameList = c(1,2,3,4,5)))), paste(c(1:5)))
  expect_equal(all(sapply(eR( set_point_names(GL1TF2, nameList = c(1,2,3,4,5)) ), function(x) return(names(x)== paste(c(1:5)) ))), TRUE)

  expect_equal(tP(set_point_names(GL1TF2, pointList = c("t1","t2","t3")))$name, c(1,2,3,"t4","t5"))
  expect_equal(names(gL(set_point_names(GL1TF2, pointList = c("t1","t2","t3")))), c(1,2,3,"t4","t5"))
  expect_equal(all(sapply(eR( set_point_names(GL1TF2, pointList = c("t1","t2","t3")) ), function(x) return(names(x)== c(1,2,3,"t4","t5") ))), TRUE)

  expect_equal(tP(set_point_names(GL1TF2, pointList = c("t1","t2","t3"), nameList = c("a1","a2","a3")))$name, c("a1","a2","a3","t4","t5"))
  expect_equal(names(gL(set_point_names(GL1TF2, pointList = c("t1","t2","t3"), nameList = c("a1","a2","a3")))), c("a1","a2","a3","t4","t5"))
  expect_equal(all(sapply(eR( set_point_names(GL1TF2, pointList = c("t1","t2","t3"), nameList = c("a1","a2","a3")) ), function(x) return(names(x)== c("a1","a2","a3","t4","t5") ))), TRUE)

  expect_equal(get_point_id(set_point_names(GL1TF2, nameList = c("1","3","2","4","5")), 3), 3)
  expect_equal(get_point_id(set_point_names(GL1TF2, nameList = c("1","3","2","4","5")), "3"), 2)

  expect_equal(tP(set_point_names(GL1TF2))$name, paste(c(1,2,3,4,5)))
  expect_equal(names(gL(set_point_names(GL1TF2))), paste(c(1,2,3,4,5)))
  expect_equal(all(sapply(eR( set_point_names(GL1TF2) ), function(x) return(names(x)== paste(c(1,2,3,4,5)) ))), TRUE)

  expect_error(set_point_names(GL1TF2, pointList = c("t1","t6")), error_message_name_not_in_object())
  expect_error(set_point_names(GL1TF2, nameList = c(1,2,3,3,4)), error_message_names_not_unique())
  expect_error(set_point_names(GL1TF2, nameList = c(1,2,3)), error_message_vector_not_equal_length())
  expect_error(set_point_names(GL1TF2, pointList = c("t1","t2","t3"), nameList = c(1,2)), error_message_vector_not_equal_length())
  expect_error(set_point_names(GL1TF2, pointList = c("t1","t2"), nameList = c(1,2,3)), error_message_vector_not_equal_length())

  expect_equal(tP(set_point_names(GL1TF2, pointList = c("t1","t2","t3"), safe = FALSE))$name, c(1,2,3,"t4","t5"))
  expect_equal(names(gL(set_point_names(GL1TF2, pointList = c("t1","t2","t3"), safe = FALSE))), c(1,2,3,"t4","t5"))
  expect_equal(all(sapply(eR( set_point_names(GL1TF2, pointList = c("t1","t2","t3"), safe = FALSE) ), function(x) return(names(x)== c(1,2,3,"t4","t5") ))), TRUE)

  expect_equal(tP(set_point_names(GL1TF2, pointList = c("t1","t2","t3"), nameList = c("1","1","2"), safe = FALSE))$name, c(1,1,2,"t4","t5"))
  expect_equal(names(gL(set_point_names(GL1TF2, pointList = c("t1","t2","t3"), nameList = c("1","1","2"), safe = FALSE))), c(1,1,2,"t4","t5"))
  expect_equal(all(sapply(eR( set_point_names(GL1TF2, pointList = c("t1","t2","t3"), nameList = c("1","1","2"), safe = FALSE) ), function(x) return(names(x)== c(1,1,2,"t4","t5") ))), TRUE)

  expect_equal(tP(set_point_names(GL1TF2, pointList = c("t1","t2"), nameList = "1", safe = FALSE))$name, c(1,1,"t3","t4","t5"))
  expect_equal(names(gL(set_point_names(GL1TF2, pointList = c("t1","t2"), nameList = "1", safe = FALSE))), c(1,1,"t3","t4","t5"))
  expect_equal(all(sapply(eR( set_point_names(GL1TF2, pointList = c("t1","t2"), nameList = "1", safe = FALSE) ), function(x) return(names(x)== c(1,1,"t3","t4","t5") ))), TRUE)



  testTempNetwork <- GL1TF2
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- set_point_names(GL1TF2)
  expect_equal(tG(testTempNetwork),NULL)
})



test_that("test 'set_step_weights(tempFlow, srcPointList = NULL, dstPointList = NULL, weightList = NULL, safe = TRUE)'", {

  expect_equal(tS(set_step_weights(GL1TF2))$weight, rep(1, length(tS(GL1TF2))))
  expect_equal(tS(set_step_weights(GL1TF2, srcPointList = c("t1","t2")))$weight, rep(1, length(tS(GL1TF2))))
  expect_equal(tS(set_step_weights(GL1TF2, dstPointList = c("t1","t2")))$weight, rep(1, length(tS(GL1TF2))))
  expect_equal(tS(set_step_weights(GL1TF2, weightList = 2))$weight, rep(2, length(tS(GL1TF2))))
  expect_equal(tS(set_step_weights(GL1TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4"), weightList = c(10,20)))$weight, c(10,3,20,2,1))
  expect_equal(tS(set_step_weights(GL1TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4")))$weight, c(1,3,1,2,1))

  expect_equal(tS(set_step_weights(GL1TF2))$weight, rep(1, length(tS(GL1TF2))))
  expect_equal(tS(set_step_weights(GL1LTF2))$weight, c(1,1,1,1,1,0,0,0,0,0))


  expect_error(set_step_weights(GL1TF2, weightList = c(1,2)), error_message_vector_not_equal_lengths_and_not_one())
  expect_error(set_step_weights(GL1TF2, srcPointList = c("t1","t2"), weightList = c(1,2)), error_message_vector_not_equal_lengths_and_not_one())
  expect_error(set_step_weights(GL1TF2, dstPointList = c("t1","t2"), weightList = c(1,2)), error_message_vector_not_equal_lengths_and_not_one())
  expect_error(set_step_weights(GL1TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t5"), weightList = c(1,2)), error_message_edge_not_exist())
  expect_error(set_step_weights(GL1TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4"), weightList = c(1,-2)), error_message_weights_not_nonnegative())
  expect_error(set_step_weights(GL1TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4"), weightList = c("10",-20)), error_message_weights_not_numeric() )

  expect_equal(tS(set_step_weights(GL1LTF2))$weight, c(1,1,1,1,1,0,0,0,0,0))
  expect_equal(tS(set_step_weights(GL1LTF2, srcPointList = c("t1","t2")))$weight, c(1,1,1,1,1,0,0,0,0,0))
  expect_equal(tS(set_step_weights(GL1LTF2, dstPointList = c("t1","t2")))$weight, c(1,1,1,1,1,0,0,0,0,0))
  expect_equal(tS(set_step_weights(GL1LTF2, weightList = 2))$weight, rep(2, length(tS(GL1LTF2))))
  expect_equal(tS(set_step_weights(GL1LTF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4"), weightList = c(10,20)))$weight, c(10,3,20,2,1,1,1,1,1,1))
  expect_equal(tS(set_step_weights(GL1LTF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4")))$weight, c(1,3,1,2,1,1,1,1,1,1))

  expect_equal(suppressWarnings(tS(set_step_weights(GL1TF2, weightList = c(1,2), safe = FALSE))$weight), tS(GL1TF2)$weight)
  expect_equal(suppressWarnings(tS(set_step_weights(GL1TF2, srcPointList = c("t1","t2"), weightList = c(1,2), safe = FALSE))$weight), tS(GL1TF2)$weight)
  expect_equal(suppressWarnings(tS(set_step_weights(GL1TF2, dstPointList = c("t1","t2"), weightList = c(1,2), safe = FALSE))$weight), tS(GL1TF2)$weight)
  expect_equal(suppressWarnings(tS(set_step_weights(GL1TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t5"), weightList = c(20,30), safe = FALSE))$weight), c(20,3,3,2,1))
  expect_equal(tS(set_step_weights(GL1TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4"), weightList = c(20,-2), safe = FALSE))$weight, c(20,3,-2,2,1))
  expect_equal(tS(set_step_weights(GL1TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4"), weightList = c("10",-20), safe = FALSE))$weight, paste(c(10,3,-20,2,1)))

  testTempNetwork <- GL1TF2
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- set_step_weights(GL1TF2)
  expect_equal(tG(testTempNetwork),NULL)
})




test_that("test 'set_step_weights_from_id(tempFlow, stepIDList = NULL, weightList = NULL, safe = TRUE)'", {

  expect_equal(tS(set_step_weights_from_id(GL1TF2))$weight, rep(1, length(tS(GL1TF2))))
  expect_equal(tS(set_step_weights_from_id(GL1TF2, weightList = 1))$weight, rep(1, length(tS(GL1TF2))))
  expect_equal(tS(set_step_weights_from_id(GL1TF2, weightList = c(1,2,3,4,5)))$weight, c(1,2,3,4,5))

  expect_equal(tS(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2,3,4,5)))$weight, rep(1, length(tS(GL1TF2))))
  expect_equal(tS(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2,3,4,5), weightList = 1))$weight, rep(1, length(tS(GL1TF2))))
  expect_equal(tS(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2,3,4,5), weightList = c(1,2,3,4,5)))$weight, c(1,2,3,4,5))

  expect_equal(tS(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2,3)))$weight,  c(1,1,1,2,1))
  expect_equal(tS(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2,3), weightList = 1))$weight, c(1,1,1,2,1))
  expect_equal(tS(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2,3), weightList = c(1,2,3)))$weight, c(1,2,3,2,1))
  expect_equal(tS(set_step_weights_from_id(GL1TF2))$weight, rep(1, length(tS(GL1TF2))))



  expect_equal(tS(set_step_weights_from_id(GL1LTF2))$weight, c(1,1,1,1,1,0,0,0,0,0))
  expect_equal(tS(set_step_weights_from_id(GL1LTF2, weightList = 1))$weight, c(1,1,1,1,1,1,1,1,1,1))
  expect_equal(tS(set_step_weights_from_id(GL1LTF2, weightList = c(1,2,3,4,5,6,7,8,9,10)))$weight, c(1,2,3,4,5,6,7,8,9,10))

  expect_equal(tS(set_step_weights_from_id(GL1LTF2, stepIDList = c(1,2,3,4,5,6,7,8,9,10)))$weight, c(1,1,1,1,1,0,0,0,0,0))
  expect_equal(tS(set_step_weights_from_id(GL1LTF2, stepIDList = c(1,2,3,4,5,6,7,8,9,10), weightList = 1))$weight, c(1,1,1,1,1,1,1,1,1,1))
  expect_equal(tS(set_step_weights_from_id(GL1LTF2, stepIDList = c(1,2,3,4,5,6,7,8,9,10), weightList = c(1,2,3,4,5,6,7,8,9,10)))$weight, c(1,2,3,4,5,6,7,8,9,10))

  expect_equal(tS(set_step_weights_from_id(GL1LTF2, stepIDList = c(1,2,3,6,10)))$weight,  c(1,1,1,2,1,0,1,1,1,0))
  expect_equal(tS(set_step_weights_from_id(GL1LTF2, stepIDList = c(1,2,3,6,10), weightList = 1))$weight, c(1,1,1,2,1,1,1,1,1,1))
  expect_equal(tS(set_step_weights_from_id(GL1LTF2, stepIDList = c(1,2,3,6,10), weightList = c(1,2,3,4,5)))$weight, c(1,2,3,2,1,4,1,1,1,5))
  expect_equal(tS(set_step_weights_from_id(GL1LTF2))$weight, c(1,1,1,1,1,0,0,0,0,0))

  expect_error(set_step_weights_from_id(GL1TF2, weightList = c(1,2)), error_message_vector_not_equal_length_and_not_one())
  expect_error(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2), weightList = c(1,2,3)), error_message_vector_not_equal_length_and_not_one())
  expect_error(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2,3,4), weightList = c(1,2,3)), error_message_vector_not_equal_length_and_not_one())
  expect_error(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2,9), weightList = c(1,2,3)), error_message_ids_not_in_object())
  expect_error(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2), weightList = c(1,-2)), error_message_weights_not_nonnegative())
  expect_error(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2), weightList = c("10",-20)), error_message_weights_not_numeric())


  expect_equal(suppressWarnings(tS(set_step_weights_from_id(GL1TF2, weightList = c(1,2,3), safe = FALSE))$weight), c(1,2,3,1,2))
  expect_equal(suppressWarnings(tS(set_step_weights_from_id(GL1TF2, stepIDList = c(1,9), weightList = c(20,30), safe = FALSE))$weight), c(20,3,3,2,1))
  expect_equal(tS(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2), weightList = c(20,-2), safe = FALSE))$weight, c(20,-2,3,2,1))
  expect_equal(tS(set_step_weights_from_id(GL1TF2, stepIDList = c(1,2), weightList = c("10",-20), safe = FALSE))$weight, paste(c(10,-20,3,2,1)))

  testTempNetwork <- GL1TF2
  testTempNetwork$storeTempGraph  <- TRUE
  testTempNetwork <- construct_underlying_graph(testTempNetwork)
  expect_equal(class(tG(testTempNetwork)),"igraph")
  testTempNetwork <- set_step_weights_from_id(GL1TF2)
  expect_equal(tG(testTempNetwork),NULL)

})



