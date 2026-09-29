---
title: MPI_COMM_RANK
c_name: MPI_Comm_rank
chapter: context
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_RANK, MPI_Comm_rank]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_RANK

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_COMM_RANK|MPI-1.3]] · [[versions/v21/API/MPI_COMM_RANK|MPI-2.1]] Δ · [[versions/v22/API/MPI_COMM_RANK|MPI-2.2]] · [[versions/v30/API/MPI_COMM_RANK|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_RANK|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_RANK|MPI-4.0]] Δ · [[versions/v41/API/MPI_COMM_RANK|MPI-4.1]] Δ · [[versions/v50/API/MPI_COMM_RANK|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Comm_rank(MPI_Comm comm, int *rank)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI::Comm::Get_rank() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_rank(comm, rank, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: rank
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_rank(comm, rank, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: rank
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_COMM_RANK(COMM, RANK, IERROR)
    INTEGER COMM, RANK, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |
| `rank` | OUT | **MPI-1.3–MPI-3.1:** rank of the calling process in group of ` comm` (integer)<br>**MPI-4.0:** rank of the calling process in group of `comm` (integer)<br>**MPI-4.1–MPI-5.0:** rank of the calling MPI process in group of `comm` (integer) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_COMM_RANK|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_RANK|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_RANK|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_RANK|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_RANK|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_RANK|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_RANK|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_RANK|API note]] · chapter [[versions/v50/sections/context|context]]
