---
title: MPI_TYPE_CREATE_F90_INTEGER
c_name: MPI_Type_create_f90_integer
chapter: binding
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_CREATE_F90_INTEGER, MPI_Type_create_f90_integer]
tags: [mpi/routine, mpi/binding]
---

# MPI_TYPE_CREATE_F90_INTEGER

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_CREATE_F90_INTEGER|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_CREATE_F90_INTEGER|MPI-2.1]] · [[versions/v22/API/MPI_TYPE_CREATE_F90_INTEGER|MPI-2.2]] · [[versions/v30/API/MPI_TYPE_CREATE_F90_INTEGER|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_CREATE_F90_INTEGER|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_CREATE_F90_INTEGER|MPI-4.0]] · [[versions/v41/API/MPI_TYPE_CREATE_F90_INTEGER|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_CREATE_F90_INTEGER|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Type_create_f90_integer(int r, MPI_Datatype *newtype)
```

## C++

**MPI-2.0–MPI-2.2**
```c
static MPI::Datatype MPI::Datatype::Create_f90_integer(int r)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_create_f90_integer(r, newtype, ierror) BIND(C)
    INTEGER, INTENT(IN) :: r
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Type_create_f90_integer(r, newtype, ierror)
    INTEGER, INTENT(IN) :: r
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_TYPE_CREATE_F90_INTEGER(R, NEWTYPE, IERROR)
    INTEGER R, NEWTYPE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `r` | IN | **MPI-2.0–MPI-5.0:** decimal exponent range, i.e., number of decimal digits (integer) |
| `newtype` | OUT | **MPI-2.0–MPI-5.0:** the requested MPI datatype (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_CREATE_F90_INTEGER|API note]] · chapter [[versions/v20/sections/binding|binding]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_CREATE_F90_INTEGER|API note]] · chapter [[versions/v21/sections/binding|binding]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_CREATE_F90_INTEGER|API note]] · chapter [[versions/v22/sections/binding|binding]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_CREATE_F90_INTEGER|API note]] · chapter [[versions/v30/sections/binding|binding]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_CREATE_F90_INTEGER|API note]] · chapter [[versions/v31/sections/binding|binding]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_CREATE_F90_INTEGER|API note]] · chapter [[versions/v40/sections/binding|binding]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_CREATE_F90_INTEGER|API note]] · chapter [[versions/v41/sections/binding|binding]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_CREATE_F90_INTEGER|API note]] · chapter [[versions/v50/sections/binding|binding]]
