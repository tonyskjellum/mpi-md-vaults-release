---
title: MPI_TYPE_HINDEXED
c_name: MPI_Type_hindexed
lis_name: MPI_TYPE_HINDEXED
chapter: deprecated
aliases: [MPI_TYPE_HINDEXED, MPI_Type_hindexed]
tags: [mpi/function, mpi/deprecated]
---

# MPI_TYPE_HINDEXED

**C**
```c
int MPI_Type_hindexed(int count, int *array_of_blocklengths, MPI_Aint *array_of_displacements, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks -- also number of entries in `array_of_displacements` and `array_of_blocklengths` (non-negative integer) |
| `array_of_blocklengths` | IN | number of elements in each block (array of non-negative integers) |
| `array_of_displacements` | IN | byte displacement of each block (array of integer) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_HINDEXED(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_DISPLACEMENTS(*), OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[deprecated]] for the normative text.
