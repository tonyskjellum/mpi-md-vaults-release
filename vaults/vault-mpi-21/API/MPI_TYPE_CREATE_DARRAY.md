---
title: MPI_TYPE_CREATE_DARRAY
c_name: MPI_Type_create_darray
lis_name: MPI_TYPE_CREATE_DARRAY
chapter: datatypes
aliases: [MPI_TYPE_CREATE_DARRAY, MPI_Type_create_darray]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_CREATE_DARRAY

**C**
```c
int MPI_Type_create_darray(int size, int rank, int ndims, int array_of_gsizes[], int array_of_distribs[], int array_of_dargs[], int array_of_psizes[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**C++**
```cpp
MPI::Datatype MPI::Datatype::Create_darray(int size, int rank, int ndims, const int array_of_gsizes[], const int array_of_distribs[], const int array_of_dargs[], const int array_of_psizes[], int order) const
```

| Parameter | Intent | Description |
|---|---|---|
| `size` | IN | size of process group (positive integer) |
| `rank` | IN | rank in process group (nonnegative integer) |
| `ndims` | IN | number of array dimensions as well as process grid dimensions (positive integer) |
| `array_of_gsizes` | IN | number of elements of type `oldtype` in each dimension of global array (array of positive integers) |
| `array_of_distribs` | IN | distribution of array in each dimension (array of state) |
| `array_of_dargs` | IN | distribution argument in each dimension (array of positive integers) |
| `array_of_psizes` | IN | size of process grid in each dimension (array of positive integers) |
| `order` | IN | array storage order flag (state) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_DARRAY(SIZE, RANK, NDIMS, ARRAY_OF_GSIZES, ARRAY_OF_DISTRIBS, ARRAY_OF_DARGS, ARRAY_OF_PSIZES, ORDER, OLDTYPE, NEWTYPE, IERROR)
  INTEGER SIZE, RANK, NDIMS, ARRAY_OF_GSIZES(*), ARRAY_OF_DISTRIBS(*), ARRAY_OF_DARGS(*), ARRAY_OF_PSIZES(*), ORDER, OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
