---
title: MPI_WIN_FLUSH_LOCAL_ALL
c_name: MPI_Win_flush_local_all
lis_name: MPI_WIN_FLUSH_LOCAL_ALL
chapter: one-side
aliases: [MPI_WIN_FLUSH_LOCAL_ALL, MPI_Win_flush_local_all]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_FLUSH_LOCAL_ALL

**C**
```c
int MPI_Win_flush_local_all(MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_flush_local_all(win, ierror) BIND(C)
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_FLUSH_LOCAL_ALL(WIN, IERROR)
  INTEGER WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
