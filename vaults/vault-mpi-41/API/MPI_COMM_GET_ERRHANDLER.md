---
title: MPI_COMM_GET_ERRHANDLER
c_name: MPI_Comm_get_errhandler
lis_name: MPI_COMM_GET_ERRHANDLER
chapter: inquiry
aliases: [MPI_COMM_GET_ERRHANDLER, MPI_Comm_get_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_COMM_GET_ERRHANDLER

**C**
```c
int MPI_Comm_get_errhandler(MPI_Comm comm, MPI_Errhandler *errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `errhandler` | OUT | error handler currently associated with communicator (handle) |

**Fortran 2008**
```fortran
MPI_Comm_get_errhandler(comm, errhandler, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Errhandler), INTENT(OUT) :: errhandler
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_GET_ERRHANDLER(COMM, ERRHANDLER, IERROR)
  INTEGER COMM, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
