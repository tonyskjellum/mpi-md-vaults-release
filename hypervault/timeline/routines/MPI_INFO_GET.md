---
title: MPI_INFO_GET
c_name: MPI_Info_get
chapter: deprecated
introduced: "MPI-2.0"
deprecated: "MPI-4.0"
removed: null
continued_as: "MPI_INFO_GET_STRING"
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_INFO_GET, MPI_Info_get]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_INFO_GET

**Introduced** in MPI-2.0 · **deprecated** in MPI-4.0 · **continued as** [[timeline/routines/MPI_INFO_GET_STRING|MPI_INFO_GET_STRING]] (MPI-4.0 deprecated chapter).

Releases: [[versions/v20/API/MPI_INFO_GET|MPI-2.0]] · [[versions/v21/API/MPI_INFO_GET|MPI-2.1]] · [[versions/v22/API/MPI_INFO_GET|MPI-2.2]] · [[versions/v30/API/MPI_INFO_GET|MPI-3.0]] Δ · [[versions/v31/API/MPI_INFO_GET|MPI-3.1]] Δ · [[versions/v40/API/MPI_INFO_GET|MPI-4.0]] † · [[versions/v41/API/MPI_INFO_GET|MPI-4.1]] † · [[versions/v50/API/MPI_INFO_GET|MPI-5.0]] †

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Info_get(MPI_Info info, char *key, int valuelen, char *value, int *flag)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Info_get(MPI_Info info, const char *key, int valuelen, char *value, int *flag)
```

## C++

**MPI-2.0–MPI-2.2**
```c
bool MPI::Info::Get(const char* key, int valuelen, char* value) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Info_get(info, key, valuelen, value, flag, ierror) BIND(C)
    TYPE(MPI_Info), INTENT(IN) :: info
    CHARACTER(LEN=*), INTENT(IN) :: key
    INTEGER, INTENT(IN) :: valuelen
    CHARACTER(LEN=valuelen), INTENT(OUT) :: value
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Info_get(info, key, valuelen, value, flag, ierror)
    TYPE(MPI_Info), INTENT(IN) :: info
    CHARACTER(LEN=*), INTENT(IN) :: key
    INTEGER, INTENT(IN) :: valuelen
    CHARACTER(LEN=valuelen), INTENT(OUT) :: value
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_INFO_GET(INFO, KEY, VALUELEN, VALUE, FLAG, IERROR)
    INTEGER INFO, VALUELEN, IERROR
    CHARACTER*(*) KEY, VALUE
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `info` | IN | **MPI-2.0–MPI-5.0:** info object (handle) |
| `key` | IN | **MPI-2.0–MPI-5.0:** key (string) |
| `valuelen` | IN | **MPI-2.0–MPI-3.1:** length of value arg (integer)<br>**MPI-4.0–MPI-5.0:** length of value associated with `key` (integer) |
| `value` | OUT | **MPI-2.0–MPI-5.0:** value (string) |
| `flag` | OUT | **MPI-2.0–MPI-3.1:** `true` if key defined, `false` if not (boolean)<br>**MPI-4.0–MPI-5.0:** `true` if `key` defined, `false` if not (logical) |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_INFO_GET|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_INFO_GET|API note]] · chapter [[versions/v21/sections/misc|misc]]
- MPI-2.2: [[versions/v22/API/MPI_INFO_GET|API note]] · chapter [[versions/v22/sections/misc|misc]]
- MPI-3.0: [[versions/v30/API/MPI_INFO_GET|API note]] · chapter [[versions/v30/sections/misc|misc]]
- MPI-3.1: [[versions/v31/API/MPI_INFO_GET|API note]] · chapter [[versions/v31/sections/misc|misc]]
- MPI-4.0: [[versions/v40/API/MPI_INFO_GET|API note]] · chapter [[versions/v40/sections/deprecated|deprecated]]
- MPI-4.1: [[versions/v41/API/MPI_INFO_GET|API note]] · chapter [[versions/v41/sections/deprecated|deprecated]]
- MPI-5.0: [[versions/v50/API/MPI_INFO_GET|API note]] · chapter [[versions/v50/sections/deprecated|deprecated]]
