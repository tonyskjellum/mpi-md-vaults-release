---
title: MPI_SESSION_FINALIZE
c_name: MPI_Session_finalize
chapter: dynamic
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SESSION_FINALIZE, MPI_Session_finalize]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_SESSION_FINALIZE

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_SESSION_FINALIZE|MPI-4.0]] · [[versions/v41/API/MPI_SESSION_FINALIZE|MPI-4.1]] · [[versions/v50/API/MPI_SESSION_FINALIZE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Session_finalize(MPI_Session *session)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Session_finalize(session, ierror)
    TYPE(MPI_Session), INTENT(INOUT) :: session
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_SESSION_FINALIZE(SESSION, IERROR)
    INTEGER SESSION, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `session` | INOUT | **MPI-4.0–MPI-5.0:** session to be finalized (handle) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_SESSION_FINALIZE|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_SESSION_FINALIZE|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_SESSION_FINALIZE|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]
