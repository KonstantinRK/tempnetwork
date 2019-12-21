###########################################################################################
################################ tempflow-inputchecker ####################################
###########################################################################################

check_is_igraph_object <- function(tempFlow) { UseMethod("check_is_igraph_object") }
check_is_dag <- function(tempFlow, ignoreLoops = TRUE) { UseMethod("check_is_dag") }
check_is_simple <- function(tempFlow, ignoreLoops = TRUE) { UseMethod("check_is_simple") }
check_are_names_unique <- function(tempFlow) { UseMethod("check_are_names_unique") }
check_are_names_strings <- function(tempFlow) { UseMethod("check_are_names_strings") }
check_are_weights_numeric <- function(tempFlow) { UseMethod("check_are_weights_numeric") }
check_are_weights_nonnegative <- function(tempFlow) { UseMethod("check_are_weights_nonnegative") }


check_graph_for_tempflow_completely<- function(tempFlow, throwError = TRUE) { UseMethod("check_graph_for_tempflow_completely") }
check_graph_for_tempflow <- function(tempFlow, throwError = TRUE) { UseMethod("check_graph_for_tempflow") }
check_names_for_tempflow <- function(tempFlow, throwError = TRUE) { UseMethod("check_names_for_tempflow") }
check_weights_for_tempflow <- function(tempFlow, throwError = TRUE){ UseMethod("check_weights_for_tempflow") }



check_point_id <- function(tempFlow, pointID) { UseMethod("check_point_id") }
check_point_ids <- function(tempFlow, pointIDList) { UseMethod("check_point_ids") }
check_step_id <- function(tempFlow, stepID) { UseMethod("check_step_id") }
check_step_ids <- function(tempFlow, stepIDList) { UseMethod("check_step_ids") }
check_point_name <- function(tempFlow, pointName) { UseMethod("check_point_name") }
check_point_names <- function(tempFlow, pointNameList) { UseMethod("check_point_names") }
check_has_loop <- function(tempFlow, inpPoint, safe = TRUE) { UseMethod("check_has_loop") }




###########################################################################################
################################## tempflow-getter ########################################
###########################################################################################

G <- function(tempFlow) { UseMethod("G") }
tP <- function(tempFlow, ...) { UseMethod("tP") }
tS <- function(tempFlow, ...) { UseMethod("tS") }

get_point_id <- function(tempFlow, inpPoint, safe = TRUE) { UseMethod("get_point_id") }
get_point_ids <- function(tempFlow, inpPointList = tP(tempFlow), safe = TRUE) { UseMethod("get_point_ids") }

get_step_ids <- function(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE) { UseMethod("get_step_ids") }

get_point_name <- function(tempFlow, inpPoint, safe = TRUE) { UseMethod("get_point_name") }
get_point_names <- function(tempFlow, inpPointList = tP(tempFlow), safe = TRUE) { UseMethod("get_point_names") }

get_step_weights <- function(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE) { UseMethod("get_step_weights") }
get_step_weights_from_id<- function(tempFlow, stepIDList = tS(tempFlow), safe = TRUE) { UseMethod("get_step_weights_from_id") }
get_step_point_list <- function(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE) { UseMethod("get_step_point_list") }
get_step_point_list_from_id <- function(tempFlow, stepIDList = tS(tempFlow), safe = TRUE) { UseMethod("get_step_point_list_from_id") }
get_step_attr_list <- function(tempFlow, srcPointList = NULL, dstPointList = NULL, safe = TRUE) { UseMethod("get_step_attr_list") }
get_step_attr_list_from_id <- function(tempFlow, stepIDList = tS(tempFlow), safe = TRUE) { UseMethod("get_step_attr_list_from_id") }

plot <- function(tempFlow, weighted = TRUE, ...) { UseMethod("plot") }

###########################################################################################
################################## tempflow-setter ########################################
###########################################################################################


set_point_names <- function(tempFlow, pointList = tP(tempFlow), nameList = NULL, safe = TRUE) { UseMethod("set_point_names") }
set_step_weights <- function(tempFlow, srcPointList = NULL, dstPointList = NULL, weightList = NULL, safe = TRUE) { UseMethod("set_step_weights") }
set_step_weights_from_id <- function(tempFlow, stepIDList = NULL, weightList = NULL, safe = TRUE) { UseMethod("set_step_weights_from_id") }



###########################################################################################
################################# tempflow-predicates #####################################
###########################################################################################


reachable <- function(tempFlow, startPoint, endPoint, safe = TRUE) { UseMethod("reachable") }
comparable <- function(tempFlow, inpPoint1, inpPoint2, safe = TRUE) { UseMethod("comparable") }
smaller <- function(tempFlow, inpPoint1, inpPoint2, safe = TRUE) { UseMethod("smaller") }
greater <- function(tempFlow, inpPoint1, inpPoint2, safe = TRUE) { UseMethod("greater") }
smaller_eq <- function(tempFlow, inpPoint1, inpPoint2, safe = TRUE) { UseMethod("smaller_eq") }
greater_eq <- function(tempFlow, inpPoint1, inpPoint2, safe = TRUE) { UseMethod("greater_eq") }
between <- function(tempFlow, startPoint, endPoint, checkPoint, safe = TRUE) { UseMethod("between") }
is_branch_globally_homogeneous <- function(tempFlow, startPoint, endPoint, considerWeights = TRUE, considerLoops = TRUE, safe = TRUE) { UseMethod("is_branch_globally_homogeneous") }
is_globally_homogeneous <- function(tempFlow, considerWeights = TRUE, considerLoops = TRUE) { UseMethod("is_globally_homogeneous") }
is_branch_locally_homogeneous <- function(tempFlow, startPoint, endPoint, safe = TRUE) { UseMethod("is_branch_locally_homogeneous") }
is_locally_homogeneous <- function(tempFlow, safe = TRUE) { UseMethod("is_locally_homogeneous") }



###########################################################################################
################################# tempflow-basics #########################################
###########################################################################################


add_points <- function(tempFlow, newPointList, attrList = NULL, safe = TRUE) { UseMethod("add_points") }
delete_points <- function(tempFlow, deletePointList, safe = TRUE) { UseMethod("delete_points") }
add_steps <- function(tempFlow, srcPointList, dstPointList, weightList = NULL, attrList = NULL, safe = TRUE) { UseMethod("add_steps") }
delete_steps_from_id <- function(tempFlow, stepIDList, safe = TRUE) { UseMethod("delete_steps_from_id") }
delete_steps <- function(tempFlow, srcPointList, dstPointList, safe = TRUE) { UseMethod("delete_steps") }
insert_point <- function(tempFlow, newPoint, sucPointList, predPointList, weightList = NULL, pointAttrList = NULL, stepAttrList = NULL, removeEdges = TRUE, safe = TRUE) { UseMethod("insert_point") }
remove_point <- function(tempFlow, removePoint, safe = TRUE) { UseMethod("remove_point") }

induce_flow <- function(tempFlow, inpPointList, safe = TRUE) { UseMethod("induce_flow") }
slice_flow <- function(tempFlow, startPointList, endPointList, safe = TRUE) { UseMethod("slice_flow") }
compute_tempdistance <- function(tempFlow, startPoint, endPoint, considerWeights = TRUE, safe = TRUE) { UseMethod("compute_tempdistance") }


