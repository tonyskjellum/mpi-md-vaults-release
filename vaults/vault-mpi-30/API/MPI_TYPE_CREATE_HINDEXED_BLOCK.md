---
title: MPI_TYPE_CREATE_HINDEXED_BLOCK
c_name: MPI_Type_create_hindexed_block
lis_name: MPI_TYPE_CREATE_HINDEXED_BLOCK
chapter: datatypes
aliases: [MPI_TYPE_CREATE_HINDEXED_BLOCK, MPI_Type_create_hindexed_block]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_CREATE_HINDEXED_BLOCK

**C**
```c
int MPI_Type_create_hindexed_block(int count, int blocklength, const MPI_Aint array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | length of array of displacements (non-negative integer) |
| `blocklength` | IN | size of block (non-negative integer) |
| `array_of_displacements` | IN | byte displacement of each block (array of integer) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran 2008**
```fortran
MPI_Type_create_hindexed_block(count, blocklength, array_of_displacements, oldtype, newtype, ierror) BIND(C)
  INTEGER, INTENT(IN) :: count, blocklength
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: array_of_displacements(count)
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_HINDEXED_BLOCK(COUNT, BLOCKLENGTH, ARRAY_OF_DISPLACEMENTS, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, BLOCKLENGTH, OLDTYPE, NEWTYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ARRAY_OF_DISPLACEMENTS(*)
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
