---
title: MPI_COMM_SIZE
c_name: MPI_Comm_size
chapter: context
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_SIZE, MPI_Comm_size]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_SIZE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_COMM_SIZE|MPI-1.3]] · [[versions/v21/API/MPI_COMM_SIZE|MPI-2.1]] Δ · [[versions/v22/API/MPI_COMM_SIZE|MPI-2.2]] · [[versions/v30/API/MPI_COMM_SIZE|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_SIZE|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_SIZE|MPI-4.0]] · [[versions/v41/API/MPI_COMM_SIZE|MPI-4.1]] Δ · [[versions/v50/API/MPI_COMM_SIZE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Comm_size(MPI_Comm comm, int *size)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI::Comm::Get_size() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_size(comm, size, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_size(comm, size, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_COMM_SIZE(COMM, SIZE, IERROR)
    INTEGER COMM, SIZE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |
| `size` | OUT | **MPI-1.3–MPI-2.2:** number of processes in the group of ` comm` (integer)<br>**MPI-3.0–MPI-4.0:** number of processes in the group of `comm` (integer)<br>**MPI-4.1–MPI-5.0:** number of MPI processes in the group of `comm` (integer) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_COMM_SIZE|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_SIZE|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_SIZE|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_SIZE|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_SIZE|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_SIZE|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_SIZE|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_SIZE|API note]] · chapter [[versions/v50/sections/context|context]]
