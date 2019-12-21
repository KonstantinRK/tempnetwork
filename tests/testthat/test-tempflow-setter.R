context("test-tempflow-setter")

TF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml"))
TF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml"))
# TF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_forrest_small_1.gml", package = "tempnetwork"), format = "graphml"))
# TF4 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_tree_small_1.gml", package = "tempnetwork"), format = "graphml"))
# TF5 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_lattice_small_1.gml", package = "tempnetwork"), format = "graphml"), setDefaultValues = TRUE)


LTF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_directed_acyclic_loop_small_1.gml", package = "tempnetwork"), format = "graphml"))
LTF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_acyclic_loop_small_1.gml", package = "tempnetwork"), format = "graphml"))
# LTF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_forrest_loop_small_1.gml", package = "tempnetwork"), format = "graphml"))
# LTF4 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_tree_loop_small_1.gml", package = "tempnetwork"), format = "graphml"))
# LTF5 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_lattice_loop_small_1.gml", package = "tempnetwork"), format = "graphml"), setDefaultValues = TRUE)
# LTF6 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_differentlyweighted_directed_acyclic_loop_small_1.gml", package = "tempnetwork"), format = "graphml"), setDefaultValues = TRUE)
#
# STF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_1.gml", package = "tempnetwork"), format = "graphml"))
# STF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_noname_1.gml", package = "tempnetwork"), format = "graphml"))
# STF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_loop_1.gml", package = "tempnetwork"), format = "graphml"))
#
# WTF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_partialweighted_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml"), setDefaultValues = TRUE)
#
# ETF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_2_6.gml", package = "tempnetwork"), format = "graphml"))
# ETF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_4_1.gml", package = "tempnetwork"), format = "graphml"))
# ETF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_4_2.gml", package = "tempnetwork"), format = "graphml"))

test_that("test 'set_point_names(tempFlow, pointList = tP(tempFLow), nameList = NULL, safe = TRUE)'", {

  expect_equal(tP(set_point_names(TF2))$name, paste(c(1:5)))
  expect_equal(tP(set_point_names(TF2, nameList = c(1,2,3,4,5)))$name, paste(c(1:5)))
  expect_equal(tP(set_point_names(TF2, nameList = c(1,2,3,4,5)))$name, paste(c(1:5)))
  expect_equal(tP(set_point_names(TF2, pointList = c("t1","t2","t3")))$name, c(1,2,3,"t4","t5"))
  expect_equal(tP(set_point_names(TF2, pointList = c("t1","t2","t3"), nameList = c("a1","a2","a3")))$name, c("a1","a2","a3","t4","t5"))

  expect_equal(get_point_id(set_point_names(TF2, nameList = c("1","3","2","4","5")), 3), 3)
  expect_equal(get_point_id(set_point_names(TF2, nameList = c("1","3","2","4","5")), "3"), 2)

  expect_equal(tP(set_point_names(TF2))$name, paste(c(1,2,3,4,5)))

  expect_error(set_point_names(TF2, pointList = c("t1","t6")), error_message_name_not_in_object())
  expect_error(set_point_names(TF2, nameList = c(1,2,3,3,4)), error_message_names_not_unique())
  expect_error(set_point_names(TF2, nameList = c(1,2,3)), error_message_vector_not_equal_length())
  expect_error(set_point_names(TF2, pointList = c("t1","t2","t3"), nameList = c(1,2)), error_message_vector_not_equal_length())
  expect_error(set_point_names(TF2, pointList = c("t1","t2"), nameList = c(1,2,3)), error_message_vector_not_equal_length())

  expect_equal(tP(set_point_names(TF2, pointList = c("t1","t2","t3"), safe = FALSE))$name, c(1,2,3,"t4","t5"))
  expect_equal(tP(set_point_names(TF2, pointList = c("t1","t2","t3"), nameList = c("1","1","2"), safe = FALSE))$name, c(1,1,2,"t4","t5"))
  expect_equal(tP(set_point_names(TF2, pointList = c("t1","t2"), nameList = "1", safe = FALSE))$name, c(1,1,"t3","t4","t5"))

})



test_that("test 'set_step_weights(tempFlow, srcPointList = NULL, dstPointList = NULL, weightList = NULL, safe = TRUE)'", {

  expect_equal(tS(set_step_weights(TF2))$weight, rep(1, length(tS(TF2))))
  expect_equal(tS(set_step_weights(TF2, srcPointList = c("t1","t2")))$weight, rep(1, length(tS(TF2))))
  expect_equal(tS(set_step_weights(TF2, dstPointList = c("t1","t2")))$weight, rep(1, length(tS(TF2))))
  expect_equal(tS(set_step_weights(TF2, weightList = 2))$weight, rep(2, length(tS(TF2))))
  expect_equal(tS(set_step_weights(TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4"), weightList = c(10,20)))$weight, c(10,3,20,2,1))
  expect_equal(tS(set_step_weights(TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4")))$weight, c(1,3,1,2,1))

  expect_equal(tS(set_step_weights(TF2))$weight, rep(1, length(tS(TF2))))
  expect_equal(tS(set_step_weights(LTF2))$weight, c(1,1,1,1,1,0,0,0,0,0))


  expect_error(set_step_weights(TF2, weightList = c(1,2)), error_message_vector_not_equal_lengths_and_not_one())
  expect_error(set_step_weights(TF2, srcPointList = c("t1","t2"), weightList = c(1,2)), error_message_vector_not_equal_lengths_and_not_one())
  expect_error(set_step_weights(TF2, dstPointList = c("t1","t2"), weightList = c(1,2)), error_message_vector_not_equal_lengths_and_not_one())
  expect_error(set_step_weights(TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t5"), weightList = c(1,2)), error_message_edge_not_exist())
  expect_error(set_step_weights(TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4"), weightList = c(1,-2)), error_message_weights_not_nonnegative())
  expect_error(set_step_weights(TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4"), weightList = c("10",-20)), error_message_weights_not_numeric() )

  expect_equal(tS(set_step_weights(LTF2))$weight, c(1,1,1,1,1,0,0,0,0,0))
  expect_equal(tS(set_step_weights(LTF2, srcPointList = c("t1","t2")))$weight, c(1,1,1,1,1,0,0,0,0,0))
  expect_equal(tS(set_step_weights(LTF2, dstPointList = c("t1","t2")))$weight, c(1,1,1,1,1,0,0,0,0,0))
  expect_equal(tS(set_step_weights(LTF2, weightList = 2))$weight, rep(2, length(tS(LTF2))))
  expect_equal(tS(set_step_weights(LTF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4"), weightList = c(10,20)))$weight, c(10,3,20,2,1,1,1,1,1,1))
  expect_equal(tS(set_step_weights(LTF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4")))$weight, c(1,3,1,2,1,1,1,1,1,1))

  expect_equal(suppressWarnings(tS(set_step_weights(TF2, weightList = c(1,2), safe = FALSE))$weight), tS(TF2)$weight)
  expect_equal(suppressWarnings(tS(set_step_weights(TF2, srcPointList = c("t1","t2"), weightList = c(1,2), safe = FALSE))$weight), tS(TF2)$weight)
  expect_equal(suppressWarnings(tS(set_step_weights(TF2, dstPointList = c("t1","t2"), weightList = c(1,2), safe = FALSE))$weight), tS(TF2)$weight)
  expect_equal(suppressWarnings(tS(set_step_weights(TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t5"), weightList = c(20,30), safe = FALSE))$weight), c(20,3,3,2,1))
  expect_equal(tS(set_step_weights(TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4"), weightList = c(20,-2), safe = FALSE))$weight, c(20,3,-2,2,1))
  expect_equal(tS(set_step_weights(TF2, srcPointList = c("t1","t2"), dstPointList = c("t2","t4"), weightList = c("10",-20), safe = FALSE))$weight, paste(c(10,3,-20,2,1)))

})




test_that("test 'set_step_weights_from_id(tempFlow, stepIDList = NULL, weightList = NULL, safe = TRUE)'", {

  expect_equal(tS(set_step_weights_from_id(TF2))$weight, rep(1, length(tS(TF2))))
  expect_equal(tS(set_step_weights_from_id(TF2, weightList = 1))$weight, rep(1, length(tS(TF2))))
  expect_equal(tS(set_step_weights_from_id(TF2, weightList = c(1,2,3,4,5)))$weight, c(1,2,3,4,5))

  expect_equal(tS(set_step_weights_from_id(TF2, stepIDList = c(1,2,3,4,5)))$weight, rep(1, length(tS(TF2))))
  expect_equal(tS(set_step_weights_from_id(TF2, stepIDList = c(1,2,3,4,5), weightList = 1))$weight, rep(1, length(tS(TF2))))
  expect_equal(tS(set_step_weights_from_id(TF2, stepIDList = c(1,2,3,4,5), weightList = c(1,2,3,4,5)))$weight, c(1,2,3,4,5))

  expect_equal(tS(set_step_weights_from_id(TF2, stepIDList = c(1,2,3)))$weight,  c(1,1,1,2,1))
  expect_equal(tS(set_step_weights_from_id(TF2, stepIDList = c(1,2,3), weightList = 1))$weight, c(1,1,1,2,1))
  expect_equal(tS(set_step_weights_from_id(TF2, stepIDList = c(1,2,3), weightList = c(1,2,3)))$weight, c(1,2,3,2,1))
  expect_equal(tS(set_step_weights_from_id(TF2))$weight, rep(1, length(tS(TF2))))



  expect_equal(tS(set_step_weights_from_id(LTF2))$weight, c(1,1,1,1,1,0,0,0,0,0))
  expect_equal(tS(set_step_weights_from_id(LTF2, weightList = 1))$weight, c(1,1,1,1,1,1,1,1,1,1))
  expect_equal(tS(set_step_weights_from_id(LTF2, weightList = c(1,2,3,4,5,6,7,8,9,10)))$weight, c(1,2,3,4,5,6,7,8,9,10))

  expect_equal(tS(set_step_weights_from_id(LTF2, stepIDList = c(1,2,3,4,5,6,7,8,9,10)))$weight, c(1,1,1,1,1,0,0,0,0,0))
  expect_equal(tS(set_step_weights_from_id(LTF2, stepIDList = c(1,2,3,4,5,6,7,8,9,10), weightList = 1))$weight, c(1,1,1,1,1,1,1,1,1,1))
  expect_equal(tS(set_step_weights_from_id(LTF2, stepIDList = c(1,2,3,4,5,6,7,8,9,10), weightList = c(1,2,3,4,5,6,7,8,9,10)))$weight, c(1,2,3,4,5,6,7,8,9,10))

  expect_equal(tS(set_step_weights_from_id(LTF2, stepIDList = c(1,2,3,6,10)))$weight,  c(1,1,1,2,1,0,1,1,1,0))
  expect_equal(tS(set_step_weights_from_id(LTF2, stepIDList = c(1,2,3,6,10), weightList = 1))$weight, c(1,1,1,2,1,1,1,1,1,1))
  expect_equal(tS(set_step_weights_from_id(LTF2, stepIDList = c(1,2,3,6,10), weightList = c(1,2,3,4,5)))$weight, c(1,2,3,2,1,4,1,1,1,5))
  expect_equal(tS(set_step_weights_from_id(LTF2))$weight, c(1,1,1,1,1,0,0,0,0,0))

  expect_error(set_step_weights_from_id(TF2, weightList = c(1,2)), error_message_vector_not_equal_length_and_not_one())
  expect_error(set_step_weights_from_id(TF2, stepIDList = c(1,2), weightList = c(1,2,3)), error_message_vector_not_equal_length_and_not_one())
  expect_error(set_step_weights_from_id(TF2, stepIDList = c(1,2,3,4), weightList = c(1,2,3)), error_message_vector_not_equal_length_and_not_one())
  expect_error(set_step_weights_from_id(TF2, stepIDList = c(1,2,9), weightList = c(1,2,3)), error_message_ids_not_in_object())
  expect_error(set_step_weights_from_id(TF2, stepIDList = c(1,2), weightList = c(1,-2)), error_message_weights_not_nonnegative())
  expect_error(set_step_weights_from_id(TF2, stepIDList = c(1,2), weightList = c("10",-20)), error_message_weights_not_numeric())


  expect_equal(suppressWarnings(tS(set_step_weights_from_id(TF2, weightList = c(1,2,3), safe = FALSE))$weight), c(1,2,3,1,2))
  expect_equal(suppressWarnings(tS(set_step_weights_from_id(TF2, stepIDList = c(1,9), weightList = c(20,30), safe = FALSE))$weight), c(20,3,3,2,1))
  expect_equal(tS(set_step_weights_from_id(TF2, stepIDList = c(1,2), weightList = c(20,-2), safe = FALSE))$weight, c(20,-2,3,2,1))
  expect_equal(tS(set_step_weights_from_id(TF2, stepIDList = c(1,2), weightList = c("10",-20), safe = FALSE))$weight, paste(c(10,-20,3,2,1)))

})


