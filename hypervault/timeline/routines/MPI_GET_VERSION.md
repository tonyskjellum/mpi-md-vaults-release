---
title: MPI_GET_VERSION
c_name: MPI_Get_version
chapter: inquiry
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GET_VERSION, MPI_Get_version]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_GET_VERSION

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_GET_VERSION|MPI-1.3]] · [[versions/v20/API/MPI_GET_VERSION|MPI-2.0]] · [[versions/v21/API/MPI_GET_VERSION|MPI-2.1]] Δ · [[versions/v22/API/MPI_GET_VERSION|MPI-2.2]] · [[versions/v30/API/MPI_GET_VERSION|MPI-3.0]] Δ · [[versions/v31/API/MPI_GET_VERSION|MPI-3.1]] Δ · [[versions/v40/API/MPI_GET_VERSION|MPI-4.0]] · [[versions/v41/API/MPI_GET_VERSION|MPI-4.1]] · [[versions/v50/API/MPI_GET_VERSION|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Get_version(int *version, int *subversion)
```

## C++

**MPI-1.3–MPI-2.0**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Get_version(int& version, int& subversion)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Get_version(version, subversion, ierror) BIND(C)
    INTEGER, INTENT(OUT) :: version, subversion
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Get_version(version, subversion, ierror)
    INTEGER, INTENT(OUT) :: version, subversion
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_GET_VERSION(VERSION, SUBVERSION, IERROR)
    INTEGER VERSION, SUBVERSION, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `version` | OUT | **MPI-1.3–MPI-5.0:** version number (integer) |
| `subversion` | OUT | **MPI-1.3–MPI-5.0:** subversion number (integer) |

## Named in the change log of

[[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_GET_VERSION|API note]] · chapter [[versions/v13/sections/inquiry|inquiry]]
- MPI-2.0: [[versions/v20/API/MPI_GET_VERSION|API note]] · chapter [[versions/v20/sections/misc-1.2|misc-1.2]]
- MPI-2.1: [[versions/v21/API/MPI_GET_VERSION|API note]] · chapter [[versions/v21/sections/inquiry|inquiry]]
- MPI-2.2: [[versions/v22/API/MPI_GET_VERSION|API note]] · chapter [[versions/v22/sections/inquiry|inquiry]]
- MPI-3.0: [[versions/v30/API/MPI_GET_VERSION|API note]] · chapter [[versions/v30/sections/inquiry|inquiry]]
- MPI-3.1: [[versions/v31/API/MPI_GET_VERSION|API note]] · chapter [[versions/v31/sections/inquiry|inquiry]]
- MPI-4.0: [[versions/v40/API/MPI_GET_VERSION|API note]] · chapter [[versions/v40/sections/inquiry|inquiry]]
- MPI-4.1: [[versions/v41/API/MPI_GET_VERSION|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_GET_VERSION|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]
