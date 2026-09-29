---
title: MPI_ERROR_CLASS
c_name: MPI_Error_class
chapter: inquiry
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ERROR_CLASS, MPI_Error_class]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_ERROR_CLASS

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_ERROR_CLASS|MPI-1.3]] · [[versions/v21/API/MPI_ERROR_CLASS|MPI-2.1]] Δ · [[versions/v22/API/MPI_ERROR_CLASS|MPI-2.2]] Δ · [[versions/v30/API/MPI_ERROR_CLASS|MPI-3.0]] Δ · [[versions/v31/API/MPI_ERROR_CLASS|MPI-3.1]] Δ · [[versions/v40/API/MPI_ERROR_CLASS|MPI-4.0]] · [[versions/v41/API/MPI_ERROR_CLASS|MPI-4.1]] · [[versions/v50/API/MPI_ERROR_CLASS|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Error_class(int errorcode, int *errorclass)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI::Get_error_class(int errorcode)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Error_class(errorcode, errorclass, ierror) BIND(C)
    INTEGER, INTENT(IN) :: errorcode
    INTEGER, INTENT(OUT) :: errorclass
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Error_class(errorcode, errorclass, ierror)
    INTEGER, INTENT(IN) :: errorcode
    INTEGER, INTENT(OUT) :: errorclass
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_ERROR_CLASS(ERRORCODE, ERRORCLASS, IERROR)
    INTEGER ERRORCODE, ERRORCLASS, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `errorcode` | IN | **MPI-1.3–MPI-5.0:** Error code returned by an MPI routine |
| `errorclass` | OUT | **MPI-1.3–MPI-2.1:** Error class associated with errorcode<br>**MPI-2.2–MPI-5.0:** Error class associated with `errorcode` |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_ERROR_CLASS|API note]] · chapter [[versions/v13/sections/inquiry|inquiry]]
- MPI-2.1: [[versions/v21/API/MPI_ERROR_CLASS|API note]] · chapter [[versions/v21/sections/inquiry|inquiry]]
- MPI-2.2: [[versions/v22/API/MPI_ERROR_CLASS|API note]] · chapter [[versions/v22/sections/inquiry|inquiry]]
- MPI-3.0: [[versions/v30/API/MPI_ERROR_CLASS|API note]] · chapter [[versions/v30/sections/inquiry|inquiry]]
- MPI-3.1: [[versions/v31/API/MPI_ERROR_CLASS|API note]] · chapter [[versions/v31/sections/inquiry|inquiry]]
- MPI-4.0: [[versions/v40/API/MPI_ERROR_CLASS|API note]] · chapter [[versions/v40/sections/inquiry|inquiry]]
- MPI-4.1: [[versions/v41/API/MPI_ERROR_CLASS|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_ERROR_CLASS|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]
