---
title: MPI_SESSION_INIT
c_name: MPI_Session_init
chapter: dynamic
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SESSION_INIT, MPI_Session_init]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_SESSION_INIT

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_SESSION_INIT|MPI-4.0]] · [[versions/v41/API/MPI_SESSION_INIT|MPI-4.1]] · [[versions/v50/API/MPI_SESSION_INIT|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Session_init(MPI_Info info, MPI_Errhandler errhandler, MPI_Session *session)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Session_init(info, errhandler, session, ierror)
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Errhandler), INTENT(IN) :: errhandler
    TYPE(MPI_Session), INTENT(OUT) :: session
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_SESSION_INIT(INFO, ERRHANDLER, SESSION, IERROR)
    INTEGER INFO, ERRHANDLER, SESSION, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `info` | IN | **MPI-4.0–MPI-5.0:** info object to specify thread support level and MPI implementation specific resources (handle) |
| `errhandler` | IN | **MPI-4.0–MPI-5.0:** error handler to invoke in the event that an error is encountered during this function call (handle) |
| `session` | OUT | **MPI-4.0–MPI-5.0:** new session (handle) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_SESSION_INIT|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_SESSION_INIT|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_SESSION_INIT|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]
