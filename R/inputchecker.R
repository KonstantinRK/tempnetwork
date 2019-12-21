
#' A function that checks, if the two given vectors have equal length.
#'
#' @param vector1 A arbitrary vector.
#' @param vector2 A arbitrary vector.
#' @return The boolean value TRUE, if the two given vectors have equal length.
check_vector_equal_length <- function(vector1, vector2) {
  return(length(vector1) == length(vector2))
}


#' A function that checks, if the 'checkVector' has either equal length as the 'refVector' or is of length 1.
#'
#' @param checkVector The vector to be checked.
#' @param refVector The reference vector.
#' @return The boolean value TRUE, if the 'checkVector' has either equal length as the 'refVector' or is of length 1.
check_vector_equal_length_or_one <- function(checkVector, refVector) {
  return(length(checkVector) == length(refVector) || length(checkVector)==1 )
}

#' A function that checks, if the given vector contains either a NA, NaN or a NULL value.
#'
#' @param vector1 A arbitrary vector.
#' @return The boolean value TRUE, if the given vector contains either a NA, NaN or a NULL value.
check_vector_contains_na_or_or_nan_null <- function(vector) {
  return(any(is.na(vector)) || any(is.nan(vector) || any(is.null(vector))))
}

check_vector_unique <- function(vector){
  return(length(unique(vector))==length(vector))
}
