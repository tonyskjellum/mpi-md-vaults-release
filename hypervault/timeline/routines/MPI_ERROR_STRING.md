---
title: MPI_ERROR_STRING
c_name: MPI_Error_string
chapter: inquiry
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ERROR_STRING, MPI_Error_string]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_ERROR_STRING

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_ERROR_STRING|MPI-1.3]] · [[versions/v21/API/MPI_ERROR_STRING|MPI-2.1]] Δ · [[versions/v22/API/MPI_ERROR_STRING|MPI-2.2]] Δ · [[versions/v30/API/MPI_ERROR_STRING|MPI-3.0]] Δ · [[versions/v31/API/MPI_ERROR_STRING|MPI-3.1]] Δ · [[versions/v40/API/MPI_ERROR_STRING|MPI-4.0]] · [[versions/v41/API/MPI_ERROR_STRING|MPI-4.1]] · [[versions/v50/API/MPI_ERROR_STRING|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Error_string(int errorcode, char *string, int *resultlen)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Get_error_string(int errorcode, char* name, int& resultlen)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Error_string(errorcode, string, resultlen, ierror) BIND(C)
    INTEGER, INTENT(IN) :: errorcode
    CHARACTER(LEN=MPI_MAX_ERROR_STRING), INTENT(OUT) :: string
    INTEGER, INTENT(OUT) :: resultlen
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Error_string(errorcode, string, resultlen, ierror)
    INTEGER, INTENT(IN) :: errorcode
    CHARACTER(LEN=MPI_MAX_ERROR_STRING), INTENT(OUT) :: string
    INTEGER, INTENT(OUT) :: resultlen
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_ERROR_STRING(ERRORCODE, STRING, RESULTLEN, IERROR)
    INTEGER ERRORCODE, RESULTLEN, IERROR
    CHARACTER*(*) STRING
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `errorcode` | IN | **MPI-1.3–MPI-5.0:** Error code returned by an MPI routine |
| `string` | OUT | **MPI-1.3–MPI-2.1:** Text that corresponds to the errorcode<br>**MPI-2.2–MPI-5.0:** Text that corresponds to the `errorcode` |
| `resultlen` | OUT | **MPI-1.3–MPI-2.1:** Length (in printable characters) of the result returned in string<br>**MPI-2.2–MPI-5.0:** Length (in printable characters) of the result returned in `string` |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_ERROR_STRING|API note]] · chapter [[versions/v13/sections/inquiry|inquiry]]
- MPI-2.1: [[versions/v21/API/MPI_ERROR_STRING|API note]] · chapter [[versions/v21/sections/inquiry|inquiry]]
- MPI-2.2: [[versions/v22/API/MPI_ERROR_STRING|API note]] · chapter [[versions/v22/sections/inquiry|inquiry]]
- MPI-3.0: [[versions/v30/API/MPI_ERROR_STRING|API note]] · chapter [[versions/v30/sections/inquiry|inquiry]]
- MPI-3.1: [[versions/v31/API/MPI_ERROR_STRING|API note]] · chapter [[versions/v31/sections/inquiry|inquiry]]
- MPI-4.0: [[versions/v40/API/MPI_ERROR_STRING|API note]] · chapter [[versions/v40/sections/inquiry|inquiry]]
- MPI-4.1: [[versions/v41/API/MPI_ERROR_STRING|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_ERROR_STRING|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]
