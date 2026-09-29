---
title: MPI_DIMS_CREATE
c_name: MPI_Dims_create
lis_name: MPI_DIMS_CREATE
chapter: topol
aliases: [MPI_DIMS_CREATE, MPI_Dims_create]
tags: [mpi/function, mpi/topol]
---

# MPI_DIMS_CREATE

**C**
```c
int MPI_Dims_create(int nnodes, int ndims, int dims[])
```

| Parameter | Intent | Description |
|---|---|---|
| `nnodes` | IN | number of nodes in a grid (integer) |
| `ndims` | IN | number of Cartesian dimensions (integer) |
| `dims` | INOUT | integer array of size `ndims` specifying the number of nodes in each dimension |

**Fortran 2008**
```fortran
MPI_Dims_create(nnodes, ndims, dims, ierror) BIND(C)
  INTEGER, INTENT(IN) :: nnodes, ndims
  INTEGER, INTENT(INOUT) :: dims(ndims)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_DIMS_CREATE(NNODES, NDIMS, DIMS, IERROR)
  INTEGER NNODES, NDIMS, DIMS(*), IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
