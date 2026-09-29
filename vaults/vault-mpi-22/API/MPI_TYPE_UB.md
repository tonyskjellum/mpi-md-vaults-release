---
title: MPI_TYPE_UB
c_name: MPI_Type_ub
lis_name: MPI_TYPE_UB
chapter: deprecated
aliases: [MPI_TYPE_UB, MPI_Type_ub]
tags: [mpi/function, mpi/deprecated]
---

# MPI_TYPE_UB

**C**
```c
int MPI_Type_ub(MPI_Datatype datatype, MPI_Aint* displacement)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype (handle) |
| `displacement` | OUT | displacement of upper bound from origin, in bytes (integer) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_UB( DATATYPE, DISPLACEMENT, IERROR)
  INTEGER DATATYPE, DISPLACEMENT, IERROR
```


> [!info] Semantics
> See the chapter note [[deprecated]] for the normative text.
