---
title: MPI_GET_PROCESSOR_NAME
c_name: MPI_Get_processor_name
chapter: inquiry
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GET_PROCESSOR_NAME, MPI_Get_processor_name]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_GET_PROCESSOR_NAME

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_GET_PROCESSOR_NAME|MPI-1.3]] · [[versions/v21/API/MPI_GET_PROCESSOR_NAME|MPI-2.1]] Δ · [[versions/v22/API/MPI_GET_PROCESSOR_NAME|MPI-2.2]] · [[versions/v30/API/MPI_GET_PROCESSOR_NAME|MPI-3.0]] Δ · [[versions/v31/API/MPI_GET_PROCESSOR_NAME|MPI-3.1]] Δ · [[versions/v40/API/MPI_GET_PROCESSOR_NAME|MPI-4.0]] Δ · [[versions/v41/API/MPI_GET_PROCESSOR_NAME|MPI-4.1]] · [[versions/v50/API/MPI_GET_PROCESSOR_NAME|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Get_processor_name(char *name, int *resultlen)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Get_processor_name(char* name, int& resultlen)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Get_processor_name(name, resultlen, ierror) BIND(C)
    CHARACTER(LEN=MPI_MAX_PROCESSOR_NAME), INTENT(OUT) :: name
    INTEGER, INTENT(OUT) :: resultlen
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Get_processor_name(name, resultlen, ierror)
    CHARACTER(LEN=MPI_MAX_PROCESSOR_NAME), INTENT(OUT) :: name
    INTEGER, INTENT(OUT) :: resultlen
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-3.1**
```fortran
MPI_GET_PROCESSOR_NAME( NAME, RESULTLEN, IERROR)
    CHARACTER*(*) NAME
    INTEGER RESULTLEN,IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_GET_PROCESSOR_NAME(NAME, RESULTLEN, IERROR)
    CHARACTER*(*) NAME
    INTEGER RESULTLEN, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `name` | OUT | **MPI-1.3–MPI-5.0:** A unique specifier for the actual (as opposed to virtual) node. |
| `resultlen` | OUT | **MPI-1.3–MPI-5.0:** Length (in printable characters) of the result returned in `name` |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_GET_PROCESSOR_NAME|API note]] · chapter [[versions/v13/sections/inquiry|inquiry]]
- MPI-2.1: [[versions/v21/API/MPI_GET_PROCESSOR_NAME|API note]] · chapter [[versions/v21/sections/inquiry|inquiry]]
- MPI-2.2: [[versions/v22/API/MPI_GET_PROCESSOR_NAME|API note]] · chapter [[versions/v22/sections/inquiry|inquiry]]
- MPI-3.0: [[versions/v30/API/MPI_GET_PROCESSOR_NAME|API note]] · chapter [[versions/v30/sections/inquiry|inquiry]]
- MPI-3.1: [[versions/v31/API/MPI_GET_PROCESSOR_NAME|API note]] · chapter [[versions/v31/sections/inquiry|inquiry]]
- MPI-4.0: [[versions/v40/API/MPI_GET_PROCESSOR_NAME|API note]] · chapter [[versions/v40/sections/inquiry|inquiry]]
- MPI-4.1: [[versions/v41/API/MPI_GET_PROCESSOR_NAME|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_GET_PROCESSOR_NAME|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]
