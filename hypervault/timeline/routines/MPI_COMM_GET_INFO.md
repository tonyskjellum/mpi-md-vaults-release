---
title: MPI_COMM_GET_INFO
c_name: MPI_Comm_get_info
chapter: context
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_GET_INFO, MPI_Comm_get_info]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_GET_INFO

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_COMM_GET_INFO|MPI-3.0]] · [[versions/v31/API/MPI_COMM_GET_INFO|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_GET_INFO|MPI-4.0]] · [[versions/v41/API/MPI_COMM_GET_INFO|MPI-4.1]] · [[versions/v50/API/MPI_COMM_GET_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Comm_get_info(MPI_Comm comm, MPI_Info *info_used)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Comm_get_info(comm, info_used, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(OUT) :: info_used
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_get_info(comm, info_used, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(OUT) :: info_used
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_COMM_GET_INFO(COMM, INFO_USED, IERROR)
    INTEGER COMM, INFO_USED, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-3.0–MPI-5.0:** communicator object (handle) |
| `info_used` | OUT | **MPI-3.0–MPI-5.0:** new info object (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_COMM_GET_INFO|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_GET_INFO|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_GET_INFO|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_GET_INFO|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_GET_INFO|API note]] · chapter [[versions/v50/sections/context|context]]
