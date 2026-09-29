---
title: MPI_COMM_JOIN
c_name: MPI_Comm_join
chapter: dynamic
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_JOIN, MPI_Comm_join]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_COMM_JOIN

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_COMM_JOIN|MPI-2.0]] · [[versions/v21/API/MPI_COMM_JOIN|MPI-2.1]] · [[versions/v22/API/MPI_COMM_JOIN|MPI-2.2]] · [[versions/v30/API/MPI_COMM_JOIN|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_JOIN|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_JOIN|MPI-4.0]] Δ · [[versions/v41/API/MPI_COMM_JOIN|MPI-4.1]] · [[versions/v50/API/MPI_COMM_JOIN|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Comm_join(int fd, MPI_Comm *intercomm)
```

## C++

**MPI-2.0–MPI-2.2**
```c
static MPI::Intercomm MPI::Comm::Join(const int fd)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_join(fd, intercomm, ierror) BIND(C)
    INTEGER, INTENT(IN) :: fd
    TYPE(MPI_Comm), INTENT(OUT) :: intercomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_join(fd, intercomm, ierror)
    INTEGER, INTENT(IN) :: fd
    TYPE(MPI_Comm), INTENT(OUT) :: intercomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_COMM_JOIN(FD, INTERCOMM, IERROR)
    INTEGER FD, INTERCOMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `fd` | IN | **MPI-2.0–MPI-5.0:** socket file descriptor |
| `intercomm` | OUT | **MPI-2.0–MPI-3.1:** new intercommunicator (handle)<br>**MPI-4.0–MPI-5.0:** new inter-communicator (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_COMM_JOIN|API note]] · chapter [[versions/v20/sections/dynamic|dynamic]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_JOIN|API note]] · chapter [[versions/v21/sections/dynamic|dynamic]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_JOIN|API note]] · chapter [[versions/v22/sections/dynamic|dynamic]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_JOIN|API note]] · chapter [[versions/v30/sections/dynamic|dynamic]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_JOIN|API note]] · chapter [[versions/v31/sections/dynamic|dynamic]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_JOIN|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_JOIN|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_JOIN|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]
