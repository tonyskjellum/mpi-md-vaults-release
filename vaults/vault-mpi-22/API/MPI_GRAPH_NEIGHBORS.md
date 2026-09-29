---
title: MPI_GRAPH_NEIGHBORS
c_name: MPI_Graph_neighbors
lis_name: MPI_GRAPH_NEIGHBORS
chapter: topol
aliases: [MPI_GRAPH_NEIGHBORS, MPI_Graph_neighbors]
tags: [mpi/function, mpi/topol]
---

# MPI_GRAPH_NEIGHBORS

**C**
```c
int MPI_Graph_neighbors(MPI_Comm comm, int rank, int maxneighbors, int *neighbors)
```

**C++**
```cpp
void MPI::Graphcomm::Get_neighbors(int rank, int maxneighbors, int neighbors[]) const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with graph topology (handle) |
| `rank` | IN | rank of process in group of `comm` (integer) |
| `maxneighbors` | IN | size of array `neighbors` (integer) |
| `neighbors` | OUT | ranks of processes that are neighbors to specified process (array of integer) |

**Fortran (mpif.h)**
```fortran
MPI_GRAPH_NEIGHBORS(COMM, RANK, MAXNEIGHBORS, NEIGHBORS, IERROR)
  INTEGER COMM, RANK, MAXNEIGHBORS, NEIGHBORS(*), IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
