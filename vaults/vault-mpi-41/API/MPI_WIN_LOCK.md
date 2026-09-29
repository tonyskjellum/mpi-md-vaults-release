---
title: MPI_WIN_LOCK
c_name: MPI_Win_lock
lis_name: MPI_WIN_LOCK
chapter: one-side
aliases: [MPI_WIN_LOCK, MPI_Win_lock]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_LOCK

**C**
```c
int MPI_Win_lock(int lock_type, int rank, int assert, MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `lock_type` | IN | either `MPI_LOCK_EXCLUSIVE` or `MPI_LOCK_SHARED` (state) |
| `rank` | IN | rank of locked window (non-negative integer) |
| `assert` | IN | program assertion (integer) |
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_lock(lock_type, rank, assert, win, ierror)
  INTEGER, INTENT(IN) :: lock_type, rank, assert
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_LOCK(LOCK_TYPE, RANK, ASSERT, WIN, IERROR)
  INTEGER LOCK_TYPE, RANK, ASSERT, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
