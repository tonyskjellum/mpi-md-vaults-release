---
title: MPI_TYPE_INDEXED
c_name: MPI_Type_indexed
lis_name: MPI_TYPE_INDEXED
chapter: datatypes
aliases: [MPI_TYPE_INDEXED, MPI_Type_indexed, MPI_Type_indexed_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_INDEXED

**C**
```c
int MPI_Type_indexed(int count, const int array_of_blocklengths[], const int array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
int MPI_Type_indexed_c(MPI_Count count, const MPI_Count array_of_blocklengths[], const MPI_Count array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks---also number of entries in `array_of_displacements` and `array_of_blocklengths` (nonnegative integer) |
| `array_of_blocklengths` | IN | number of elements per block (array of nonnegative integers) |
| `array_of_displacements` | IN | displacement for each block, in multiples of `oldtype` (array of integers) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran 2008**
```fortran
MPI_Type_indexed(count, array_of_blocklengths, array_of_displacements, oldtype, newtype, ierror)
  INTEGER, INTENT(IN) :: count, array_of_blocklengths(count), array_of_displacements(count)
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Type_indexed(count, array_of_blocklengths, array_of_displacements, oldtype, newtype, ierror) !(_c)
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count, array_of_blocklengths(count), array_of_displacements(count)
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_INDEXED(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_DISPLACEMENTS(*), OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
