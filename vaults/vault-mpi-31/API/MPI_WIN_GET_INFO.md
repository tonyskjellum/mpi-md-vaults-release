---
title: MPI_WIN_GET_INFO
c_name: MPI_Win_get_info
lis_name: MPI_WIN_GET_INFO
chapter: one-side
aliases: [MPI_WIN_GET_INFO, MPI_Win_get_info]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_GET_INFO

**C**
```c
int MPI_Win_get_info(MPI_Win win, MPI_Info *info_used)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window object (handle) |
| `info_used` | OUT | new info object (handle) |

**Fortran 2008**
```fortran
MPI_Win_get_info(win, info_used, ierror)
  TYPE(MPI_Win), INTENT(IN) :: win
  TYPE(MPI_Info), INTENT(OUT) :: info_used
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_GET_INFO(WIN, INFO_USED, IERROR)
  INTEGER WIN, INFO_USED, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
