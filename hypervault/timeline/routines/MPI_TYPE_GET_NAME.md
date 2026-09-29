---
title: MPI_TYPE_GET_NAME
c_name: MPI_Type_get_name
chapter: context
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_GET_NAME, MPI_Type_get_name]
tags: [mpi/routine, mpi/context]
---

# MPI_TYPE_GET_NAME

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_GET_NAME|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_GET_NAME|MPI-2.1]] · [[versions/v22/API/MPI_TYPE_GET_NAME|MPI-2.2]] · [[versions/v30/API/MPI_TYPE_GET_NAME|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_GET_NAME|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_GET_NAME|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_GET_NAME|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_GET_NAME|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Type_get_name(MPI_Datatype type, char *type_name, int *resultlen)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Type_get_name(MPI_Datatype datatype, char *type_name, int *resultlen)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Datatype::Get_name(char* type_name, int& resultlen) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_get_name(datatype, type_name, resultlen, ierror) BIND(C)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    CHARACTER(LEN=MPI_MAX_OBJECT_NAME), INTENT(OUT) :: type_name
    INTEGER, INTENT(OUT) :: resultlen
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Type_get_name(datatype, type_name, resultlen, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    CHARACTER(LEN=MPI_MAX_OBJECT_NAME), INTENT(OUT) :: type_name
    INTEGER, INTENT(OUT) :: resultlen
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-2.2**
```fortran
MPI_TYPE_GET_NAME(TYPE, TYPE_NAME, RESULTLEN, IERROR)
    INTEGER TYPE, RESULTLEN, IERROR
    CHARACTER*(*) TYPE_NAME
```

**MPI-3.0–MPI-5.0**
```fortran
MPI_TYPE_GET_NAME(DATATYPE, TYPE_NAME, RESULTLEN, IERROR)
    INTEGER DATATYPE, RESULTLEN, IERROR
    CHARACTER*(*) TYPE_NAME
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `type` | IN | **MPI-2.0–MPI-2.2:** datatype whose name is to be returned (handle)<br>_MPI-3.0–MPI-5.0: absent_ |
| `type_name` | OUT | **MPI-2.0–MPI-3.1:** the name previously stored on the datatype, or a empty string if no such name exists (string)<br>**MPI-4.0–MPI-5.0:** the name previously stored on the datatype, or an empty string if no such name exists (string) |
| `resultlen` | OUT | **MPI-2.0–MPI-5.0:** length of returned name (integer) |
| `datatype` | IN | _MPI-2.0–MPI-2.2: absent_<br>**MPI-3.0–MPI-5.0:** datatype whose name is to be returned (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_GET_NAME|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_GET_NAME|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_GET_NAME|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_GET_NAME|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_GET_NAME|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_GET_NAME|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_GET_NAME|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_GET_NAME|API note]] · chapter [[versions/v50/sections/context|context]]
