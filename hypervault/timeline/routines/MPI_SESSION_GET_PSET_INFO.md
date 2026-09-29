---
title: MPI_SESSION_GET_PSET_INFO
c_name: MPI_Session_get_pset_info
chapter: dynamic
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SESSION_GET_PSET_INFO, MPI_Session_get_pset_info]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_SESSION_GET_PSET_INFO

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_SESSION_GET_PSET_INFO|MPI-4.0]] · [[versions/v41/API/MPI_SESSION_GET_PSET_INFO|MPI-4.1]] · [[versions/v50/API/MPI_SESSION_GET_PSET_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Session_get_pset_info(MPI_Session session, const char *pset_name, MPI_Info *info)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Session_get_pset_info(session, pset_name, info, ierror)
    TYPE(MPI_Session), INTENT(IN) :: session
    CHARACTER(LEN=*), INTENT(IN) :: pset_name
    TYPE(MPI_Info), INTENT(OUT) :: info
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_SESSION_GET_PSET_INFO(SESSION, PSET_NAME, INFO, IERROR)
    INTEGER SESSION, INFO, IERROR
    CHARACTER*(*) PSET_NAME
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `session` | IN | **MPI-4.0–MPI-5.0:** session (handle) |
| `pset_name` | IN | **MPI-4.0–MPI-5.0:** name of process set (string) |
| `info` | OUT | **MPI-4.0–MPI-5.0:** info object containing information about the given process set (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_SESSION_GET_PSET_INFO|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_SESSION_GET_PSET_INFO|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_SESSION_GET_PSET_INFO|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]
