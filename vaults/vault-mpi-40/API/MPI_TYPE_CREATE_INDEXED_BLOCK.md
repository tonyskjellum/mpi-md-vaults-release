---
title: MPI_TYPE_CREATE_INDEXED_BLOCK
c_name: MPI_Type_create_indexed_block
lis_name: MPI_TYPE_CREATE_INDEXED_BLOCK
chapter: datatypes
aliases: [MPI_TYPE_CREATE_INDEXED_BLOCK, MPI_Type_create_indexed_block, MPI_Type_create_indexed_block_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_CREATE_INDEXED_BLOCK

**C**
```c
int MPI_Type_create_indexed_block(int count, int blocklength, const int array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
int MPI_Type_create_indexed_block_c(MPI_Count count, MPI_Count blocklength, const MPI_Count array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks---also number of entries in `array_of_displacements` (non-negative integer) |
| `blocklength` | IN | number of elements in each block (non-negative integer) |
| `array_of_displacements` | IN | array of displacements, in multiples of `oldtype` (array of integers) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran 2008**
```fortran
MPI_Type_create_indexed_block(count, blocklength, array_of_displacements, oldtype, newtype, ierror)
  INTEGER, INTENT(IN) :: count, blocklength, array_of_displacements(count)
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Type_create_indexed_block(count, blocklength, array_of_displacements, oldtype, newtype, ierror) !(_c)
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count, blocklength, array_of_displacements(count)
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_INDEXED_BLOCK(COUNT, BLOCKLENGTH, ARRAY_OF_DISPLACEMENTS, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, BLOCKLENGTH, ARRAY_OF_DISPLACEMENTS(*), OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
