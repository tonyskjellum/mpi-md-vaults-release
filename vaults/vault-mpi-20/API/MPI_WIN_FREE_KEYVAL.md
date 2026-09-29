---
title: MPI_WIN_FREE_KEYVAL
c_name: MPI_Win_free_keyval
lis_name: MPI_WIN_FREE_KEYVAL
chapter: ei
aliases: [MPI_WIN_FREE_KEYVAL, MPI_Win_free_keyval]
tags: [mpi/function, mpi/ei]
---

# MPI_WIN_FREE_KEYVAL

**C**
```c
int MPI_Win_free_keyval(int *win_keyval)
```

**C++**
```cpp
static void MPI::Win::Free_keyval(int& win_keyval)
```

| Parameter | Intent | Description |
|---|---|---|
| `win_keyval` | INOUT | key value (integer) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_FREE_KEYVAL(WIN_KEYVAL, IERROR)
  INTEGER WIN_KEYVAL, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
