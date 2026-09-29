---
title: MPI_SESSION_CALL_ERRHANDLER
c_name: MPI_Session_call_errhandler
chapter: inquiry
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SESSION_CALL_ERRHANDLER, MPI_Session_call_errhandler]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_SESSION_CALL_ERRHANDLER

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_SESSION_CALL_ERRHANDLER|MPI-4.0]] · [[versions/v41/API/MPI_SESSION_CALL_ERRHANDLER|MPI-4.1]] · [[versions/v50/API/MPI_SESSION_CALL_ERRHANDLER|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Session_call_errhandler(MPI_Session session, int errorcode)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Session_call_errhandler(session, errorcode, ierror)
    TYPE(MPI_Session), INTENT(IN) :: session
    INTEGER, INTENT(IN) :: errorcode
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_SESSION_CALL_ERRHANDLER(SESSION, ERRORCODE, IERROR)
    INTEGER SESSION, ERRORCODE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `session` | IN | **MPI-4.0–MPI-5.0:** session with error handler (handle) |
| `errorcode` | IN | **MPI-4.0–MPI-5.0:** error code (integer) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_SESSION_CALL_ERRHANDLER|API note]] · chapter [[versions/v40/sections/inquiry|inquiry]]
- MPI-4.1: [[versions/v41/API/MPI_SESSION_CALL_ERRHANDLER|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_SESSION_CALL_ERRHANDLER|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]
