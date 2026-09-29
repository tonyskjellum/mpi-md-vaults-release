---
title: MPI_ADD_ERROR_CLASS
c_name: MPI_Add_error_class
chapter: inquiry
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ADD_ERROR_CLASS, MPI_Add_error_class]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_ADD_ERROR_CLASS

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_ADD_ERROR_CLASS|MPI-2.0]] · [[versions/v21/API/MPI_ADD_ERROR_CLASS|MPI-2.1]] · [[versions/v22/API/MPI_ADD_ERROR_CLASS|MPI-2.2]] · [[versions/v30/API/MPI_ADD_ERROR_CLASS|MPI-3.0]] Δ · [[versions/v31/API/MPI_ADD_ERROR_CLASS|MPI-3.1]] Δ · [[versions/v40/API/MPI_ADD_ERROR_CLASS|MPI-4.0]] · [[versions/v41/API/MPI_ADD_ERROR_CLASS|MPI-4.1]] · [[versions/v50/API/MPI_ADD_ERROR_CLASS|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Add_error_class(int *errorclass)
```

## C++

**MPI-2.0–MPI-2.2**
```c
int MPI::Add_error_class()
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Add_error_class(errorclass, ierror) BIND(C)
    INTEGER, INTENT(OUT) :: errorclass
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Add_error_class(errorclass, ierror)
    INTEGER, INTENT(OUT) :: errorclass
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_ADD_ERROR_CLASS(ERRORCLASS, IERROR)
    INTEGER ERRORCLASS, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `errorclass` | OUT | **MPI-2.0–MPI-5.0:** value for the new error class (integer) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_ADD_ERROR_CLASS|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_ADD_ERROR_CLASS|API note]] · chapter [[versions/v21/sections/inquiry|inquiry]]
- MPI-2.2: [[versions/v22/API/MPI_ADD_ERROR_CLASS|API note]] · chapter [[versions/v22/sections/inquiry|inquiry]]
- MPI-3.0: [[versions/v30/API/MPI_ADD_ERROR_CLASS|API note]] · chapter [[versions/v30/sections/inquiry|inquiry]]
- MPI-3.1: [[versions/v31/API/MPI_ADD_ERROR_CLASS|API note]] · chapter [[versions/v31/sections/inquiry|inquiry]]
- MPI-4.0: [[versions/v40/API/MPI_ADD_ERROR_CLASS|API note]] · chapter [[versions/v40/sections/inquiry|inquiry]]
- MPI-4.1: [[versions/v41/API/MPI_ADD_ERROR_CLASS|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_ADD_ERROR_CLASS|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]
