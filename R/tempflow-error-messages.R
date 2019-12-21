
error_message_not_igraph <- function(name = NULL) {
  if (any(is.null(c(name)))) {"An igraph object is required."}
  else {sprintf("Parameter '%s' has to be an igraph object", name)}
}

error_message_not_dag <- function(name = NULL) {
  if (any(is.null(c(name)))) {"A directed acyclic igraph object is required."}
  else {sprintf("Parameter '%s' has to be an directed acyclic igraph object", name)}
}

error_message_not_simple <- function(name = NULL) {
  if (any(is.null(c(name)))) {"A simple igraph object, with or without loops, is required."}
  else {sprintf("Parameter '%s' has to be an simple igraph object, with or without loops.", name)}
}

error_message_names_not_strings <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The names in the igraph object have to be strings."}
  else {sprintf("The names in the igraph object '%s', have to be strings", name)}
}

error_message_names_not_unique <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The names in the igraph object have to be unique."}
  else {sprintf("The names in the igraph object '%s', have to be unique", name)}
}

error_message_weights_not_numeric <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The weights in the igraph object have to be numeric and can not be NA, NaN or NULL"}
  else {sprintf("The weights in the igraph object '%s', have to be numeric", name)}
}

error_message_weights_not_nonnegative <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The weights in the igraph object have to be non-negative."}
  else {sprintf("The weights in the igraph object '%s', have to be non-negative", name)}
}

error_message_ids_not_in_object <- function(parameterName = NULL, objectName = NULL) {
  if (any(is.null(c(parameterName, objectName)))) {"The given id must correspond with the id of a vertex in the underlying igraph object."}
  else {sprintf("The parameter '%s', contains an id that is not present in '%s'", parameterName, objectName)}
}

error_message_name_not_in_object <- function(parameterName = NULL, objectName = NULL) {
  if (any(is.null(c(parameterName, objectName)))) {"The given name must correspond with the name of a vertex in the underlying igraph object."}
  else {sprintf("The parameter '%s', contains a name that is not present in '%s'", parameterName, objectName)}
}

error_message_no_attr_assigned <- function(objectName = NULL, attrName = NULL) {
  if (any(is.null(c(objectName, attrName)))) {"No attribute with that name exists."}
  else {sprintf("The object '%s', has no attribute called '%s", objectName, attrName)}
}

error_message_edge_not_exist <- function(startPoint = NULL, endPoint = NULL){
  if (any(is.null(c(startPoint, endPoint)))) {"One of the specified edges does not exist."}
  else {sprintf("There is no edge between the point '%s' and the point '%s'", startPoint, endPoint)}
}

error_message_not_subtempflow <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The given 'tempflow'-object is not a subtempflow."}
  else {sprintf("Error: %s",name)}
}


error_message_not_point_subset <- function(name = NULL) {
  if (any(is.null(c(name)))) {"The points of the 'tempflow'-object is not a subset."}
  else {sprintf("Error: %s",name)}
}


error_not_igraph <- function(name = NULL) {stop(error_message_not_igraph(name))}
error_not_dag <- function(name = NULL) {stop(error_message_not_dag(name))}
error_not_simple <- function(name = NULL) {stop(error_message_not_simple(name))}
error_names_not_strings <- function(name = NULL) {stop(error_message_names_not_strings(name))}
error_names_not_unique <- function(name = NULL) {stop(error_message_names_not_unique(name))}
error_weights_not_numeric <- function(name = NULL) {stop(error_message_weights_not_numeric(name))}
error_weights_not_nonnegative <- function(name = NULL) {stop(error_message_weights_not_nonnegative(name))}
error_ids_not_in_object <- function(parameterName = NULL, objectName = NULL) {stop(error_message_ids_not_in_object(parameterName, objectName))}
error_name_not_in_object <- function(parameterName = NULL, objectName = NULL) {stop(error_message_name_not_in_object(parameterName, objectName))}
error_no_attr_assigned <- function(objectName = NULL, attrName = NULL) {stop(error_message_no_attr_assigned(objectName, attrName))}
error_edge_not_exist <- function(startPoint = NULL, endPoint = NULL) {stop(error_message_edge_not_exist(startPoint, endPoint))}
error_not_subtempflow <- function(name = NULL) {stop(error_message_not_subtempflow(name))}
error_not_point_subset <- function(name = NULL) {stop(error_message_not_point_subset(name))}


