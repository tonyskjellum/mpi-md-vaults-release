---
title: MPI_TYPE_CREATE_HINDEXED
c_name: MPI_Type_create_hindexed
lis_name: MPI_TYPE_CREATE_HINDEXED
chapter: misc
aliases: [MPI_TYPE_CREATE_HINDEXED, MPI_Type_create_hindexed]
tags: [mpi/function, mpi/misc]
---

# MPI_TYPE_CREATE_HINDEXED

**C**
```c
int MPI_Type_create_hindexed(int count, int array_of_blocklengths[], MPI_Aint array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**C++**
```cpp
MPI::Datatype MPI::Datatype::Create_hindexed(int count, const int array_of_blocklengths[], const MPI::Aint array_of_displacements[]) const
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks --- also number of entries in `array_of_displacements` and `array_of_blocklengths` (integer) |
| `array_of_blocklengths` | IN | number of elements in each block (array of nonnegative integers) |
| `array_of_displacements` | IN | byte displacement of each block (array of integer) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_HINDEXED(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), OLDTYPE, NEWTYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ARRAY_OF_DISPLACEMENTS(*)
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
