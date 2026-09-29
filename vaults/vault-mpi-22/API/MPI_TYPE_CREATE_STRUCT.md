---
title: MPI_TYPE_CREATE_STRUCT
c_name: MPI_Type_create_struct
lis_name: MPI_TYPE_CREATE_STRUCT
chapter: datatypes
aliases: [MPI_TYPE_CREATE_STRUCT, MPI_Type_create_struct]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_CREATE_STRUCT

**C**
```c
int MPI_Type_create_struct(int count, int array_of_blocklengths[], MPI_Aint array_of_displacements[], MPI_Datatype array_of_types[], MPI_Datatype *newtype)
```

**C++**
```cpp
static MPI::Datatype MPI::Datatype::Create_struct(int count, const int array_of_blocklengths[], const MPI::Aint array_of_displacements[], const MPI::Datatype array_of_types[])
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks (non-negative integer) --- also number of entries in arrays `array_of_types`, `array_of_displacements` and `array_of_blocklengths` |
| `array_of_blocklength` | IN | number of elements in each block (array of non-negative integer) |
| `array_of_displacements` | IN | byte displacement of each block (array of integer) |
| `array_of_types` | IN | type of elements in each block (array of handles to datatype objects) |
| `newtype` | OUT | new datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_STRUCT(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, ARRAY_OF_TYPES, NEWTYPE, IERROR)
  INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_TYPES(*), NEWTYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ARRAY_OF_DISPLACEMENTS(*)
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
