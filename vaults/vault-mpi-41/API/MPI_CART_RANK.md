---
title: MPI_CART_RANK
c_name: MPI_Cart_rank
lis_name: MPI_CART_RANK
chapter: topol
aliases: [MPI_CART_RANK, MPI_Cart_rank]
tags: [mpi/function, mpi/topol]
---

# MPI_CART_RANK

**C**
```c
int MPI_Cart_rank(MPI_Comm comm, const int coords[], int *rank)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with associated Cartesian topology (handle) |
| `coords` | IN | integer array (of size `ndims`) specifying the Cartesian coordinates of an MPI process |
| `rank` | OUT | rank of specified MPI process within group of `comm` (integer) |

**Fortran 2008**
```fortran
MPI_Cart_rank(comm, coords, rank, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(IN) :: coords(*)
  INTEGER, INTENT(OUT) :: rank
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_CART_RANK(COMM, COORDS, RANK, IERROR)
  INTEGER COMM, COORDS(*), RANK, IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
