---
title: MPI_CARTDIM_GET
c_name: MPI_Cartdim_get
lis_name: MPI_CARTDIM_GET
chapter: topol
aliases: [MPI_CARTDIM_GET, MPI_Cartdim_get]
tags: [mpi/function, mpi/topol]
---

# MPI_CARTDIM_GET

**C**
```c
int MPI_Cartdim_get(MPI_Comm comm, int *ndims)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with cartesian structure (handle) |
| `ndims` | OUT | number of dimensions of the cartesian structure (integer) |

**Fortran (mpif.h)**
```fortran
MPI_CARTDIM_GET(COMM, NDIMS, IERROR)
  INTEGER COMM, NDIMS, IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
