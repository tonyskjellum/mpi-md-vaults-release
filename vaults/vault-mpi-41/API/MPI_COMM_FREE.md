---
title: MPI_COMM_FREE
c_name: MPI_Comm_free
lis_name: MPI_COMM_FREE
chapter: context
aliases: [MPI_COMM_FREE, MPI_Comm_free]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_FREE

**C**
```c
int MPI_Comm_free(MPI_Comm *comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | INOUT | communicator to be destroyed (handle) |

**Fortran 2008**
```fortran
MPI_Comm_free(comm, ierror)
  TYPE(MPI_Comm), INTENT(INOUT) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_FREE(COMM, IERROR)
  INTEGER COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
