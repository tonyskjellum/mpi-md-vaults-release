---
title: MPI_SESSION_GET_NUM_PSETS
c_name: MPI_Session_get_num_psets
chapter: dynamic
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SESSION_GET_NUM_PSETS, MPI_Session_get_num_psets]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_SESSION_GET_NUM_PSETS

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_SESSION_GET_NUM_PSETS|MPI-4.0]] · [[versions/v41/API/MPI_SESSION_GET_NUM_PSETS|MPI-4.1]] · [[versions/v50/API/MPI_SESSION_GET_NUM_PSETS|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Session_get_num_psets(MPI_Session session, MPI_Info info, int *npset_names)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Session_get_num_psets(session, info, npset_names, ierror)
    TYPE(MPI_Session), INTENT(IN) :: session
    TYPE(MPI_Info), INTENT(IN) :: info
    INTEGER, INTENT(OUT) :: npset_names
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_SESSION_GET_NUM_PSETS(SESSION, INFO, NPSET_NAMES, IERROR)
    INTEGER SESSION, INFO, NPSET_NAMES, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `session` | IN | **MPI-4.0–MPI-5.0:** session (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info object (handle) |
| `npset_names` | OUT | **MPI-4.0–MPI-4.1:** number of available process sets (non-negative integer)<br>**MPI-5.0:** number of available process sets (nonnegative integer) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_SESSION_GET_NUM_PSETS|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_SESSION_GET_NUM_PSETS|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_SESSION_GET_NUM_PSETS|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]
