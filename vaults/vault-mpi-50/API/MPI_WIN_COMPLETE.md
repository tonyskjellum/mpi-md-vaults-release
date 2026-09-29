---
title: MPI_WIN_COMPLETE
c_name: MPI_Win_complete
lis_name: MPI_WIN_COMPLETE
chapter: one-side
aliases: [MPI_WIN_COMPLETE, MPI_Win_complete]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_COMPLETE

**C**
```c
int MPI_Win_complete(MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_complete(win, ierror)
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_COMPLETE(WIN, IERROR)
  INTEGER WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
