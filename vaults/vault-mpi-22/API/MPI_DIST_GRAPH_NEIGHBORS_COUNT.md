---
title: MPI_DIST_GRAPH_NEIGHBORS_COUNT
c_name: MPI_Dist_graph_neighbors_count
lis_name: MPI_DIST_GRAPH_NEIGHBORS_COUNT
chapter: topol
aliases: [MPI_DIST_GRAPH_NEIGHBORS_COUNT, MPI_Dist_graph_neighbors_count]
tags: [mpi/function, mpi/topol]
---

# MPI_DIST_GRAPH_NEIGHBORS_COUNT

**C**
```c
int MPI_Dist_graph_neighbors_count(MPI_Comm comm, int *indegree, int *outdegree, int *weighted)
```

**C++**
```cpp
void MPI::Distgraphcomm::Get_dist_neighbors_count(int rank, int indegree[], int outdegree[], bool& weighted) const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with distributed graph topology (handle) |
| `indegree` | OUT | number of edges into this process (non-negative integer) |
| `outdegree` | OUT | number of edges out of this process (non-negative integer) |
| `weighted` | OUT | `false` if `MPI_UNWEIGHTED` was supplied during creation, `true` otherwise (logical) |

**Fortran (mpif.h)**
```fortran
MPI_DIST_GRAPH_NEIGHBORS_COUNT(COMM, INDEGREE, OUTDEGREE, WEIGHTED, IERROR)
  INTEGER COMM, INDEGREE, OUTDEGREE, IERROR
  LOGICAL WEIGHTED
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
