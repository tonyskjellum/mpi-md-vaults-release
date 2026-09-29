---
title: MPI_GET_LIBRARY_VERSION
c_name: MPI_Get_library_version
chapter: inquiry
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GET_LIBRARY_VERSION, MPI_Get_library_version]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_GET_LIBRARY_VERSION

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_GET_LIBRARY_VERSION|MPI-3.0]] · [[versions/v31/API/MPI_GET_LIBRARY_VERSION|MPI-3.1]] Δ · [[versions/v40/API/MPI_GET_LIBRARY_VERSION|MPI-4.0]] Δ · [[versions/v41/API/MPI_GET_LIBRARY_VERSION|MPI-4.1]] · [[versions/v50/API/MPI_GET_LIBRARY_VERSION|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Get_library_version(char *version, int *resultlen)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Get_library_version(version, resulten, ierror) BIND(C)
    CHARACTER(LEN=MPI_MAX_LIBRARY_VERSION_STRING), INTENT(OUT) :: version
    INTEGER, INTENT(OUT) :: resultlen
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Get_library_version(version, resultlen, ierror)
    CHARACTER(LEN=MPI_MAX_LIBRARY_VERSION_STRING), INTENT(OUT) :: version
    INTEGER, INTENT(OUT) :: resultlen
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0**
```fortran
MPI_GET_LIBRARY_VERSION(VERSION, RESULTEN, IERROR)
    CHARACTER*(*) VERSION
    INTEGER RESULTLEN,IERROR
```

**MPI-3.1**
```fortran
MPI_GET_LIBRARY_VERSION(VERSION, RESULTLEN, IERROR)
    CHARACTER*(*) VERSION
    INTEGER RESULTLEN,IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_GET_LIBRARY_VERSION(VERSION, RESULTLEN, IERROR)
    CHARACTER*(*) VERSION
    INTEGER RESULTLEN, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `version` | OUT | **MPI-3.0–MPI-3.1:** version string (string)<br>**MPI-4.0–MPI-5.0:** version number (string) |
| `resultlen` | OUT | **MPI-3.0–MPI-5.0:** Length (in printable characters) of the result returned in `version` (integer) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_GET_LIBRARY_VERSION|API note]] · chapter [[versions/v30/sections/inquiry|inquiry]]
- MPI-3.1: [[versions/v31/API/MPI_GET_LIBRARY_VERSION|API note]] · chapter [[versions/v31/sections/inquiry|inquiry]]
- MPI-4.0: [[versions/v40/API/MPI_GET_LIBRARY_VERSION|API note]] · chapter [[versions/v40/sections/inquiry|inquiry]]
- MPI-4.1: [[versions/v41/API/MPI_GET_LIBRARY_VERSION|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_GET_LIBRARY_VERSION|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]
