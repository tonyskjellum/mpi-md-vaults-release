---
title: MPI_SESSION_IFLUSH_BUFFER
c_name: MPI_Session_iflush_buffer
chapter: pt2pt
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_SESSION_IFLUSH_BUFFER, MPI_Session_iflush_buffer]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_SESSION_IFLUSH_BUFFER

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_SESSION_IFLUSH_BUFFER|MPI-4.1]] · [[versions/v50/API/MPI_SESSION_IFLUSH_BUFFER|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1–MPI-5.0**
```c
int MPI_Session_iflush_buffer(MPI_Session session, MPI_Request *request)
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Session_iflush_buffer(session, request, ierror)
    TYPE(MPI_Session), INTENT(IN) :: session
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_SESSION_IFLUSH_BUFFER(SESSION, REQUEST, IERROR)
    INTEGER SESSION, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `session` | IN | **MPI-4.1–MPI-5.0:** session (handle) |
| `request` | OUT | **MPI-4.1–MPI-5.0:** communication request (handle) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_SESSION_IFLUSH_BUFFER|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_SESSION_IFLUSH_BUFFER|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
