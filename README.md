# DirectedGraph_SML

A directed graph can be represented by a list of pairs. Every edge is represented by a pair of two
elements and the whole graph by a list of edges. For example, the following graph
1
3
4
2
can be represented as [(1, 2), (2, 3), (3, 1), (2, 4)]. (You may assume that nodes are
labelled using non-zero natural numbers.)
Define a function path which takes such a graph and two nodes as input and checks whether second
node is reachable from the first.
- path;
val it = fn : (int * int) list * int * int -> bool
- path([(1,2), (2,3), (3,1), (2,4)], 3, 4);
val it = true : bool
- path([(1,2), (2,3), (3,1), (2,4)], 4, 3);
val it = false : bool
