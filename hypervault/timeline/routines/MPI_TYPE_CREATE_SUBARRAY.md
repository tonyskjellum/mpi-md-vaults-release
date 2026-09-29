---
title: MPI_TYPE_CREATE_SUBARRAY
c_name: MPI_Type_create_subarray
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_CREATE_SUBARRAY, MPI_Type_create_subarray]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_TYPE_CREATE_SUBARRAY

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_CREATE_SUBARRAY|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_CREATE_SUBARRAY|MPI-2.1]] · [[versions/v22/API/MPI_TYPE_CREATE_SUBARRAY|MPI-2.2]] Δ · [[versions/v30/API/MPI_TYPE_CREATE_SUBARRAY|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_CREATE_SUBARRAY|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_CREATE_SUBARRAY|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_CREATE_SUBARRAY|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_CREATE_SUBARRAY|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Type_create_subarray(int ndims, int array_of_sizes[], int array_of_subsizes[], int array_of_starts[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Type_create_subarray(int ndims, const int array_of_sizes[], const int array_of_subsizes[], const int array_of_starts[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Type_create_subarray(int ndims, const int array_of_sizes[], const int array_of_subsizes[], const int array_of_starts[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
int MPI_Type_create_subarray_c(int ndims, const MPI_Count array_of_sizes[], const MPI_Count array_of_subsizes[], const MPI_Count array_of_starts[], int order, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

## C++

**MPI-2.0–MPI-2.2**
```c
MPI::Datatype MPI::Datatype::Create_subarray(int ndims, const int array_of_sizes[], const int array_of_subsizes[], const int array_of_starts[], int order) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_create_subarray(ndims, array_of_sizes, array_of_subsizes, array_of_starts, order, oldtype, newtype, ierror) BIND(C)
    INTEGER, INTENT(IN) :: ndims, array_of_sizes(ndims), array_of_subsizes(ndims), array_of_starts(ndims), order
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Type_create_subarray(ndims, array_of_sizes, array_of_subsizes, array_of_starts, order, oldtype, newtype, ierror)
    INTEGER, INTENT(IN) :: ndims, array_of_sizes(ndims),
    array_of_subsizes(ndims), array_of_starts(ndims), order
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Type_create_subarray(ndims, array_of_sizes, array_of_subsizes, array_of_starts, order, oldtype, newtype, ierror)
    INTEGER, INTENT(IN) :: ndims, array_of_sizes(ndims), array_of_subsizes(ndims), array_of_starts(ndims), order
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Type_create_subarray(ndims, array_of_sizes, array_of_subsizes, array_of_starts, order, oldtype, newtype, ierror) !(_c)
    INTEGER, INTENT(IN) :: ndims, order
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: array_of_sizes(ndims), array_of_subsizes(ndims), array_of_starts(ndims)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.0**
```fortran
MPI_TYPE_CREATE_SUBARRAY(NDIMS, ARRAY_OF_SIZES, ARRAY_OF_SUBSIZES, ARRAY_OF_STARTS, ORDER, OLDTYPE, NEWTYPE, IERROR)
    INTEGER NDIMS, ARRAY_OF_SIZES(*), ARRAY_OF_SUBSIZES(*), ARRAY_OF_STARTS(*), ORDER, OLDTYPE, NEWTYPE, IERROR
```

**MPI-3.1**
```fortran
MPI_TYPE_CREATE_SUBARRAY(NDIMS, ARRAY_OF_SIZES, ARRAY_OF_SUBSIZES, ARRAY_OF_STARTS, ORDER, OLDTYPE, NEWTYPE, IERROR)
    INTEGER NDIMS, ARRAY_OF_SIZES(*), ARRAY_OF_SUBSIZES(*),
    ARRAY_OF_STARTS(*), ORDER, OLDTYPE, NEWTYPE, IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_TYPE_CREATE_SUBARRAY(NDIMS, ARRAY_OF_SIZES, ARRAY_OF_SUBSIZES, ARRAY_OF_STARTS, ORDER, OLDTYPE, NEWTYPE, IERROR)
    INTEGER NDIMS, ARRAY_OF_SIZES(*), ARRAY_OF_SUBSIZES(*), ARRAY_OF_STARTS(*), ORDER, OLDTYPE, NEWTYPE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `ndims` | IN | **MPI-2.0–MPI-5.0:** number of array dimensions (positive integer) |
| `array_of_sizes` | IN | **MPI-2.0–MPI-5.0:** number of elements of type `oldtype` in each dimension of the full array (array of positive integers) |
| `array_of_subsizes` | IN | **MPI-2.0–MPI-5.0:** number of elements of type `oldtype` in each dimension of the subarray (array of positive integers) |
| `array_of_starts` | IN | **MPI-2.0–MPI-2.1:** starting coordinates of the subarray in each dimension (array of nonnegative integers)<br>**MPI-2.2–MPI-4.1:** starting coordinates of the subarray in each dimension (array of non-negative integers)<br>**MPI-5.0:** starting coordinates of the subarray in each dimension (array of nonnegative integers) |
| `order` | IN | **MPI-2.0–MPI-5.0:** array storage order flag (state) |
| `oldtype` | IN | **MPI-2.0–MPI-3.1:** array element datatype (handle)<br>**MPI-4.0–MPI-5.0:** old datatype (handle) |
| `newtype` | OUT | **MPI-2.0–MPI-5.0:** new datatype (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_CREATE_SUBARRAY|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_CREATE_SUBARRAY|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_CREATE_SUBARRAY|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_CREATE_SUBARRAY|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_CREATE_SUBARRAY|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_CREATE_SUBARRAY|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_CREATE_SUBARRAY|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_CREATE_SUBARRAY|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
