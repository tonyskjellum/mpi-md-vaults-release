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
int MPI_Cart_coords(MPI_Comm comm, int rank, int maxdims, int *coords)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with cartesian structure (handle) |
| `rank` | IN | rank of a process within group of `comm` (integer) |
| `maxdims` | IN | length of vector `coords` in the calling program (integer) |
| `coords` | OUT | integer array (of size `ndims`) containing the cartesian coordinates of specified process (array of integers) |

**Fortran (mpif.h)**
```fortran
MPI_CART_COORDS(COMM, RANK, MAXDIMS, COORDS, IERROR)
  INTEGER COMM, RANK, MAXDIMS, COORDS(*), IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
