---
title: MPI_WIN_FREE
c_name: MPI_Win_free
lis_name: MPI_WIN_FREE
chapter: one-side
aliases: [MPI_WIN_FREE, MPI_Win_free]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_FREE

**C**
```c
int MPI_Win_free(MPI_Win *win)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | INOUT | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_free(win, ierror) BIND(C)
  TYPE(MPI_Win), INTENT(INOUT) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_FREE(WIN, IERROR)
  INTEGER WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
