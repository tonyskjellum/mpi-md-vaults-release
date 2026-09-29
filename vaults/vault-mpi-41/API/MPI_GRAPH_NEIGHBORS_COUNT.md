---
title: MPI_GRAPH_NEIGHBORS_COUNT
c_name: MPI_Graph_neighbors_count
lis_name: MPI_GRAPH_NEIGHBORS_COUNT
chapter: topol
aliases: [MPI_GRAPH_NEIGHBORS_COUNT, MPI_Graph_neighbors_count]
tags: [mpi/function, mpi/topol]
---

# MPI_GRAPH_NEIGHBORS_COUNT

**C**
```c
int MPI_Graph_neighbors_count(MPI_Comm comm, int rank, int *nneighbors)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with associated graph topology (handle) |
| `rank` | IN | rank of MPI process in group of `comm` (integer) |
| `nneighbors` | OUT | number of neighbors of specified MPI process (integer) |

**Fortran 2008**
```fortran
MPI_Graph_neighbors_count(comm, rank, nneighbors, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(IN) :: rank
  INTEGER, INTENT(OUT) :: nneighbors
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GRAPH_NEIGHBORS_COUNT(COMM, RANK, NNEIGHBORS, IERROR)
  INTEGER COMM, RANK, NNEIGHBORS, IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
