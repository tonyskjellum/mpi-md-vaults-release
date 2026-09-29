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

**C++**
```cpp
void MPI::Win::Lock(int lock_type, int rank, int assert) const
```

| Parameter | Intent | Description |
|---|---|---|
| `lock_type` | IN | either MPI_LOCK_EXCLUSIVE or MPI_LOCK_SHARED (state) |
| `rank` | IN | rank of locked window (nonnegative integer) |
| `assert` | IN | program assertion (integer) |
| `win` | IN | window object (handle) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_LOCK(LOCK_TYPE, RANK, ASSERT, WIN, IERROR)
  INTEGER LOCK_TYPE, RANK, ASSERT, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
