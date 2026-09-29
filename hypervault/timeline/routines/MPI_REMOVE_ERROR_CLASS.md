---
title: MPI_REMOVE_ERROR_CLASS
c_name: MPI_Remove_error_class
chapter: inquiry
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_REMOVE_ERROR_CLASS, MPI_Remove_error_class]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_REMOVE_ERROR_CLASS

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_REMOVE_ERROR_CLASS|MPI-4.1]] · [[versions/v50/API/MPI_REMOVE_ERROR_CLASS|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1–MPI-5.0**
```c
int MPI_Remove_error_class(int errorclass)
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Remove_error_class(errorclass, ierror)
    INTEGER, INTENT(IN) :: errorclass
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_REMOVE_ERROR_CLASS(ERRORCLASS, IERROR)
    INTEGER ERRORCLASS, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `errorclass` | IN | **MPI-4.1–MPI-5.0:** value for the error class to remove (integer) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_REMOVE_ERROR_CLASS|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_REMOVE_ERROR_CLASS|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]
