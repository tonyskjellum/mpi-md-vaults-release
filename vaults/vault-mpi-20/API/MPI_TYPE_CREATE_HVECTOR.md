---
title: MPI_TYPE_CREATE_HVECTOR
c_name: MPI_Type_create_hvector
lis_name: MPI_TYPE_CREATE_HVECTOR
chapter: misc
aliases: [MPI_TYPE_CREATE_HVECTOR, MPI_Type_create_hvector]
tags: [mpi/function, mpi/misc]
---

# MPI_TYPE_CREATE_HVECTOR

**C**
```c
int MPI_Type_create_hvector(int count, int blocklength, MPI_Aint stride, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**C++**
```cpp
MPI::Datatype MPI::Datatype::Create_hvector(int count, int blocklength, MPI::Aint stride) const
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
MPI_TYPE_CREATE_HVECTOR(COUNT, BLOCKLENGTH, STIDE, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, BLOCKLENGTH, OLDTYPE, NEWTYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) STRIDE
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
