---
title: MPI_ABORT
c_name: MPI_Abort
chapter: dynamic
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ABORT, MPI_Abort]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_ABORT

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_ABORT|MPI-1.3]] · [[versions/v21/API/MPI_ABORT|MPI-2.1]] Δ · [[versions/v22/API/MPI_ABORT|MPI-2.2]] · [[versions/v30/API/MPI_ABORT|MPI-3.0]] Δ · [[versions/v31/API/MPI_ABORT|MPI-3.1]] Δ · [[versions/v40/API/MPI_ABORT|MPI-4.0]] Δ · [[versions/v41/API/MPI_ABORT|MPI-4.1]] · [[versions/v50/API/MPI_ABORT|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Abort(MPI_Comm comm, int errorcode)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Comm::Abort(int errorcode)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Abort(comm, errorcode, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: errorcode
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Abort(comm, errorcode, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: errorcode
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_ABORT(COMM, ERRORCODE, IERROR)
    INTEGER COMM, ERRORCODE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3–MPI-3.1:** communicator of tasks to abort<br>**MPI-4.0–MPI-5.0:** communicator of MPI processes to abort (handle) |
| `errorcode` | IN | **MPI-1.3–MPI-3.1:** error code to return to invoking environment<br>**MPI-4.0–MPI-5.0:** error code to return to invoking environment (integer) |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_ABORT|API note]] · chapter [[versions/v13/sections/inquiry|inquiry]]
- MPI-2.1: [[versions/v21/API/MPI_ABORT|API note]] · chapter [[versions/v21/sections/inquiry|inquiry]]
- MPI-2.2: [[versions/v22/API/MPI_ABORT|API note]] · chapter [[versions/v22/sections/inquiry|inquiry]]
- MPI-3.0: [[versions/v30/API/MPI_ABORT|API note]] · chapter [[versions/v30/sections/inquiry|inquiry]]
- MPI-3.1: [[versions/v31/API/MPI_ABORT|API note]] · chapter [[versions/v31/sections/inquiry|inquiry]]
- MPI-4.0: [[versions/v40/API/MPI_ABORT|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_ABORT|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_ABORT|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]
