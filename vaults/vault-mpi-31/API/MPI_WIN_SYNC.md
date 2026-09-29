---
title: MPI_WIN_SYNC
c_name: MPI_Win_sync
lis_name: MPI_WIN_SYNC
chapter: one-side
aliases: [MPI_WIN_SYNC, MPI_Win_sync]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_SYNC

**C**
```c
int MPI_Win_sync(MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_sync(win, ierror)
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_SYNC(WIN, IERROR)
  INTEGER WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
