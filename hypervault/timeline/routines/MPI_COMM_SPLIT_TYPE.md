---
title: MPI_COMM_SPLIT_TYPE
c_name: MPI_Comm_split_type
chapter: context
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_SPLIT_TYPE, MPI_Comm_split_type]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_SPLIT_TYPE

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_COMM_SPLIT_TYPE|MPI-3.0]] · [[versions/v31/API/MPI_COMM_SPLIT_TYPE|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_SPLIT_TYPE|MPI-4.0]] Δ · [[versions/v41/API/MPI_COMM_SPLIT_TYPE|MPI-4.1]] · [[versions/v50/API/MPI_COMM_SPLIT_TYPE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Comm_split_type(MPI_Comm comm, int split_type, int key, MPI_Info info, MPI_Comm *newcomm)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Comm_split_type(comm, split_type, key, info, newcomm, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: split_type, key
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_split_type(comm, split_type, key, info, newcomm, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: split_type, key
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_COMM_SPLIT_TYPE(COMM, SPLIT_TYPE, KEY, INFO, NEWCOMM, IERROR)
    INTEGER COMM, SPLIT_TYPE, KEY, INFO, NEWCOMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-3.0–MPI-5.0:** communicator (handle) |
| `split_type` | IN | **MPI-3.0–MPI-5.0:** type of processes to be grouped together (integer) |
| `key` | IN | **MPI-3.0–MPI-5.0:** control of rank assignment (integer) |
| `info` | IN/INOUT | **MPI-3.0–MPI-3.1:** info argument (handle)<br>**MPI-4.0–MPI-5.0:** info argument (handle) |
| `newcomm` | OUT | **MPI-3.0–MPI-5.0:** new communicator (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_COMM_SPLIT_TYPE|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_SPLIT_TYPE|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_SPLIT_TYPE|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_SPLIT_TYPE|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_SPLIT_TYPE|API note]] · chapter [[versions/v50/sections/context|context]]
