---
title: MPI_BARRIER
c_name: MPI_Barrier
lis_name: MPI_BARRIER
chapter: coll
aliases: [MPI_BARRIER, MPI_Barrier]
tags: [mpi/function, mpi/coll]
---

# MPI_BARRIER

**C**
```c
int MPI_Barrier(MPI_Comm comm )
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_BARRIER(COMM, IERROR)
  INTEGER COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.
