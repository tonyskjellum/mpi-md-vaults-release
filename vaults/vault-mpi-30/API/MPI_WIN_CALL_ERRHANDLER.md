---
title: MPI_WIN_CALL_ERRHANDLER
c_name: MPI_Win_call_errhandler
lis_name: MPI_WIN_CALL_ERRHANDLER
chapter: inquiry
aliases: [MPI_WIN_CALL_ERRHANDLER, MPI_Win_call_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_WIN_CALL_ERRHANDLER

**C**
```c
int MPI_Win_call_errhandler(MPI_Win win, int errorcode)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window with error handler (handle) |
| `errorcode` | IN | error code (integer) |

**Fortran 2008**
```fortran
MPI_Win_call_errhandler(win, errorcode, ierror) BIND(C)
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, INTENT(IN) :: errorcode
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_CALL_ERRHANDLER(WIN, ERRORCODE, IERROR)
  INTEGER WIN, ERRORCODE, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
