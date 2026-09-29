---
title: MPI_TYPE_CREATE_INDEXED_BLOCK
c_name: MPI_Type_create_indexed_block
lis_name: MPI_TYPE_CREATE_INDEXED_BLOCK
chapter: misc
aliases: [MPI_TYPE_CREATE_INDEXED_BLOCK, MPI_Type_create_indexed_block]
tags: [mpi/function, mpi/misc]
---

# MPI_TYPE_CREATE_INDEXED_BLOCK

**C**
```c
int MPI_Type_create_indexed_block(int count, int blocklength, int array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**C++**
```cpp
MPI::Datatype MPI::Datatype::Create_indexed_block( int count, int blocklength, const int array_of_displacements[]) const
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | length of array of displacements (integer) |
| `blocklength` | IN | size of block (integer) |
| `array_of_displacements` | IN | array of displacements (array of integer) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_INDEXED_BLOCK(COUNT, BLOCKLENGTH, ARRAY_OF_DISPLACEMENTS, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, BLOCKLENGTH, ARRAY_OF_DISPLACEMENTS(*), OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
