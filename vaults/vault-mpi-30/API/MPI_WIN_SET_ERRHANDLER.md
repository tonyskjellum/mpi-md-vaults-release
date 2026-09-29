---
title: MPI_WIN_SET_ERRHANDLER
c_name: MPI_Win_set_errhandler
lis_name: MPI_WIN_SET_ERRHANDLER
chapter: inquiry
aliases: [MPI_WIN_SET_ERRHANDLER, MPI_Win_set_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_WIN_SET_ERRHANDLER

**C**
```c
int MPI_Win_set_errhandler(MPI_Win win, MPI_Errhandler errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | INOUT | window (handle) |
| `errhandler` | IN | new error handler for window (handle) |

**Fortran 2008**
```fortran
MPI_Win_set_errhandler(win, errhandler, ierror) BIND(C)
  TYPE(MPI_Win), INTENT(IN) :: win
  TYPE(MPI_Errhandler), INTENT(IN) :: errhandler
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_SET_ERRHANDLER(WIN, ERRHANDLER, IERROR)
  INTEGER WIN, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
