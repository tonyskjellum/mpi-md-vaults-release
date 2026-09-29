---
title: MPI_DIST_GRAPH_CREATE_ADJACENT
c_name: MPI_Dist_graph_create_adjacent
lis_name: MPI_DIST_GRAPH_CREATE_ADJACENT
chapter: topol
aliases: [MPI_DIST_GRAPH_CREATE_ADJACENT, MPI_Dist_graph_create_adjacent]
tags: [mpi/function, mpi/topol]
---

# MPI_DIST_GRAPH_CREATE_ADJACENT

**C**
```c
int MPI_Dist_graph_create_adjacent(MPI_Comm comm_old, int indegree, const int sources[], const int sourceweights[], int outdegree, const int destinations[], const int destweights[], MPI_Info info, int reorder, MPI_Comm *comm_dist_graph)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm_old` | IN | input communicator (handle) |
| `indegree` | IN | size of `sources` and `sourceweights` arrays (nonnegative integer) |
| `sources` | IN | ranks of MPI processes for which the calling process is a destination (array of nonnegative integers) |
| `sourceweights` | IN | weights of the edges into the calling MPI process (array of nonnegative integers) |
| `outdegree` | IN | size of `destinations` and `destweights` arrays (nonnegative integer) |
| `destinations` | IN | ranks of MPI processes for which the calling MPI process is a source (array of nonnegative integers) |
| `destweights` | IN | weights of the edges out of the calling MPI process (array of nonnegative integers) |
| `info` | IN | hints on optimization and interpretation of weights (handle) |
| `reorder` | IN | ranks may be reordered (`true`) or not (`false`) (logical) |
| `comm_dist_graph` | OUT | new communicator with associated distributed graph topology (handle) |

**Fortran 2008**
```fortran
MPI_Dist_graph_create_adjacent(comm_old, indegree, sources, sourceweights, outdegree, destinations, destweights, info, reorder, comm_dist_graph, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm_old
  INTEGER, INTENT(IN) :: indegree, sources(indegree), sourceweights(*), outdegree, destinations(outdegree), destweights(*)
  TYPE(MPI_Info), INTENT(IN) :: info
  LOGICAL, INTENT(IN) :: reorder
  TYPE(MPI_Comm), INTENT(OUT) :: comm_dist_graph
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_DIST_GRAPH_CREATE_ADJACENT(COMM_OLD, INDEGREE, SOURCES, SOURCEWEIGHTS, OUTDEGREE, DESTINATIONS, DESTWEIGHTS, INFO, REORDER, COMM_DIST_GRAPH, IERROR)
  INTEGER COMM_OLD, INDEGREE, SOURCES(*), SOURCEWEIGHTS(*), OUTDEGREE, DESTINATIONS(*), DESTWEIGHTS(*), INFO, COMM_DIST_GRAPH, IERROR
  LOGICAL REORDER
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
