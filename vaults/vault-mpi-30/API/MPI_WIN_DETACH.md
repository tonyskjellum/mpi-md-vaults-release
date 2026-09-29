---
title: MPI_WIN_DETACH
c_name: MPI_Win_detach
lis_name: MPI_WIN_DETACH
chapter: one-side
aliases: [MPI_WIN_DETACH, MPI_Win_detach]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_DETACH

**C**
```c
int MPI_Win_detach(MPI_Win win, const void *base)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window object (handle) |
| `base` | IN | initial address of memory to be detached |

**Fortran 2008**
```fortran
MPI_Win_detach(win, base, ierror) BIND(C)
  TYPE(MPI_Win), INTENT(IN) :: win
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: base
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_DETACH(WIN, BASE, IERROR)
  INTEGER WIN, IERROR
  <type> BASE(*)
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
