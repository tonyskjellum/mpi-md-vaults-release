---
title: MPI_WIN_UNLOCK
c_name: MPI_Win_unlock
lis_name: MPI_WIN_UNLOCK
chapter: one-side
aliases: [MPI_WIN_UNLOCK, MPI_Win_unlock]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_UNLOCK

**C**
```c
int MPI_Win_unlock(int rank, MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `rank` | IN | rank of target MPI process in the group of the window `win` (nonnegative integer) |
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_unlock(rank, win, ierror)
  INTEGER, INTENT(IN) :: rank
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_UNLOCK(RANK, WIN, IERROR)
  INTEGER RANK, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
