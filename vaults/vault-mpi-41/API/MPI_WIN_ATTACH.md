---
title: MPI_WIN_ATTACH
c_name: MPI_Win_attach
lis_name: MPI_WIN_ATTACH
chapter: one-side
aliases: [MPI_WIN_ATTACH, MPI_Win_attach]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_ATTACH

**C**
```c
int MPI_Win_attach(MPI_Win win, void *base, MPI_Aint size)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window object (handle) |
| `base` | IN | initial address of memory to be attached (choice) |
| `size` | IN | size of memory to be attached in bytes (non-negative integer) |

**Fortran 2008**
```fortran
MPI_Win_attach(win, base, size, ierror)
  TYPE(MPI_Win), INTENT(IN) :: win
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: base
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_ATTACH(WIN, BASE, SIZE, IERROR)
  INTEGER WIN, IERROR
  <type> BASE(*)
  INTEGER(KIND=MPI_ADDRESS_KIND) SIZE
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
