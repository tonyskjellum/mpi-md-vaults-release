---
title: MPI_WIN_CREATE_DYNAMIC
c_name: MPI_Win_create_dynamic
lis_name: MPI_WIN_CREATE_DYNAMIC
chapter: one-side
aliases: [MPI_WIN_CREATE_DYNAMIC, MPI_Win_create_dynamic]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_CREATE_DYNAMIC

**C**
```c
int MPI_Win_create_dynamic(MPI_Info info, MPI_Comm comm, MPI_Win *win)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | IN | info argument (handle) |
| `comm` | IN | intra-communicator (handle) |
| `win` | OUT | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_create_dynamic(info, comm, win, ierror)
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Win), INTENT(OUT) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_CREATE_DYNAMIC(INFO, COMM, WIN, IERROR)
  INTEGER INFO, COMM, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
