---
title: MPI_CART_COORDS
c_name: MPI_Cart_coords
lis_name: MPI_CART_COORDS
chapter: topol
aliases: [MPI_CART_COORDS, MPI_Cart_coords]
tags: [mpi/function, mpi/topol]
---

# MPI_CART_COORDS

**C**
```c
int MPI_Cart_coords(MPI_Comm comm, int rank, int maxdims, int coords[])
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with associated Cartesian topology (handle) |
| `rank` | IN | rank of an MPI process within group of `comm` (integer) |
| `maxdims` | IN | length of vector `coords` in the calling program (integer) |
| `coords` | OUT | coordinates of the MPI process with the rank `rank` in Cartesian structure (array of integers) |

**Fortran 2008**
```fortran
MPI_Cart_coords(comm, rank, maxdims, coords, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(IN) :: rank, maxdims
  INTEGER, INTENT(OUT) :: coords(maxdims)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_CART_COORDS(COMM, RANK, MAXDIMS, COORDS, IERROR)
  INTEGER COMM, RANK, MAXDIMS, COORDS(*), IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
