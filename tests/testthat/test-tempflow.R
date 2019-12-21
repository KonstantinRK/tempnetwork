context("test-tempflow")

G1 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml")
G2 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml")
G3 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_small_1.gml", package = "tempnetwork"), format = "graphml")
G4 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_forrest_small_1.gml", package = "tempnetwork"), format = "graphml")
G5 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_tree_small_1.gml", package = "tempnetwork"), format = "graphml")
G6 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_lattice_small_1.gml", package = "tempnetwork"), format = "graphml")

LG1 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_directed_acyclic_loop_small_1.gml", package = "tempnetwork"), format = "graphml")
LG2 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_acyclic_loop_small_1.gml", package = "tempnetwork"), format = "graphml")
LG3 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_loop_small_1.gml", package = "tempnetwork"), format = "graphml")
LG4 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_forrest_loop_small_1.gml", package = "tempnetwork"), format = "graphml")
LG5 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_tree_loop_small_1.gml", package = "tempnetwork"), format = "graphml")
LG6 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_lattice_loop_small_1.gml", package = "tempnetwork"), format = "graphml")
LG7 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_differentlyweighted_directed_acyclic_loop_small_1.gml", package = "tempnetwork"), format = "graphml")

MG1 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_multipleedges_1.gml", package = "tempnetwork"), format = "graphml")
MG2 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_multipleedges_cycle_1.gml", package = "tempnetwork"), format = "graphml")
MG3 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_multipleedges_loop_1.gml", package = "tempnetwork"), format = "graphml")
MG4 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_multipleedges_cycle_loop_1.gml", package = "tempnetwork"), format = "graphml")


SG1 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_1.gml", package = "tempnetwork"), format = "graphml")
SG2 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_noname_1.gml", package = "tempnetwork"), format = "graphml")
SG3 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_singelton_loop_1.gml", package = "tempnetwork"), format = "graphml")

UG1 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_undirected_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml")
UG2 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_undirected_small_1.gml", package = "tempnetwork"), format = "graphml")

WG1 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_negativeweighted_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml")
WG2 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_partialweighted_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml")
WG3 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_stringweighted_directed_acyclic_small_1.gml", package = "tempnetwork"), format = "graphml")

NG1 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_acyclic_duplicatename_small_1.gml", package = "tempnetwork"), format = "graphml")
NG2 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_acyclic_numname_small_1.gml", package = "tempnetwork"), format = "graphml")
NG3 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_weighted_directed_acyclic_idname_small_1.gml", package = "tempnetwork"), format = "graphml")

EG1 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_2_6.gml", package = "tempnetwork"), format = "graphml")
EG2 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_4_1.gml", package = "tempnetwork"), format = "graphml")
EG3 <- igraph::read.graph(system.file("inst","testdata","tempflow","tempflow_example_4_2.gml", package = "tempnetwork"), format = "graphml")


test_that("test 'tempflow'", {

  expect_error(tempflow("G1"), error_message_not_igraph())
  expect_error(tempflow(list(1,2,3)), error_message_not_igraph())

  expect_equal(class(tempflow(G1)), "tempflow")
  expect_equal(class(tempflow(G2)), "tempflow")
  expect_error(tempflow(G3), error_message_not_dag())
  expect_equal(class(tempflow(G4)), "tempflow")
  expect_equal(class(tempflow(G5)), "tempflow")
  expect_equal(class(tempflow(G6, setDefaultValues = TRUE)), "tempflow")
  expect_error(tempflow(G6), error_message_weights_not_numeric())

  expect_equal(class(tempflow(LG1)), "tempflow")
  expect_equal(class(tempflow(LG2)), "tempflow")
  expect_error(tempflow(LG3), error_message_not_dag())
  expect_equal(class(tempflow(LG4)), "tempflow")
  expect_equal(class(tempflow(LG5)), "tempflow")
  expect_equal(class(tempflow(LG6, setDefaultValues =  TRUE)), "tempflow")
  expect_error(tempflow(LG6), error_message_weights_not_numeric())
  expect_equal(class(tempflow(LG7)), "tempflow")

  expect_error(tempflow(MG1), error_message_not_simple())
  expect_error(tempflow(MG2), error_message_not_dag())
  expect_error(tempflow(MG3), error_message_not_simple())
  expect_error(tempflow(MG4), error_message_not_dag())

  expect_equal(class(tempflow(SG1)), "tempflow")
  expect_equal(class(tempflow(SG2)), "tempflow")
  expect_equal(class(tempflow(SG3)), "tempflow")

  expect_error(tempflow(UG1), error_message_not_dag())
  expect_error(tempflow(UG2), error_message_not_dag())

  expect_error(tempflow(WG1), error_message_weights_not_nonnegative())
  expect_equal(igraph::edge_attr(G(tempflow(WG2, setDefaultValues = TRUE)), name="weight"), c(1,1,1,1,1))
  expect_error(tempflow(WG2), error_message_weights_not_numeric())
  expect_error(tempflow(WG2), error_message_weights_not_numeric())
  expect_error(tempflow(WG3), error_message_weights_not_numeric())

  expect_error(tempflow(NG1), error_message_names_not_unique())
  #expect_equal(class(tempflow(NG2)), "templow")
  #expect_error(tempflow(NG3), error_message_names_not_strings())

  expect_equal(class(tempflow(EG1)), "tempflow")
  expect_equal(class(tempflow(EG2)), "tempflow")
  expect_equal(class(tempflow(EG3)), "tempflow")

})


