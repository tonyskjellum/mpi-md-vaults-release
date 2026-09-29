---
title: MPI_ERRHANDLER_SET
c_name: MPI_Errhandler_set
lis_name: MPI_ERRHANDLER_SET
chapter: inquiry
aliases: [MPI_ERRHANDLER_SET, MPI_Errhandler_set]
tags: [mpi/function, mpi/inquiry]
---

# MPI_ERRHANDLER_SET

**C**
```c
int MPI_Errhandler_set(MPI_Comm comm, MPI_Errhandler errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator to set the error handler for (handle) |
| `errhandler` | IN | new MPI error handler for communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_ERRHANDLER_SET(COMM, ERRHANDLER, IERROR)
  INTEGER COMM, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
