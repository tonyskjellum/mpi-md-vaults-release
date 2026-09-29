---
title: MPI_REQUEST_GET_STATUS_ANY
c_name: MPI_Request_get_status_any
chapter: pt2pt
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_REQUEST_GET_STATUS_ANY, MPI_Request_get_status_any]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_REQUEST_GET_STATUS_ANY

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_REQUEST_GET_STATUS_ANY|MPI-4.1]] · [[versions/v50/API/MPI_REQUEST_GET_STATUS_ANY|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1–MPI-5.0**
```c
int MPI_Request_get_status_any(int count, const MPI_Request array_of_requests[], int *index, int *flag, MPI_Status *status)
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Request_get_status_any(count, array_of_requests, index, flag, status, ierror)
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Request), INTENT(IN) :: array_of_requests(count)
    INTEGER, INTENT(OUT) :: index
    LOGICAL, INTENT(OUT) :: flag
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_REQUEST_GET_STATUS_ANY(COUNT, ARRAY_OF_REQUESTS, INDEX, FLAG, STATUS, IERROR)
    INTEGER COUNT, ARRAY_OF_REQUESTS(*), INDEX, STATUS(MPI_STATUS_SIZE), IERROR
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-4.1:** list length (non-negative integer)<br>**MPI-5.0:** list length (nonnegative integer) |
| `array_of_requests` | IN | **MPI-4.1–MPI-5.0:** array of requests (array of handles) |
| `index` | OUT | **MPI-4.1–MPI-5.0:** index of operation that completed or `MPI_UNDEFINED` if none completed (integer) |
| `flag` | OUT | **MPI-4.1–MPI-5.0:** `true` if one of the operations is complete (logical) |
| `status` | OUT | **MPI-4.1–MPI-5.0:** status object if flag is true (status) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_REQUEST_GET_STATUS_ANY|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_REQUEST_GET_STATUS_ANY|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
