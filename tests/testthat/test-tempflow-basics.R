context("test-tempflow-basics")
igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml")

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

STF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_1.gml", package = "tempnetwork"), format = "graphml"))
STF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_noname_1.gml", package = "tempnetwork"), format = "graphml"))
STF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_loop_1.gml", package = "tempnetwork"), format = "graphml"))

# WTF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_partialweighted_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml"), setDefaultValues = TRUE)

ETF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_2_6.gml", package = "tempnetwork"), format = "graphml"))
# ETF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_4_1.gml", package = "tempnetwork"), format = "graphml"))
# ETF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_4_2.gml", package = "tempnetwork"), format = "graphml"))



test_that("test 'add_points(tempFlow, newPointList, attrList = NULL, safe = TRUE)'", {

  expect_equal(length(tP(add_points(LTF1, c("t6","t7")))), 7)
  expect_equal(tP(add_points(LTF1, c("t6","t7")))$name, c("t1", "t2", "t3", "t4", "t5", "t6", "t7"))
  expect_equal(tP(add_points(LTF1, c("t6","t7"), attrList = list("RealName" = c("a", "b"))))$name, c("t1", "t2", "t3", "t4", "t5", "t6", "t7"))
  expect_equal(tP(add_points(LTF1, c("t6","t7"), attrList = list("RealName" = c("a", "b"))))$RealName, c(NA, NA, NA, NA, NA, "a", "b"))
  expect_equal(tP(add_points(LTF1, c("t6","t7"), attrList = list("RealName" = c("a"))))$RealName, c(NA, NA, NA, NA, NA, "a", "a"))

  expect_equal(igraph::is_isomorphic_to(G(LTF1), G(add_points(LTF1, c()))), TRUE)

  expect_error(tP(add_points(LTF1, c("t6","t7","t8"), attrList = list("RealName" = c("a","b"))))$RealName, error_message_vector_not_equal_length_and_not_one())
  expect_error(tP(add_points(LTF1, c("t6","t7","t8"), attrList = list("RealName" = c("a", "b", "c","d"))))$name, error_message_vector_not_equal_length_and_not_one())

  expect_error(add_points(LTF1, c("t5","t7")), error_message_names_not_unique())
  expect_error(add_points(LTF1, c("t6","t6")), error_message_names_not_unique())

})


test_that("test 'delete_points(tempFlow, deletePointList, safe = TRUE) '", {

  expect_equal(tP(delete_points(LTF1, c()))$name, c("t1", "t2", "t3","t4", "t5"))
  expect_equal(tP(delete_points(LTF1, c(NULL)))$name, c("t1", "t2", "t3", "t4", "t5"))
  expect_equal(tP(delete_points(LTF1, c("t3","t3")))$name, c("t1", "t2", "t4", "t5"))
  expect_equal(tP(delete_points(LTF1, c(3,4)))$name, c("t1", "t2", "t5"))
  expect_equal(tP(delete_points(LTF1, c(1,2,3,4,5)))$name, character(0))

  expect_error(delete_points(LTF1, c("t3","t7")), error_message_name_not_in_object())
  expect_error(delete_points(LTF1, c(NA, "t3")), error_message_name_not_in_object())
  expect_error(delete_points(LTF1, c(NaN, "t3")), error_message_name_not_in_object())
  expect_error(delete_points(LTF1, c(3,7)), error_message_ids_not_in_object())
  expect_error(delete_points(LTF1, c(3,"t3")), error_message_name_not_in_object())
})




test_that("test 'add_steps(tempFlow, srcPointList, dstPointList, weightList = NULL, attrList = NULL, safe = TRUE)'", {


  expect_equal(igraph::get.edge.ids(G(add_steps(TF1, c(1,3),c(5,4))), c("t1","t5"), error = FALSE)>0, TRUE)
  expect_equal(igraph::get.edge.ids(G(add_steps(TF1, c(1,3),c(5,4))), c("t3","t4"), error = FALSE)>0, TRUE)

  expect_equal(igraph::get.edge.ids(G(add_steps(TF1, c("t1","t3"),c("t5","t4"))), c("t1","t5"), error = FALSE)>0, TRUE)
  expect_equal(igraph::get.edge.ids(G(add_steps(TF1, c("t1","t3"),c("t5","t4"))), c("t3","t4"), error = FALSE)>0, TRUE)

  expect_equal(igraph::get.edge.ids(G(add_steps(TF1, c(1,3),c("t5","t4"))), c("t1","t5"), error = FALSE)>0, TRUE)
  expect_equal(igraph::get.edge.ids(G(add_steps(TF1, c("t1","t3"),c(5,4))), c("t3","t4"), error = FALSE)>0, TRUE)

  expect_equal(igraph::get.edge.ids(G(add_steps(TF1, c("t1","t3"),c("t1","t3"))), c("t1","t1"), error = FALSE)>0, TRUE)
  expect_equal(igraph::get.edge.ids(G(add_steps(TF1, c("t1","t3"),c("t1","t3"))), c("t3","t3"), error = FALSE)>0, TRUE)

  expect_equal(tS(add_steps(TF1, c("t1","t3"),c("t1","t4")))$weight[length(tS(TF1))+1], 0)
  expect_equal(tS(add_steps(TF1, c("t1","t3"),c("t1","t4")))$weight[length(tS(TF1))+2], 1)
  expect_equal(tS(add_steps(TF1, c("t1","t3"),c("t1","t4"), c(20,40)))$weight[length(tS(TF1))+1], 20)
  expect_equal(tS(add_steps(TF1, c("t1","t3"),c("t1","t4"), c(20,40)))$weight[length(tS(TF1))+2], 40)

  expect_equal(tS(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20)))$weight[length(tS(TF1))+1], 20)
  expect_equal(tS(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20)))$weight[length(tS(TF1))+2], 20)
  expect_equal(tS(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20)))$weight[length(tS(TF1))+3], 20)

  expect_equal(tS(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c"), "rname"= c("a","b","c"))))$name[length(tS(TF1))+1], "a")
  expect_equal(tS(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c"), "rname"= c("a","b","c"))))$name[length(tS(TF1))+2], "b")
  expect_equal(tS(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c"), "rname"= c("a","b","c"))))$name[length(tS(TF1))+3], "c")

  expect_equal(tS(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c"), "rname"= c("a","b","c"))))$rname[length(tS(TF1))+1], "a")
  expect_equal(tS(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c"), "rname"= c("a","b","c"))))$rname[length(tS(TF1))+2], "b")
  expect_equal(tS(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c"), "rname"= c("a","b","c"))))$rname[length(tS(TF1))+3], "c")

  expect_equal(tS(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), weightList = c(20,40,60), attrList = list("name"= c("a","b","c"), "weight"= c(30,50,70))))$weight[length(tS(TF1))+1], 20)
  expect_equal(tS(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), weightList = c(20,40,60), attrList = list("name"= c("a","b","c"), "weight"= c(30,50,70))))$weight[length(tS(TF1))+2], 40)
  expect_equal(tS(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), weightList = c(20,40,60), attrList = list("name"= c("a","b","c"), "weight"= c(30,50,70))))$weight[length(tS(TF1))+3], 60)

  expect_error(add_steps(TF1, c("t1",3),c("t5",4)), error_message_name_not_in_object())
  expect_error(add_steps(TF1, c("t1","t2"),c("t2","t5")), error_message_not_simple())
  expect_error(add_steps(TF1, c("t1","t2"),c("t7","t5")), error_message_name_not_in_object())
  expect_error(add_steps(TF1, c("t1","t2","t3"),c("t4","t5")), error_message_vector_not_equal_length())
  expect_error(add_steps(TF1, c("t1","t2"),c("t4","t5","t3")), error_message_vector_not_equal_length())
  expect_error(add_steps(TF1, c("t1","t2", NULL),c("t4","t5","t3")), error_message_vector_not_equal_length())

  expect_error(add_steps(TF1, c("t1",NA),c("t4","t5")), error_message_name_not_in_object())
  expect_error(add_steps(TF1, c("t1","t2"),c("t4",NA)), error_message_name_not_in_object())
  expect_error(add_steps(TF1, c("t1",NaN),c("t4","t5")), error_message_name_not_in_object())
  expect_error(add_steps(TF1, c("t1","t2"),c("t4",NaN)), error_message_name_not_in_object())

  expect_error(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20,40)), error_message_vector_not_equal_lengths_and_not_one())
  expect_error(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(-20,40,60)), error_message_weights_not_nonnegative())
  expect_error(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20,"40",60)), error_message_weights_not_numeric())
  expect_error(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20,NA,60)), error_message_weights_not_numeric())
  expect_error(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), c(20,NaN,60)), error_message_weights_not_numeric())

  expect_error(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b"))), error_message_vector_not_equal_lengths_and_not_one())
  expect_error(add_steps(TF1, c("t1","t3","t1"),c("t1","t4","t5"), attrList = list("name"= c("a","b","c","d"))), error_message_vector_not_equal_lengths_and_not_one())

  })



test_that("test 'delete_steps_from_id(tempFlow, stepIDList, safe = TRUE)'", {

  expect_equal(sum(igraph::get.edge.ids(G(delete_steps_from_id(LTF1,c(6,7))), c("t1","t1","t2","t2"), error = FALSE)), 0)
  expect_equal(sum(igraph::get.edge.ids(G(delete_steps_from_id(LTF1,c(6,7))), c("t1","t1","t2","t2"), error = FALSE)), 0)

  expect_equal(sum(igraph::get.edge.ids(G(delete_steps_from_id(TF1,c(1,4))), c("t1","t2","t4","t5"), error = FALSE)), 0)
  expect_equal(sum(igraph::get.edge.ids(G(delete_steps_from_id(TF1,c(1,4,1))), c("t1","t2","t4","t5"), error = FALSE)), 0)


  expect_error(delete_steps(TF1,c(1,9), c(1,5)), error_message_ids_not_in_object())
  expect_error(delete_steps(TF1,c(1,4), c(1,9)), error_message_ids_not_in_object())
  expect_error(delete_steps(TF1,c(1,2,NA), c(2,3,4)), error_message_ids_not_in_object())
  expect_error(delete_steps(TF1,c(1,2,3), c(2,3,NA)), error_message_ids_not_in_object())
  expect_error(delete_steps(TF1,c(1,2,NaN), c(2,3,4)), error_message_ids_not_in_object())
  expect_error(delete_steps(TF1,c(1,2,3), c(2,3,NaN)), error_message_ids_not_in_object())
  expect_error(delete_steps(TF1,c(1,"t2"), c(2,3)), error_message_name_not_in_object())
  expect_error(delete_steps(TF1,c(1,2), c(2,"t3")), error_message_name_not_in_object())
  expect_error(delete_steps(TF1,c("t1","t2"), c("t2","t5")), error_message_edge_not_exist())


})

test_that("test 'delete_steps(tempFlow, srcPointList, dstPointList, safe = TRUE)'", {

  expect_equal(sum(igraph::get.edge.ids(G(delete_steps(TF1,c("t1","t4"), c("t2","t5"))), c("t1","t2","t4","t5"), error = FALSE)), 0)
  expect_equal(sum(igraph::get.edge.ids(G(delete_steps(LTF1,c("t1","t2"), c("t1","t2"))), c("t1","t1","t2","t2"), error = FALSE)), 0)
  expect_equal(sum(igraph::get.edge.ids(G(delete_steps(TF1,c("t1","t4","t1"), c("t2","t5","t2"))), c("t1","t2","t4","t5"), error = FALSE)), 0)

  expect_equal(sum(igraph::get.edge.ids(G(delete_steps(TF1,c(1,4), c(2,5))), c("t1","t2","t4","t5"), error = FALSE)), 0)
  expect_equal(sum(igraph::get.edge.ids(G(delete_steps(LTF1,c(1,2), c("t1","t2"))), c("t1","t1","t2","t2"), error = FALSE)), 0)
  expect_equal(sum(igraph::get.edge.ids(G(delete_steps(TF1,c(1,4,1), c(2,5,2))), c("t1","t2","t4","t5"), error = FALSE)), 0)


  expect_error(delete_steps(TF1,c("t1","t6"), c("t2","t5")), error_message_name_not_in_object())
  expect_error(delete_steps(TF1,c("t1","t4"), c("t2","t6")), error_message_name_not_in_object())
  expect_error(delete_steps(TF1,c("t1","t4"), c("t5","t5")), "One of the specified edges does not exist.")
  expect_error(delete_steps(TF1,c("t1","t4","t2"), c("t5", "t5", NA)), error_message_name_not_in_object())
  expect_error(delete_steps(TF1,c("t1","t4",NA), c("t5", "t5", "t3")), error_message_name_not_in_object())
  expect_error(delete_steps(TF1,c("t1","t4","t2"), c("t5", "t5", NaN)), error_message_name_not_in_object())
  expect_error(delete_steps(TF1,c("t1","t4",NaN), c("t5", "t5", "t3")), error_message_name_not_in_object())

  expect_error(delete_steps(TF1,c("t1","t4","t2"), c("t5", "t5", NULL)), error_message_vector_not_equal_length())
  expect_error(delete_steps(TF1,c("t1","t4",NULL), c("t5", "t5", "t3")), error_message_vector_not_equal_length())
  expect_error(delete_steps(TF1,c("t1","t4","t2"), c("t5", "t5")), error_message_vector_not_equal_length())
  expect_error(delete_steps(TF1,c("t1","t4"), c("t5", "t5", "t3")), error_message_vector_not_equal_length())

})


test_that("test 'insert_point(tempFlow, newPoint, srcPointList, dstPointList, weightList = NULL, attrList = NULL, removeEdges = TRUE, safe = TRUE)'", {

  tempFlow <- insert_point(TF1, "tX", c(), c())
  expect_equal(length(tS(tempFlow)), length(tS(TF1)))
  expect_equal(length(tP(tempFlow)), length(tP(TF1))+1)
  expect_equal(tS(tempFlow)$weight, tS(TF1)$weight)

  tempFlow <- insert_point(TF1, "tX", c("tX"), c())
  wTempFlow <- insert_point(TF1, "tX", c("tX"), c(), c(10))
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+1)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("tX","tX"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("tX"), c("tX"))]$weight, c(0))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("tX"), c("tX"))]$weight, c(10))

  tempFlow <- insert_point(TF1, "tX", c(), c("tX"))
  wTempFlow <- insert_point(TF1, "tX", c(), c("tX"), c(10))
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+1)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("tX","tX"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("tX"), c("tX"))]$weight, c(0))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("tX"), c("tX"))]$weight, c(10))

  tempFlow <- insert_point(TF1, "tX", c("t1","tX"), c("t2"))
  wTempFlow <- insert_point(TF1, "tX", c("t1","tX"), c("t2"), c(10,8,20))
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+2)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t1","t2"), error = FALSE) == 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t1","tX","tX","tX","tX","t2"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t1","tX","tX"), c("tX","tX","t2"))]$weight, c(1,0,1))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("t1","tX","tX"), c("tX","tX","t2"))]$weight, c(10,8,20))

  tempFlow <- insert_point(TF1, "tX", c("t3","t4"), c("t5"))
  wTempFlow <- insert_point(TF1, "tX", c("t3","t4"), c("t5"), c(10,20,30))
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+1)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t3","t5","t4","t5"), error = FALSE) == 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t3","tX","t4","tX","tX","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t3","t4","tX"), c("tX","tX","t5"))]$weight, c(1,1,1))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("t3","t4","tX"), c("tX","tX","t5"))]$weight, c(10,20,30))

  tempFlow <- insert_point(TF1, "tX", c("t1","t2"), c("t5"))
  wTempFlow <- insert_point(TF1, "tX", c("t1","t2"), c("t5"), c(10,20,30))
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+3)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t1","tX","t1","tX","tX","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t1","t2","tX"), c("tX","tX","t5"))]$weight, c(1,1,1))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("t1","t2","tX"), c("tX","tX","t5"))]$weight, c(10,20,30))

  tempFlow <- insert_point(TF1, "tX", c("t1","t2"), c("t3","t4"))
  wTempFlow <- insert_point(TF1, "tX", c("t1","t2"), c("t3","t4"), c(10,20,30,40))
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+2)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t2","t3","t2","t4"), error = FALSE) == 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t1","tX","t2","tX","tX","t3","tX","t4"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t1","t2","tX","tX"), c("tX","tX","t3","t4"))]$weight, c(1,1,1,1))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("t1","t2","tX","tX"), c("tX","tX","t3","t4"))]$weight, c(10,20,30,40))

  tempFlow <- insert_point(TF1, "tX", c("t3","t4"), c("t5"))
  wTempFlow <- insert_point(TF1, "tX", c("t3","t4"), c("t5"), c(10,20,30))
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+1)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t3","t5","t4","t5"), error = FALSE) == 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t3","tX","t4","tX","tX","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t3","t4","tX"), c("tX","tX","t5"))]$weight, c(1,1,1))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("t3","t4","tX"), c("tX","tX","t5"))]$weight, c(10,20,30))

  tempFlow <- insert_point(ETF1, "tX", c("p31", "p41"), c("p32", "p42"))
  wTempFlow <- insert_point(ETF1, "tX", c("p31", "p41"), c("p32", "p42"), c(10,20,30,40))
  expect_equal(length(tS(tempFlow)), length(tS(ETF1))+2)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("p31","p32","p41","p42"), error = FALSE) == 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("p31","tX","p41","tX","tX","p32","tX","p42"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("p31","p41","tX","tX"), c("tX","tX","p32","p42"))]$weight, c(1,1,1,1))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("p31","p41","tX","tX"), c("tX","tX","p32","p42"))]$weight, c(10,20,30,40))


  tempFlow <- insert_point(TF1, "tX", c(), c(), removeEdges = FALSE)
  wTempFlow <- insert_point(TF1, "tX", c(), c("tX"), c(10))
  expect_equal(length(tS(tempFlow)), length(tS(TF1)))
  expect_equal(length(tP(tempFlow)), length(tP(TF1))+1)
  expect_equal(tS(tempFlow)$weight, tS(TF1)$weight)

  tempFlow <- insert_point(TF1, "tX", c("tX"), c(), removeEdges = FALSE)
  wTempFlow <- insert_point(TF1, "tX", c("tX"), c(), c(10), removeEdges = FALSE)
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+1)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("tX","tX"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("tX"), c("tX"))]$weight, c(0))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("tX"), c("tX"))]$weight, c(10))

  tempFlow <- insert_point(TF1, "tX", c(), c("tX"), removeEdges = FALSE)
  wTempFlow <- insert_point(TF1, "tX", c(), c("tX"), c(10), removeEdges = FALSE)
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+1)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("tX","tX"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("tX"), c("tX"))]$weight, c(0))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("tX"), c("tX"))]$weight, c(10))

  tempFlow <- insert_point(TF1, "tX", c("t1","tX"), c("t2"), removeEdges = FALSE)
  wTempFlow <- insert_point(TF1, "tX", c("t1","tX"), c("t2"), c(10,8,20), removeEdges = FALSE)
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+3)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t1","t2"), error = FALSE) > 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t1","tX","tX","tX","tX","t2"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t1","tX","tX"), c("tX","tX","t2"))]$weight, c(1,0,1))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("t1","tX","tX"), c("tX","tX","t2"))]$weight, c(10,8,20))

  tempFlow <- insert_point(TF1, "tX", c("t3","t4"), c("t5"), removeEdges = FALSE)
  wTempFlow <- insert_point(TF1, "tX", c("t3","t4"), c("t5"), c(10,20,30), removeEdges = FALSE)
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+3)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t3","t5","t4","t5"), error = FALSE) > 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t3","tX","t4","tX","tX","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t3","t4","tX"), c("tX","tX","t5"))]$weight, c(1,1,1))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("t3","t4","tX"), c("tX","tX","t5"))]$weight, c(10,20,30))

  tempFlow <- insert_point(TF1, "tX",c("t1","t2"), c("t5"), removeEdges = FALSE)
  wTempFlow <-  insert_point(TF1, "tX",c("t1","t2"), c("t5"), c(10,20,30), removeEdges = FALSE)
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+3)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t1","tX","t1","tX","tX","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t1","t2","tX"), c("tX","tX","t5"))]$weight, c(1,1,1))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("t1","t2","tX"), c("tX","tX","t5"))]$weight, c(10,20,30))

  tempFlow <- insert_point(TF1, "tX", c("t1","t2"), c("t3","t4"), removeEdges = FALSE)
  wTempFlow <-insert_point(TF1, "tX", c("t1","t2"), c("t3","t4"), c(10,20,30,40), removeEdges = FALSE)
  expect_equal(length(tS(tempFlow)), length(tS(TF1))+4)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t2","t3","t2","t4"), error = FALSE) > 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t1","tX","t2","tX","tX","t3","tX","t4"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t1","t2","tX","tX"), c("tX","tX","t3","t4"))]$weight, c(1,1,1,1))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("t1","t2","tX","tX"), c("tX","tX","t3","t4"))]$weight, c(10,20,30,40))

  tempFlow <- insert_point(ETF1, "tX",c("p31", "p41"), c("p32", "p42"), removeEdges = FALSE)
  wTempFlow <- insert_point(ETF1, "tX",c("p31", "p41"), c("p32", "p42"), c(10,20,30,40), removeEdges = FALSE)
  expect_equal(length(tS(tempFlow)), length(tS(ETF1))+4)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("p31","p32","p41","p42"), error = FALSE) > 0), TRUE)
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("p31","tX","p41","tX","tX","p32","tX","p42"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("p31","p41","tX","tX"), c("tX","tX","p32","p42"))]$weight, c(1,1,1,1))
  expect_equal(tS(wTempFlow)[get_step_ids(wTempFlow, c("p31","p41","tX","tX"), c("tX","tX","p32","p42"))]$weight, c(10,20,30,40))


  expect_error(insert_point(TF1, "tX", c("t1","t6"), c("t3","t4")), error_message_name_not_in_object())
  expect_error(insert_point(TF1, "tX", c("t1","t2"), c("t3","t6")), error_message_name_not_in_object())

  expect_error(insert_point(TF1, "tX", c("t1","t2"), c("t2","t4")), error_message_not_dag())
  expect_error(insert_point(TF1, "tX", c("t1","t1"), c("t2","t2")), error_message_not_simple())

  expect_error(insert_point(TF1, "tX", c("t1","t2"), c("t3",NA)), error_message_name_not_in_object())
  expect_error(insert_point(TF1, "tX", c("t1",NA), c("t3","t4")), error_message_name_not_in_object())

  expect_error(insert_point(TF1, "tX", c("t1","t2"), c(NaN)), error_message_ids_not_in_object())
  expect_error(insert_point(TF1, "tX", c("t1",NaN), c("t3","t4")), error_message_name_not_in_object())

  expect_error(insert_point(TF1, "tX", c("t1","t2"), c("t3","t4"), c(10,20)), error_message_vector_not_equal_sum_lengths_and_not_one())
  expect_error(insert_point(TF1, "tX", c("t1","t2"), c("t3","t4"), c(-10,20,30,40)), error_message_weights_not_nonnegative())
  expect_error(insert_point(TF1, "tX", c("t1","t2"), c("t3","t4"), c("-10",20,30,40)), error_message_weights_not_numeric())
  expect_error(insert_point(TF1, "tX", c("t1","t2"), c("t3","t4"), c(NA,20,30,40)), error_message_weights_not_numeric())
  expect_error(insert_point(TF1, "tX", c("t1","t2"), c("t3","t4"), c(NaN,20,30,40)), error_message_weights_not_numeric())
  expect_error(insert_point(TF1, "tX", c("t1","t2"), c("t3","t4"), c(10,20,30,NULL)), error_message_vector_not_equal_sum_lengths_and_not_one())
  expect_error(insert_point(TF1, "tX", c("tX"), c("tX"), c(10)), error_message_not_simple())

})

test_that("test 'remove_point(tempFlow, removePoint, safe = TRUE)'", {


  tempFlow <- remove_point(TF1, "t5")
  expect_equal(length(tP(tempFlow)), length(tP(TF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(TF1))-2)
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("t3","t5","t4","t5"), error = FALSE) == 0), "Invalid vertex names")

  tempFlow <- remove_point(LTF1, "t5")
  expect_equal(length(tP(tempFlow)), length(tP(LTF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(LTF1))-3)
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("t3","t5","t4","t5","t5","t5"), error = FALSE) == 0), "Invalid vertex names")

  tempFlow <- remove_point(TF1, "t1")
  expect_equal(length(tP(tempFlow)), length(tP(TF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(TF1))-1)
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("t1","t2"), error = FALSE) == 0), "Invalid vertex names")

  tempFlow <- remove_point(LTF1, "t1")
  expect_equal(length(tP(tempFlow)), length(tP(LTF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(LTF1))-2)
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("t1","t2","t1","t1"), error = FALSE) == 0), "Invalid vertex names")

  tempFlow <- remove_point(TF1, "t2")
  expect_equal(length(tP(tempFlow)), length(tP(TF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(TF1))-1)
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("t2","t3","t2","t4"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t1","t3","t1","t4"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t1","t1"), c("t3","t4"))]$weight, c(2,2))

  tempFlow <- remove_point(LTF1, "t2")
  expect_equal(length(tP(tempFlow)), length(tP(LTF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(LTF1))-2)
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("t2","t3","t2","t4", "t2","t2"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t1","t3","t1","t4"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t1","t1"), c("t3","t4"))]$weight, c(2,2))


  tempFlow <- remove_point(TF1, "t3")
  expect_equal(length(tP(tempFlow)), length(tP(TF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(TF1))-1)
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("t2","t3","t3","t5"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t2","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t2"), c("t5"))]$weight, c(2))

  tempFlow <- remove_point(LTF1, "t3")
  expect_equal(length(tP(tempFlow)), length(tP(LTF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(LTF1))-2)
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("t2","t3","t3","t5"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t2","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t2"), c("t5"))]$weight, c(2))

  tempFlow <- remove_point(STF1, "t1")
  expect_equal(length(tP(tempFlow)), length(tP(STF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(STF1)))

  tempFlow <- remove_point(STF3, "t1")
  expect_equal(length(tP(tempFlow)), length(tP(STF3))-1)
  expect_equal(length(tS(tempFlow)), length(tS(STF3))-1)


  tempFlow <- remove_point(ETF1, "b")
  expect_equal(length(tP(tempFlow)), length(tP(ETF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(ETF1)))
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("p11","b","p23","b","b","p31","b","p41"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("p11","p31","p11","p41","p23","p31","p23","p41"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("p11","p11","p23","p23"), c("p31","p41","p31","p41"))]$weight, c(3,3,2,2))

  tempFlow <- remove_point(set_step_weights(ETF1, "b","p31", 10), "b")
  expect_equal(length(tP(tempFlow)), length(tP(ETF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(ETF1)))
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("p11","b","p23","b","b","p31","b","p41"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("p11","p31","p11","p41","p23","p31","p23","p41"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("p11","p11","p23","p23"), c("p31","p41","p31","p41"))]$weight, c(12,3,11,2))


  tempFlow <- remove_point(LTF1, "t3")
  expect_equal(length(tP(tempFlow)), length(tP(LTF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(LTF1))-2)
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("t2","t3","t3","t5"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t2","t5"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t2"), c("t5"))]$weight, c(2))


  tempFlow <- remove_point(TF2, "t2")
  expect_equal(length(tP(tempFlow)), length(tP(TF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(TF1))-1)
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("t2","t3","t2","t4"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t1","t3","t1","t4"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t1","t1"), c("t3","t4"))]$weight, c(4,4))

  tempFlow <- remove_point(LTF2, "t2")
  expect_equal(length(tP(tempFlow)), length(tP(LTF1))-1)
  expect_equal(length(tS(tempFlow)), length(tS(LTF1))-2)
  expect_error(all(igraph::get.edge.ids(G(tempFlow), c("t2","t3","t2","t4", "t2","t2"), error = FALSE) == 0), "Invalid vertex names")
  expect_equal(all(igraph::get.edge.ids(G(tempFlow), c("t1","t3","t1","t4"), error = FALSE) > 0), TRUE)
  expect_equal(tS(tempFlow)[get_step_ids(tempFlow, c("t1","t1"), c("t3","t4"))]$weight, c(4,4))


  expect_error(remove_point(TF1, c("t6")), error_message_name_not_in_object())
  expect_error(remove_point(TF1, c(6)), error_message_ids_not_in_object())


})




test_that("test 'induce_flow(tempFlow, inpPointList, safe = TRUE)'", {
  expect_error(induce_flow(TF1, c(1,2,8)))
  expect_equal(igraph::is_isomorphic_to(G(induce_flow(TF1, c(1,1,3,5))),G(induce_flow(TF1,  c(1,3,5)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(induce_flow(TF1, c())),igraph::graph.empty()), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(induce_flow(TF1, igraph::V(G(TF1)))),G(TF1)), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(induce_flow(TF1, c("t1", "t3", "t5"))),G(induce_flow(TF1,  c(1,3,5)))), TRUE)

  expect_error(induce_flow(TF2, c(1,2,6)), error_message_ids_not_in_object())
  expect_error(induce_flow(TF2, c("t1","t2","t6")), error_message_name_not_in_object())
})


test_that("test 'slice_flow(tempFlow, startPointList, endPointList, safe = TRUE)'", {
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(TF1,2,5)),G(induce_flow(TF1,  c(2,3,4,5)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(TF1,3,4)),igraph::graph.empty()), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(TF1,5,2)),igraph::graph.empty()), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(TF1,2,5)),G(induce_flow(TF1,  c(2,3,4,5)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(TF2,1,1)),G(induce_flow(TF2,  c(1)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(LTF2,1,1)),G(induce_flow(LTF2,  c(1)))), TRUE)

  expect_equal(igraph::is_isomorphic_to(G(slice_flow(TF1,c(2,4),c(5,3))),G(induce_flow(TF1,  c(2,3,4,5)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(TF1,3,4)),igraph::graph.empty()), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(TF1,5,2)),igraph::graph.empty()), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(TF1,2,5)),G(induce_flow(TF1,  c(2,3,4,5)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(LTF1,c(3,4), c(3,4))),G(induce_flow(LTF1,  c(3,4)))), TRUE)

  expect_equal(igraph::is_isomorphic_to(G(slice_flow(TF2,1,c(1,1))),G(induce_flow(TF2,  c(1)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(TF2,c(1,1),1)),G(induce_flow(TF2,  c(1)))), TRUE)

  expect_equal(igraph::is_isomorphic_to(G(slice_flow(LTF2,1,c(1,1))),G(induce_flow(LTF2,  c(1)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(LTF2,c(1,1),1)),G(induce_flow(LTF2,  c(1)))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(LTF2,c(1),c())),G(induce_flow(LTF2,  c()))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(LTF2,c(),c(1))),G(induce_flow(LTF2,  c()))), TRUE)

  expect_equal(igraph::is_isomorphic_to(G(slice_flow(ETF1,c("p11","p23"),c("c"),1)),G(induce_flow(ETF1,  c("p11","p23","b","p31","p32","p41","p42","c")))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(ETF1,c("a"),c("p11","p23"),1)),G(induce_flow(ETF1,  c("a","p11","p21","p22","p23")))), TRUE)
  expect_equal(igraph::is_isomorphic_to(G(slice_flow(ETF1,c("p11","p23"),c("p32","p41"),1)),G(induce_flow(ETF1,  c("p11","p23","b","p31","p32","p41")))), TRUE)

  expect_error(slice_flow(TF1, c(1,8)))
})


test_that("test 'compute_tempdistance'", {

  expect_equal(compute_tempdistance(TF1, "t5", "t1"), Inf)
  expect_equal(compute_tempdistance(TF1, "t3", "t4"), Inf)
  expect_equal(compute_tempdistance(TF1, "t1", "t1"), 0)
  expect_equal(compute_tempdistance(TF1, "t1", 5), 3)
  expect_equal(compute_tempdistance(TF1, 1, "t5"), 3)
  expect_equal(compute_tempdistance(TF1, 1, 5), 3)
  expect_equal(compute_tempdistance(TF1, "t1", "t5"), 3)

  expect_error(compute_tempdistance(TF1, "t1", "t100"))
  expect_error(compute_tempdistance(TF1, "t1", 100))
  expect_error(compute_tempdistance(TF1, 100, "t1"))
  expect_error(compute_tempdistance(TF1, 111, 222))

  expect_equal(compute_tempdistance(TF2, "t1", "t5"), 5)

  expect_equal(compute_tempdistance(LTF1, "t1", "t5"), 3)
  expect_equal(compute_tempdistance(LTF2, "t1", "t1"), 1)
  expect_equal(compute_tempdistance(LTF2, "t1", "t5"), 5)

  expect_equal(compute_tempdistance(LTF1, "t1", "t5"), 3)
  expect_equal(compute_tempdistance(LTF1, "t1", "t1"), 0)
  expect_equal(compute_tempdistance(LTF2, "t1", "t5"), 5)
})

