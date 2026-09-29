---
title: MPI_SESSION_CREATE_ERRHANDLER
c_name: MPI_Session_create_errhandler
chapter: inquiry
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SESSION_CREATE_ERRHANDLER, MPI_Session_create_errhandler]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_SESSION_CREATE_ERRHANDLER

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_SESSION_CREATE_ERRHANDLER|MPI-4.0]] · [[versions/v41/API/MPI_SESSION_CREATE_ERRHANDLER|MPI-4.1]] · [[versions/v50/API/MPI_SESSION_CREATE_ERRHANDLER|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Session_create_errhandler(MPI_Session_errhandler_function *session_errhandler_fn, MPI_Errhandler *errhandler)
typedef void MPI_Session_errhandler_function(MPI_Session *session, int *error_code, ...);
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Session_create_errhandler(session_errhandler_fn, errhandler, ierror)
    PROCEDURE(MPI_Session_errhandler_function) :: session_errhandler_fn
    TYPE(MPI_Errhandler), INTENT(OUT) :: errhandler
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_SESSION_CREATE_ERRHANDLER(SESSION_ERRHANDLER_FN, ERRHANDLER, IERROR)
    EXTERNAL SESSION_ERRHANDLER_FN
    INTEGER ERRHANDLER, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `session_errhandler_fn` | IN | **MPI-4.0–MPI-5.0:** user defined error handling procedure (function) |
| `errhandler` | OUT | **MPI-4.0–MPI-5.0:** MPI error handler (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_SESSION_CREATE_ERRHANDLER|API note]] · chapter [[versions/v40/sections/inquiry|inquiry]]
- MPI-4.1: [[versions/v41/API/MPI_SESSION_CREATE_ERRHANDLER|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_SESSION_CREATE_ERRHANDLER|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]
