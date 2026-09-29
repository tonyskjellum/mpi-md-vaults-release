---
title: MPI_STATUS_SET_TAG
c_name: MPI_Status_set_tag
chapter: ei
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_STATUS_SET_TAG, MPI_Status_set_tag]
tags: [mpi/routine, mpi/ei]
---

# MPI_STATUS_SET_TAG

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_STATUS_SET_TAG|MPI-4.1]] · [[versions/v50/API/MPI_STATUS_SET_TAG|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1–MPI-5.0**
```c
int MPI_Status_set_tag(MPI_Status *status, int tag)
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Status_set_tag(status, tag, ierror)
    TYPE(MPI_Status), INTENT(INOUT) :: status
    INTEGER, INTENT(IN) :: tag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_STATUS_SET_TAG(STATUS, TAG, IERROR)
    INTEGER STATUS(MPI_STATUS_SIZE), TAG, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `status` | INOUT | **MPI-4.1–MPI-5.0:** status with which to associate tag (status) |
| `tag` | IN | **MPI-4.1–MPI-5.0:** tag to set in the `MPI_TAG` field (integer) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_STATUS_SET_TAG|API note]] · chapter [[versions/v41/sections/ei|ei]]
- MPI-5.0: [[versions/v50/API/MPI_STATUS_SET_TAG|API note]] · chapter [[versions/v50/sections/ei|ei]]
