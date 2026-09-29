---
title: MPI_WIN_FLUSH_ALL
c_name: MPI_Win_flush_all
lis_name: MPI_WIN_FLUSH_ALL
chapter: one-side
aliases: [MPI_WIN_FLUSH_ALL, MPI_Win_flush_all]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_FLUSH_ALL

**C**
```c
int MPI_Win_flush_all(MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_flush_all(win, ierror)
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_FLUSH_ALL(WIN, IERROR)
  INTEGER WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
