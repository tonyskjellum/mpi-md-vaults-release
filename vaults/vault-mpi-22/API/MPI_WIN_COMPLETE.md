---
title: MPI_WIN_COMPLETE
c_name: MPI_Win_complete
lis_name: MPI_WIN_COMPLETE
chapter: one-side
aliases: [MPI_WIN_COMPLETE, MPI_Win_complete]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_COMPLETE

**C**
```c
int MPI_Win_complete(MPI_Win win)
```

**C++**
```cpp
void MPI::Win::Complete() const
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window object (handle) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_COMPLETE(WIN, IERROR)
  INTEGER WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
