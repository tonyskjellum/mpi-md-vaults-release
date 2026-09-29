---
title: MPI_WIN_DELETE_ATTR
c_name: MPI_Win_delete_attr
lis_name: MPI_WIN_DELETE_ATTR
chapter: context
aliases: [MPI_WIN_DELETE_ATTR, MPI_Win_delete_attr]
tags: [mpi/function, mpi/context]
---

# MPI_WIN_DELETE_ATTR

**C**
```c
int MPI_Win_delete_attr(MPI_Win win, int win_keyval)
```

**C++**
```cpp
void MPI::Win::Delete_attr(int win_keyval)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | INOUT | window from which the attribute is deleted (handle) |
| `win_keyval` | IN | key value (integer) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_DELETE_ATTR(WIN, WIN_KEYVAL, IERROR)
  INTEGER WIN, WIN_KEYVAL, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
