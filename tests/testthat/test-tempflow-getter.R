context("test-tempflow-getter")

TF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml"))



test_that("test 'get_point_ids(tempFlow, inpPoint = tP(tempFlow), safe = TRUE)'", {

  expect_equal(get_point_ids(TF2), c(1,2,3,4,5))
  expect_equal(get_point_ids(TF2, 3), 3)
  expect_equal(get_point_ids(TF2, "t3"), 3)
  expect_equal(get_point_ids(TF2, c(1,2,3)), c(1,2,3))
  expect_equal(get_point_ids(TF2, c("t1","t2","t3")), c(1,2,3))
  expect_error(get_point_ids(TF2, "4"), error_message_name_not_in_object())
  expect_error(get_point_ids(TF2, 9), error_message_ids_not_in_object())
  expect_error(get_point_ids(TF2, -3), error_message_ids_not_in_object())
  expect_error(get_point_ids(TF2, c("t1",2,"t3")), error_message_name_not_in_object())
  expect_error(get_point_ids(TF2, c("1",2,"3")), error_message_name_not_in_object())

  expect_equal(get_point_ids(TF2, "4", safe = FALSE), integer(0))
  expect_equal(get_point_ids(TF2, 9, safe = FALSE), 9)
  expect_equal(get_point_ids(TF2, -3, safe = FALSE), -3)

})


test_that("test 'get_step_ids(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE)'", {


  expect_equal(get_step_ids(TF2, 3,5), 5)
  expect_equal(get_step_ids(TF2, "t3", "t5"), 5)
  expect_equal(get_step_ids(TF2, NULL, "t5"), c(1,2,3,4,5))
  expect_equal(get_step_ids(TF2, "t3", NULL), c(1,2,3,4,5))
  expect_error(get_step_ids(TF2, "4","5"), error_message_name_not_in_object())
  expect_error(get_step_ids(TF2, 9,4), error_message_ids_not_in_object())
  expect_error(get_step_ids(TF2, "4",5), error_message_name_not_in_object())
  expect_error(get_step_ids(TF2, 4, "5"), error_message_name_not_in_object())

  expect_equal(get_step_ids(TF2, "t4",5, safe = FALSE), 4)
  expect_error(get_step_ids(TF2, 4,7, safe = FALSE))
  expect_error(get_step_ids(TF2, 9,4, safe = FALSE),)
  expect_error(get_step_ids(TF2, -3,-4, safe = FALSE))

})


test_that("test 'get_point_names(tempFlow, inpPointList  = tP(tempFlow), safe = TRUE)'", {

  expect_equal(get_point_names(TF2), c("t1","t2","t3","t4","t5"))
  expect_equal(get_point_names(TF2, c(1,2,3)), c("t1","t2","t3"))
  expect_equal(get_point_names(TF2, c("t1","t2","t3")), c("t1","t2","t3"))
  expect_equal(get_point_names(TF2, c(1,2,5)), c("t1","t2","t5"))
  expect_equal(get_point_names(TF2, c("t1","t2","t5")), c("t1","t2","t5"))

  expect_error(get_point_names(TF2, c("1","2","3")), error_message_name_not_in_object())
  expect_error(get_point_names(TF2, c(1,"t2",5)), error_message_name_not_in_object())
  expect_error(get_point_names(TF2, c("t1","t2","t9")), error_message_name_not_in_object())
  expect_error(get_point_names(TF2, c(1,2,9)), error_message_ids_not_in_object())

})


test_that("test 'get_step_weights(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE)'", {

  expect_equal(get_step_weights(TF2, c("t1","t2","t3"), c("t2", "t4","t5")), c(1,3,1))
  expect_equal(get_step_weights(TF2, c(1,2,3), c(2,4,5)), c(1,3,1))
  expect_equal(get_step_weights(TF2, c(1,2,3), c("t2","t4","t5")), c(1,3,1))
  expect_equal(get_step_weights(TF2, c("t1","t2","t3"), c(2,4,5)), c(1,3,1))
  expect_equal(get_step_weights(TF2), c(1,3,3,2,1))


  expect_error(get_step_weights(TF2, c(1,2,3), c(2,"4",5)), error_message_name_not_in_object())
  expect_error(get_step_weights(TF2, c(1,"2",3), c(2,4,5)), error_message_name_not_in_object())
  expect_error(get_step_weights(TF2, c("t1",2,"t3"), c(2,"t4",5)), error_message_name_not_in_object())
  expect_error(get_step_weights(TF2, c("t1","t9","t3"), c("t2", "t4","t5")), error_message_name_not_in_object())
  expect_error(get_step_weights(TF2, c("t1","t2","t3"), c("t2", "t9","t5")), error_message_name_not_in_object())
  expect_error(get_step_weights(TF2, c("t1","t1","t3"), c("t2", "t4","t5")), error_message_edge_not_exist())
  expect_error(get_step_weights(TF2, c("t1","t2","t3"), c("t2", "t5","t5")), error_message_edge_not_exist())


  })


test_that("test 'get_step_weights_from_id(tempFlow, stepIDList=tS(tempFlow), safe = TRUE)'", {

  expect_equal(get_step_weights_from_id(TF2, c(1,3,5)), c(1,3,1))
  expect_equal(get_step_weights_from_id(TF2), c(1,3,3,2,1))

  expect_error(get_step_weights_from_id(TF2, c(1,2,9)), error_message_ids_not_in_object())
  expect_error(get_step_weights_from_id(TF2, c(1,"t2",3)), error_message_ids_not_in_object())

})





test_that("test 'get_step_point_list(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE) '", {

  expect_equal(get_step_point_list(TF2, c("t1","t2","t3"), c("t2", "t4","t5")), list("startPointList"=c("t1","t2","t3"), "endPointList"=c("t2", "t4","t5")))
  expect_equal(get_step_point_list(TF2, c(1,2,3), c(2,4,5)), list("startPointList"=c("t1","t2","t3"), "endPointList"=c("t2", "t4","t5")))
  expect_equal(get_step_point_list(TF2, c(1,2,3), c("t2","t4","t5")), list("startPointList"=c("t1","t2","t3"), "endPointList"=c("t2", "t4","t5")))
  expect_equal(get_step_point_list(TF2, c("t1","t2","t3"), c(2,4,5)), list("startPointList"=c("t1","t2","t3"), "endPointList"=c("t2", "t4","t5")))
  expect_equal(get_step_point_list(TF2), list("startPointList"=c("t1","t2","t2","t4","t3"), "endPointList"=c("t2","t3", "t4","t5", "t5")))


  expect_error(get_step_point_list(TF2, c(1,2,3), c(2,"4",5)), error_message_name_not_in_object())
  expect_error(get_step_point_list(TF2, c(1,"2",3), c(2,4,5)), error_message_name_not_in_object())
  expect_error(get_step_point_list(TF2, c("t1",2,"t3"), c(2,"t4",5)), error_message_name_not_in_object())
  expect_error(get_step_point_list(TF2, c("t1","t9","t3"), c("t2", "t4","t5")), error_message_name_not_in_object())
  expect_error(get_step_point_list(TF2, c("t1","t2","t3"), c("t2", "t9","t5")), error_message_name_not_in_object())
  expect_error(get_step_point_list(TF2, c("t1","t1","t3"), c("t2", "t4","t5")), error_message_edge_not_exist())
  expect_error(get_step_point_list(TF2, c("t1","t2","t3"), c("t2", "t5","t5")), error_message_edge_not_exist())


})


test_that("test 'get_step_point_list_from_id(tempFlow, stepIDList = tS(tempFlow), safe = TRUE)'", {

  expect_equal(get_step_point_list_from_id(TF2, c(1,3,5)), list("startPointList"=c("t1","t2","t3"), "endPointList"=c("t2", "t4","t5")))
  expect_equal(get_step_point_list_from_id(TF2), list("startPointList"=c("t1","t2","t2","t4","t3"), "endPointList"=c("t2","t3", "t4","t5", "t5")))

  expect_error(get_step_point_list_from_id(TF2, c(1,2,9)), error_message_ids_not_in_object())
  expect_error(get_step_point_list_from_id(TF2, c(1,"t2",3)), error_message_ids_not_in_object())

})




