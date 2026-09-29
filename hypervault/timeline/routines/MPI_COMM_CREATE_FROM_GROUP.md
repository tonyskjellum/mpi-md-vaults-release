---
title: MPI_COMM_CREATE_FROM_GROUP
c_name: MPI_Comm_create_from_group
chapter: context
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_CREATE_FROM_GROUP, MPI_Comm_create_from_group]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_CREATE_FROM_GROUP

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|MPI-4.0]] · [[versions/v41/API/MPI_COMM_CREATE_FROM_GROUP|MPI-4.1]] · [[versions/v50/API/MPI_COMM_CREATE_FROM_GROUP|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Comm_create_from_group(MPI_Group group, const char *stringtag, MPI_Info info, MPI_Errhandler errhandler, MPI_Comm *newcomm)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Comm_create_from_group(group, stringtag, info, errhandler, newcomm, ierror)
    TYPE(MPI_Group), INTENT(IN) :: group
    CHARACTER(LEN=*), INTENT(IN) :: stringtag
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Errhandler), INTENT(IN) :: errhandler
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_COMM_CREATE_FROM_GROUP(GROUP, STRINGTAG, INFO, ERRHANDLER, NEWCOMM, IERROR)
    INTEGER GROUP, INFO, ERRHANDLER, NEWCOMM, IERROR
    CHARACTER*(*) STRINGTAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `group` | IN | **MPI-4.0–MPI-5.0:** group (handle) |
| `stringtag` | IN | **MPI-4.0–MPI-5.0:** unique identifier for this operation (string) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info object (handle) |
| `errhandler` | IN | **MPI-4.0–MPI-5.0:** error handler to be attached to new intra-communicator (handle) |
| `newcomm` | OUT | **MPI-4.0–MPI-5.0:** new communicator (handle) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_CREATE_FROM_GROUP|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_CREATE_FROM_GROUP|API note]] · chapter [[versions/v50/sections/context|context]]
