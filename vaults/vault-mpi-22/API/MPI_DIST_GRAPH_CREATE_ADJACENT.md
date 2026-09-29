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
int MPI_Dist_graph_create_adjacent(MPI_Comm comm_old, int indegree, int sources[], int sourceweights[], int outdegree, int destinations[], int destweights[], MPI_Info info, int reorder, MPI_Comm *comm_dist_graph)
```

**C++**
```cpp
MPI::Distgraphcomm MPI::Intracomm::Dist_graph_create_adjacent(int indegree, const int sources[], const int sourceweights[], int outdegree, const int destinations[], const int destweights[], const MPI::Info& info, bool reorder) const
MPI::Distgraphcomm MPI::Intracomm::Dist_graph_create_adjacent(int indegree, const int sources[], int outdegree, const int destinations[], const MPI::Info& info, bool reorder) const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm_old` | IN | input communicator (handle) |
| `indegree` | IN | size of `sources` and `sourceweights` arrays (non-negative integer) |
| `sources` | IN | ranks of processes for which the calling process is a destination (array of non-negative integers) |
| `sourceweights` | IN | weights of the edges into the calling process (array of non-negative integers) |
| `outdegree` | IN | size of `destinations` and `destweights` arrays (non-negative integer) |
| `destinations` | IN | ranks of processes for which the calling process is a source (array of non-negative integers) |
| `destweights` | IN | weights of the edges out of the calling process (array of non-negative integers) |
| `info` | IN | hints on optimization and interpretation of weights (handle) |
| `reorder` | IN | the ranks may be reordered (`true`) or not (`false`) (logical) |
| `comm_dist_graph` | OUT | communicator with distributed graph topology (handle) |

**Fortran (mpif.h)**
```fortran
MPI_DIST_GRAPH_CREATE_ADJACENT(COMM_OLD, INDEGREE, SOURCES, SOURCEWEIGHTS, OUTDEGREE, DESTINATIONS, DESTWEIGHTS, INFO, REORDER, COMM_DIST_GRAPH, IERROR)
  INTEGER COMM_OLD, INDEGREE, SOURCES(*), SOURCEWEIGHTS(*), OUTDEGREE,
  DESTINATIONS(*), DESTWEIGHTS(*), INFO, COMM_DIST_GRAPH, IERROR
  LOGICAL REORDER
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
