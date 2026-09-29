---
title: MPI_TYPE_CREATE_RESIZED
c_name: MPI_Type_create_resized
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_CREATE_RESIZED, MPI_Type_create_resized]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_TYPE_CREATE_RESIZED

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_CREATE_RESIZED|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_CREATE_RESIZED|MPI-2.1]] Δ · [[versions/v22/API/MPI_TYPE_CREATE_RESIZED|MPI-2.2]] · [[versions/v30/API/MPI_TYPE_CREATE_RESIZED|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_CREATE_RESIZED|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_CREATE_RESIZED|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_CREATE_RESIZED|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_CREATE_RESIZED|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-3.1**
```c
int MPI_Type_create_resized(MPI_Datatype oldtype, MPI_Aint lb, MPI_Aint extent, MPI_Datatype *newtype)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Type_create_resized(MPI_Datatype oldtype, MPI_Aint lb, MPI_Aint extent, MPI_Datatype *newtype)
int MPI_Type_create_resized_c(MPI_Datatype oldtype, MPI_Count lb, MPI_Count extent, MPI_Datatype *newtype)
```

## C++

**MPI-2.0**
```c
MPI::Datatype MPI::Datatype::Resized(const MPI::Aint lb, const MPI::Aint extent) const
```

**MPI-2.1–MPI-2.2**
```c
MPI::Datatype MPI::Datatype::Create_resized(const MPI::Aint lb, const MPI::Aint extent) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_create_resized(oldtype, lb, extent, newtype, ierror) BIND(C)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: lb, extent
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Type_create_resized(oldtype, lb, extent, newtype, ierror)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: lb, extent
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Type_create_resized(oldtype, lb, extent, newtype, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: lb, extent
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Type_create_resized(oldtype, lb, extent, newtype, ierror) !(_c)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: lb, extent
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_TYPE_CREATE_RESIZED(OLDTYPE, LB, EXTENT, NEWTYPE, IERROR)
    INTEGER OLDTYPE, NEWTYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) LB, EXTENT
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `oldtype` | IN | **MPI-2.0–MPI-5.0:** input datatype (handle) |
| `lb` | IN | **MPI-2.0–MPI-5.0:** new lower bound of datatype (integer) |
| `extent` | IN | **MPI-2.0–MPI-5.0:** new extent of datatype (integer) |
| `newtype` | OUT | **MPI-2.0–MPI-5.0:** output datatype (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_CREATE_RESIZED|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_CREATE_RESIZED|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_CREATE_RESIZED|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_CREATE_RESIZED|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_CREATE_RESIZED|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_CREATE_RESIZED|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_CREATE_RESIZED|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_CREATE_RESIZED|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
