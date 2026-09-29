---
title: MPI_TYPE_FREE
c_name: MPI_Type_free
chapter: datatypes
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_FREE, MPI_Type_free]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_TYPE_FREE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_TYPE_FREE|MPI-1.3]] · [[versions/v21/API/MPI_TYPE_FREE|MPI-2.1]] Δ · [[versions/v22/API/MPI_TYPE_FREE|MPI-2.2]] · [[versions/v30/API/MPI_TYPE_FREE|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_FREE|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_FREE|MPI-4.0]] · [[versions/v41/API/MPI_TYPE_FREE|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_FREE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Type_free(MPI_Datatype *datatype)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Datatype::Free()
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_free(datatype, ierror) BIND(C)
    TYPE(MPI_Datatype), INTENT(INOUT) :: datatype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Type_free(datatype, ierror)
    TYPE(MPI_Datatype), INTENT(INOUT) :: datatype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_TYPE_FREE(DATATYPE, IERROR)
    INTEGER DATATYPE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `datatype` | INOUT | **MPI-1.3–MPI-5.0:** datatype that is freed (handle) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_TYPE_FREE|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_FREE|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_FREE|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_FREE|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_FREE|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_FREE|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_FREE|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_FREE|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
