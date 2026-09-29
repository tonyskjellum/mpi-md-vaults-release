---
title: MPI_TYPE_CREATE_DARRAY
c_name: MPI_Type_create_darray
lis_name: MPI_TYPE_CREATE_DARRAY
chapter: datatypes
aliases: [MPI_TYPE_CREATE_DARRAY, MPI_Type_create_darray, MPI_Type_create_darray_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_CREATE_DARRAY

**C**
```c
int MPI_Type_create_darray(int size, int rank, int ndims, const int array_of_gsizes[], const int array_of_distribs[], const int array_of_dargs[], const int array_of_psizes[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
int MPI_Type_create_darray_c(int size, int rank, int ndims, const MPI_Count array_of_gsizes[], const int array_of_distribs[], const int array_of_dargs[], const int array_of_psizes[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `size` | IN | size of process group (positive integer) |
| `rank` | IN | rank in process group (nonnegative integer) |
| `ndims` | IN | number of array dimensions as well as process grid dimensions (positive integer) |
| `array_of_gsizes` | IN | number of elements of type `oldtype` in each dimension of global array (array of positive integers) |
| `array_of_distribs` | IN | distribution of array in each dimension (array of states) |
| `array_of_dargs` | IN | distribution argument in each dimension (array of positive integers) |
| `array_of_psizes` | IN | size of process grid in each dimension (array of positive integers) |
| `order` | IN | array storage order flag (state) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran 2008**
```fortran
MPI_Type_create_darray(size, rank, ndims, array_of_gsizes, array_of_distribs, array_of_dargs, array_of_psizes, order, oldtype, newtype, ierror)
  INTEGER, INTENT(IN) :: size, rank, ndims, array_of_gsizes(ndims), array_of_distribs(ndims), array_of_dargs(ndims), array_of_psizes(ndims), order
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Type_create_darray(size, rank, ndims, array_of_gsizes, array_of_distribs, array_of_dargs, array_of_psizes, order, oldtype, newtype, ierror) !(_c)
  INTEGER, INTENT(IN) :: size, rank, ndims, array_of_distribs(ndims), array_of_dargs(ndims), array_of_psizes(ndims), order
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: array_of_gsizes(ndims)
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_DARRAY(SIZE, RANK, NDIMS, ARRAY_OF_GSIZES, ARRAY_OF_DISTRIBS, ARRAY_OF_DARGS, ARRAY_OF_PSIZES, ORDER, OLDTYPE, NEWTYPE, IERROR)
  INTEGER SIZE, RANK, NDIMS, ARRAY_OF_GSIZES(*), ARRAY_OF_DISTRIBS(*), ARRAY_OF_DARGS(*), ARRAY_OF_PSIZES(*), ORDER, OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
