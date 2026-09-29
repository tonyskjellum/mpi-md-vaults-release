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
int MPI_Comm_create_errhandler(MPI_Comm_errhandler_function *function, MPI_Errhandler *errhandler)
typedef void MPI_Comm_errhandler_function(MPI_Comm *, int *, ...);
```

**C++**
```cpp
static MPI::Errhandler MPI::Comm::Create_errhandler(MPI::Comm::Errhandler_function* function)
typedef void MPI::Comm::Errhandler_function(MPI::Comm &, int *, ... );
```

| Parameter | Intent | Description |
|---|---|---|
| `function` | IN | user defined error handling procedure (function) |
| `errhandler` | OUT | MPI error handler (handle) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_CREATE_ERRHANDLER(FUNCTION, ERRHANDLER, IERROR)
  EXTERNAL FUNCTION
  INTEGER ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
