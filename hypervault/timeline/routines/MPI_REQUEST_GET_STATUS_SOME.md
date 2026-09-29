---
title: MPI_REQUEST_GET_STATUS_SOME
c_name: MPI_Request_get_status_some
chapter: pt2pt
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_REQUEST_GET_STATUS_SOME, MPI_Request_get_status_some]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_REQUEST_GET_STATUS_SOME

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_REQUEST_GET_STATUS_SOME|MPI-4.1]] · [[versions/v50/API/MPI_REQUEST_GET_STATUS_SOME|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1–MPI-5.0**
```c
int MPI_Request_get_status_some(int incount, const MPI_Request array_of_requests[], int *outcount, int array_of_indices[], MPI_Status array_of_statuses[])
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Request_get_status_some(incount, array_of_requests, outcount, array_of_indices, array_of_statuses, ierror)
    INTEGER, INTENT(IN) :: incount
    TYPE(MPI_Request), INTENT(IN) :: array_of_requests(incount)
    INTEGER, INTENT(OUT) :: outcount, array_of_indices(*)
    TYPE(MPI_Status) :: array_of_statuses(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_REQUEST_GET_STATUS_SOME(INCOUNT, ARRAY_OF_REQUESTS, OUTCOUNT, ARRAY_OF_INDICES, ARRAY_OF_STATUSES, IERROR)
    INTEGER INCOUNT, ARRAY_OF_REQUESTS(*), OUTCOUNT, ARRAY_OF_INDICES(*), ARRAY_OF_STATUSES(MPI_STATUS_SIZE, *), IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `incount` | IN | **MPI-4.1:** length of array_of_requests (non-negative integer)<br>**MPI-5.0:** length of array_of_requests (nonnegative integer) |
| `array_of_requests` | IN | **MPI-4.1–MPI-5.0:** array of requests (array of handles) |
| `outcount` | OUT | **MPI-4.1–MPI-5.0:** number of completed requests (integer) |
| `array_of_indices` | OUT | **MPI-4.1–MPI-5.0:** array of indices of operations that completed (array of integers) |
| `array_of_statuses` | OUT | **MPI-4.1–MPI-5.0:** array of status objects for operations that completed (array of status) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_REQUEST_GET_STATUS_SOME|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_REQUEST_GET_STATUS_SOME|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
