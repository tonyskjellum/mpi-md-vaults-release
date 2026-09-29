---
title: MPI_INFO_CREATE_ENV
c_name: MPI_Info_create_env
chapter: misc
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_INFO_CREATE_ENV, MPI_Info_create_env]
tags: [mpi/routine, mpi/misc]
---

# MPI_INFO_CREATE_ENV

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_INFO_CREATE_ENV|MPI-4.0]] · [[versions/v41/API/MPI_INFO_CREATE_ENV|MPI-4.1]] Δ · [[versions/v50/API/MPI_INFO_CREATE_ENV|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0**
```c
int MPI_Info_create_env(int argc, char argv[], MPI_Info *info)
```

**MPI-4.1–MPI-5.0**
```c
int MPI_Info_create_env(int argc, char *argv[], MPI_Info *info)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Info_create_env(info, ierror)
    TYPE(MPI_Info), INTENT(OUT) :: info
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_INFO_CREATE_ENV(INFO, IERROR)
    INTEGER INFO, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `info` | OUT | **MPI-4.0–MPI-5.0:** info object (handle) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_INFO_CREATE_ENV|API note]] · chapter [[versions/v40/sections/misc|misc]]
- MPI-4.1: [[versions/v41/API/MPI_INFO_CREATE_ENV|API note]] · chapter [[versions/v41/sections/misc|misc]]
- MPI-5.0: [[versions/v50/API/MPI_INFO_CREATE_ENV|API note]] · chapter [[versions/v50/sections/misc|misc]]
