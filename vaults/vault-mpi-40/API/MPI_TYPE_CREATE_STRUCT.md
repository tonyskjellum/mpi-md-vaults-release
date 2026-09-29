---
title: MPI_TYPE_CREATE_STRUCT
c_name: MPI_Type_create_struct
lis_name: MPI_TYPE_CREATE_STRUCT
chapter: datatypes
aliases: [MPI_TYPE_CREATE_STRUCT, MPI_Type_create_struct, MPI_Type_create_struct_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_CREATE_STRUCT

**C**
```c
int MPI_Type_create_struct(int count, const int array_of_blocklengths[], const MPI_Aint array_of_displacements[], const MPI_Datatype array_of_types[], MPI_Datatype *newtype)
int MPI_Type_create_struct_c(MPI_Count count, const MPI_Count array_of_blocklengths[], const MPI_Count array_of_displacements[], const MPI_Datatype array_of_types[], MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks---also number of entries in arrays `array_of_types`, `array_of_displacements`, and `array_of_blocklengths` (non-negative integer) |
| `array_of_blocklengths` | IN | number of elements in each block (array of non-negative integers) |
| `array_of_displacements` | IN | byte displacement of each block (array of integers) |
| `array_of_types` | IN | type of elements in each block (array of handles) |
| `newtype` | OUT | new datatype (handle) |

**Fortran 2008**
```fortran
MPI_Type_create_struct(count, array_of_blocklengths, array_of_displacements, array_of_types, newtype, ierror)
  INTEGER, INTENT(IN) :: count, array_of_blocklengths(count)
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: array_of_displacements(count)
  TYPE(MPI_Datatype), INTENT(IN) :: array_of_types(count)
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Type_create_struct(count, array_of_blocklengths, array_of_displacements, array_of_types, newtype, ierror) !(_c)
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count, array_of_blocklengths(count), array_of_displacements(count)
  TYPE(MPI_Datatype), INTENT(IN) :: array_of_types(count)
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_STRUCT(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, ARRAY_OF_TYPES, NEWTYPE, IERROR)
  INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_TYPES(*), NEWTYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ARRAY_OF_DISPLACEMENTS(*)
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
