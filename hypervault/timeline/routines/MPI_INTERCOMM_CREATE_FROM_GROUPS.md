---
title: MPI_INTERCOMM_CREATE_FROM_GROUPS
c_name: MPI_Intercomm_create_from_groups
chapter: context
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_INTERCOMM_CREATE_FROM_GROUPS, MPI_Intercomm_create_from_groups]
tags: [mpi/routine, mpi/context]
---

# MPI_INTERCOMM_CREATE_FROM_GROUPS

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI-4.0]] · [[versions/v41/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI-4.1]] · [[versions/v50/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Intercomm_create_from_groups(MPI_Group local_group, int local_leader, MPI_Group remote_group, int remote_leader, const char *stringtag, MPI_Info info, MPI_Errhandler errhandler, MPI_Comm *newintercomm)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Intercomm_create_from_groups(local_group, local_leader, remote_group, remote_leader, stringtag, info, errhandler, newintercomm, ierror)
    TYPE(MPI_Group), INTENT(IN) :: local_group, remote_group
    INTEGER, INTENT(IN) :: local_leader, remote_leader
    CHARACTER(LEN=*), INTENT(IN) :: stringtag
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Errhandler), INTENT(IN) :: errhandler
    TYPE(MPI_Comm), INTENT(OUT) :: newintercomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_INTERCOMM_CREATE_FROM_GROUPS(LOCAL_GROUP, LOCAL_LEADER, REMOTE_GROUP, REMOTE_LEADER, STRINGTAG, INFO, ERRHANDLER, NEWINTERCOMM, IERROR)
    INTEGER LOCAL_GROUP, LOCAL_LEADER, REMOTE_GROUP, REMOTE_LEADER, INFO, ERRHANDLER, NEWINTERCOMM, IERROR
    CHARACTER*(*) STRINGTAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `local_group` | IN | **MPI-4.0–MPI-5.0:** local group (handle) |
| `local_leader` | IN | **MPI-4.0–MPI-5.0:** rank of local group leader in `local_group` (integer) |
| `remote_group` | IN | **MPI-4.0–MPI-5.0:** remote group, significant only at `local_leader` (handle) |
| `remote_leader` | IN | **MPI-4.0–MPI-5.0:** rank of remote group leader in `remote_group`, significant only at `local_leader` (integer) |
| `stringtag` | IN | **MPI-4.0–MPI-4.1:** unique idenitifier for this operation (string)<br>**MPI-5.0:** unique identifier for this operation (string) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info object (handle) |
| `errhandler` | IN | **MPI-4.0–MPI-5.0:** error handler to be attached to new inter-communicator (handle) |
| `newintercomm` | OUT | **MPI-4.0–MPI-5.0:** new inter-communicator (handle) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|API note]] · chapter [[versions/v50/sections/context|context]]
