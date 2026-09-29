---
title: MPI_TYPE_STRUCT
c_name: MPI_Type_struct
lis_name: MPI_TYPE_STRUCT
chapter: pt2pt
aliases: [MPI_TYPE_STRUCT, MPI_Type_struct]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_TYPE_STRUCT

**C**
```c
int MPI_Type_struct(int count, int *array_of_blocklengths, MPI_Aint *array_of_displacements, MPI_Datatype *array_of_types, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks (integer) -- also number of entries in arrays `array_of_types`, `array_of_displacements` and `array_of_blocklengths` |
| `array_of_blocklength` | IN | number of elements in each block (array of integer) |
| `array_of_displacements` | IN | byte displacement of each block (array of integer) |
| `array_of_types` | IN | type of elements in each block (array of handles to datatype objects) |
| `newtype` | OUT | new datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_STRUCT(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, ARRAY_OF_TYPES, NEWTYPE, IERROR)
  INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_DISPLACEMENTS(*), ARRAY_OF_TYPES(*), NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
