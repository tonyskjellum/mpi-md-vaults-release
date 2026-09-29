---
title: MPI_INFO_SET
c_name: MPI_Info_set
chapter: misc
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_INFO_SET, MPI_Info_set]
tags: [mpi/routine, mpi/misc]
---

# MPI_INFO_SET

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_INFO_SET|MPI-2.0]] · [[versions/v21/API/MPI_INFO_SET|MPI-2.1]] · [[versions/v22/API/MPI_INFO_SET|MPI-2.2]] · [[versions/v30/API/MPI_INFO_SET|MPI-3.0]] Δ · [[versions/v31/API/MPI_INFO_SET|MPI-3.1]] Δ · [[versions/v40/API/MPI_INFO_SET|MPI-4.0]] · [[versions/v41/API/MPI_INFO_SET|MPI-4.1]] · [[versions/v50/API/MPI_INFO_SET|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Info_set(MPI_Info info, char *key, char *value)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Info_set(MPI_Info info, const char *key, const char *value)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Info::Set(const char* key, const char* value)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Info_set(info, key, value, ierror) BIND(C)
    TYPE(MPI_Info), INTENT(IN) :: info
    CHARACTER(LEN=*), INTENT(IN) :: key, value
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Info_set(info, key, value, ierror)
    TYPE(MPI_Info), INTENT(IN) :: info
    CHARACTER(LEN=*), INTENT(IN) :: key, value
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_INFO_SET(INFO, KEY, VALUE, IERROR)
    INTEGER INFO, IERROR
    CHARACTER*(*) KEY, VALUE
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `info` | INOUT | **MPI-2.0–MPI-5.0:** info object (handle) |
| `key` | IN | **MPI-2.0–MPI-5.0:** key (string) |
| `value` | IN | **MPI-2.0–MPI-5.0:** value (string) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_INFO_SET|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_INFO_SET|API note]] · chapter [[versions/v21/sections/misc|misc]]
- MPI-2.2: [[versions/v22/API/MPI_INFO_SET|API note]] · chapter [[versions/v22/sections/misc|misc]]
- MPI-3.0: [[versions/v30/API/MPI_INFO_SET|API note]] · chapter [[versions/v30/sections/misc|misc]]
- MPI-3.1: [[versions/v31/API/MPI_INFO_SET|API note]] · chapter [[versions/v31/sections/misc|misc]]
- MPI-4.0: [[versions/v40/API/MPI_INFO_SET|API note]] · chapter [[versions/v40/sections/misc|misc]]
- MPI-4.1: [[versions/v41/API/MPI_INFO_SET|API note]] · chapter [[versions/v41/sections/misc|misc]]
- MPI-5.0: [[versions/v50/API/MPI_INFO_SET|API note]] · chapter [[versions/v50/sections/misc|misc]]
