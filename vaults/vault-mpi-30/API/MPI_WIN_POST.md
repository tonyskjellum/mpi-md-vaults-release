---
title: MPI_WIN_POST
c_name: MPI_Win_post
lis_name: MPI_WIN_POST
chapter: one-side
aliases: [MPI_WIN_POST, MPI_Win_post]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_POST

**C**
```c
int MPI_Win_post(MPI_Group group, int assert, MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `group` | IN | group of origin processes (handle) |
| `assert` | IN | program assertion (integer) |
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_post(group, assert, win, ierror) BIND(C)
  TYPE(MPI_Group), INTENT(IN) :: group
  INTEGER, INTENT(IN) :: assert
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_POST(GROUP, ASSERT, WIN, IERROR)
  INTEGER GROUP, ASSERT, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
