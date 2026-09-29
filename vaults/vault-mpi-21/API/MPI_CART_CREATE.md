---
title: MPI_CART_CREATE
c_name: MPI_Cart_create
lis_name: MPI_CART_CREATE
chapter: topol
aliases: [MPI_CART_CREATE, MPI_Cart_create]
tags: [mpi/function, mpi/topol]
---

# MPI_CART_CREATE

**C**
```c
int MPI_Cart_create(MPI_Comm comm_old, int ndims, int *dims, int *periods, int reorder, MPI_Comm *comm_cart)
```

**C++**
```cpp
MPI::Cartcomm MPI::Intracomm::Create_cart(int ndims, const int dims[], const bool periods[], bool reorder) const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm_old` | IN | input communicator (handle) |
| `ndims` | IN | number of dimensions of Cartesian grid (integer) |
| `dims` | IN | integer array of size `ndims` specifying the number of processes in each dimension |
| `periods` | IN | logical array of size `ndims` specifying whether the grid is periodic (true) or not (false) in each dimension |
| `reorder` | IN | ranking may be reordered (true) or not (false) (logical) |
| `comm_cart` | OUT | communicator with new Cartesian topology (handle) |

**Fortran (mpif.h)**
```fortran
MPI_CART_CREATE(COMM_OLD, NDIMS, DIMS, PERIODS, REORDER, COMM_CART, IERROR)
  INTEGER COMM_OLD, NDIMS, DIMS(*), COMM_CART, IERROR
  LOGICAL PERIODS(*), REORDER
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
