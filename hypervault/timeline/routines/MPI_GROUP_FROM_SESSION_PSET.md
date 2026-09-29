---
title: MPI_GROUP_FROM_SESSION_PSET
c_name: MPI_Group_from_session_pset
chapter: context
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GROUP_FROM_SESSION_PSET, MPI_Group_from_session_pset]
tags: [mpi/routine, mpi/context]
---

# MPI_GROUP_FROM_SESSION_PSET

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_GROUP_FROM_SESSION_PSET|MPI-4.0]] · [[versions/v41/API/MPI_GROUP_FROM_SESSION_PSET|MPI-4.1]] · [[versions/v50/API/MPI_GROUP_FROM_SESSION_PSET|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Group_from_session_pset(MPI_Session session, const char *pset_name, MPI_Group *newgroup)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Group_from_session_pset(session, pset_name, newgroup, ierror)
    TYPE(MPI_Session), INTENT(IN) :: session
    CHARACTER(LEN=*), INTENT(IN) :: pset_name
    TYPE(MPI_Group), INTENT(OUT) :: newgroup
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_GROUP_FROM_SESSION_PSET(SESSION, PSET_NAME, NEWGROUP, IERROR)
    INTEGER SESSION, NEWGROUP, IERROR
    CHARACTER*(*) PSET_NAME
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `session` | IN | **MPI-4.0–MPI-5.0:** session (handle) |
| `pset_name` | IN | **MPI-4.0–MPI-5.0:** name of process set to use to create the new group (string) |
| `newgroup` | OUT | **MPI-4.0–MPI-5.0:** new group derived from supplied session and process set (handle) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_GROUP_FROM_SESSION_PSET|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_GROUP_FROM_SESSION_PSET|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_GROUP_FROM_SESSION_PSET|API note]] · chapter [[versions/v50/sections/context|context]]
