---
title: MPI_FILE_CREATE_ERRHANDLER
c_name: MPI_File_create_errhandler
chapter: inquiry
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_FILE_CREATE_ERRHANDLER, MPI_File_create_errhandler]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_FILE_CREATE_ERRHANDLER

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_FILE_CREATE_ERRHANDLER|MPI-2.0]] · [[versions/v21/API/MPI_FILE_CREATE_ERRHANDLER|MPI-2.1]] · [[versions/v22/API/MPI_FILE_CREATE_ERRHANDLER|MPI-2.2]] Δ · [[versions/v30/API/MPI_FILE_CREATE_ERRHANDLER|MPI-3.0]] Δ · [[versions/v31/API/MPI_FILE_CREATE_ERRHANDLER|MPI-3.1]] Δ · [[versions/v40/API/MPI_FILE_CREATE_ERRHANDLER|MPI-4.0]] Δ · [[versions/v41/API/MPI_FILE_CREATE_ERRHANDLER|MPI-4.1]] · [[versions/v50/API/MPI_FILE_CREATE_ERRHANDLER|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.1**
```c
int MPI_File_create_errhandler(MPI_File_errhandler_fn *function, MPI_Errhandler *errhandler)
typedef void MPI_File_errhandler_fn(MPI_File *, int *, ...);
```

**MPI-2.2**
```c
int MPI_File_create_errhandler(MPI_File_errhandler_function *function, MPI_Errhandler *errhandler)
typedef void MPI_File_errhandler_function(MPI_File *, int *, ...);
```

**MPI-3.0–MPI-3.1**
```c
int MPI_File_create_errhandler(MPI_File_errhandler_function *file_errhandler_fn, MPI_Errhandler *errhandler)
typedef void MPI_File_errhandler_function(MPI_File *, int *, ...);
```

**MPI-4.0–MPI-5.0**
```c
int MPI_File_create_errhandler(MPI_File_errhandler_function *file_errhandler_fn, MPI_Errhandler *errhandler)
typedef void MPI_File_errhandler_function(MPI_File *file, int *error_code, ...);
```

## C++

**MPI-2.0–MPI-2.1**
```c
static MPI::Errhandler MPI::File::Create_errhandler(MPI::File::Errhandler_fn* function)
typedef void MPI::File::Errhandler_fn(MPI::File &, int *, ... );
```

**MPI-2.2**
```c
static MPI::Errhandler MPI::File::Create_errhandler(MPI::File::Errhandler_function* function)
typedef void MPI::File::Errhandler_function(MPI::File &, int *, ... );
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_File_create_errhandler(file_errhandler_fn, errhandler, ierror) BIND(C)
    PROCEDURE(MPI_File_errhandler_function) :: file_errhandler_fn
    TYPE(MPI_Errhandler), INTENT(OUT) :: errhandler
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_File_create_errhandler(file_errhandler_fn, errhandler, ierror)
    PROCEDURE(MPI_File_errhandler_function) :: file_errhandler_fn
    TYPE(MPI_Errhandler), INTENT(OUT) :: errhandler
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-2.2**
```fortran
MPI_FILE_CREATE_ERRHANDLER(FUNCTION, ERRHANDLER, IERROR)
    EXTERNAL FUNCTION
    INTEGER ERRHANDLER, IERROR
```

**MPI-3.0–MPI-5.0**
```fortran
MPI_FILE_CREATE_ERRHANDLER(FILE_ERRHANDLER_FN, ERRHANDLER, IERROR)
    EXTERNAL FILE_ERRHANDLER_FN
    INTEGER ERRHANDLER, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `function` | IN | **MPI-2.0–MPI-2.2:** user defined error handling procedure (function)<br>_MPI-3.0–MPI-5.0: absent_ |
| `errhandler` | OUT | **MPI-2.0–MPI-5.0:** MPI error handler (handle) |
| `file_errhandler_fn` | IN | _MPI-2.0–MPI-2.2: absent_<br>**MPI-3.0–MPI-5.0:** user defined error handling procedure (function) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_FILE_CREATE_ERRHANDLER|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_FILE_CREATE_ERRHANDLER|API note]] · chapter [[versions/v21/sections/inquiry|inquiry]]
- MPI-2.2: [[versions/v22/API/MPI_FILE_CREATE_ERRHANDLER|API note]] · chapter [[versions/v22/sections/inquiry|inquiry]]
- MPI-3.0: [[versions/v30/API/MPI_FILE_CREATE_ERRHANDLER|API note]] · chapter [[versions/v30/sections/inquiry|inquiry]]
- MPI-3.1: [[versions/v31/API/MPI_FILE_CREATE_ERRHANDLER|API note]] · chapter [[versions/v31/sections/inquiry|inquiry]]
- MPI-4.0: [[versions/v40/API/MPI_FILE_CREATE_ERRHANDLER|API note]] · chapter [[versions/v40/sections/inquiry|inquiry]]
- MPI-4.1: [[versions/v41/API/MPI_FILE_CREATE_ERRHANDLER|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_FILE_CREATE_ERRHANDLER|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]
