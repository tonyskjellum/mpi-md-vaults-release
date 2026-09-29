---
title: MPI_SESSION_GET_INFO
c_name: MPI_Session_get_info
chapter: dynamic
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SESSION_GET_INFO, MPI_Session_get_info]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_SESSION_GET_INFO

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_SESSION_GET_INFO|MPI-4.0]] · [[versions/v41/API/MPI_SESSION_GET_INFO|MPI-4.1]] · [[versions/v50/API/MPI_SESSION_GET_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Session_get_info(MPI_Session session, MPI_Info *info_used)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Session_get_info(session, info_used, ierror)
    TYPE(MPI_Session), INTENT(IN) :: session
    TYPE(MPI_Info), INTENT(OUT) :: info_used
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_SESSION_GET_INFO(SESSION, INFO_USED, IERROR)
    INTEGER SESSION, INFO_USED, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `session` | IN | **MPI-4.0–MPI-5.0:** session (handle) |
| `info_used` | OUT | **MPI-4.0–MPI-5.0:** see explanation below (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_SESSION_GET_INFO|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_SESSION_GET_INFO|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_SESSION_GET_INFO|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]
