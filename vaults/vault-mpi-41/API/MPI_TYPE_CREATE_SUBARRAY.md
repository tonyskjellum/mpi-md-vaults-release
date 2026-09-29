---
title: MPI_TYPE_CREATE_SUBARRAY
c_name: MPI_Type_create_subarray
lis_name: MPI_TYPE_CREATE_SUBARRAY
chapter: datatypes
aliases: [MPI_TYPE_CREATE_SUBARRAY, MPI_Type_create_subarray, MPI_Type_create_subarray_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_CREATE_SUBARRAY

**C**
```c
int MPI_Type_create_subarray(int ndims, const int array_of_sizes[], const int array_of_subsizes[], const int array_of_starts[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
int MPI_Type_create_subarray_c(int ndims, const MPI_Count array_of_sizes[], const MPI_Count array_of_subsizes[], const MPI_Count array_of_starts[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `ndims` | IN | number of array dimensions (positive integer) |
| `array_of_sizes` | IN | number of elements of type `oldtype` in each dimension of the full array (array of positive integers) |
| `array_of_subsizes` | IN | number of elements of type `oldtype` in each dimension of the subarray (array of positive integers) |
| `array_of_starts` | IN | starting coordinates of the subarray in each dimension (array of non-negative integers) |
| `order` | IN | array storage order flag (state) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran 2008**
```fortran
MPI_Type_create_subarray(ndims, array_of_sizes, array_of_subsizes, array_of_starts, order, oldtype, newtype, ierror)
  INTEGER, INTENT(IN) :: ndims, array_of_sizes(ndims), array_of_subsizes(ndims), array_of_starts(ndims), order
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Type_create_subarray(ndims, array_of_sizes, array_of_subsizes, array_of_starts, order, oldtype, newtype, ierror) !(_c)
  INTEGER, INTENT(IN) :: ndims, order
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: array_of_sizes(ndims), array_of_subsizes(ndims), array_of_starts(ndims)
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_SUBARRAY(NDIMS, ARRAY_OF_SIZES, ARRAY_OF_SUBSIZES, ARRAY_OF_STARTS, ORDER, OLDTYPE, NEWTYPE, IERROR)
  INTEGER NDIMS, ARRAY_OF_SIZES(*), ARRAY_OF_SUBSIZES(*), ARRAY_OF_STARTS(*), ORDER, OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
