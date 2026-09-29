---
title: MPI_COMM_RANK
c_name: MPI_Comm_rank
lis_name: MPI_COMM_RANK
chapter: context
aliases: [MPI_COMM_RANK, MPI_Comm_rank]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_RANK

**C**
```c
int MPI_Comm_rank(MPI_Comm comm, int *rank)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `rank` | OUT | rank of the calling process in group of ` comm` (integer) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_RANK(COMM, RANK, IERROR)
  INTEGER COMM, RANK, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
