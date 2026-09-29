---
title: MPI_ERRHANDLER_FREE
c_name: MPI_Errhandler_free
chapter: inquiry
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ERRHANDLER_FREE, MPI_Errhandler_free]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_ERRHANDLER_FREE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_ERRHANDLER_FREE|MPI-1.3]] · [[versions/v20/API/MPI_ERRHANDLER_FREE|MPI-2.0]] · [[versions/v21/API/MPI_ERRHANDLER_FREE|MPI-2.1]] Δ · [[versions/v22/API/MPI_ERRHANDLER_FREE|MPI-2.2]] · [[versions/v30/API/MPI_ERRHANDLER_FREE|MPI-3.0]] Δ · [[versions/v31/API/MPI_ERRHANDLER_FREE|MPI-3.1]] Δ · [[versions/v40/API/MPI_ERRHANDLER_FREE|MPI-4.0]] · [[versions/v41/API/MPI_ERRHANDLER_FREE|MPI-4.1]] · [[versions/v50/API/MPI_ERRHANDLER_FREE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3**
```c
int MPI_Errhandler_free(MPI_Errhandler *errhandler)
```

**MPI-2.0**
_(no C binding)_

**MPI-2.1–MPI-5.0**
```c
int MPI_Errhandler_free(MPI_Errhandler *errhandler)
```

## C++

**MPI-1.3–MPI-2.0**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Errhandler::Free()
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Errhandler_free(errhandler, ierror) BIND(C)
    TYPE(MPI_Errhandler), INTENT(INOUT) :: errhandler
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Errhandler_free(errhandler, ierror)
    TYPE(MPI_Errhandler), INTENT(INOUT) :: errhandler
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3**
```fortran
MPI_ERRHANDLER_FREE(ERRHANDLER, IERROR)
    INTEGER ERRHANDLER, IERROR
```

**MPI-2.0**
_(no mpif.h binding)_

**MPI-2.1–MPI-5.0**
```fortran
MPI_ERRHANDLER_FREE(ERRHANDLER, IERROR)
    INTEGER ERRHANDLER, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `errhandler` | IN/INOUT | **MPI-1.3:** MPI error handler (handle)<br>**MPI-2.0:** MPI error handler (handle)<br>**MPI-2.1–MPI-5.0:** MPI error handler (handle) |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_ERRHANDLER_FREE|API note]] · chapter [[versions/v13/sections/inquiry|inquiry]]
- MPI-2.0: [[versions/v20/API/MPI_ERRHANDLER_FREE|API note]] · chapter [[versions/v20/sections/misc-1.2|misc-1.2]]
- MPI-2.1: [[versions/v21/API/MPI_ERRHANDLER_FREE|API note]] · chapter [[versions/v21/sections/inquiry|inquiry]]
- MPI-2.2: [[versions/v22/API/MPI_ERRHANDLER_FREE|API note]] · chapter [[versions/v22/sections/inquiry|inquiry]]
- MPI-3.0: [[versions/v30/API/MPI_ERRHANDLER_FREE|API note]] · chapter [[versions/v30/sections/inquiry|inquiry]]
- MPI-3.1: [[versions/v31/API/MPI_ERRHANDLER_FREE|API note]] · chapter [[versions/v31/sections/inquiry|inquiry]]
- MPI-4.0: [[versions/v40/API/MPI_ERRHANDLER_FREE|API note]] · chapter [[versions/v40/sections/inquiry|inquiry]]
- MPI-4.1: [[versions/v41/API/MPI_ERRHANDLER_FREE|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_ERRHANDLER_FREE|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]
