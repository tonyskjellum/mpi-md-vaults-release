---
title: MPI_STATUS_GET_SOURCE
c_name: MPI_Status_get_source
chapter: pt2pt
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_STATUS_GET_SOURCE, MPI_Status_get_source]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_STATUS_GET_SOURCE

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_STATUS_GET_SOURCE|MPI-4.1]] · [[versions/v50/API/MPI_STATUS_GET_SOURCE|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1**
```c
int MPI_Status_get_source(MPI_Status *status, int *source)
```

**MPI-5.0**
```c
int MPI_Status_get_source(const MPI_Status *status, int *source)
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Status_get_source(status, source, ierror)
    TYPE(MPI_Status), INTENT(IN) :: status
    INTEGER, INTENT(OUT) :: source
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_STATUS_GET_SOURCE(STATUS, SOURCE, IERROR)
    INTEGER STATUS(MPI_STATUS_SIZE), SOURCE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `status` | IN | **MPI-4.1–MPI-5.0:** status from which to retrieve source rank (status) |
| `source` | OUT | **MPI-4.1–MPI-5.0:** rank set in the `MPI_SOURCE` field (integer) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_STATUS_GET_SOURCE|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_STATUS_GET_SOURCE|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
