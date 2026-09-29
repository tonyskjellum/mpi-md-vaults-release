---
title: MPI_ERRHANDLER_FREE
c_name: MPI_Errhandler_free
lis_name: MPI_ERRHANDLER_FREE
chapter: inquiry
aliases: [MPI_ERRHANDLER_FREE, MPI_Errhandler_free]
tags: [mpi/function, mpi/inquiry]
---

# MPI_ERRHANDLER_FREE

**C**
```c
int MPI_Errhandler_free(MPI_Errhandler *errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `errhandler` | INOUT | MPI error handler (handle) |

**Fortran (mpif.h)**
```fortran
MPI_ERRHANDLER_FREE(ERRHANDLER, IERROR)
  INTEGER ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
