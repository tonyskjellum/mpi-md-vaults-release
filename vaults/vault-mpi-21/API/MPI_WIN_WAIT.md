---
title: MPI_WIN_WAIT
c_name: MPI_Win_wait
lis_name: MPI_WIN_WAIT
chapter: one-side
aliases: [MPI_WIN_WAIT, MPI_Win_wait]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_WAIT

**C**
```c
int MPI_Win_wait(MPI_Win win)
```

**C++**
```cpp
void MPI::Win::Wait() const
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window object (handle) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_WAIT(WIN, IERROR)
  INTEGER WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
