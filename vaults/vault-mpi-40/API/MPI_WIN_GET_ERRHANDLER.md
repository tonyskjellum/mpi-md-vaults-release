---
title: MPI_WIN_GET_ERRHANDLER
c_name: MPI_Win_get_errhandler
lis_name: MPI_WIN_GET_ERRHANDLER
chapter: inquiry
aliases: [MPI_WIN_GET_ERRHANDLER, MPI_Win_get_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_WIN_GET_ERRHANDLER

**C**
```c
int MPI_Win_get_errhandler(MPI_Win win, MPI_Errhandler *errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window object (handle) |
| `errhandler` | OUT | error handler currently associated with window (handle) |

**Fortran 2008**
```fortran
MPI_Win_get_errhandler(win, errhandler, ierror)
  TYPE(MPI_Win), INTENT(IN) :: win
  TYPE(MPI_Errhandler), INTENT(OUT) :: errhandler
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_GET_ERRHANDLER(WIN, ERRHANDLER, IERROR)
  INTEGER WIN, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
