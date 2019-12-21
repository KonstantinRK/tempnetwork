


###########################################################################################
################################ tempnetwork-getter #######################################
###########################################################################################

tF <- function(tempNetwork) { UseMethod("tF") }
tV <- function(tempNetwork) { UseMethod("tV") }
gL <- function(tempNetwork) { UseMethod("gL") }
stG <- function(tempNetwork) { UseMethod("stG") }
tG <- function(tempNetwork, computeTempGraph =FALSE, connectGraphs = TRUE) { UseMethod("tG") }
eR <- function(tempNetwork, computeEquivRel=FALSE) { UseMethod("eR") }
gG <- function(tempNetwork, pointName, safe = TRUE) { UseMethod("gG") }
gV <- function(tempNetwork, pointName, safe = TRUE) { UseMethod("gV") }
gE <- function(tempNetwork, pointName, safe = TRUE) { UseMethod("gE") }
get_equiv_class <- function(tempNetwork, vertexName, pointNames = NULL, safe = TRUE) { UseMethod("get_equiv_class") }
get_tempgraph_vertex_name <-  function(tempNetwork, tVertexName, pointName, safe = TRUE){ UseMethod("get_tempgraph_vertex_name") }
get_tempgraph_vertex_names <-  function(tempNetwork, tVertexNameList, pointNameList, safe = TRUE){ UseMethod("get_tempgraph_vertex_names") }
tGvN <-  function(tempNetwork, tVertexNameList, pointNameList, safe = TRUE){ UseMethod("tGvN") }
get_vertexname <- function(tempNetwork, tVertexName, pointName, safe = TRUE) { UseMethod("get_vertexname") }
get_vertexnames <- function(tempNetwork, tVertexNameList, pointNameList, safe = TRUE) { UseMethod("get_vertexnames") }


###########################################################################################
################################ tempnetwork-setter #######################################
###########################################################################################


set_tempFlow <- function(tempNetwork, tempFlow, safe = TRUE) { UseMethod("set_tempFlow") }
set_graphList <- function(tempNetwork, graphList, setDefaultGraphNames = TRUE,safe = TRUE) { UseMethod("set_graphList") }
set_equivRelation <- function(tempNetwork, equivRel, safe = TRUE) { UseMethod("set_equivRelation") }
set_tempGraph <- function(tempNetwork, tempGraph = NULL, safe = TRUE) { UseMethod("set_tempGraph") }
set_basic_properties <- function(tempNetwork,  tempFlow = NULL, graphList = NULL, equivRel = NULL, setDefaultGraphNames=TRUE,safe = TRUE) { UseMethod("set_basic_properties") }
set_store_tempgraph <- function(tempNetwork, storeTempGraph){ UseMethod("set_store_tempgraph") }
set_tempvertex_names <- function(tempNetwork, oldNames, newNames, safe = TRUE) { UseMethod("set_tempvertex_names") }
set_vertex_names <- function(tempNetwork, pointNameList, tVertexNameList, newNameList = NULL, changeEquivRel = TRUE, safe = TRUE){ UseMethod("set_vertex_names") }
set_equivclass_gvertex_names <- function(tempNetwork, tVertexName, gVertexNameList = rep(tVertexName, length(tP(tempNetwork))), safe = TRUE) { UseMethod("set_equivclass_gvertex_names") }

###########################################################################################
################################ tempnetwork-basics #######################################
###########################################################################################

adjust_to_reduced_tempflow <- function(tempNetwork, redTempFlow, safe = TRUE)  { UseMethod("adjust_to_reduced_tempflow") }
add_tvertex <- function(tempNetwork, tVertexName, gVertexNameList = rep(tVertexName, length(tP(tempNetwork))), pointNameList = tP(tempNetwork)$name, safe = TRUE)  { UseMethod("add_tvertex") }
add_tvertices <- function(tempNetwork, tVertexNameList, gVertexNameList = rep(tVertexNameList, each = length(tP(tempNetwork))), pointNameList = NULL, safe = TRUE)  { UseMethod("add_tvertices") }
remove_tvertices <- function(tempNetwork, tVertexNameList, safe = TRUE)  { UseMethod("remove_tvertices") }
add_gedges <- function(tempNetwork, pointNameList, startTVertexList, endTVertexList,weightList = NULL, safe = TRUE)  { UseMethod("add_gedges") }
remove_gedges <- function(tempNetwork, pointNameList, startTVertexList, endTVertexList , safe = TRUE)  { UseMethod("remove_gedges") }
construct_underlying_graph <- function(tempNetwork, connectGraphs = TRUE, forceIGraph = FALSE){ UseMethod("construct_underlying_graph") }
compute_distance <- function(tempNetwork, startTVertex, endTVertex, startPoint = NULL, endPoint = NULL, considerWeights = TRUE, cutGraph = TRUE, names = TRUE, safe = TRUE){ UseMethod("compute_distance") }

###########################################################################################
################################ tempnetwork-tempflow-basics ##############################
###########################################################################################

add_points <- function(tempNetwork, newPointList, graphList, equivRel = NULL, attrList = NULL, safe = TRUE) {UseMethod("add_points") }
insert_point <- function(tempNetwork, newPoint, predPointList, sucPointList, graphList, equivRel = NULL,
                         weightList = NULL, pointAttrList = NULL, stepAttrList = NULL, removeEdges = TRUE, safe = TRUE) {UseMethod("insert_point") }


###########################################################################################
################################ tempnetwork-inputchecker #################################
###########################################################################################


check_tempflow <- function(tempNetwork) { UseMethod("check_tempflow") }
check_tempflow_not_empty <- function(tempNetwork) { UseMethod("check_tempflow_not_empty") }
check_graphlist_not_empty <- function(tempNetwork) { UseMethod("check_graphlist_not_empty") }
check_graphlist_equal_length <- function(tempNetwork) { UseMethod("check_graphlist_equal_length") }
check_graphs_have_names <- function(tempNetwork) { UseMethod("check_graphs_have_names") }

check_equivrel_equal_length_to_vertices <- function(tempNetwork) { UseMethod("check_equivrel_equal_length_to_vertices") }
check_equivclass_equal_length_to_graphs <- function(tempNetwork) { UseMethod("check_equivclass_equal_length_to_graphs") }

check_equivrel_index_is_unique <- function(tempNetwork) { UseMethod("check_equivrel_index_is_unique") }
check_equivclass_index_is_unique <- function(tempNetwork) { UseMethod("check_equivclass_index_is_unique") }
check_equivclass_disjoined <- function(tempNetwork) { UseMethod("check_equivclass_disjoined") }
check_graphlist_index_is_unique <- function(tempNetwork) { UseMethod("check_graphlist_index_is_unique") }
check_graphlist_vertex_unique <- function(tempNetwork) { UseMethod("check_graphlist_vertex_unique") }

check_equivalenceclass_is_exhaustive <- function(tempNetwork) { UseMethod("check_equivalenceclass_is_exhaustive") }

check_graphlist_equivclass_index_equality <- function(tempNetwork) { UseMethod("check_graphlist_equivclass_index_equality") }
check_tempflow_equivclass_index_equality <- function(tempNetwork) { UseMethod("check_tempflow_equivclass_index_equality") }
check_tempflow_graphlist_index_equality <- function(tempNetwork) { UseMethod("check_tempflow_graphlist_index_equality") }
check_graphlist_vertex_equality <- function(tempNetwork) { UseMethod("check_graphlist_vertex_equality") }

check_tempflow_graphlist_equivrel_correspondence <- function(tempNetwork, throwError = TRUE) { UseMethod("check_tempflow_graphlist_equivrel_correspondence") }
check_graphlist_equivrel_correspondence <- function(tempNetwork, hasTempflowCorrespondence = FALSE, throwError = TRUE) { UseMethod("check_graphlist_equivrel_correspondence") }

check_graphlist_vertex_sets <- function(tempNetwork, throwError = TRUE) { UseMethod("check_graphlist_vertex_sets") }
check_null_values <- function(tempNetwork, throwError = TRUE) { UseMethod("check_null_values") }

check_tempnetwork_completely <- function(tempNetwork, throwError = TRUE) { UseMethod("check_tempnetwork_completely") }

check_vertices_exists <- function(tempNetwork, tVertexNameList, pointNameList, vertexNameList){ UseMethod("check_vertices_exists") }
check_edge_exists <- function(tempNetwork, pointNameList, startTVertexNameList, endTVertexNameList){ UseMethod("check_edge_exists") }
check_points_exists <- function(tempNetwork, pointNameList){ UseMethod("check_points_exists") }
check_tvertices_exists <- function(tempNetwork, tVertexNameList){ UseMethod("check_tvertices_exists") }
check_points_and_tvertices <- function(tempNetwork, pointNameList = NULL, tVertexNameList = NULL, throwError = TRUE){ UseMethod("check_points_and_tvertices") }

check_is_subtempflow <- function(tempNetwork, tempFlow){ UseMethod("check_is_subtempflow") }
check_is_pointsubset <- function(tempNetwork, tempFlow){ UseMethod("check_is_pointsubset") }

