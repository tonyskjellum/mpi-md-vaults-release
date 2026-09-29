---
title: MPI_WIN_FENCE
c_name: MPI_Win_fence
lis_name: MPI_WIN_FENCE
chapter: one-side
aliases: [MPI_WIN_FENCE, MPI_Win_fence]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_FENCE

**C**
```c
int MPI_Win_fence(int assert, MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `assert` | IN | program assertion (integer) |
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_fence(assert, win, ierror) BIND(C)
  INTEGER, INTENT(IN) :: assert
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_FENCE(ASSERT, WIN, IERROR)
  INTEGER ASSERT, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
