---
title: MPI_WIN_FREE_KEYVAL
c_name: MPI_Win_free_keyval
lis_name: MPI_WIN_FREE_KEYVAL
chapter: context
aliases: [MPI_WIN_FREE_KEYVAL, MPI_Win_free_keyval]
tags: [mpi/function, mpi/context]
---

# MPI_WIN_FREE_KEYVAL

**C**
```c
int MPI_Win_free_keyval(int *win_keyval)
```

| Parameter | Intent | Description |
|---|---|---|
| `win_keyval` | INOUT | key value (integer) |

**Fortran 2008**
```fortran
MPI_Win_free_keyval(win_keyval, ierror) BIND(C)
  INTEGER, INTENT(INOUT) :: win_keyval
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_FREE_KEYVAL(WIN_KEYVAL, IERROR)
  INTEGER WIN_KEYVAL, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
