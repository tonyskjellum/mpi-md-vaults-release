---
title: MPI_INFO_GET_STRING
c_name: MPI_Info_get_string
chapter: misc
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_INFO_GET_STRING, MPI_Info_get_string]
tags: [mpi/routine, mpi/misc]
---

# MPI_INFO_GET_STRING

**Introduced** in MPI-4.0 · **continues** [[timeline/routines/MPI_INFO_GET|MPI_INFO_GET]] · **continues** [[timeline/routines/MPI_INFO_GET_VALUELEN|MPI_INFO_GET_VALUELEN]].

Releases: [[versions/v40/API/MPI_INFO_GET_STRING|MPI-4.0]] · [[versions/v41/API/MPI_INFO_GET_STRING|MPI-4.1]] · [[versions/v50/API/MPI_INFO_GET_STRING|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Info_get_string(MPI_Info info, const char *key, int *buflen, char *value, int *flag)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Info_get_string(info, key, buflen, value, flag, ierror)
    TYPE(MPI_Info), INTENT(IN) :: info
    CHARACTER(LEN=*), INTENT(IN) :: key
    INTEGER, INTENT(INOUT) :: buflen
    CHARACTER(LEN=*), INTENT(OUT) :: value
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_INFO_GET_STRING(INFO, KEY, BUFLEN, VALUE, FLAG, IERROR)
    INTEGER INFO, BUFLEN, IERROR
    CHARACTER*(*) KEY, VALUE
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `info` | IN | **MPI-4.0–MPI-5.0:** info object (handle) |
| `key` | IN | **MPI-4.0–MPI-5.0:** key (string) |
| `buflen` | INOUT | **MPI-4.0–MPI-5.0:** length of buffer (integer) |
| `value` | OUT | **MPI-4.0–MPI-5.0:** value (string) |
| `flag` | OUT | **MPI-4.0–MPI-4.1:** `true` if `key` defined, `false` if not (logical)<br>**MPI-5.0:** `true` if `key` is defined, `false` otherwise (logical) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_INFO_GET_STRING|API note]] · chapter [[versions/v40/sections/misc|misc]]
- MPI-4.1: [[versions/v41/API/MPI_INFO_GET_STRING|API note]] · chapter [[versions/v41/sections/misc|misc]]
- MPI-5.0: [[versions/v50/API/MPI_INFO_GET_STRING|API note]] · chapter [[versions/v50/sections/misc|misc]]
