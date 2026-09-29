---
title: MPI_TYPE_INDEXED
c_name: MPI_Type_indexed
lis_name: MPI_TYPE_INDEXED
chapter: datatypes
aliases: [MPI_TYPE_INDEXED, MPI_Type_indexed]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_INDEXED

**C**
```c
int MPI_Type_indexed(int count, int *array_of_blocklengths, int *array_of_displacements, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**C++**
```cpp
MPI::Datatype MPI::Datatype::Create_indexed(int count, const int array_of_blocklengths[], const int array_of_displacements[]) const
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks -- also number of entries in `array_of_displacements` and `array_of_blocklengths` (non-negative integer) |
| `array_of_blocklengths` | IN | number of elements per block (array of non-negative integers) |
| `array_of_displacements` | IN | displacement for each block, in multiples of `oldtype` extent (array of integer) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_INDEXED(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_DISPLACEMENTS(*), OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
