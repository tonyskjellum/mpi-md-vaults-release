---
title: MPI_WIN_SET_NAME
c_name: MPI_Win_set_name
lis_name: MPI_WIN_SET_NAME
chapter: ei
aliases: [MPI_WIN_SET_NAME, MPI_Win_set_name]
tags: [mpi/function, mpi/ei]
---

# MPI_WIN_SET_NAME

**C**
```c
int MPI_Win_set_name(MPI_Win win, char *win_name)
```

**C++**
```cpp
void MPI::Win::Set_name(const char* win_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | INOUT | window whose identifier is to be set (handle) |
| `win_name` | IN | the character string which is remembered as the name (string) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_SET_NAME(WIN, WIN_NAME, IERROR)
  INTEGER WIN, IERROR
  CHARACTER*(*) WIN_NAME
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
