---
title: MPI_DIST_GRAPH_CREATE
c_name: MPI_Dist_graph_create
lis_name: MPI_DIST_GRAPH_CREATE
chapter: topol
aliases: [MPI_DIST_GRAPH_CREATE, MPI_Dist_graph_create]
tags: [mpi/function, mpi/topol]
---

# MPI_DIST_GRAPH_CREATE

**C**
```c
int MPI_Dist_graph_create(MPI_Comm comm_old, int n, const int sources[], const int degrees[], const int destinations[], const int weights[], MPI_Info info, int reorder, MPI_Comm *comm_dist_graph)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm_old` | IN | input communicator (handle) |
| `n` | IN | number of source nodes for which this MPI process specifies edges (non-negative integer) |
| `sources` | IN | array containing the `n` source nodes for which this MPI process specifies edges (array of non-negative integers) |
| `degrees` | IN | array specifying the number of destinations for each source node in the source node array (array of non-negative integers) |
| `destinations` | IN | destination nodes for the source nodes in the source node array (array of non-negative integers) |
| `weights` | IN | weights for source to destination edges (array of non-negative integers) |
| `info` | IN | hints on optimization and interpretation of weights (handle) |
| `reorder` | IN | ranks may be reordered (`true`) or not (`false`) (logical) |
| `comm_dist_graph` | OUT | new communicator with associated distributed graph topology (handle) |

**Fortran 2008**
```fortran
MPI_Dist_graph_create(comm_old, n, sources, degrees, destinations, weights, info, reorder, comm_dist_graph, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm_old
  INTEGER, INTENT(IN) :: n, sources(n), degrees(n), destinations(*), weights(*)
  TYPE(MPI_Info), INTENT(IN) :: info
  LOGICAL, INTENT(IN) :: reorder
  TYPE(MPI_Comm), INTENT(OUT) :: comm_dist_graph
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_DIST_GRAPH_CREATE(COMM_OLD, N, SOURCES, DEGREES, DESTINATIONS, WEIGHTS, INFO, REORDER, COMM_DIST_GRAPH, IERROR)
  INTEGER COMM_OLD, N, SOURCES(*), DEGREES(*), DESTINATIONS(*), WEIGHTS(*), INFO, COMM_DIST_GRAPH, IERROR
  LOGICAL REORDER
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
