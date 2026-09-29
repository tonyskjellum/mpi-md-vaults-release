---
title: MPI_TYPE_INDEXED
c_name: MPI_Type_indexed
chapter: datatypes
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_INDEXED, MPI_Type_indexed]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_TYPE_INDEXED

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_TYPE_INDEXED|MPI-1.3]] · [[versions/v21/API/MPI_TYPE_INDEXED|MPI-2.1]] Δ · [[versions/v22/API/MPI_TYPE_INDEXED|MPI-2.2]] Δ · [[versions/v30/API/MPI_TYPE_INDEXED|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_INDEXED|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_INDEXED|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_INDEXED|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_INDEXED|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Type_indexed(int count, int *array_of_blocklengths, int *array_of_displacements, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Type_indexed(int count, const int array_of_blocklengths[], const int array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Type_indexed(int count, const int array_of_blocklengths[], const int array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
int MPI_Type_indexed_c(MPI_Count count, const MPI_Count array_of_blocklengths[], const MPI_Count array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
MPI::Datatype MPI::Datatype::Create_indexed(int count, const int array_of_blocklengths[], const int array_of_displacements[]) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_indexed(count, array_of_blocklengths, array_of_displacements, oldtype, newtype, ierror) BIND(C)
    INTEGER, INTENT(IN) :: count, array_of_blocklengths(count), array_of_displacements(count)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Type_indexed(count, array_of_blocklengths, array_of_displacements, oldtype, newtype, ierror)
    INTEGER, INTENT(IN) :: count, array_of_blocklengths(count),
    array_of_displacements(count)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Type_indexed(count, array_of_blocklengths, array_of_displacements, oldtype, newtype, ierror)
    INTEGER, INTENT(IN) :: count, array_of_blocklengths(count), array_of_displacements(count)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Type_indexed(count, array_of_blocklengths, array_of_displacements, oldtype, newtype, ierror) !(_c)
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count, array_of_blocklengths(count), array_of_displacements(count)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-3.0**
```fortran
MPI_TYPE_INDEXED(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, OLDTYPE, NEWTYPE, IERROR)
    INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_DISPLACEMENTS(*), OLDTYPE, NEWTYPE, IERROR
```

**MPI-3.1**
```fortran
MPI_TYPE_INDEXED(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, OLDTYPE, NEWTYPE, IERROR)
    INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_DISPLACEMENTS(*),
    OLDTYPE, NEWTYPE, IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_TYPE_INDEXED(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, OLDTYPE, NEWTYPE, IERROR)
    INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_DISPLACEMENTS(*), OLDTYPE, NEWTYPE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-1.3–MPI-2.1:** number of blocks -- also number of entries in `array_of_displacements` and `array_of_blocklengths` (nonnegative integer)<br>**MPI-2.2:** number of blocks -- also number of entries in `array_of_displacements` and `array_of_blocklengths` (non-negative integer)<br>**MPI-3.0–MPI-3.1:** number of blocks --- also number of entries in `array_of_displacements` and `array_of_blocklengths` (non-negative integer)<br>**MPI-4.0–MPI-4.1:** number of blocks---also number of entries in `array_of_displacements` and `array_of_blocklengths` (non-negative integer)<br>**MPI-5.0:** number of blocks---also number of entries in `array_of_displacements` and `array_of_blocklengths` (nonnegative integer) |
| `array_of_blocklengths` | IN | **MPI-1.3–MPI-2.1:** number of elements per block (array of nonnegative integers)<br>**MPI-2.2–MPI-4.1:** number of elements per block (array of non-negative integers)<br>**MPI-5.0:** number of elements per block (array of nonnegative integers) |
| `array_of_displacements` | IN | **MPI-1.3–MPI-3.1:** displacement for each block, in multiples of `oldtype` extent (array of integer)<br>**MPI-4.0–MPI-5.0:** displacement for each block, in multiples of `oldtype` (array of integers) |
| `oldtype` | IN | **MPI-1.3–MPI-5.0:** old datatype (handle) |
| `newtype` | OUT | **MPI-1.3–MPI-5.0:** new datatype (handle) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_TYPE_INDEXED|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_INDEXED|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_INDEXED|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_INDEXED|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_INDEXED|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_INDEXED|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_INDEXED|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_INDEXED|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
