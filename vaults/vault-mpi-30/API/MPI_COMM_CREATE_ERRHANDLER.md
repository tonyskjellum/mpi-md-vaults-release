---
title: MPI_COMM_CREATE_ERRHANDLER
c_name: MPI_Comm_create_errhandler
lis_name: MPI_COMM_CREATE_ERRHANDLER
chapter: inquiry
aliases: [MPI_COMM_CREATE_ERRHANDLER, MPI_Comm_create_errhandler, MPI_Comm_errhandler_function]
tags: [mpi/function, mpi/inquiry]
---

# MPI_COMM_CREATE_ERRHANDLER

**C**
```c
int MPI_Comm_create_errhandler(MPI_Comm_errhandler_function *comm_errhandler_fn, MPI_Errhandler *errhandler)
typedef void MPI_Comm_errhandler_function(MPI_Comm *, int *, ...);
```

| Parameter | Intent | Description |
|---|---|---|
| `comm_errhandler_fn` | IN | user defined error handling procedure (function) |
| `errhandler` | OUT | MPI error handler (handle) |

**Fortran 2008**
```fortran
MPI_Comm_create_errhandler(comm_errhandler_fn, errhandler, ierror) BIND(C)
  PROCEDURE(MPI_Comm_errhandler_function) :: comm_errhandler_fn
  TYPE(MPI_Errhandler), INTENT(OUT) :: errhandler
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_CREATE_ERRHANDLER(COMM_ERRHANDLER_FN, ERRHANDLER, IERROR)
  EXTERNAL COMM_ERRHANDLER_FN
  INTEGER ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
