---
title: MPI_CART_SHIFT
c_name: MPI_Cart_shift
lis_name: MPI_CART_SHIFT
chapter: topol
aliases: [MPI_CART_SHIFT, MPI_Cart_shift]
tags: [mpi/function, mpi/topol]
---

# MPI_CART_SHIFT

**C**
```c
int MPI_Cart_shift(MPI_Comm comm, int direction, int disp, int *rank_source, int *rank_dest)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with associated Cartesian topology (handle) |
| `direction` | IN | coordinate dimension of shift (integer) |
| `disp` | IN | displacement ($> 0$: upwards shift, $< 0$: downwards shift) (integer) |
| `rank_source` | OUT | rank of source MPI process (integer) |
| `rank_dest` | OUT | rank of destination MPI process (integer) |

**Fortran 2008**
```fortran
MPI_Cart_shift(comm, direction, disp, rank_source, rank_dest, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(IN) :: direction, disp
  INTEGER, INTENT(OUT) :: rank_source, rank_dest
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_CART_SHIFT(COMM, DIRECTION, DISP, RANK_SOURCE, RANK_DEST, IERROR)
  INTEGER COMM, DIRECTION, DISP, RANK_SOURCE, RANK_DEST, IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
