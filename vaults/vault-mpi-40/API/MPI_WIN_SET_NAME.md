---
title: MPI_WIN_SET_NAME
c_name: MPI_Win_set_name
lis_name: MPI_WIN_SET_NAME
chapter: context
aliases: [MPI_WIN_SET_NAME, MPI_Win_set_name]
tags: [mpi/function, mpi/context]
---

# MPI_WIN_SET_NAME

**C**
```c
int MPI_Win_set_name(MPI_Win win, const char *win_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | INOUT | window whose identifier is to be set (handle) |
| `win_name` | IN | the character string which is remembered as the name (string) |

**Fortran 2008**
```fortran
MPI_Win_set_name(win, win_name, ierror)
  TYPE(MPI_Win), INTENT(IN) :: win
  CHARACTER(LEN=*), INTENT(IN) :: win_name
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_SET_NAME(WIN, WIN_NAME, IERROR)
  INTEGER WIN, IERROR
  CHARACTER*(*) WIN_NAME
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
