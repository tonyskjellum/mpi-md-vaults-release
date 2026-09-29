---
title: MPI_TYPE_CREATE_SUBARRAY
c_name: MPI_Type_create_subarray
lis_name: MPI_TYPE_CREATE_SUBARRAY
chapter: misc
aliases: [MPI_TYPE_CREATE_SUBARRAY, MPI_Type_create_subarray]
tags: [mpi/function, mpi/misc]
---

# MPI_TYPE_CREATE_SUBARRAY

**C**
```c
int MPI_Type_create_subarray(int ndims, int array_of_sizes[], int array_of_subsizes[], int array_of_starts[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**C++**
```cpp
MPI::Datatype MPI::Datatype::Create_subarray(int ndims, const int array_of_sizes[], const int array_of_subsizes[], const int array_of_starts[], int order) const
```

| Parameter | Intent | Description |
|---|---|---|
| `ndims` | IN | number of array dimensions (positive integer) |
| `array_of_sizes` | IN | number of elements of type `oldtype` in each dimension of the full array (array of positive integers) |
| `array_of_subsizes` | IN | number of elements of type `oldtype` in each dimension of the subarray (array of positive integers) |
| `array_of_starts` | IN | starting coordinates of the subarray in each dimension (array of nonnegative integers) |
| `order` | IN | array storage order flag (state) |
| `oldtype` | IN | array element datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_SUBARRAY(NDIMS, ARRAY_OF_SIZES, ARRAY_OF_SUBSIZES, ARRAY_OF_STARTS, ORDER, OLDTYPE, NEWTYPE, IERROR)
  INTEGER NDIMS, ARRAY_OF_SIZES(*), ARRAY_OF_SUBSIZES(*), ARRAY_OF_STARTS(*), ORDER, OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
