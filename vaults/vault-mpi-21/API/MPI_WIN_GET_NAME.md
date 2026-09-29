---
title: MPI_WIN_GET_NAME
c_name: MPI_Win_get_name
lis_name: MPI_WIN_GET_NAME
chapter: context
aliases: [MPI_WIN_GET_NAME, MPI_Win_get_name]
tags: [mpi/function, mpi/context]
---

# MPI_WIN_GET_NAME

**C**
```c
int MPI_Win_get_name(MPI_Win win, char *win_name, int *resultlen)
```

**C++**
```cpp
void MPI::Win::Get_name(char* win_name, int& resultlen) const
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window whose name is to be returned (handle) |
| `win_name` | OUT | the name previously stored on the window, or a empty string if no such name exists (string) |
| `resultlen` | OUT | length of returned name (integer) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_GET_NAME(WIN, WIN_NAME, RESULTLEN, IERROR)
  INTEGER WIN, RESULTLEN, IERROR
  CHARACTER*(*) WIN_NAME
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
