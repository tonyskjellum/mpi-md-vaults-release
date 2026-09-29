---
title: MPI_ERRHANDLER_CREATE
c_name: MPI_Errhandler_create
lis_name: MPI_ERRHANDLER_CREATE
chapter: deprecated
aliases: [MPI_ERRHANDLER_CREATE, MPI_Errhandler_create]
tags: [mpi/function, mpi/deprecated]
---

# MPI_ERRHANDLER_CREATE

**C**
```c
int MPI_Errhandler_create(MPI_Handler_function *function, MPI_Errhandler *errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `function` | IN | user defined error handling procedure |
| `errhandler` | OUT | MPI error handler (handle) |

**Fortran (mpif.h)**
```fortran
MPI_ERRHANDLER_CREATE(FUNCTION, ERRHANDLER, IERROR)
  EXTERNAL FUNCTION
  INTEGER ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[deprecated]] for the normative text.
