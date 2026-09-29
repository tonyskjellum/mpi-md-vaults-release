---
title: MPI_CART_MAP
c_name: MPI_Cart_map
lis_name: MPI_CART_MAP
chapter: topol
aliases: [MPI_CART_MAP, MPI_Cart_map]
tags: [mpi/function, mpi/topol]
---

# MPI_CART_MAP

**C**
```c
int MPI_Cart_map(MPI_Comm comm, int ndims, int *dims, int *periods, int *newrank)
```

**C++**
```cpp
int MPI::Cartcomm::Map(int ndims, const int dims[], const bool periods[]) const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | input communicator (handle) |
| `ndims` | IN | number of dimensions of Cartesian structure (integer) |
| `dims` | IN | integer array of size `ndims` specifying the number of processes in each coordinate direction |
| `periods` | IN | logical array of size `ndims` specifying the periodicity specification in each coordinate direction |
| `newrank` | OUT | reordered rank of the calling process; `MPI_UNDEFINED` if calling process does not belong to grid (integer) |

**Fortran (mpif.h)**
```fortran
MPI_CART_MAP(COMM, NDIMS, DIMS, PERIODS, NEWRANK, IERROR)
  INTEGER COMM, NDIMS, DIMS(*), NEWRANK, IERROR
  LOGICAL PERIODS(*)
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
