---
title: MPI_ERRHANDLER_GET
c_name: MPI_Errhandler_get
lis_name: MPI_ERRHANDLER_GET
chapter: deprecated
aliases: [MPI_ERRHANDLER_GET, MPI_Errhandler_get]
tags: [mpi/function, mpi/deprecated]
---

# MPI_ERRHANDLER_GET

**C**
```c
int MPI_Errhandler_get(MPI_Comm comm, MPI_Errhandler *errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator to get the error handler from (handle) |
| `errhandler` | OUT | MPI error handler currently associated with communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_ERRHANDLER_GET(COMM, ERRHANDLER, IERROR)
  INTEGER COMM, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[deprecated]] for the normative text.
