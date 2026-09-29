---
title: MPI_WIN_SET_INFO
c_name: MPI_Win_set_info
lis_name: MPI_WIN_SET_INFO
chapter: one-side
aliases: [MPI_WIN_SET_INFO, MPI_Win_set_info]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_SET_INFO

**C**
```c
int MPI_Win_set_info(MPI_Win win, MPI_Info info)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | INOUT | window object (handle) |
| `info` | IN | info argument (handle) |

**Fortran 2008**
```fortran
MPI_Win_set_info(win, info, ierror)
  TYPE(MPI_Win), INTENT(IN) :: win
  TYPE(MPI_Info), INTENT(IN) :: info
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_SET_INFO(WIN, INFO, IERROR)
  INTEGER WIN, INFO, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
