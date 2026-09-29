---
title: MPI_SESSION_GET_NTH_PSET
c_name: MPI_Session_get_nth_pset
chapter: dynamic
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SESSION_GET_NTH_PSET, MPI_Session_get_nth_pset]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_SESSION_GET_NTH_PSET

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_SESSION_GET_NTH_PSET|MPI-4.0]] · [[versions/v41/API/MPI_SESSION_GET_NTH_PSET|MPI-4.1]] · [[versions/v50/API/MPI_SESSION_GET_NTH_PSET|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Session_get_nth_pset(MPI_Session session, MPI_Info info, int n, int *pset_len, char *pset_name)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Session_get_nth_pset(session, info, n, pset_len, pset_name, ierror)
    TYPE(MPI_Session), INTENT(IN) :: session
    TYPE(MPI_Info), INTENT(IN) :: info
    INTEGER, INTENT(IN) :: n
    INTEGER, INTENT(INOUT) :: pset_len
    CHARACTER(LEN=*), INTENT(OUT) :: pset_name
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_SESSION_GET_NTH_PSET(SESSION, INFO, N, PSET_LEN, PSET_NAME, IERROR)
    INTEGER SESSION, INFO, N, PSET_LEN, IERROR
    CHARACTER*(*) PSET_NAME
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `session` | IN | **MPI-4.0–MPI-5.0:** session (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info object (handle) |
| `n` | IN | **MPI-4.0–MPI-5.0:** index of the desired process set name (integer) |
| `pset_len` | INOUT | **MPI-4.0–MPI-5.0:** length of the pset_name argument (integer) |
| `pset_name` | OUT | **MPI-4.0–MPI-5.0:** name of the `n`th process set (string) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_SESSION_GET_NTH_PSET|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_SESSION_GET_NTH_PSET|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_SESSION_GET_NTH_PSET|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]
