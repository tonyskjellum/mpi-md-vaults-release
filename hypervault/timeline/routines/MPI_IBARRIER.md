---
title: MPI_IBARRIER
c_name: MPI_Ibarrier
chapter: coll
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_IBARRIER, MPI_Ibarrier]
tags: [mpi/routine, mpi/coll]
---

# MPI_IBARRIER

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_IBARRIER|MPI-3.0]] · [[versions/v31/API/MPI_IBARRIER|MPI-3.1]] Δ · [[versions/v40/API/MPI_IBARRIER|MPI-4.0]] · [[versions/v41/API/MPI_IBARRIER|MPI-4.1]] · [[versions/v50/API/MPI_IBARRIER|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Ibarrier(MPI_Comm comm, MPI_Request *request)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Ibarrier(comm, request, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Ibarrier(comm, request, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_IBARRIER(COMM, REQUEST, IERROR)
    INTEGER COMM, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-3.0–MPI-5.0:** communicator (handle) |
| `request` | OUT | **MPI-3.0–MPI-5.0:** communication request (handle) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_IBARRIER|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_IBARRIER|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_IBARRIER|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_IBARRIER|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_IBARRIER|API note]] · chapter [[versions/v50/sections/coll|coll]]
