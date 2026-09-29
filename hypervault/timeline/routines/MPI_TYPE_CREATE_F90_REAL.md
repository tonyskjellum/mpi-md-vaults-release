---
title: MPI_TYPE_CREATE_F90_REAL
c_name: MPI_Type_create_f90_real
chapter: binding
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_CREATE_F90_REAL, MPI_Type_create_f90_real]
tags: [mpi/routine, mpi/binding]
---

# MPI_TYPE_CREATE_F90_REAL

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_CREATE_F90_REAL|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_CREATE_F90_REAL|MPI-2.1]] · [[versions/v22/API/MPI_TYPE_CREATE_F90_REAL|MPI-2.2]] · [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_CREATE_F90_REAL|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_CREATE_F90_REAL|MPI-4.0]] · [[versions/v41/API/MPI_TYPE_CREATE_F90_REAL|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_CREATE_F90_REAL|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Type_create_f90_real(int p, int r, MPI_Datatype *newtype)
```

## C++

**MPI-2.0–MPI-2.2**
```c
static MPI::Datatype MPI::Datatype::Create_f90_real(int p, int r)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_create_f90_real(p, r, newtype, ierror) BIND(C)
    INTEGER, INTENT(IN) :: p, r
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Type_create_f90_real(p, r, newtype, ierror)
    INTEGER, INTENT(IN) :: p, r
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_TYPE_CREATE_F90_REAL(P, R, NEWTYPE, IERROR)
    INTEGER P, R, NEWTYPE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `p` | IN | **MPI-2.0–MPI-5.0:** precision, in decimal digits (integer) |
| `r` | IN | **MPI-2.0–MPI-5.0:** decimal exponent range (integer) |
| `newtype` | OUT | **MPI-2.0–MPI-5.0:** the requested MPI datatype (handle) |

## Named in the change log of

[[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_CREATE_F90_REAL|API note]] · chapter [[versions/v20/sections/binding|binding]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_CREATE_F90_REAL|API note]] · chapter [[versions/v21/sections/binding|binding]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_CREATE_F90_REAL|API note]] · chapter [[versions/v22/sections/binding|binding]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|API note]] · chapter [[versions/v30/sections/binding|binding]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_CREATE_F90_REAL|API note]] · chapter [[versions/v31/sections/binding|binding]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_CREATE_F90_REAL|API note]] · chapter [[versions/v40/sections/binding|binding]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_CREATE_F90_REAL|API note]] · chapter [[versions/v41/sections/binding|binding]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_CREATE_F90_REAL|API note]] · chapter [[versions/v50/sections/binding|binding]]
