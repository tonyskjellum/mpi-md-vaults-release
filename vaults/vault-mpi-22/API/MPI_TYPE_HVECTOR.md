---
title: MPI_TYPE_HVECTOR
c_name: MPI_Type_hvector
lis_name: MPI_TYPE_HVECTOR
chapter: deprecated
aliases: [MPI_TYPE_HVECTOR, MPI_Type_hvector]
tags: [mpi/function, mpi/deprecated]
---

# MPI_TYPE_HVECTOR

**C**
```c
int MPI_Type_hvector(int count, int blocklength, MPI_Aint stride, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks (non-negative integer) |
| `blocklength` | IN | number of elements in each block (non-negative integer) |
| `stride` | IN | number of bytes between start of each block (integer) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_HVECTOR(COUNT, BLOCKLENGTH, STRIDE, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, BLOCKLENGTH, STRIDE, OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[deprecated]] for the normative text.
