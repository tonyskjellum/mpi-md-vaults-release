---
title: MPI_DIST_GRAPH_NEIGHBORS
c_name: MPI_Dist_graph_neighbors
lis_name: MPI_DIST_GRAPH_NEIGHBORS
chapter: topol
aliases: [MPI_DIST_GRAPH_NEIGHBORS, MPI_Dist_graph_neighbors]
tags: [mpi/function, mpi/topol]
---

# MPI_DIST_GRAPH_NEIGHBORS

**C**
```c
int MPI_Dist_graph_neighbors(MPI_Comm comm, int maxindegree, int sources[], int sourceweights[], int maxoutdegree, int destinations[], int destweights[])
```

**C++**
```cpp
void MPI::Distgraphcomm::Get_dist_neighbors(int maxindegree, int sources[], int sourceweights[], int maxoutdegree, int destinations[], int destweights[])
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with distributed graph topology (handle) |
| `maxindegree` | IN | size of sources and sourceweights arrays (non-negative integer) |
| `sources` | OUT | processes for which the calling process is a destination (array of non-negative integers) |
| `sourceweights` | OUT | weights of the edges into the calling process (array of non-negative integers) |
| `maxoutdegree` | IN | size of destinations and destweights arrays (non-negative integer) |
| `destinations` | OUT | processes for which the calling process is a source (array of non-negative integers) |
| `destweights` | OUT | weights of the edges out of the calling process (array of non-negative integers) |

**Fortran (mpif.h)**
```fortran
MPI_DIST_GRAPH_NEIGHBORS(COMM, MAXINDEGREE, SOURCES, SOURCEWEIGHTS, MAXOUTDEGREE, DESTINATIONS, DESTWEIGHTS, IERROR)
  INTEGER COMM, MAXINDEGREE, SOURCES(*), SOURCEWEIGHTS(*), MAXOUTDEGREE,
  DESTINATIONS(*), DESTWEIGHTS(*), IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
