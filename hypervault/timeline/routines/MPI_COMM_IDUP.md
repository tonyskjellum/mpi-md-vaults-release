---
title: MPI_COMM_IDUP
c_name: MPI_Comm_idup
chapter: context
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_IDUP, MPI_Comm_idup]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_IDUP

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_COMM_IDUP|MPI-3.0]] · [[versions/v31/API/MPI_COMM_IDUP|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_IDUP|MPI-4.0]] Δ · [[versions/v41/API/MPI_COMM_IDUP|MPI-4.1]] · [[versions/v50/API/MPI_COMM_IDUP|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Comm_idup(MPI_Comm comm, MPI_Comm *newcomm, MPI_Request *request)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Comm_idup(comm, newcomm, request, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_idup(comm, newcomm, request, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Comm), INTENT(OUT), ASYNCHRONOUS :: newcomm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_COMM_IDUP(COMM, NEWCOMM, REQUEST, IERROR)
    INTEGER COMM, NEWCOMM, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-3.0–MPI-5.0:** communicator (handle) |
| `newcomm` | OUT | **MPI-3.0–MPI-3.1:** copy of comm (handle)<br>**MPI-4.0–MPI-5.0:** copy of `comm` (handle) |
| `request` | OUT | **MPI-3.0–MPI-5.0:** communication request (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_COMM_IDUP|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_IDUP|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_IDUP|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_IDUP|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_IDUP|API note]] · chapter [[versions/v50/sections/context|context]]
