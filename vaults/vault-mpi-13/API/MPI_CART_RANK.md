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
int MPI_Cart_rank(MPI_Comm comm, int *coords, int *rank)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with cartesian structure (handle) |
| `coords` | IN | integer array (of size `ndims`) specifying the cartesian coordinates of a process |
| `rank` | OUT | rank of specified process (integer) |

**Fortran (mpif.h)**
```fortran
MPI_CART_RANK(COMM, COORDS, RANK, IERROR)
  INTEGER COMM, COORDS(*), RANK, IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
