---
title: MPI_WIN_CREATE_ERRHANDLER
c_name: MPI_Win_create_errhandler
lis_name: MPI_WIN_CREATE_ERRHANDLER
chapter: inquiry
aliases: [MPI_WIN_CREATE_ERRHANDLER, MPI_Win_create_errhandler, MPI_Win_errhandler_fn]
tags: [mpi/function, mpi/inquiry]
---

# MPI_WIN_CREATE_ERRHANDLER

**C**
```c
int MPI_Win_create_errhandler(MPI_Win_errhandler_fn *function, MPI_Errhandler *errhandler)
typedef void MPI_Win_errhandler_fn(MPI_Win *, int *, ...);
```

**C++**
```cpp
static MPI::Errhandler MPI::Win::Create_errhandler(MPI::Win::Errhandler_fn* function)
typedef void MPI::Win::Errhandler_fn(MPI::Win &, int *, ... );
```

| Parameter | Intent | Description |
|---|---|---|
| `function` | IN | user defined error handling procedure (function) |
| `errhandler` | OUT | MPI error handler (handle) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_CREATE_ERRHANDLER(FUNCTION, ERRHANDLER, IERROR)
  EXTERNAL FUNCTION
  INTEGER ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
