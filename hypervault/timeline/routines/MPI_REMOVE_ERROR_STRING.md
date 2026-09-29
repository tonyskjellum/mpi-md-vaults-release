---
title: MPI_REMOVE_ERROR_STRING
c_name: MPI_Remove_error_string
chapter: inquiry
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_REMOVE_ERROR_STRING, MPI_Remove_error_string]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_REMOVE_ERROR_STRING

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_REMOVE_ERROR_STRING|MPI-4.1]] · [[versions/v50/API/MPI_REMOVE_ERROR_STRING|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1–MPI-5.0**
```c
int MPI_Remove_error_string(int errorcode)
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Remove_error_string(errorcode, ierror)
    INTEGER, INTENT(IN) :: errorcode
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_REMOVE_ERROR_STRING(ERRORCODE, IERROR)
    INTEGER ERRORCODE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `errorcode` | IN | **MPI-4.1–MPI-5.0:** error code or class (integer) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_REMOVE_ERROR_STRING|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_REMOVE_ERROR_STRING|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]
