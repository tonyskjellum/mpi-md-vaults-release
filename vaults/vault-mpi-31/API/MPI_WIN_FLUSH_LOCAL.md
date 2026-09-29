---
title: MPI_WIN_FLUSH_LOCAL
c_name: MPI_Win_flush_local
lis_name: MPI_WIN_FLUSH_LOCAL
chapter: one-side
aliases: [MPI_WIN_FLUSH_LOCAL, MPI_Win_flush_local]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_FLUSH_LOCAL

**C**
```c
int MPI_Win_flush_local(int rank, MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `rank` | IN | rank of target window (non-negative integer) |
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_flush_local(rank, win, ierror)
  INTEGER, INTENT(IN) :: rank
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_FLUSH_LOCAL(RANK, WIN, IERROR)
  INTEGER RANK, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
