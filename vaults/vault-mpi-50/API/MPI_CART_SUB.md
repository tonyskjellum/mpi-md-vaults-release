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
int MPI_Cart_sub(MPI_Comm comm, const int remain_dims[], MPI_Comm *newcomm)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with associated Cartesian topology (handle) |
| `remain_dims` | IN | the `i`-th entry of `remain_dims` specifies whether the `i`-th dimension is kept in the subgrid (`true`) or is dropped (`false`) (array of logicals) |
| `newcomm` | OUT | new communicator with associated Cartesian topology containing the subgrid that includes the calling MPI process (handle) |

**Fortran 2008**
```fortran
MPI_Cart_sub(comm, remain_dims, newcomm, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  LOGICAL, INTENT(IN) :: remain_dims(*)
  TYPE(MPI_Comm), INTENT(OUT) :: newcomm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_CART_SUB(COMM, REMAIN_DIMS, NEWCOMM, IERROR)
  INTEGER COMM, NEWCOMM, IERROR
  LOGICAL REMAIN_DIMS(*)
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
