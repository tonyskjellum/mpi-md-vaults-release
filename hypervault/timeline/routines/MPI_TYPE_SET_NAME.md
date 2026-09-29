---
title: MPI_TYPE_SET_NAME
c_name: MPI_Type_set_name
chapter: context
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_SET_NAME, MPI_Type_set_name]
tags: [mpi/routine, mpi/context]
---

# MPI_TYPE_SET_NAME

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_SET_NAME|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_SET_NAME|MPI-2.1]] · [[versions/v22/API/MPI_TYPE_SET_NAME|MPI-2.2]] · [[versions/v30/API/MPI_TYPE_SET_NAME|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_SET_NAME|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_SET_NAME|MPI-4.0]] · [[versions/v41/API/MPI_TYPE_SET_NAME|MPI-4.1]] Δ · [[versions/v50/API/MPI_TYPE_SET_NAME|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Type_set_name(MPI_Datatype type, char *type_name)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Type_set_name(MPI_Datatype datatype, const char *type_name)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Datatype::Set_name(const char* type_name)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_set_name(datatype, type_name, ierror) BIND(C)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    CHARACTER(LEN=*), INTENT(IN) :: type_name
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Type_set_name(datatype, type_name, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    CHARACTER(LEN=*), INTENT(IN) :: type_name
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-2.2**
```fortran
MPI_TYPE_SET_NAME(TYPE, TYPE_NAME, IERROR)
    INTEGER TYPE, IERROR
    CHARACTER*(*) TYPE_NAME
```

**MPI-3.0–MPI-5.0**
```fortran
MPI_TYPE_SET_NAME(DATATYPE, TYPE_NAME, IERROR)
    INTEGER DATATYPE, IERROR
    CHARACTER*(*) TYPE_NAME
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `type` | INOUT | **MPI-2.0–MPI-2.2:** datatype whose identifier is to be set (handle)<br>_MPI-3.0–MPI-5.0: absent_ |
| `type_name` | IN | **MPI-2.0–MPI-4.0:** the character string which is remembered as the name (string)<br>**MPI-4.1–MPI-5.0:** the character string that is remembered as the name (string) |
| `datatype` | INOUT | _MPI-2.0–MPI-2.2: absent_<br>**MPI-3.0–MPI-5.0:** datatype whose identifier is to be set (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_SET_NAME|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_SET_NAME|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_SET_NAME|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_SET_NAME|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_SET_NAME|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_SET_NAME|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_SET_NAME|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_SET_NAME|API note]] · chapter [[versions/v50/sections/context|context]]
