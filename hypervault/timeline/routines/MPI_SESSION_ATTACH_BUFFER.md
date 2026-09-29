---
title: MPI_SESSION_ATTACH_BUFFER
c_name: MPI_Session_attach_buffer
chapter: pt2pt
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_SESSION_ATTACH_BUFFER, MPI_Session_attach_buffer]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_SESSION_ATTACH_BUFFER

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_SESSION_ATTACH_BUFFER|MPI-4.1]] · [[versions/v50/API/MPI_SESSION_ATTACH_BUFFER|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1–MPI-5.0**
```c
int MPI_Session_attach_buffer(MPI_Session session, void *buffer, int size)
int MPI_Session_attach_buffer_c(MPI_Session session, void *buffer, MPI_Count size)
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Session_attach_buffer(session, buffer, size, ierror)
    TYPE(MPI_Session), INTENT(IN) :: session
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
    INTEGER, INTENT(IN) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Session_attach_buffer(session, buffer, size, ierror) !(_c)
    TYPE(MPI_Session), INTENT(IN) :: session
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_SESSION_ATTACH_BUFFER(SESSION, BUFFER, SIZE, IERROR)
    INTEGER SESSION, SIZE, IERROR
    <type> BUFFER(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `session` | IN | **MPI-4.1–MPI-5.0:** session (handle) |
| `buffer` | IN | **MPI-4.1–MPI-5.0:** initial buffer address (choice) |
| `size` | IN | **MPI-4.1:** buffer size, in bytes (non-negative integer)<br>**MPI-5.0:** buffer size, in bytes (nonnegative integer) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_SESSION_ATTACH_BUFFER|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_SESSION_ATTACH_BUFFER|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
