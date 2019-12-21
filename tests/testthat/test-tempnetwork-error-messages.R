context("test-tempnetwork-error-messages")

test_that("test 'error_messages'", {
  expect_error(error_vertex_not_exists(), error_message_vertex_not_exists())
  expect_error(error_tvertex_not_exists(), error_message_tvertex_not_exists())
  expect_error(error_point_not_exists(), error_message_point_not_exists())

  expect_error(error_not_tempflow(), error_message_not_tempflow())
  expect_error(error_graphlist_empty(), error_message_graphlist_empty())
  expect_error(error_tempflow_empty(), error_message_tempflow_empty())
  expect_error(error_graph_has_no_name(), error_message_graph_has_no_name())

  expect_error(error_graphlist_index_is_not_unique(), error_message_graphlist_index_is_not_unique())
  expect_error(error_equivclass_index_is_not_unique(), error_message_equivclass_index_is_not_unique())
  expect_error(error_equivclass_not_disjoined(), error_message_equivclass_not_disjoined())
  expect_error(error_equivrel_index_is_not_unique(), error_message_equivrel_index_is_not_unique())
  expect_error(error_graphlist_vertex_not_unique(), error_message_graphlist_vertex_not_unique())

  expect_error(error_graphlist_not_equal_length(), error_message_graphlist_not_equal_length())
  expect_error(error_not_graphlist_vertex_equality(), error_message_not_graphlist_vertex_equality())

  expect_error(error_not_tempflow_graphlist_index_equality(), error_message_not_tempflow_graphlist_index_equality())
  expect_error(error_not_tempflow_equivclass_index_equality(), error_message_not_tempflow_equivclass_index_equality())
  expect_error(error_not_graphlist_equivclass_index_equality(), error_message_not_graphlist_equivclass_index_equality())

  expect_error(error_equivalenceclass_is_not_exhaustive(), error_message_equivalenceclass_is_not_exhaustive())
  expect_error(error_equivrel_not_equal_length_to_vertices(), error_message_equivrel_not_equal_length_to_vertices())

  expect_error(error_not_multiple_of_tempflow(), error_message_not_multiple_of_tempflow())



  expect_error(error_vertex_not_exists("A"), error_message_vertex_not_exists("A"))
  expect_error(error_tvertex_not_exists("A"), error_message_tvertex_not_exists("A"))
  expect_error(error_point_not_exists("A"), error_message_point_not_exists("A"))

  expect_error(error_not_tempflow("A"), error_message_not_tempflow("A"))
  expect_error(error_graphlist_empty("A"), error_message_graphlist_empty("A"))
  expect_error(error_tempflow_empty("A"), error_message_tempflow_empty("A"))
  expect_error(error_graph_has_no_name("A"), error_message_graph_has_no_name("A"))

  expect_error(error_graphlist_index_is_not_unique("A"), error_message_graphlist_index_is_not_unique("A"))
  expect_error(error_equivclass_index_is_not_unique("A"), error_message_equivclass_index_is_not_unique("A"))
  expect_error(error_equivclass_not_disjoined("A"), error_message_equivclass_not_disjoined("A"))
  expect_error(error_equivrel_index_is_not_unique("A"), error_message_equivrel_index_is_not_unique("A"))
  expect_error(error_graphlist_vertex_not_unique("A"), error_message_graphlist_vertex_not_unique("A"))

  expect_error(error_graphlist_not_equal_length("A"), error_message_graphlist_not_equal_length("A"))
  expect_error(error_not_graphlist_vertex_equality("A"), error_message_not_graphlist_vertex_equality("A"))

  expect_error(error_not_tempflow_graphlist_index_equality("A"), error_message_not_tempflow_graphlist_index_equality("A"))
  expect_error(error_not_tempflow_equivclass_index_equality("A"), error_message_not_tempflow_equivclass_index_equality("A"))
  expect_error(error_not_graphlist_equivclass_index_equality("A"), error_message_not_graphlist_equivclass_index_equality("A"))

  expect_error(error_equivalenceclass_is_not_exhaustive("A"), error_message_equivalenceclass_is_not_exhaustive("A"))
  expect_error(error_equivrel_not_equal_length_to_vertices("A"), error_message_equivrel_not_equal_length_to_vertices("A"))

  expect_error(error_not_multiple_of_tempflow("A"), error_message_not_multiple_of_tempflow("A"))

})




