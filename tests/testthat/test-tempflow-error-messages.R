context("test-tempflow-error-messages")

test_that("test 'error_messages'", {
  expect_error(error_not_igraph(), error_message_not_igraph())
  expect_error(error_not_dag(), error_message_not_dag())
  expect_error(error_not_simple(), error_message_not_simple())
  expect_error(error_names_not_strings(), error_message_names_not_strings())
  expect_error(error_names_not_unique(), error_message_names_not_unique())
  expect_error(error_weights_not_numeric(), error_message_weights_not_numeric())
  expect_error(error_weights_not_nonnegative(), error_message_weights_not_nonnegative())
  expect_error(error_ids_not_in_object(), error_message_ids_not_in_object())
  expect_error(error_name_not_in_object(), error_message_name_not_in_object())
  expect_error(error_no_attr_assigned(), error_message_no_attr_assigned())
  expect_error(error_edge_not_exist(), error_message_edge_not_exist())

  expect_error(error_not_subtempflow(), error_message_not_subtempflow())
  expect_error(error_not_point_subset(), error_message_not_point_subset())



  expect_error(error_not_igraph("A"), error_message_not_igraph("A"))
  expect_error(error_not_dag("A"), error_message_not_dag("A"))
  expect_error(error_not_simple("A"), error_message_not_simple("A"))
  expect_error(error_names_not_strings("A"), error_message_names_not_strings("A"))
  expect_error(error_names_not_unique("A"), error_message_names_not_unique("A"))
  expect_error(error_weights_not_numeric("A"), error_message_weights_not_numeric("A"))
  expect_error(error_weights_not_nonnegative("A"), error_message_weights_not_nonnegative("A"))
  expect_error(error_ids_not_in_object("A","B"), error_message_ids_not_in_object("A","B"))
  expect_error(error_name_not_in_object("A","B"), error_message_name_not_in_object("A","B"))
  expect_error(error_no_attr_assigned("A","B"), error_message_no_attr_assigned("A","B"))
  expect_error(error_edge_not_exist("A","B"), error_message_edge_not_exist("A","B"))

  expect_error(error_not_subtempflow("A"), error_message_not_subtempflow("A"))
  expect_error(error_not_point_subset("A"), error_message_not_point_subset("A"))



})


