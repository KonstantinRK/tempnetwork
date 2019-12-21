context("test-error-messages")

test_that("test 'error_messages'", {

  expect_error(error_vector_not_unique(), error_message_vector_not_unique())
  expect_error(error_vector_not_equal_length(), error_message_vector_not_equal_length())
  expect_error(error_vector_not_equal_length_and_not_one(), error_message_vector_not_equal_length_and_not_one())
  expect_error(error_vector_not_equal_lengths_and_not_one(), error_message_vector_not_equal_lengths_and_not_one())
  expect_error(error_vector_not_equal_sum_lengths_and_not_one(), error_message_vector_not_equal_sum_lengths_and_not_one())



  expect_error(error_vector_not_unique("A"), error_message_vector_not_unique("A"))
  expect_error(error_vector_not_equal_length("A","B"), error_message_vector_not_equal_length("A","B"))
  expect_error(error_vector_not_equal_length_and_not_one("A","B"), error_message_vector_not_equal_length_and_not_one("A","B"))
  expect_error(error_vector_not_equal_lengths_and_not_one("A","B","C"), error_message_vector_not_equal_lengths_and_not_one("A","B","C"))
  expect_error(error_vector_not_equal_sum_lengths_and_not_one("A","B","C"), error_message_vector_not_equal_sum_lengths_and_not_one("A","B","C"))


})


