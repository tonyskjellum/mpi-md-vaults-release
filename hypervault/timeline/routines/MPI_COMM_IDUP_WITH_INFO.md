---
title: MPI_COMM_IDUP_WITH_INFO
c_name: MPI_Comm_idup_with_info
chapter: context
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_IDUP_WITH_INFO, MPI_Comm_idup_with_info]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_IDUP_WITH_INFO

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI-4.0]] · [[versions/v41/API/MPI_COMM_IDUP_WITH_INFO|MPI-4.1]] · [[versions/v50/API/MPI_COMM_IDUP_WITH_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Comm_idup_with_info(MPI_Comm comm, MPI_Info info, MPI_Comm *newcomm, MPI_Request *request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Comm_idup_with_info(comm, info, newcomm, request, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(OUT), ASYNCHRONOUS :: newcomm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_COMM_IDUP_WITH_INFO(COMM, INFO, NEWCOMM, REQUEST, IERROR)
    INTEGER COMM, INFO, NEWCOMM, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-4.0–MPI-5.0:** communicator (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info object (handle) |
| `newcomm` | OUT | **MPI-4.0–MPI-5.0:** copy of `comm` (handle) |
| `request` | OUT | **MPI-4.0–MPI-5.0:** communication request (handle) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_IDUP_WITH_INFO|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_IDUP_WITH_INFO|API note]] · chapter [[versions/v50/sections/context|context]]
