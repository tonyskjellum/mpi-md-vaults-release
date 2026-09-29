---
title: MPI_TYPE_HVECTOR
c_name: MPI_Type_hvector
lis_name: MPI_TYPE_HVECTOR
chapter: pt2pt
aliases: [MPI_TYPE_HVECTOR, MPI_Type_hvector]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_TYPE_HVECTOR

**C**
```c
int MPI_Type_hvector(int count, int blocklength, MPI_Aint stride, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks (nonnegative integer) |
| `blocklength` | IN | number of elements in each block (nonnegative integer) |
| `stride` | IN | number of bytes between start of each block (integer) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_HVECTOR(COUNT, BLOCKLENGTH, STRIDE, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, BLOCKLENGTH, STRIDE, OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
