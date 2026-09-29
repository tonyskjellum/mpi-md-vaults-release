---
title: MPI_WIN_CREATE_ERRHANDLER
c_name: MPI_Win_create_errhandler
lis_name: MPI_WIN_CREATE_ERRHANDLER
chapter: inquiry
aliases: [MPI_WIN_CREATE_ERRHANDLER, MPI_Win_create_errhandler, MPI_Win_errhandler_function]
tags: [mpi/function, mpi/inquiry]
---

# MPI_WIN_CREATE_ERRHANDLER

**C**
```c
int MPI_Win_create_errhandler(MPI_Win_errhandler_function *win_errhandler_fn, MPI_Errhandler *errhandler)
typedef void MPI_Win_errhandler_function(MPI_Win *win, int *error_code, ...);
```

| Parameter | Intent | Description |
|---|---|---|
| `win_errhandler_fn` | IN | user defined error handling procedure (function) |
| `errhandler` | OUT | MPI error handler (handle) |

**Fortran 2008**
```fortran
MPI_Win_create_errhandler(win_errhandler_fn, errhandler, ierror)
  PROCEDURE(MPI_Win_errhandler_function) :: win_errhandler_fn
  TYPE(MPI_Errhandler), INTENT(OUT) :: errhandler
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_CREATE_ERRHANDLER(WIN_ERRHANDLER_FN, ERRHANDLER, IERROR)
  EXTERNAL WIN_ERRHANDLER_FN
  INTEGER ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
