---
title: MPI_REQUEST_GET_STATUS_ALL
c_name: MPI_Request_get_status_all
chapter: pt2pt
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_REQUEST_GET_STATUS_ALL, MPI_Request_get_status_all]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_REQUEST_GET_STATUS_ALL

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_REQUEST_GET_STATUS_ALL|MPI-4.1]] · [[versions/v50/API/MPI_REQUEST_GET_STATUS_ALL|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1–MPI-5.0**
```c
int MPI_Request_get_status_all(int count, const MPI_Request array_of_requests[], int *flag, MPI_Status array_of_statuses[])
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Request_get_status_all(count, array_of_requests, flag, array_of_statuses, ierror)
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Request), INTENT(IN) :: array_of_requests(count)
    LOGICAL, INTENT(OUT) :: flag
    TYPE(MPI_Status) :: array_of_statuses(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_REQUEST_GET_STATUS_ALL(COUNT, ARRAY_OF_REQUESTS, FLAG, ARRAY_OF_STATUSES, IERROR)
    INTEGER COUNT, ARRAY_OF_REQUESTS(*), ARRAY_OF_STATUSES(MPI_STATUS_SIZE, *), IERROR
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-4.1:** list length (non-negative integer)<br>**MPI-5.0:** list length (nonnegative integer) |
| `array_of_requests` | IN | **MPI-4.1–MPI-5.0:** array of requests (array of handles) |
| `flag` | OUT | **MPI-4.1–MPI-5.0:** true if all of the operations are complete (logical) |
| `array_of_statuses` | OUT | **MPI-4.1–MPI-5.0:** array of status objects (array of status) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_REQUEST_GET_STATUS_ALL|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_REQUEST_GET_STATUS_ALL|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
