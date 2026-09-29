---
title: MPI_WIN_CREATE
c_name: MPI_Win_create
lis_name: MPI_WIN_CREATE
chapter: one-side
aliases: [MPI_WIN_CREATE, MPI_Win_create, MPI_Win_create_c]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_CREATE

**C**
```c
int MPI_Win_create(void *base, MPI_Aint size, int disp_unit, MPI_Info info, MPI_Comm comm, MPI_Win *win)
int MPI_Win_create_c(void *base, MPI_Aint size, MPI_Aint disp_unit, MPI_Info info, MPI_Comm comm, MPI_Win *win)
```

| Parameter | Intent | Description |
|---|---|---|
| `base` | IN | initial address of window (choice) |
| `size` | IN | size of window in bytes (nonnegative integer) |
| `disp_unit` | IN | local unit size for displacements, in bytes (positive integer) |
| `info` | IN | info argument (handle) |
| `comm` | IN | intra-communicator (handle) |
| `win` | OUT | window object (handle) |

**Fortran 2008**
```fortran
MPI_Win_create(base, size, disp_unit, info, comm, win, ierror)
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: base
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size
  INTEGER, INTENT(IN) :: disp_unit
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Win), INTENT(OUT) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Win_create(base, size, disp_unit, info, comm, win, ierror) !(_c)
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: base
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size, disp_unit
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Win), INTENT(OUT) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_CREATE(BASE, SIZE, DISP_UNIT, INFO, COMM, WIN, IERROR)
  <type> BASE(*)
  INTEGER(KIND=MPI_ADDRESS_KIND) SIZE
  INTEGER DISP_UNIT, INFO, COMM, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
