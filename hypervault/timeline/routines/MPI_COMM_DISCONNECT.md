---
title: MPI_COMM_DISCONNECT
c_name: MPI_Comm_disconnect
chapter: dynamic
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_DISCONNECT, MPI_Comm_disconnect]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_COMM_DISCONNECT

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_COMM_DISCONNECT|MPI-2.0]] · [[versions/v21/API/MPI_COMM_DISCONNECT|MPI-2.1]] · [[versions/v22/API/MPI_COMM_DISCONNECT|MPI-2.2]] · [[versions/v30/API/MPI_COMM_DISCONNECT|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_DISCONNECT|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_DISCONNECT|MPI-4.0]] · [[versions/v41/API/MPI_COMM_DISCONNECT|MPI-4.1]] · [[versions/v50/API/MPI_COMM_DISCONNECT|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Comm_disconnect(MPI_Comm *comm)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Comm::Disconnect()
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_disconnect(comm, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(INOUT) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_disconnect(comm, ierror)
    TYPE(MPI_Comm), INTENT(INOUT) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_COMM_DISCONNECT(COMM, IERROR)
    INTEGER COMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | INOUT | **MPI-2.0–MPI-5.0:** communicator (handle) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_COMM_DISCONNECT|API note]] · chapter [[versions/v20/sections/dynamic|dynamic]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_DISCONNECT|API note]] · chapter [[versions/v21/sections/dynamic|dynamic]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_DISCONNECT|API note]] · chapter [[versions/v22/sections/dynamic|dynamic]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_DISCONNECT|API note]] · chapter [[versions/v30/sections/dynamic|dynamic]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_DISCONNECT|API note]] · chapter [[versions/v31/sections/dynamic|dynamic]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_DISCONNECT|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_DISCONNECT|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_DISCONNECT|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]
