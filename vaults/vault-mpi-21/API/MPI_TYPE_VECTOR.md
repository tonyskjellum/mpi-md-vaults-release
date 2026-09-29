---
title: MPI_TYPE_VECTOR
c_name: MPI_Type_vector
lis_name: MPI_TYPE_VECTOR
chapter: datatypes
aliases: [MPI_TYPE_VECTOR, MPI_Type_vector]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_VECTOR

**C**
```c
int MPI_Type_vector(int count, int blocklength, int stride, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**C++**
```cpp
MPI::Datatype MPI::Datatype::Create_vector(int count, int blocklength, int stride) const
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks (nonnegative integer) |
| `blocklength` | IN | number of elements in each block (nonnegative integer) |
| `stride` | IN | number of elements between start of each block (integer) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_VECTOR(COUNT, BLOCKLENGTH, STRIDE, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, BLOCKLENGTH, STRIDE, OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
