---
title: MPI_COMM_CREATE_GROUP
c_name: MPI_Comm_create_group
chapter: context
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_CREATE_GROUP, MPI_Comm_create_group]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_CREATE_GROUP

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI-3.0]] · [[versions/v31/API/MPI_COMM_CREATE_GROUP|MPI-3.1]] · [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI-4.0]] Δ · [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI-4.1]] · [[versions/v50/API/MPI_COMM_CREATE_GROUP|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Comm_create_group(MPI_Comm comm, MPI_Group group, int tag, MPI_Comm *newcomm)
```

## Fortran 2008

**MPI-3.0–MPI-5.0**
```fortran
MPI_Comm_create_group(comm, group, tag, newcomm, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Group), INTENT(IN) :: group
    INTEGER, INTENT(IN) :: tag
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_COMM_CREATE_GROUP(COMM, GROUP, TAG, NEWCOMM, IERROR)
    INTEGER COMM, GROUP, TAG, NEWCOMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-3.0–MPI-3.1:** intracommunicator (handle)<br>**MPI-4.0–MPI-5.0:** intra-communicator (handle) |
| `group` | IN | **MPI-3.0–MPI-5.0:** group, which is a subset of the group of `comm` (handle) |
| `tag` | IN | **MPI-3.0–MPI-5.0:** tag (integer) |
| `newcomm` | OUT | **MPI-3.0–MPI-5.0:** new communicator (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_COMM_CREATE_GROUP|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_CREATE_GROUP|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_CREATE_GROUP|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_CREATE_GROUP|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_CREATE_GROUP|API note]] · chapter [[versions/v50/sections/context|context]]
