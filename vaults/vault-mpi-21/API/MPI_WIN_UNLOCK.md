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

**C++**
```cpp
void MPI::Win::Unlock(int rank) const
```

| Parameter | Intent | Description |
|---|---|---|
| `rank` | IN | rank of window (nonnegative integer) |
| `win` | IN | window object (handle) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_UNLOCK(RANK, WIN, IERROR)
  INTEGER RANK, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
