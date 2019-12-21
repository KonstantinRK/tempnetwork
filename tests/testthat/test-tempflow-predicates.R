context("test-tempflow-predicates")

TF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml"))
TF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml"))
TF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_forrest_small_1.gml", package = "tempnetwork"), format = "graphml"))
TF4 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_tree_small_1.gml", package = "tempnetwork"), format = "graphml"))
TF5 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_lattice_small_1.gml", package = "tempnetwork"), format = "graphml"), setDefaultValues = TRUE)


LTF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_directed_acyclic_loop_small_1.gml", package = "tempnetwork"), format = "graphml"))
LTF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_acyclic_loop_small_1.gml", package = "tempnetwork"), format = "graphml"))
LTF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_forrest_loop_small_1.gml", package = "tempnetwork"), format = "graphml"))
LTF4 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_tree_loop_small_1.gml", package = "tempnetwork"), format = "graphml"))
LTF5 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_lattice_loop_small_1.gml", package = "tempnetwork"), format = "graphml"), setDefaultValues = TRUE)
LTF6 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_differentlyweighted_directed_acyclic_loop_small_1.gml", package = "tempnetwork"), format = "graphml"), setDefaultValues = TRUE)

STF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_1.gml", package = "tempnetwork"), format = "graphml"))
STF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_noname_1.gml", package = "tempnetwork"), format = "graphml"))
STF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_loop_1.gml", package = "tempnetwork"), format = "graphml"))

WTF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_partialweighted_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml"), setDefaultValues = TRUE)

ETF1 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_2_6.gml", package = "tempnetwork"), format = "graphml"))
ETF2 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_4_1.gml", package = "tempnetwork"), format = "graphml"))
ETF3 <- tempflow(igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_4_2.gml", package = "tempnetwork"), format = "graphml"))



test_that("test 'reachable(tempFlow, startPoint, endPoint, safe = TRUE)'", {

  expect_equal(reachable(TF1,1,5), TRUE)
  expect_equal(reachable(TF1,3,4), FALSE)
  expect_equal(reachable(TF1,5,1), FALSE)
  expect_equal(reachable(TF1,1,1), FALSE)

  expect_equal(reachable(LTF1,1,5), TRUE)
  expect_equal(reachable(LTF1,3,4), FALSE)
  expect_equal(reachable(LTF1,5,1), FALSE)
  expect_equal(reachable(LTF1,1,1), TRUE)

  expect_equal(reachable(TF1, 1,"t2"), TRUE)
  expect_equal(reachable(TF1,"t1",2), TRUE)
  expect_equal(reachable(TF1,"t1","t2"), TRUE)


  expect_equal(reachable(TF1, 2,"t1"), FALSE)
  expect_equal(reachable(TF1,"t2",1), FALSE)
  expect_equal(reachable(TF1,"t2","t1"), FALSE)

  expect_error(reachable(TF1, 1, 20))
  expect_error(reachable(TF1, "t1", "t20"))

  expect_equal(reachable(TF3,1,13), FALSE)

})

test_that("test 'comparable(tempFlow, inpPoint1, inpPoint2, safe = TRUE)'", {

  expect_equal(comparable(TF1,1,5), TRUE)
  expect_equal(comparable(TF1,3,4), FALSE)
  expect_equal(comparable(TF1,5,1), TRUE)
  expect_equal(comparable(TF1,1,1), FALSE)

  expect_equal(comparable(LTF1,1,5), TRUE)
  expect_equal(comparable(LTF1,3,4), FALSE)
  expect_equal(comparable(LTF1,5,1), TRUE)
  expect_equal(comparable(LTF1,1,1), TRUE)

  expect_equal(comparable(TF1, 1,"t2"), TRUE)
  expect_equal(comparable(TF1,"t1",2), TRUE)
  expect_equal(comparable(TF1,"t1","t2"), TRUE)


  expect_equal(comparable(TF1, 2,"t1"), TRUE)
  expect_equal(comparable(TF1,"t2",1), TRUE)
  expect_equal(comparable(TF1,"t2","t1"), TRUE)

  expect_error(comparable(TF1, 1, 20))
  expect_error(comparable(TF1, "t1", "t20"))

  expect_equal(comparable(TF3,1,13), FALSE)

})


test_that("test 'smaller'", {

  expect_equal(smaller(TF1,1,5), TRUE)
  expect_equal(smaller(TF1,3,4), FALSE)
  expect_equal(smaller(TF1,5,1), FALSE)
  expect_equal(smaller(TF1,1,1), FALSE)

  expect_equal(smaller(LTF1,1,5), TRUE)
  expect_equal(smaller(LTF1,3,4), FALSE)
  expect_equal(smaller(LTF1,5,1), FALSE)
  expect_equal(smaller(LTF1,1,1), FALSE)

  expect_equal(smaller(TF1, 1,"t2"), TRUE)
  expect_equal(smaller(TF1,"t1",2), TRUE)
  expect_equal(smaller(TF1,"t1","t2"), TRUE)

  expect_equal(smaller(TF1, 2,"t1"), FALSE)
  expect_equal(smaller(TF1,"t2",1), FALSE)
  expect_equal(smaller(TF1,"t2","t1"), FALSE)

  expect_error(smaller(TF1, 1, 20))
  expect_error(smaller(TF1, "t1", "t20"))

  expect_equal(smaller(TF3,1,13), FALSE)
})


test_that("test 'greater'", {

  expect_equal(greater(TF1,1,5), FALSE)
  expect_equal(greater(TF1,3,4), FALSE)
  expect_equal(greater(TF1,5,1), TRUE)
  expect_equal(greater(TF1,1,1), FALSE)

  expect_equal(greater(LTF1,1,5), FALSE)
  expect_equal(greater(LTF1,3,4), FALSE)
  expect_equal(greater(LTF1,5,1), TRUE)
  expect_equal(greater(LTF1,1,1), FALSE)

  expect_equal(greater(TF1, 1,"t2"), FALSE)
  expect_equal(greater(TF1,"t1",2), FALSE)
  expect_equal(greater(TF1,"t1","t2"), FALSE)

  expect_equal(greater(TF1, 2,"t1"), TRUE)
  expect_equal(greater(TF1,"t2",1), TRUE)
  expect_equal(greater(TF1,"t2","t1"), TRUE)


  expect_error(greater(TF1, 1, 20))
  expect_error(greater(TF1, "t1", "t20"))

  expect_equal(greater(TF3,1,13), FALSE)
})





test_that("test 'smaller_eq'", {

  expect_equal(smaller_eq(TF1,1,5), TRUE)
  expect_equal(smaller_eq(TF1,3,4), FALSE)
  expect_equal(smaller_eq(TF1,5,1), FALSE)
  expect_equal(smaller_eq(TF1,1,1), TRUE)

  expect_equal(smaller_eq(LTF1,1,5), TRUE)
  expect_equal(smaller_eq(LTF1,3,4), FALSE)
  expect_equal(smaller_eq(LTF1,5,1), FALSE)
  expect_equal(smaller_eq(LTF1,1,1), TRUE)

  expect_equal(smaller_eq(TF1, 1,"t2"), TRUE)
  expect_equal(smaller_eq(TF1,"t1",2), TRUE)
  expect_equal(smaller_eq(TF1,"t1","t2"), TRUE)

  expect_equal(smaller_eq(TF1, 2,"t1"), FALSE)
  expect_equal(smaller_eq(TF1,"t2",1), FALSE)
  expect_equal(smaller_eq(TF1,"t2","t1"), FALSE)

  expect_error(smaller_eq(TF1, 1, 20))
  expect_error(smaller_eq(TF1, "t1", "t20"))

  expect_equal(smaller_eq(TF3,1,13), FALSE)
})


test_that("test 'greater_eq'", {

  expect_equal(greater_eq(TF1,1,5), FALSE)
  expect_equal(greater_eq(TF1,3,4), FALSE)
  expect_equal(greater_eq(TF1,5,1), TRUE)
  expect_equal(greater_eq(TF1,1,1), TRUE)

  expect_equal(greater_eq(LTF1,1,5), FALSE)
  expect_equal(greater_eq(LTF1,3,4), FALSE)
  expect_equal(greater_eq(LTF1,5,1), TRUE)
  expect_equal(greater_eq(LTF1,1,1), TRUE)

  expect_equal(greater_eq(TF1, 1,"t2"), FALSE)
  expect_equal(greater_eq(TF1,"t1",2), FALSE)
  expect_equal(greater_eq(TF1,"t1","t2"), FALSE)

  expect_equal(greater_eq(TF1, 2,"t1"), TRUE)
  expect_equal(greater_eq(TF1,"t2",1), TRUE)
  expect_equal(greater_eq(TF1,"t2","t1"), TRUE)


  expect_error(greater_eq(TF1, 1, 20))
  expect_error(greater_eq(TF1, "t1", "t20"))

  expect_equal(greater_eq(TF3,1,13), FALSE)
})





test_that("test 'between'", {

  expect_equal(between(TF1,1,5,4), TRUE)
  expect_equal(between(TF1,3,5,4), FALSE)
  expect_equal(between(TF1,5,1,4), FALSE)
  expect_equal(between(TF1,1,1,1), FALSE)
  expect_equal(between(TF1,1,2,1), FALSE)
  expect_equal(between(TF1,1,2,2), FALSE)

  expect_equal(between(LTF1,1,5,4), TRUE)
  expect_equal(between(LTF1,3,4,4), FALSE)
  expect_equal(between(LTF1,5,1,4), FALSE)
  expect_equal(between(LTF1,1,1,1), FALSE)
  expect_equal(between(LTF1,1,2,1), FALSE)
  expect_equal(between(LTF1,1,2,2), FALSE)


  expect_equal(between(TF1, 1,"t3", 2), TRUE)
  expect_equal(between(TF1,"t1",3, 2), TRUE)
  expect_equal(between(TF1,"t1","t3", 2), TRUE)

  expect_equal(between(TF1, 1,"t3", "t2"), TRUE)
  expect_equal(between(TF1,"t1",3, "t2"), TRUE)
  expect_equal(between(TF1,"t1","t3", "t2"), TRUE)

  expect_error(between(TF1, 1, 20, 3))
  expect_error(between(TF1, "t1", "t20", "t3"))

  expect_error(between(TF1, 1, "t5", 20))
  expect_error(between(TF1, "t1", "t5", "t20"))

  expect_equal(between(TF3,"t1","t13", "t2"), FALSE)
  expect_equal(between(TF3,"t1","t5", "t2"), TRUE)
  expect_equal(between(TF3,"t3","t13", "t12"), TRUE)
})

test_that("test 'is_branch_globally_homogeneous'", {

  expect_equal(is_branch_globally_homogeneous(TF1, "t2", "t5"), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t1", "t2"), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t3", "t4"), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t4", "t3"), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t1", "t1"), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF2, "t2", "t5"), FALSE)
  expect_equal(is_branch_globally_homogeneous(TF2, "t1", "t2"), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF2, "t3", "t4"), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF2, "t4", "t3"), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF3, "t1", "t13"), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF4, "t1", "t13"), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF4, "t1", "t8"), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF4, "t8", "t1"), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF5, "t4", "t13"), FALSE)
  expect_equal(is_branch_globally_homogeneous(TF5, "t1", "t13"), FALSE)

  expect_equal(is_branch_globally_homogeneous(LTF1, "t2", "t5"), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t1", "t2"), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t3", "t4"), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t4", "t3"), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t1", "t1"), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF2, "t2", "t5"), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t1", "t2"), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t3", "t4"), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t4", "t3"), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t4", "t3"), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF3, "t1", "t13"), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF4, "t1", "t13"), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF4, "t1", "t8"), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF4, "t8", "t1"), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF5, "t4", "t13"), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF5, "t1", "t13"), FALSE)

  expect_equal(is_branch_globally_homogeneous(LTF6, "t2", "t5"), FALSE)
  expect_error(is_branch_globally_homogeneous(LTF6, "t2", "t6"), error_message_name_not_in_object())

  expect_equal(is_branch_globally_homogeneous(STF1, "t1", "t1"), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF2, 1,1), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF3, "t1", "t1"), TRUE)

  expect_equal(is_branch_globally_homogeneous(ETF1, "a", "b"), TRUE)
  expect_equal(is_branch_globally_homogeneous(ETF1, "b", "c"), FALSE)



  expect_equal(is_branch_globally_homogeneous(TF1, "t2", "t5", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t1", "t2", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t3", "t4", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t4", "t3", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t1", "t1", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF2, "t2", "t5", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF2, "t1", "t2", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF2, "t3", "t4", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF2, "t4", "t3", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF3, "t1", "t13", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF4, "t1", "t13", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF4, "t1", "t8", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF4, "t8", "t1", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF5, "t4", "t13", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(TF5, "t1", "t13", considerWeights = FALSE), FALSE)

  is_branch_globally_homogeneous(TF5, "t4", "t13", considerWeights = FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t2", "t5", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t1", "t2", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t3", "t4", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t4", "t3", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t1", "t1", considerWeights = FALSE), TRUE)


  expect_equal(is_branch_globally_homogeneous(LTF2, "t2", "t5", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t1", "t2", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t3", "t4", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t4", "t3", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF3, "t1", "t13", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF4, "t1", "t13", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF4, "t1", "t8", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF4, "t8", "t1", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF5, "t4", "t13", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF5, "t1", "t13", considerWeights = FALSE), FALSE)

  expect_equal(is_branch_globally_homogeneous(LTF6, "t2", "t5", considerWeights = FALSE), FALSE)
  expect_error(is_branch_globally_homogeneous(LTF6, "t2", "t6", considerWeights = FALSE), error_message_name_not_in_object())

  expect_equal(is_branch_globally_homogeneous(STF1, "t1", "t1", considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF2, 1, 1, considerWeights = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF3, "t1", "t1", considerWeights = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(ETF1, "a", "b", considerWeights = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(ETF1, "b", "c", considerWeights = FALSE), TRUE)



  expect_equal(is_branch_globally_homogeneous(TF1, "t2", "t5", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t1", "t2", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t3", "t4", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t4", "t3", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t1", "t1", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF2, "t2", "t5", considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(TF2, "t1", "t2", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF2, "t3", "t4", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF2, "t4", "t3", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF3, "t1", "t13", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF4, "t1", "t13", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF4, "t1", "t8", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF4, "t8", "t1", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF5, "t4", "t13", considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(TF5, "t1", "t13", considerLoops = FALSE), FALSE)

  expect_equal(is_branch_globally_homogeneous(LTF1, "t2", "t5", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t1", "t2", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t3", "t4", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t4", "t3", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t1", "t1", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF2, "t2", "t5", considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t1", "t2", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t3", "t4", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t4", "t3", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t4", "t3", considerLoops = FALSE), TRUE)


  expect_equal(is_branch_globally_homogeneous(LTF3, "t1", "t13", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF4, "t1", "t13", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF4, "t1", "t8", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF4, "t8", "t1", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF5, "t4", "t13", considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF5, "t1", "t13", considerLoops = FALSE), FALSE)

  expect_equal(is_branch_globally_homogeneous(LTF6, "t2", "t5", considerLoops = FALSE), FALSE)
  expect_error(is_branch_globally_homogeneous(LTF6, "t2", "t6", considerLoops = FALSE), error_message_name_not_in_object())

  expect_equal(is_branch_globally_homogeneous(STF1, "t1", "t1", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF2, 1,1, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF3, "t1", "t1", considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(ETF1, "a", "b", considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(ETF1, "b", "c", considerLoops = FALSE), FALSE)



  expect_equal(is_branch_globally_homogeneous(TF1, "t2", "t5", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t1", "t2", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t3", "t4", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t4", "t3", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF1, "t1", "t1", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF2, "t2", "t5", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF2, "t1", "t2", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF2, "t3", "t4", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF2, "t4", "t3", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF3, "t1", "t13", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF4, "t1", "t13", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF4, "t1", "t8", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(TF4, "t8", "t1", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(TF5, "t4", "t13", considerWeights = FALSE, considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(TF5, "t1", "t13", considerWeights = FALSE, considerLoops = FALSE), FALSE)

  expect_equal(is_branch_globally_homogeneous(LTF1, "t2", "t5", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t1", "t2", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t3", "t4", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t4", "t3", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF1, "t1", "t1", considerWeights = FALSE, considerLoops = FALSE), TRUE)


  expect_equal(is_branch_globally_homogeneous(LTF2, "t2", "t5", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t1", "t2", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t3", "t4", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF2, "t4", "t3", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF3, "t1", "t13", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF4, "t1", "t13", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF4, "t1", "t8", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(LTF4, "t8", "t1", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(LTF5, "t4", "t13", considerWeights = FALSE, considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(LTF5, "t1", "t13", considerWeights = FALSE, considerLoops = FALSE), FALSE)

  expect_equal(is_branch_globally_homogeneous(LTF6, "t2", "t5", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_error(is_branch_globally_homogeneous(LTF6, "t2", "t6", considerWeights = FALSE, considerLoops = FALSE), error_message_name_not_in_object())

  expect_equal(is_branch_globally_homogeneous(STF1, "t1", "t1", considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF2, 1, 1, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_branch_globally_homogeneous(STF3, "t1", "t1", considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_branch_globally_homogeneous(ETF1, "a", "b", considerWeights = FALSE, considerLoops = FALSE), FALSE)
  expect_equal(is_branch_globally_homogeneous(ETF1, "b", "c", considerWeights = FALSE, considerLoops = FALSE), TRUE)
})



test_that("test 'is_globally_homogeneous'", {

  expect_equal(is_globally_homogeneous(TF1), TRUE)
  expect_equal(is_globally_homogeneous(TF2), FALSE)
  expect_equal(is_globally_homogeneous(TF3), TRUE)
  expect_equal(is_globally_homogeneous(TF4), TRUE)
  expect_equal(is_globally_homogeneous(TF5), FALSE)

  expect_equal(is_globally_homogeneous(LTF1), TRUE)
  expect_equal(is_globally_homogeneous(LTF2), FALSE)
  expect_equal(is_globally_homogeneous(LTF3), FALSE)
  expect_equal(is_globally_homogeneous(LTF4), FALSE)
  expect_equal(is_globally_homogeneous(LTF5), FALSE)
  expect_equal(is_globally_homogeneous(LTF6), FALSE)

  expect_equal(is_globally_homogeneous(STF1), TRUE)
  expect_equal(is_globally_homogeneous(STF2), TRUE)
  expect_equal(is_globally_homogeneous(STF3), TRUE)

  expect_equal(is_globally_homogeneous(WTF1), TRUE)

  expect_equal(is_globally_homogeneous(ETF1), FALSE)
  expect_equal(is_globally_homogeneous(ETF2), TRUE)
  expect_equal(is_globally_homogeneous(ETF3), TRUE)

  expect_equal(is_globally_homogeneous(TF1, considerWeights = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(TF2, considerWeights = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(TF3, considerWeights = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(TF4, considerWeights = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(TF5, considerWeights = FALSE), FALSE)

  expect_equal(is_globally_homogeneous(LTF1, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(LTF2, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(LTF3, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(LTF4, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(LTF5, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(LTF6, considerWeights = FALSE), FALSE)

  expect_equal(is_globally_homogeneous(STF1, considerWeights = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(STF2, considerWeights = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(STF3, considerWeights = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(WTF1, considerWeights = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(ETF1, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(ETF2, considerWeights = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(ETF3, considerWeights = FALSE), TRUE)



  expect_equal(is_globally_homogeneous(TF1, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(TF2, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(TF3, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(TF4, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(TF5, considerLoops = FALSE), FALSE)

  expect_equal(is_globally_homogeneous(LTF1, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(LTF2, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(LTF3, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(LTF4, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(LTF5, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(LTF6, considerLoops = FALSE), FALSE)

  expect_equal(is_globally_homogeneous(STF1, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(STF2, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(STF3, considerLoops = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(ETF1, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(ETF2, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(ETF3, considerLoops = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(TF1, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(TF2, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(TF3, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(TF4, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(TF5, considerWeights = FALSE, considerLoops = FALSE), FALSE)

  expect_equal(is_globally_homogeneous(LTF1, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(LTF2, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(LTF3, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(LTF4, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(LTF5, considerWeights = FALSE, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(LTF6, considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(STF1, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(STF2, considerWeights = FALSE, considerLoops = FALSE), TRUE)
  expect_equal(is_globally_homogeneous(STF3, considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(WTF1, considerWeights = FALSE, considerLoops = FALSE), TRUE)

  expect_equal(is_globally_homogeneous(ETF1, considerWeights = FALSE, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(ETF2, considerWeights = FALSE, considerLoops = FALSE), FALSE)
  expect_equal(is_globally_homogeneous(ETF3, considerWeights = FALSE, considerLoops = FALSE), TRUE)
})



test_that("test 'is_locally_homogeneous'", {

  expect_equal(is_locally_homogeneous(TF1), TRUE)
  expect_equal(is_locally_homogeneous(TF2), FALSE)
  expect_equal(is_locally_homogeneous(TF3), FALSE)
  expect_equal(is_locally_homogeneous(TF4), FALSE)
  expect_equal(is_locally_homogeneous(TF5), TRUE)

  expect_equal(is_locally_homogeneous(LTF1), TRUE)
  expect_equal(is_locally_homogeneous(LTF2), FALSE)
  expect_equal(is_locally_homogeneous(LTF3), FALSE)
  expect_equal(is_locally_homogeneous(LTF4), FALSE)
  expect_equal(is_locally_homogeneous(LTF5), TRUE)
  expect_equal(is_locally_homogeneous(LTF6), FALSE)

  expect_equal(is_locally_homogeneous(STF1), TRUE)
  expect_equal(is_locally_homogeneous(STF2), TRUE)
  expect_equal(is_locally_homogeneous(STF3), TRUE)

  expect_equal(is_locally_homogeneous(WTF1), TRUE)

  expect_equal(is_locally_homogeneous(ETF1), FALSE)
  expect_equal(is_locally_homogeneous(ETF2), FALSE)
  expect_equal(is_locally_homogeneous(ETF3), TRUE)

})


test_that("test 'is_branch_locally_homogeneous'", {

  expect_equal(is_branch_locally_homogeneous(TF1, "t2", "t5"), TRUE)
  expect_equal(is_branch_locally_homogeneous(TF1, "t5", "t2"), TRUE)
  expect_equal(is_branch_locally_homogeneous(TF1, "t1", "t2"), TRUE)
  expect_equal(is_branch_locally_homogeneous(TF1, "t3", "t4"), TRUE)
  expect_equal(is_branch_locally_homogeneous(TF1, "t4", "t3"), TRUE)
  expect_equal(is_branch_locally_homogeneous(TF1, "t1", "t1"), TRUE)

  expect_equal(is_branch_locally_homogeneous(TF2, "t2", "t5"), FALSE)
  expect_equal(is_branch_locally_homogeneous(TF2, "t1", "t2"), TRUE)
  expect_equal(is_branch_locally_homogeneous(TF2, "t3", "t4"), TRUE)
  expect_equal(is_branch_locally_homogeneous(TF2, "t4", "t3"), TRUE)

  expect_equal(is_branch_locally_homogeneous(TF3, "t1", "t13"), TRUE)
  expect_equal(is_branch_locally_homogeneous(TF3, "t1", "t9"), FALSE)
  expect_equal(is_branch_locally_homogeneous(TF3, "t2", "t9"), TRUE)

  expect_equal(is_branch_locally_homogeneous(TF4, "t1", "t13"), FALSE)
  expect_equal(is_branch_locally_homogeneous(TF4, "t1", "t8"), FALSE)
  expect_equal(is_branch_locally_homogeneous(TF4, "t8", "t1"), TRUE)

  expect_equal(is_branch_locally_homogeneous(TF5, "t4", "t12"), TRUE)
  expect_equal(is_branch_locally_homogeneous(TF5, "t1", "t13"), TRUE)

  expect_equal(is_branch_locally_homogeneous(LTF1, "t2", "t5"), TRUE)
  expect_equal(is_branch_locally_homogeneous(LTF1, "t1", "t2"), TRUE)
  expect_equal(is_branch_locally_homogeneous(LTF1, "t3", "t4"), TRUE)
  expect_equal(is_branch_locally_homogeneous(LTF1, "t4", "t3"), TRUE)
  expect_equal(is_branch_locally_homogeneous(LTF1, "t1", "t1"), TRUE)

  expect_equal(is_branch_locally_homogeneous(LTF2, "t2", "t5"), FALSE)
  expect_equal(is_branch_locally_homogeneous(LTF2, "t1", "t2"), TRUE)
  expect_equal(is_branch_locally_homogeneous(LTF2, "t3", "t4"), TRUE)
  expect_equal(is_branch_locally_homogeneous(LTF2, "t4", "t3"), TRUE)

  expect_equal(is_branch_locally_homogeneous(LTF3, "t1", "t13"), TRUE)

  expect_equal(is_branch_locally_homogeneous(LTF4, "t1", "t13"), FALSE)
  expect_equal(is_branch_locally_homogeneous(LTF4, "t1", "t8"), FALSE)
  expect_equal(is_branch_locally_homogeneous(LTF4, "t8", "t1"), TRUE)

  expect_equal(is_branch_locally_homogeneous(LTF5, "t4", "t13"), TRUE)
  expect_equal(is_branch_locally_homogeneous(LTF5, "t1", "t13"), TRUE)
  expect_equal(is_branch_locally_homogeneous(LTF6, "t2", "t5"), FALSE)

  expect_equal(is_branch_locally_homogeneous(STF1, "t1", "t1"), TRUE)
  expect_equal(is_branch_locally_homogeneous(STF2, 1,1), TRUE)
  expect_equal(is_branch_locally_homogeneous(STF3, "t1", "t1"), TRUE)

  expect_equal(is_branch_locally_homogeneous(ETF1, "a", "b"), FALSE)
  expect_equal(is_branch_locally_homogeneous(ETF1, "b", "c"), FALSE)
})

