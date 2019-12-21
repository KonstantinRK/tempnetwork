context("test-tempnetwork-tempflow-predicates")
PATH = system.file("inst","testdata","tempflow", package = "tempnetwork")
PATH_GRAPH = system.file("inst","testdata","tempgraph", package = "tempnetwork")

TF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_directed_acyclic_small_1.gml"), format = "graphml"))
TF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_directed_acyclic_small_1.gml"), format = "graphml"))
TF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_forrest_small_1.gml"), format = "graphml"))
TF4 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_tree_small_1.gml"), format = "graphml"))
TF5 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_lattice_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)


LTF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_directed_acyclic_loop_small_1.gml"), format = "graphml"))
LTF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_directed_acyclic_loop_small_1.gml"), format = "graphml"))
LTF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_forrest_loop_small_1.gml"), format = "graphml"))
LTF4 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_weighted_tree_loop_small_1.gml"), format = "graphml"))
LTF5 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_lattice_loop_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)
LTF6 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_differentlyweighted_directed_acyclic_loop_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)

STF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_singelton_1.gml"), format = "graphml"))
STF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_singelton_noname_1.gml"), format = "graphml"))
STF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_singelton_loop_1.gml"), format = "graphml"))

WTF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_partialweighted_directed_acyclic_small_1.gml"), format = "graphml"), setDefaultValues = TRUE)

ETF1 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_example_2_6.gml"), format = "graphml"))
ETF2 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_example_4_1.gml"), format = "graphml"))
ETF3 <- tempflow(igraph::read.graph(file.path(PATH, "tempflow_example_4_2.gml"), format = "graphml"))


GL1 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v1")
GL2 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v2")
GL3 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v3")
GL4 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_p13_n5_random50")
GL5 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_p11_n5_random50", graphNameList = list("a","p11","p21","p22","p23","b","p31","p32","p41","p42","c"))
GL6 <- read_graph_list_all_variants(PATH_GRAPH, "tempgraph_default_p5_n5_v1", graphNameList = list("t1", "t2", "t3", "t12", "t13"))


GL1TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$simple)
GL2TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL2$simple)
GL3TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL3$simple)

GL1TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL1$simple)
GL2TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL2$simple)
GL3TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL3$simple)

GL4TF3 <- tempnetwork(tempFlow = TF3, equivalenceRelation = NULL, graphList = GL4$simple)
GL4TF4 <- tempnetwork(tempFlow = TF4, equivalenceRelation = NULL, graphList = GL4$simple)
GL4TF5 <- tempnetwork(tempFlow = TF5, equivalenceRelation = NULL, graphList = GL4$simple)

GL1LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL1$simple)
GL2LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL2$simple)
GL3LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL3$simple)

GL1LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL1$simple)
GL2LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL2$simple)
GL3LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL3$simple)

GL4LTF3 <- tempnetwork(tempFlow = LTF3, equivalenceRelation = NULL, graphList = GL4$simple)
GL4LTF4 <- tempnetwork(tempFlow = LTF4, equivalenceRelation = NULL, graphList = GL4$simple)
GL4LTF5 <- tempnetwork(tempFlow = LTF5, equivalenceRelation = NULL, graphList = GL4$simple)
GL1LTF6 <- tempnetwork(tempFlow = LTF6, equivalenceRelation = NULL, graphList = GL1$simple)

GL0STF1 <- tempnetwork(tempFlow = STF1, equivalenceRelation = NULL, graphList = list("t1"=GL1$simple$t1))
GL0STF2 <- tempnetwork(tempFlow = STF2, equivalenceRelation = NULL, graphList = list("1"=GL1$simple$t1))
GL0STF3 <- tempnetwork(tempFlow = STF3, equivalenceRelation = NULL, graphList = list("t1"=GL1$simple$t1))

GL5ETF1 <- tempnetwork(tempFlow = ETF1, equivalenceRelation = NULL, graphList = GL5$simple)
GL6ETF2 <- tempnetwork(tempFlow = ETF2, equivalenceRelation = NULL, graphList = GL6$simple)


WGL1TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL1$weighted)
WGL2TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL2$weighted)
WGL3TF1 <- tempnetwork(tempFlow = TF1, equivalenceRelation = NULL, graphList = GL3$weighted)

WGL1TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL1$weighted)
WGL2TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL2$weighted)
WGL3TF2 <- tempnetwork(tempFlow = TF2, equivalenceRelation = NULL, graphList = GL3$weighted)

WGL4TF3 <- tempnetwork(tempFlow = TF3, equivalenceRelation = NULL, graphList = GL4$weighted)
WGL4TF4 <- tempnetwork(tempFlow = TF4, equivalenceRelation = NULL, graphList = GL4$weighted)
WGL4TF5 <- tempnetwork(tempFlow = TF5, equivalenceRelation = NULL, graphList = GL4$weighted)

WGL1LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL1$weighted)
WGL2LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL2$weighted)
WGL3LTF1 <- tempnetwork(tempFlow = LTF1, equivalenceRelation = NULL, graphList = GL3$weighted)


WGL1LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL1$weighted)
WGL2LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL2$weighted)
WGL3LTF2 <- tempnetwork(tempFlow = LTF2, equivalenceRelation = NULL, graphList = GL3$weighted)

WGL4LTF3 <- tempnetwork(tempFlow = LTF3, equivalenceRelation = NULL, graphList = GL4$weighted)
WGL4LTF4 <- tempnetwork(tempFlow = LTF4, equivalenceRelation = NULL, graphList = GL4$weighted)
WGL4LTF5 <- tempnetwork(tempFlow = LTF5, equivalenceRelation = NULL, graphList = GL4$weighted)
WGL1LTF6 <- tempnetwork(tempFlow = LTF6, equivalenceRelation = NULL, graphList = GL1$weighted)

WGL5ETF1 <- tempnetwork(tempFlow = ETF1, equivalenceRelation = NULL, graphList = GL5$weighted)
WGL1ETF2 <- tempnetwork(tempFlow = ETF2, equivalenceRelation = NULL, graphList = GL6$weighted)

test_that("test 'reachable(tempFlow, startPoint, endPoint, safe = TRUE)'", {

  expect_equal(reachable(GL1TF1,1,5), TRUE)
  expect_equal(reachable(GL1TF1,3,4), FALSE)
  expect_equal(reachable(GL1TF1,5,1), FALSE)
  expect_equal(reachable(GL1TF1,1,1), FALSE)

  expect_equal(reachable(GL1LTF1,1,5), TRUE)
  expect_equal(reachable(GL1LTF1,3,4), FALSE)
  expect_equal(reachable(GL1LTF1,5,1), FALSE)
  expect_equal(reachable(GL1LTF1,1,1), TRUE)

  expect_equal(reachable(GL1TF1, 1,"t2"), TRUE)
  expect_equal(reachable(GL1TF1,"t1",2), TRUE)
  expect_equal(reachable(GL1TF1,"t1","t2"), TRUE)


  expect_equal(reachable(GL1TF1, 2,"t1"), FALSE)
  expect_equal(reachable(GL1TF1,"t2",1), FALSE)
  expect_equal(reachable(GL1TF1,"t2","t1"), FALSE)

  expect_error(reachable(GL1TF1, 1, 20))
  expect_error(reachable(GL1TF1, "t1", "t20"))

  expect_equal(reachable(GL4TF3,1,13), FALSE)

})

test_that("test 'comparable(tempFlow, inpPoint1, inpPoint2, safe = TRUE)'", {

  expect_equal(comparable(GL1TF1,1,5), TRUE)
  expect_equal(comparable(GL1TF1,3,4), FALSE)
  expect_equal(comparable(GL1TF1,5,1), TRUE)
  expect_equal(comparable(GL1TF1,1,1), FALSE)

  expect_equal(comparable(GL1LTF1,1,5), TRUE)
  expect_equal(comparable(GL1LTF1,3,4), FALSE)
  expect_equal(comparable(GL1LTF1,5,1), TRUE)
  expect_equal(comparable(GL1LTF1,1,1), TRUE)

  expect_equal(comparable(GL1TF1, 1,"t2"), TRUE)
  expect_equal(comparable(GL1TF1,"t1",2), TRUE)
  expect_equal(comparable(GL1TF1,"t1","t2"), TRUE)


  expect_equal(comparable(GL1TF1, 2,"t1"), TRUE)
  expect_equal(comparable(GL1TF1,"t2",1), TRUE)
  expect_equal(comparable(GL1TF1,"t2","t1"), TRUE)

  expect_error(comparable(GL1TF1, 1, 20))
  expect_error(comparable(GL1TF1, "t1", "t20"))

  expect_equal(comparable(GL4TF3,1,13), FALSE)

})


test_that("test 'smaller'", {

  expect_equal(smaller(GL1TF1,1,5), TRUE)
  expect_equal(smaller(GL1TF1,3,4), FALSE)
  expect_equal(smaller(GL1TF1,5,1), FALSE)
  expect_equal(smaller(GL1TF1,1,1), FALSE)

  expect_equal(smaller(GL1LTF1,1,5), TRUE)
  expect_equal(smaller(GL1LTF1,3,4), FALSE)
  expect_equal(smaller(GL1LTF1,5,1), FALSE)
  expect_equal(smaller(GL1LTF1,1,1), FALSE)

  expect_equal(smaller(GL1TF1, 1,"t2"), TRUE)
  expect_equal(smaller(GL1TF1,"t1",2), TRUE)
  expect_equal(smaller(GL1TF1,"t1","t2"), TRUE)

  expect_equal(smaller(GL1TF1, 2,"t1"), FALSE)
  expect_equal(smaller(GL1TF1,"t2",1), FALSE)
  expect_equal(smaller(GL1TF1,"t2","t1"), FALSE)

  expect_error(smaller(GL1TF1, 1, 20))
  expect_error(smaller(GL1TF1, "t1", "t20"))

  expect_equal(smaller(GL4TF3,1,13), FALSE)
})


test_that("test 'greater'", {

  expect_equal(greater(GL1TF1,1,5), FALSE)
  expect_equal(greater(GL1TF1,3,4), FALSE)
  expect_equal(greater(GL1TF1,5,1), TRUE)
  expect_equal(greater(GL1TF1,1,1), FALSE)

  expect_equal(greater(GL1LTF1,1,5), FALSE)
  expect_equal(greater(GL1LTF1,3,4), FALSE)
  expect_equal(greater(GL1LTF1,5,1), TRUE)
  expect_equal(greater(GL1LTF1,1,1), FALSE)

  expect_equal(greater(GL1TF1, 1,"t2"), FALSE)
  expect_equal(greater(GL1TF1,"t1",2), FALSE)
  expect_equal(greater(GL1TF1,"t1","t2"), FALSE)

  expect_equal(greater(GL1TF1, 2,"t1"), TRUE)
  expect_equal(greater(GL1TF1,"t2",1), TRUE)
  expect_equal(greater(GL1TF1,"t2","t1"), TRUE)


  expect_error(greater(GL1TF1, 1, 20))
  expect_error(greater(GL1TF1, "t1", "t20"))

  expect_equal(greater(GL4TF3,1,13), FALSE)
})





test_that("test 'smaller_eq'", {

  expect_equal(smaller_eq(GL1TF1,1,5), TRUE)
  expect_equal(smaller_eq(GL1TF1,3,4), FALSE)
  expect_equal(smaller_eq(GL1TF1,5,1), FALSE)
  expect_equal(smaller_eq(GL1TF1,1,1), TRUE)

  expect_equal(smaller_eq(GL1LTF1,1,5), TRUE)
  expect_equal(smaller_eq(GL1LTF1,3,4), FALSE)
  expect_equal(smaller_eq(GL1LTF1,5,1), FALSE)
  expect_equal(smaller_eq(GL1LTF1,1,1), TRUE)

  expect_equal(smaller_eq(GL1TF1, 1,"t2"), TRUE)
  expect_equal(smaller_eq(GL1TF1,"t1",2), TRUE)
  expect_equal(smaller_eq(GL1TF1,"t1","t2"), TRUE)

  expect_equal(smaller_eq(GL1TF1, 2,"t1"), FALSE)
  expect_equal(smaller_eq(GL1TF1,"t2",1), FALSE)
  expect_equal(smaller_eq(GL1TF1,"t2","t1"), FALSE)

  expect_error(smaller_eq(GL1TF1, 1, 20))
  expect_error(smaller_eq(GL1TF1, "t1", "t20"))

  expect_equal(smaller_eq(GL4TF3,1,13), FALSE)
})


test_that("test 'greater_eq'", {

  expect_equal(greater_eq(GL1TF1,1,5), FALSE)
  expect_equal(greater_eq(GL1TF1,3,4), FALSE)
  expect_equal(greater_eq(GL1TF1,5,1), TRUE)
  expect_equal(greater_eq(GL1TF1,1,1), TRUE)

  expect_equal(greater_eq(GL1LTF1,1,5), FALSE)
  expect_equal(greater_eq(GL1LTF1,3,4), FALSE)
  expect_equal(greater_eq(GL1LTF1,5,1), TRUE)
  expect_equal(greater_eq(GL1LTF1,1,1), TRUE)

  expect_equal(greater_eq(GL1TF1, 1,"t2"), FALSE)
  expect_equal(greater_eq(GL1TF1,"t1",2), FALSE)
  expect_equal(greater_eq(GL1TF1,"t1","t2"), FALSE)

  expect_equal(greater_eq(GL1TF1, 2,"t1"), TRUE)
  expect_equal(greater_eq(GL1TF1,"t2",1), TRUE)
  expect_equal(greater_eq(GL1TF1,"t2","t1"), TRUE)


  expect_error(greater_eq(GL1TF1, 1, 20))
  expect_error(greater_eq(GL1TF1, "t1", "t20"))

  expect_equal(greater_eq(GL4TF3,1,13), FALSE)
})





test_that("test 'between'", {

  expect_equal(between(GL1TF1,1,5,4), TRUE)
  expect_equal(between(GL1TF1,3,5,4), FALSE)
  expect_equal(between(GL1TF1,5,1,4), FALSE)
  expect_equal(between(GL1TF1,1,1,1), FALSE)
  expect_equal(between(GL1TF1,1,2,1), FALSE)
  expect_equal(between(GL1TF1,1,2,2), FALSE)

  expect_equal(between(GL1LTF1,1,5,4), TRUE)
  expect_equal(between(GL1LTF1,3,4,4), FALSE)
  expect_equal(between(GL1LTF1,5,1,4), FALSE)
  expect_equal(between(GL1LTF1,1,1,1), FALSE)
  expect_equal(between(GL1LTF1,1,2,1), FALSE)
  expect_equal(between(GL1LTF1,1,2,2), FALSE)


  expect_equal(between(GL1TF1, 1,"t3", 2), TRUE)
  expect_equal(between(GL1TF1,"t1",3, 2), TRUE)
  expect_equal(between(GL1TF1,"t1","t3", 2), TRUE)

  expect_equal(between(GL1TF1, 1,"t3", "t2"), TRUE)
  expect_equal(between(GL1TF1,"t1",3, "t2"), TRUE)
  expect_equal(between(GL1TF1,"t1","t3", "t2"), TRUE)

  expect_error(between(GL1TF1, 1, 20, 3))
  expect_error(between(GL1TF1, "t1", "t20", "t3"))

  expect_error(between(GL1TF1, 1, "t5", 20))
  expect_error(between(GL1TF1, "t1", "t5", "t20"))

  expect_equal(between(GL4TF3,"t1","t13", "t2"), FALSE)
  expect_equal(between(GL4TF3,"t1","t5", "t2"), TRUE)
  expect_equal(between(GL4TF3,"t3","t13", "t12"), TRUE)
})

test_that("test 'is_branch_globally_homogeneous'", {

  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t2", "t5"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t1", "t2"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t3", "t4"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t4", "t3"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t1", "t1"), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t2", "t5"), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t1", "t2"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t3", "t4"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t4", "t3"), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4TF3, "t1", "t13"), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4TF4, "t1", "t13"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL4TF4, "t1", "t8"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL4TF4, "t8", "t1"), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4TF5, "t4", "t13"), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL4TF5, "t1", "t13"), FALSE)

  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t2", "t5"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t1", "t2"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t3", "t4"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t4", "t3"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t1", "t1"), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t2", "t5"), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t1", "t2"), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t3", "t4"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t4", "t3"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t4", "t3"), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4LTF3, "t1", "t13"), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4LTF4, "t1", "t13"), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL4LTF4, "t1", "t8"), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL4LTF4, "t8", "t1"), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4LTF5, "t4", "t13"), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL4LTF5, "t1", "t13"), FALSE)

  expect_equal(is_branch_globally_homogeneous(GL1LTF6, "t2", "t5"), FALSE)
  expect_error(is_branch_globally_homogeneous(GL1LTF6, "t2", "t6"), error_message_name_not_in_object())

  expect_equal(is_branch_globally_homogeneous(STF1, "t1", "t1"), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF2, 1,1), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF3, "t1", "t1"), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL5ETF1, "a", "b"), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL5ETF1, "b", "c"), FALSE)



  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t2", "t5", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t1", "t2", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t3", "t4", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t4", "t3", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t1", "t1", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t2", "t5", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t1", "t2", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t3", "t4", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t4", "t3", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4TF3, "t1", "t13", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4TF4, "t1", "t13", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL4TF4, "t1", "t8", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL4TF4, "t8", "t1", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4TF5, "t4", "t13", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL4TF5, "t1", "t13", considerWeights = FALSE), FALSE)

  is_branch_globally_homogeneous(GL4TF5, "t4", "t13", considerWeights = FALSE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t2", "t5", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t1", "t2", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t3", "t4", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t4", "t3", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t1", "t1", considerWeights = FALSE), TRUE)


  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t2", "t5", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t1", "t2", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t3", "t4", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t4", "t3", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4LTF3, "t1", "t13", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4LTF4, "t1", "t13", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL4LTF4, "t1", "t8", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL4LTF4, "t8", "t1", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4LTF5, "t4", "t13", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL4LTF5, "t1", "t13", considerWeights = FALSE), FALSE)

  expect_equal(is_branch_globally_homogeneous(GL1LTF6, "t2", "t5", considerWeights = FALSE), FALSE)
  expect_error(is_branch_globally_homogeneous(GL1LTF6, "t2", "t6", considerWeights = FALSE), error_message_name_not_in_object())

  expect_equal(is_branch_globally_homogeneous(STF1, "t1", "t1", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF2, 1, 1, considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF3, "t1", "t1", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL5ETF1, "a", "b", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL5ETF1, "b", "c", considerWeights = FALSE), TRUE)



  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t2", "t5", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t1", "t2", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t3", "t4", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t4", "t3", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t1", "t1", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t2", "t5", considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t1", "t2", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t3", "t4", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t4", "t3", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4TF3, "t1", "t13", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4TF4, "t1", "t13", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL4TF4, "t1", "t8", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL4TF4, "t8", "t1", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4TF5, "t4", "t13", considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL4TF5, "t1", "t13", considerLoops = FALSE), FALSE)

  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t2", "t5", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t1", "t2", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t3", "t4", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t4", "t3", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t1", "t1", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t2", "t5", considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t1", "t2", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t3", "t4", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t4", "t3", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t4", "t3", considerLoops = FALSE), TRUE)


  expect_equal(is_branch_globally_homogeneous(GL4LTF3, "t1", "t13", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4LTF4, "t1", "t13", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL4LTF4, "t1", "t8", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL4LTF4, "t8", "t1", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4LTF5, "t4", "t13", considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL4LTF5, "t1", "t13", considerLoops = FALSE), FALSE)

  expect_equal(is_branch_globally_homogeneous(GL1LTF6, "t2", "t5", considerLoops = FALSE), FALSE)
  expect_error(is_branch_globally_homogeneous(GL1LTF6, "t2", "t6", considerLoops = FALSE), error_message_name_not_in_object())

  expect_equal(is_branch_globally_homogeneous(STF1, "t1", "t1", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF2, 1,1, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF3, "t1", "t1", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL5ETF1, "a", "b", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL5ETF1, "b", "c", considerLoops = FALSE), FALSE)



  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t2", "t5", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t1", "t2", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t3", "t4", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t4", "t3", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF1, "t1", "t1", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t2", "t5", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t1", "t2", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t3", "t4", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1TF2, "t4", "t3", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4TF3, "t1", "t13", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4TF4, "t1", "t13", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL4TF4, "t1", "t8", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL4TF4, "t8", "t1", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4TF5, "t4", "t13", considerWeights = FALSE, considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL4TF5, "t1", "t13", considerWeights = FALSE, considerLoops = FALSE), FALSE)

  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t2", "t5", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t1", "t2", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t3", "t4", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t4", "t3", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF1, "t1", "t1", considerWeights = FALSE, considerLoops = FALSE), TRUE)


  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t2", "t5", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t1", "t2", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t3", "t4", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL1LTF2, "t4", "t3", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4LTF3, "t1", "t13", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4LTF4, "t1", "t13", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL4LTF4, "t1", "t8", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(GL4LTF4, "t8", "t1", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL4LTF5, "t4", "t13", considerWeights = FALSE, considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL4LTF5, "t1", "t13", considerWeights = FALSE, considerLoops = FALSE), FALSE)

  expect_equal(is_branch_globally_homogeneous(GL1LTF6, "t2", "t5", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_error(is_branch_globally_homogeneous(GL1LTF6, "t2", "t6", considerWeights = FALSE, considerLoops = FALSE), error_message_name_not_in_object())

  expect_equal(is_branch_globally_homogeneous(STF1, "t1", "t1", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF2, 1, 1, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF3, "t1", "t1", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(GL5ETF1, "a", "b", considerWeights = FALSE, considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(GL5ETF1, "b", "c", considerWeights = FALSE, considerLoops = FALSE), TRUE)
})



test_that("test 'is_globally_homogeneous'", {

  expect_equal(is_globally_homogeneous(GL1TF1), TRUE)
  expect_equal(is_globally_homogeneous(GL1TF2), FALSE)
  expect_equal(is_globally_homogeneous(GL4TF3), TRUE)
  expect_equal(is_globally_homogeneous(GL4TF4), TRUE)
  expect_equal(is_globally_homogeneous(GL4TF5), FALSE)

  expect_equal(is_globally_homogeneous(GL1LTF1), TRUE)
  expect_equal(is_globally_homogeneous(GL1LTF2), FALSE)
  expect_equal(is_globally_homogeneous(GL4LTF3), FALSE)
  expect_equal(is_globally_homogeneous(GL4LTF4), FALSE)
  expect_equal(is_globally_homogeneous(GL4LTF5), FALSE)
  expect_equal(is_globally_homogeneous(GL1LTF6), FALSE)

  expect_equal(is_globally_homogeneous(STF1), TRUE)
  expect_equal(is_globally_homogeneous(STF2), TRUE)
  expect_equal(is_globally_homogeneous(STF3), TRUE)

  expect_equal(is_globally_homogeneous(WTF1), TRUE)

  expect_equal(is_globally_homogeneous(GL5ETF1), FALSE)
  expect_equal(is_globally_homogeneous(GL6ETF2), TRUE)
  #expect_equal(is_globally_homogeneous(ETF3), TRUE)

  expect_equal(is_globally_homogeneous(GL1TF1, considerWeights = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL1TF2, considerWeights = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4TF3, considerWeights = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4TF4, considerWeights = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4TF5, considerWeights = FALSE), FALSE)

  expect_equal(is_globally_homogeneous(GL1LTF1, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(GL1LTF2, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(GL4LTF3, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(GL4LTF4, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(GL4LTF5, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(GL1LTF6, considerWeights = FALSE), FALSE)

  expect_equal(is_globally_homogeneous(STF1, considerWeights = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(STF2, considerWeights = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(STF3, considerWeights = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(WTF1, considerWeights = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(GL5ETF1, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(GL6ETF2, considerWeights = FALSE), FALSE)
 # expect_equal(is_globally_homogeneous(ETF3, considerWeights = FALSE), TRUE)



  expect_equal(is_globally_homogeneous(GL1TF1, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL1TF2, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(GL4TF3, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4TF4, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4TF5, considerLoops = FALSE), FALSE)

  expect_equal(is_globally_homogeneous(GL1LTF1, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL1LTF2, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(GL4LTF3, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4LTF4, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4LTF5, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(GL1LTF6, considerLoops = FALSE), FALSE)

  expect_equal(is_globally_homogeneous(STF1, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(STF2, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(STF3, considerLoops = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(GL5ETF1, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(GL6ETF2, considerLoops = FALSE), TRUE)
 # expect_equal(is_globally_homogeneous(ETF3, considerLoops = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(GL1TF1, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL1TF2, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4TF3, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4TF4, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4TF5, considerWeights = FALSE, considerLoops = FALSE), FALSE)

  expect_equal(is_globally_homogeneous(GL1LTF1, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL1LTF2, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4LTF3, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4LTF4, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(GL4LTF5, considerWeights = FALSE, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(GL1LTF6, considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(STF1, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(STF2, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(STF3, considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(WTF1, considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(GL5ETF1, considerWeights = FALSE, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(GL6ETF2, considerWeights = FALSE, considerLoops = FALSE), FALSE)
 # expect_equal(is_globally_homogeneous(ETF3, considerWeights = FALSE, considerLoops = FALSE), TRUE)
})



test_that("test 'is_locally_homogeneous'", {

  expect_equal(is_locally_homogeneous(GL1TF1), TRUE)
  expect_equal(is_locally_homogeneous(GL1TF2), FALSE)
  expect_equal(is_locally_homogeneous(GL4TF3), FALSE)
  expect_equal(is_locally_homogeneous(GL4TF4), FALSE)
  expect_equal(is_locally_homogeneous(GL4TF5), TRUE)

  expect_equal(is_locally_homogeneous(GL1LTF1), TRUE)
  expect_equal(is_locally_homogeneous(GL1LTF2), FALSE)
  expect_equal(is_locally_homogeneous(GL4LTF3), FALSE)
  expect_equal(is_locally_homogeneous(GL4LTF4), FALSE)
  expect_equal(is_locally_homogeneous(GL4LTF5), TRUE)
  expect_equal(is_locally_homogeneous(GL1LTF6), FALSE)

  expect_equal(is_locally_homogeneous(STF1), TRUE)
  expect_equal(is_locally_homogeneous(STF2), TRUE)
  expect_equal(is_locally_homogeneous(STF3), TRUE)

  expect_equal(is_locally_homogeneous(WTF1), TRUE)

  expect_equal(is_locally_homogeneous(GL5ETF1), FALSE)
  expect_equal(is_locally_homogeneous(GL6ETF2), FALSE)
 # expect_equal(is_locally_homogeneous(ETF3), TRUE)

})


test_that("test 'is_branch_locally_homogeneous'", {

  expect_equal(is_branch_locally_homogeneous(GL1TF1, "t2", "t5"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1TF1, "t5", "t2"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1TF1, "t1", "t2"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1TF1, "t3", "t4"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1TF1, "t4", "t3"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1TF1, "t1", "t1"), TRUE)

  expect_equal(is_branch_locally_homogeneous(GL1TF2, "t2", "t5"), FALSE)
  expect_equal(is_branch_locally_homogeneous(GL1TF2, "t1", "t2"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1TF2, "t3", "t4"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1TF2, "t4", "t3"), TRUE)

  expect_equal(is_branch_locally_homogeneous(GL4TF3, "t1", "t13"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL4TF3, "t1", "t9"), FALSE)
  expect_equal(is_branch_locally_homogeneous(GL4TF3, "t2", "t9"), TRUE)

  expect_equal(is_branch_locally_homogeneous(GL4TF4, "t1", "t13"), FALSE)
  expect_equal(is_branch_locally_homogeneous(GL4TF4, "t1", "t8"), FALSE)
  expect_equal(is_branch_locally_homogeneous(GL4TF4, "t8", "t1"), TRUE)

  expect_equal(is_branch_locally_homogeneous(GL4TF5, "t4", "t12"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL4TF5, "t1", "t13"), TRUE)

  expect_equal(is_branch_locally_homogeneous(GL1LTF1, "t2", "t5"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1LTF1, "t1", "t2"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1LTF1, "t3", "t4"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1LTF1, "t4", "t3"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1LTF1, "t1", "t1"), TRUE)

  expect_equal(is_branch_locally_homogeneous(GL1LTF2, "t2", "t5"), FALSE)
  expect_equal(is_branch_locally_homogeneous(GL1LTF2, "t1", "t2"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1LTF2, "t3", "t4"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1LTF2, "t4", "t3"), TRUE)

  expect_equal(is_branch_locally_homogeneous(GL4LTF3, "t1", "t13"), TRUE)

  expect_equal(is_branch_locally_homogeneous(GL4LTF4, "t1", "t13"), FALSE)
  expect_equal(is_branch_locally_homogeneous(GL4LTF4, "t1", "t8"), FALSE)
  expect_equal(is_branch_locally_homogeneous(GL4LTF4, "t8", "t1"), TRUE)

  expect_equal(is_branch_locally_homogeneous(GL4LTF5, "t4", "t13"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL4LTF5, "t1", "t13"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL1LTF6, "t2", "t5"), FALSE)

  expect_equal(is_branch_locally_homogeneous(GL0STF1, "t1", "t1"), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL0STF2, 1,1), TRUE)
  expect_equal(is_branch_locally_homogeneous(GL0STF3, "t1", "t1"), TRUE)

  expect_equal(is_branch_locally_homogeneous(GL5ETF1, "a", "b"), FALSE)
  expect_equal(is_branch_locally_homogeneous(GL5ETF1, "b", "c"), FALSE)
})

