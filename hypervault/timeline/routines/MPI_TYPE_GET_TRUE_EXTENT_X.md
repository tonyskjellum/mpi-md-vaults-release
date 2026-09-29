---
title: MPI_TYPE_GET_TRUE_EXTENT_X
c_name: MPI_Type_get_true_extent_x
chapter: deprecated
introduced: "MPI-3.0"
deprecated: "MPI-4.1"
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_GET_TRUE_EXTENT_X, MPI_Type_get_true_extent_x]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_TYPE_GET_TRUE_EXTENT_X

**Introduced** in MPI-3.0 · **deprecated** in MPI-4.1.

Releases: [[versions/v30/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI-3.0]] · [[versions/v31/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI-4.1]] † · [[versions/v50/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI-5.0]] †

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Type_get_true_extent_x(MPI_Datatype datatype, MPI_Count *true_lb, MPI_Count *true_extent)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Type_get_true_extent_x(datatype, true_lb, true_extent, ierror) BIND(C)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND = MPI_COUNT_KIND), INTENT(OUT) :: true_lb, true_extent
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Type_get_true_extent_x(datatype, true_lb, true_extent, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: true_lb, true_extent
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0**
```fortran
MPI_TYPE_GET_TRUE_EXTENT_X(DATATYPE, TRUE_LB, TRUE_EXTENT, IERROR)
    INTEGER DATATYPE, IERROR
    INTEGER(KIND = MPI_COUNT_KIND) TRUE_LB, TRUE_EXTENT
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_TYPE_GET_TRUE_EXTENT_X(DATATYPE, TRUE_LB, TRUE_EXTENT, IERROR)
    INTEGER DATATYPE, IERROR
    INTEGER(KIND=MPI_COUNT_KIND) TRUE_LB, TRUE_EXTENT
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `datatype` | IN | **MPI-3.0–MPI-5.0:** datatype to get information on (handle) |
| `true_lb` | OUT | **MPI-3.0–MPI-5.0:** true lower bound of datatype (integer) |
| `true_extent` | OUT | **MPI-3.0–MPI-3.1:** true size of datatype (integer)<br>**MPI-4.0–MPI-5.0:** true extent of datatype (integer) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_TYPE_GET_TRUE_EXTENT_X|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_GET_TRUE_EXTENT_X|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_GET_TRUE_EXTENT_X|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_GET_TRUE_EXTENT_X|API note]] · chapter [[versions/v41/sections/deprecated|deprecated]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_GET_TRUE_EXTENT_X|API note]] · chapter [[versions/v50/sections/deprecated|deprecated]]
