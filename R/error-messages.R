

error_message_vector_not_unique <- function(vectorName = NULL) {
  if (is.null(vectorName)) {"The vectors can not contain duplicates."}
  else {sprintf("'%s'", vectorName)}
}

error_message_vector_not_equal_length <- function(vector1Name = NULL, vector2Name = NULL) {
  if (any(is.null(c(vector1Name, vector2Name)))) {"The vectors must be of the same length."}
  else {sprintf("The vector '%s' must be of the same length as the vector '%s'", vector1Name, vector2Name)}
}

error_message_vector_not_equal_length_and_not_one <- function(vectorCheckName = NULL, vectorRef1Name = NULL){
  if (any(is.null(c(vectorCheckName, vectorRef1Name)))) {"The attribute vector must be of the same length as the other vector, or must be of lenght 1."}
  else {sprintf("The vector '%s' must be of the same length as the vector '%s', or it must be of length 1", vectorCheckName, vectorRef1Name)}
}

error_message_vector_not_equal_lengths_and_not_one <- function(vectorCheckName = NULL, vectorRef1Name = NULL, vectorRef2Name = NULL){
  if (any(is.null(c(vectorCheckName, vectorRef1Name, vectorRef2Name)))) {"The attribute vector must be of the same length as the other vectors, or must be of lenght 1."}
  else {sprintf("The vector '%s' must be of the same length as the vector '%s' and as the vector '%s', or it must be of length 1", vectorCheckName, vectorRef1Name, vectorRef2Name)}
}

error_message_vector_not_equal_sum_lengths_and_not_one <- function(vectorCheckName = NULL, vectorRef1Name = NULL, vectorRef2Name = NULL){
  if (any(is.null(c(vectorCheckName, vectorRef1Name, vectorRef2Name)))) {"The attribute vector must be of the same length as the sum of the length of the other vectors, or must be of lenght 1."}
  else {sprintf("The vector '%s' must be of the same length as the sum of the lengths of vector '%s' and vector '%s', or it must be of length 1", vectorCheckName, vectorRef1Name, vectorRef2Name)}
}


error_vector_not_unique <- function(vectorName = NULL) {stop(error_message_vector_not_unique(vectorName))}
error_vector_not_equal_length <- function(vector1Name = NULL, vector2Name = NULL) {stop(error_message_vector_not_equal_length(vector1Name, vector2Name))}
error_vector_not_equal_length_and_not_one <- function(vectorCheckName = NULL, vectorRef1Name = NULL) {stop(error_message_vector_not_equal_length_and_not_one(vectorCheckName, vectorRef1Name))}
error_vector_not_equal_lengths_and_not_one <- function(vectorCheckName = NULL, vectorRef1Name = NULL, vectorRef2Name = NULL) {stop(error_message_vector_not_equal_lengths_and_not_one(vectorCheckName, vectorRef1Name, vectorRef2Name))}
error_vector_not_equal_sum_lengths_and_not_one <- function(vectorCheckName = NULL, vectorRef1Name = NULL, vectorRef2Name = NULL) {stop(error_message_vector_not_equal_sum_lengths_and_not_one(vectorCheckName, vectorRef1Name, vectorRef2Name))}



