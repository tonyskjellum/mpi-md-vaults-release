---
title: MPI_TYPE_CREATE_DARRAY
c_name: MPI_Type_create_darray
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_CREATE_DARRAY, MPI_Type_create_darray]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_TYPE_CREATE_DARRAY

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_CREATE_DARRAY|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_CREATE_DARRAY|MPI-2.1]] · [[versions/v22/API/MPI_TYPE_CREATE_DARRAY|MPI-2.2]] Δ · [[versions/v30/API/MPI_TYPE_CREATE_DARRAY|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_CREATE_DARRAY|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_CREATE_DARRAY|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_CREATE_DARRAY|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_CREATE_DARRAY|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Type_create_darray(int size, int rank, int ndims, int array_of_gsizes[], int array_of_distribs[], int array_of_dargs[], int array_of_psizes[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Type_create_darray(int size, int rank, int ndims, const int array_of_gsizes[], const int array_of_distribs[], const int array_of_dargs[], const int array_of_psizes[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Type_create_darray(int size, int rank, int ndims, const int array_of_gsizes[], const int array_of_distribs[], const int array_of_dargs[], const int array_of_psizes[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
int MPI_Type_create_darray_c(int size, int rank, int ndims, const MPI_Count array_of_gsizes[], const int array_of_distribs[], const int array_of_dargs[], const int array_of_psizes[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

## C++

**MPI-2.0–MPI-2.2**
```c
MPI::Datatype MPI::Datatype::Create_darray(int size, int rank, int ndims, const int array_of_gsizes[], const int array_of_distribs[], const int array_of_dargs[], const int array_of_psizes[], int order) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_create_darray(size, rank, ndims, array_of_gsizes, array_of_distribs, array_of_dargs, array_of_psizes, order, oldtype, newtype, ierror) BIND(C)
    INTEGER, INTENT(IN) :: size, rank, ndims, array_of_gsizes(ndims), array_of_distribs(ndims), array_of_dargs(ndims), array_of_psizes(ndims), order
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Type_create_darray(size, rank, ndims, array_of_gsizes, array_of_distribs, array_of_dargs, array_of_psizes, order, oldtype, newtype, ierror)
    INTEGER, INTENT(IN) :: size, rank, ndims, array_of_gsizes(ndims),
    array_of_distribs(ndims), array_of_dargs(ndims),
    array_of_psizes(ndims), order
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Type_create_darray(size, rank, ndims, array_of_gsizes, array_of_distribs, array_of_dargs, array_of_psizes, order, oldtype, newtype, ierror)
    INTEGER, INTENT(IN) :: size, rank, ndims, array_of_gsizes(ndims), array_of_distribs(ndims), array_of_dargs(ndims), array_of_psizes(ndims), order
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Type_create_darray(size, rank, ndims, array_of_gsizes, array_of_distribs, array_of_dargs, array_of_psizes, order, oldtype, newtype, ierror) !(_c)
    INTEGER, INTENT(IN) :: size, rank, ndims, array_of_distribs(ndims), array_of_dargs(ndims), array_of_psizes(ndims), order
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: array_of_gsizes(ndims)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.0**
```fortran
MPI_TYPE_CREATE_DARRAY(SIZE, RANK, NDIMS, ARRAY_OF_GSIZES, ARRAY_OF_DISTRIBS, ARRAY_OF_DARGS, ARRAY_OF_PSIZES, ORDER, OLDTYPE, NEWTYPE, IERROR)
    INTEGER SIZE, RANK, NDIMS, ARRAY_OF_GSIZES(*), ARRAY_OF_DISTRIBS(*), ARRAY_OF_DARGS(*), ARRAY_OF_PSIZES(*), ORDER, OLDTYPE, NEWTYPE, IERROR
```

**MPI-3.1**
```fortran
MPI_TYPE_CREATE_DARRAY(SIZE, RANK, NDIMS, ARRAY_OF_GSIZES, ARRAY_OF_DISTRIBS, ARRAY_OF_DARGS, ARRAY_OF_PSIZES, ORDER, OLDTYPE, NEWTYPE, IERROR)
    INTEGER SIZE, RANK, NDIMS, ARRAY_OF_GSIZES(*), ARRAY_OF_DISTRIBS(*),
    ARRAY_OF_DARGS(*), ARRAY_OF_PSIZES(*), ORDER, OLDTYPE, NEWTYPE,
    IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_TYPE_CREATE_DARRAY(SIZE, RANK, NDIMS, ARRAY_OF_GSIZES, ARRAY_OF_DISTRIBS, ARRAY_OF_DARGS, ARRAY_OF_PSIZES, ORDER, OLDTYPE, NEWTYPE, IERROR)
    INTEGER SIZE, RANK, NDIMS, ARRAY_OF_GSIZES(*), ARRAY_OF_DISTRIBS(*), ARRAY_OF_DARGS(*), ARRAY_OF_PSIZES(*), ORDER, OLDTYPE, NEWTYPE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `size` | IN | **MPI-2.0–MPI-5.0:** size of process group (positive integer) |
| `rank` | IN | **MPI-2.0–MPI-2.1:** rank in process group (nonnegative integer)<br>**MPI-2.2–MPI-4.1:** rank in process group (non-negative integer)<br>**MPI-5.0:** rank in process group (nonnegative integer) |
| `ndims` | IN | **MPI-2.0–MPI-5.0:** number of array dimensions as well as process grid dimensions (positive integer) |
| `array_of_gsizes` | IN | **MPI-2.0–MPI-5.0:** number of elements of type `oldtype` in each dimension of global array (array of positive integers) |
| `array_of_distribs` | IN | **MPI-2.0–MPI-3.1:** distribution of array in each dimension (array of state)<br>**MPI-4.0–MPI-5.0:** distribution of array in each dimension (array of states) |
| `array_of_dargs` | IN | **MPI-2.0–MPI-5.0:** distribution argument in each dimension (array of positive integers) |
| `array_of_psizes` | IN | **MPI-2.0–MPI-5.0:** size of process grid in each dimension (array of positive integers) |
| `order` | IN | **MPI-2.0–MPI-5.0:** array storage order flag (state) |
| `oldtype` | IN | **MPI-2.0–MPI-5.0:** old datatype (handle) |
| `newtype` | OUT | **MPI-2.0–MPI-5.0:** new datatype (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_CREATE_DARRAY|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_CREATE_DARRAY|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_CREATE_DARRAY|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_CREATE_DARRAY|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_CREATE_DARRAY|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_CREATE_DARRAY|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_CREATE_DARRAY|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_CREATE_DARRAY|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
