---
title: MPI_TYPE_DUP
c_name: MPI_Type_dup
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_DUP, MPI_Type_dup]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_TYPE_DUP

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_DUP|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_DUP|MPI-2.1]] · [[versions/v22/API/MPI_TYPE_DUP|MPI-2.2]] · [[versions/v30/API/MPI_TYPE_DUP|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_DUP|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_DUP|MPI-4.0]] · [[versions/v41/API/MPI_TYPE_DUP|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_DUP|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Type_dup(MPI_Datatype type, MPI_Datatype *newtype)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Type_dup(MPI_Datatype oldtype, MPI_Datatype *newtype)
```

## C++

**MPI-2.0–MPI-2.2**
```c
MPI::Datatype MPI::Datatype::Dup() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_dup(oldtype, newtype, ierror) BIND(C)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Type_dup(oldtype, newtype, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-2.2**
```fortran
MPI_TYPE_DUP(TYPE, NEWTYPE, IERROR)
    INTEGER TYPE, NEWTYPE, IERROR
```

**MPI-3.0–MPI-5.0**
```fortran
MPI_TYPE_DUP(OLDTYPE, NEWTYPE, IERROR)
    INTEGER OLDTYPE, NEWTYPE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `type` | IN | **MPI-2.0–MPI-2.2:** datatype (handle)<br>_MPI-3.0–MPI-5.0: absent_ |
| `newtype` | OUT | **MPI-2.0–MPI-2.2:** copy of `type` (handle)<br>**MPI-3.0–MPI-5.0:** copy of `oldtype` (handle) |
| `oldtype` | IN | _MPI-2.0–MPI-2.2: absent_<br>**MPI-3.0–MPI-5.0:** datatype (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_DUP|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_DUP|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_DUP|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_DUP|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_DUP|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_DUP|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_DUP|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_DUP|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
