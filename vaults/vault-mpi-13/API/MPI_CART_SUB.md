---
title: MPI_CART_SUB
c_name: MPI_Cart_sub
lis_name: MPI_CART_SUB
chapter: topol
aliases: [MPI_CART_SUB, MPI_Cart_sub]
tags: [mpi/function, mpi/topol]
---

# MPI_CART_SUB

**C**
```c
int MPI_Cart_sub(MPI_Comm comm, int *remain_dims, MPI_Comm *newcomm)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with cartesian structure (handle) |
| `remain_dims` | IN | the `i`th entry of `remain_dims` specifies whether the `i`th dimension is kept in the subgrid (`true`) or is dropped (`false`) (logical vector) |
| `newcomm` | OUT | communicator containing the subgrid that includes the calling process (handle) |

**Fortran (mpif.h)**
```fortran
MPI_CART_SUB(COMM, REMAIN_DIMS, NEWCOMM, IERROR)
  INTEGER COMM, NEWCOMM, IERROR
  LOGICAL REMAIN_DIMS(*)
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
