---
title: MPI_TYPE_LB
c_name: MPI_Type_lb
lis_name: MPI_TYPE_LB
chapter: pt2pt
aliases: [MPI_TYPE_LB, MPI_Type_lb]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_TYPE_LB

**C**
```c
int MPI_Type_lb(MPI_Datatype datatype, MPI_Aint* displacement)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype (handle) |
| `displacement` | OUT | displacement of lower bound from origin, in bytes (integer) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_LB( DATATYPE, DISPLACEMENT, IERROR)
  INTEGER DATATYPE, DISPLACEMENT, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
