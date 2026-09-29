---
title: MPI_TYPE_CREATE_HVECTOR
c_name: MPI_Type_create_hvector
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_CREATE_HVECTOR, MPI_Type_create_hvector]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_TYPE_CREATE_HVECTOR

**Introduced** in MPI-2.0 · **continues** [[timeline/routines/MPI_TYPE_HVECTOR|MPI_TYPE_HVECTOR]].

Releases: [[versions/v20/API/MPI_TYPE_CREATE_HVECTOR|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_CREATE_HVECTOR|MPI-2.1]] Δ · [[versions/v22/API/MPI_TYPE_CREATE_HVECTOR|MPI-2.2]] Δ · [[versions/v30/API/MPI_TYPE_CREATE_HVECTOR|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_CREATE_HVECTOR|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_CREATE_HVECTOR|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_CREATE_HVECTOR|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_CREATE_HVECTOR|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-3.1**
```c
int MPI_Type_create_hvector(int count, int blocklength, MPI_Aint stride, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Type_create_hvector(int count, int blocklength, MPI_Aint stride, MPI_Datatype oldtype, MPI_Datatype *newtype)
int MPI_Type_create_hvector_c(MPI_Count count, MPI_Count blocklength, MPI_Count stride, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

## C++

**MPI-2.0–MPI-2.2**
```c
MPI::Datatype MPI::Datatype::Create_hvector(int count, int blocklength, MPI::Aint stride) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_create_hvector(count, blocklength, stride, oldtype, newtype, ierror) BIND(C)
    INTEGER, INTENT(IN) :: count, blocklength
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: stride
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Type_create_hvector(count, blocklength, stride, oldtype, newtype, ierror)
    INTEGER, INTENT(IN) :: count, blocklength
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: stride
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Type_create_hvector(count, blocklength, stride, oldtype, newtype, ierror)
    INTEGER, INTENT(IN) :: count, blocklength
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: stride
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Type_create_hvector(count, blocklength, stride, oldtype, newtype, ierror) !(_c)
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count, blocklength, stride
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0**
```fortran
MPI_TYPE_CREATE_HVECTOR(COUNT, BLOCKLENGTH, STIDE, OLDTYPE, NEWTYPE, IERROR)
    INTEGER COUNT, BLOCKLENGTH, OLDTYPE, NEWTYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) STRIDE
```

**MPI-2.1–MPI-5.0**
```fortran
MPI_TYPE_CREATE_HVECTOR(COUNT, BLOCKLENGTH, STRIDE, OLDTYPE, NEWTYPE, IERROR)
    INTEGER COUNT, BLOCKLENGTH, OLDTYPE, NEWTYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) STRIDE
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-2.0–MPI-2.1:** number of blocks (nonnegative integer)<br>**MPI-2.2–MPI-4.1:** number of blocks (non-negative integer)<br>**MPI-5.0:** number of blocks (nonnegative integer) |
| `blocklength` | IN | **MPI-2.0–MPI-2.1:** number of elements in each block (nonnegative integer)<br>**MPI-2.2–MPI-4.1:** number of elements in each block (non-negative integer)<br>**MPI-5.0:** number of elements in each block (nonnegative integer) |
| `stride` | IN | **MPI-2.0–MPI-5.0:** number of bytes between start of each block (integer) |
| `oldtype` | IN | **MPI-2.0–MPI-5.0:** old datatype (handle) |
| `newtype` | OUT | **MPI-2.0–MPI-5.0:** new datatype (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_CREATE_HVECTOR|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_CREATE_HVECTOR|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_CREATE_HVECTOR|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_CREATE_HVECTOR|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_CREATE_HVECTOR|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_CREATE_HVECTOR|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_CREATE_HVECTOR|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_CREATE_HVECTOR|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
