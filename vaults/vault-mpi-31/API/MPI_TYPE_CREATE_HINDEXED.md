---
title: MPI_TYPE_CREATE_HINDEXED
c_name: MPI_Type_create_hindexed
lis_name: MPI_TYPE_CREATE_HINDEXED
chapter: datatypes
aliases: [MPI_TYPE_CREATE_HINDEXED, MPI_Type_create_hindexed]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_CREATE_HINDEXED

**C**
```c
int MPI_Type_create_hindexed(int count, const int array_of_blocklengths[], const MPI_Aint array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks --- also number of entries in `array_of_displacements` and `array_of_blocklengths` (non-negative integer) |
| `array_of_blocklengths` | IN | number of elements in each block (array of non-negative integers) |
| `array_of_displacements` | IN | byte displacement of each block (array of integer) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran 2008**
```fortran
MPI_Type_create_hindexed(count, array_of_blocklengths, array_of_displacements, oldtype, newtype, ierror)
  INTEGER, INTENT(IN) :: count, array_of_blocklengths(count)
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) ::
  array_of_displacements(count)
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_HINDEXED(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), OLDTYPE, NEWTYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ARRAY_OF_DISPLACEMENTS(*)
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
