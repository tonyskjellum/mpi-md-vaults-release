---
title: MPI_WIN_START
c_name: MPI_Win_start
lis_name: MPI_WIN_START
chapter: one-side
aliases: [MPI_WIN_START, MPI_Win_start]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_START

**C**
```c
int MPI_Win_start(MPI_Group group, int assert, MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `group` | IN | group of target processes (handle) |
| `assert` | IN | program assertion (integer) |
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_start(group, assert, win, ierror)
  TYPE(MPI_Group), INTENT(IN) :: group
  INTEGER, INTENT(IN) :: assert
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_START(GROUP, ASSERT, WIN, IERROR)
  INTEGER GROUP, ASSERT, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
