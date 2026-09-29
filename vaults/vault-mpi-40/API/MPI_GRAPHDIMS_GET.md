---
title: MPI_GRAPHDIMS_GET
c_name: MPI_Graphdims_get
lis_name: MPI_GRAPHDIMS_GET
chapter: topol
aliases: [MPI_GRAPHDIMS_GET, MPI_Graphdims_get]
tags: [mpi/function, mpi/topol]
---

# MPI_GRAPHDIMS_GET

**C**
```c
int MPI_Graphdims_get(MPI_Comm comm, int *nnodes, int *nedges)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator for group with graph structure (handle) |
| `nnodes` | OUT | number of nodes in graph (same as number of processes in the group) (integer) |
| `nedges` | OUT | number of edges in graph (integer) |

**Fortran 2008**
```fortran
MPI_Graphdims_get(comm, nnodes, nedges, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(OUT) :: nnodes, nedges
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GRAPHDIMS_GET(COMM, NNODES, NEDGES, IERROR)
  INTEGER COMM, NNODES, NEDGES, IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
