---
title: MPI_WIN_LOCK_ALL
c_name: MPI_Win_lock_all
lis_name: MPI_WIN_LOCK_ALL
chapter: one-side
aliases: [MPI_WIN_LOCK_ALL, MPI_Win_lock_all]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_LOCK_ALL

**C**
```c
int MPI_Win_lock_all(int assert, MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `assert` | IN | program assertion (integer) |
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_lock_all(assert, win, ierror) BIND(C)
  INTEGER, INTENT(IN) :: assert
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_LOCK_ALL(ASSERT, WIN, IERROR)
  INTEGER ASSERT, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
