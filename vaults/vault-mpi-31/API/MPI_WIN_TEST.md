---
title: MPI_WIN_TEST
c_name: MPI_Win_test
lis_name: MPI_WIN_TEST
chapter: one-side
aliases: [MPI_WIN_TEST, MPI_Win_test]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_TEST

**C**
```c
int MPI_Win_test(MPI_Win win, int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window object (handle) |
| `flag` | OUT | success flag (logical) |

**Fortran 2008**
```fortran
MPI_Win_test(win, flag, ierror)
  TYPE(MPI_Win), INTENT(IN) :: win
  LOGICAL, INTENT(OUT) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_TEST(WIN, FLAG, IERROR)
  INTEGER WIN, IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
