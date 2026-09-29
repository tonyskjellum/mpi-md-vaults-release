---
title: MPI_COMM_IDUP
c_name: MPI_Comm_idup
lis_name: MPI_COMM_IDUP
chapter: context
aliases: [MPI_COMM_IDUP, MPI_Comm_idup]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_IDUP

**C**
```c
int MPI_Comm_idup(MPI_Comm comm, MPI_Comm *newcomm, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `newcomm` | OUT | copy of `comm` (handle) |
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Comm_idup(comm, newcomm, request, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Comm), INTENT(OUT), ASYNCHRONOUS :: newcomm
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_IDUP(COMM, NEWCOMM, REQUEST, IERROR)
  INTEGER COMM, NEWCOMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
