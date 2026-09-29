---
title: MPI_GET_ELEMENTS
c_name: MPI_Get_elements
chapter: datatypes
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GET_ELEMENTS, MPI_Get_elements]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_GET_ELEMENTS

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_GET_ELEMENTS|MPI-1.3]] · [[versions/v21/API/MPI_GET_ELEMENTS|MPI-2.1]] Δ · [[versions/v22/API/MPI_GET_ELEMENTS|MPI-2.2]] · [[versions/v30/API/MPI_GET_ELEMENTS|MPI-3.0]] Δ · [[versions/v31/API/MPI_GET_ELEMENTS|MPI-3.1]] Δ · [[versions/v40/API/MPI_GET_ELEMENTS|MPI-4.0]] Δ · [[versions/v41/API/MPI_GET_ELEMENTS|MPI-4.1]] · [[versions/v50/API/MPI_GET_ELEMENTS|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Get_elements(MPI_Status *status, MPI_Datatype datatype, int *count)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Get_elements(const MPI_Status *status, MPI_Datatype datatype, int *count)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Get_elements(const MPI_Status *status, MPI_Datatype datatype, int *count)
int MPI_Get_elements_c(const MPI_Status *status, MPI_Datatype datatype, MPI_Count *count)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI::Status::Get_elements(const MPI::Datatype& datatype) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Get_elements(status, datatype, count, ierror) BIND(C)
    TYPE(MPI_Status), INTENT(IN) :: status
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(OUT) :: count
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Get_elements(status, datatype, count, ierror)
    TYPE(MPI_Status), INTENT(IN) :: status
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(OUT) :: count
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Get_elements(status, datatype, count, ierror)
    TYPE(MPI_Status), INTENT(IN) :: status
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(OUT) :: count
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Get_elements(status, datatype, count, ierror) !(_c)
    TYPE(MPI_Status), INTENT(IN) :: status
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: count
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_GET_ELEMENTS(STATUS, DATATYPE, COUNT, IERROR)
    INTEGER STATUS(MPI_STATUS_SIZE), DATATYPE, COUNT, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `status` | IN | **MPI-1.3–MPI-3.1:** return status of receive operation (Status)<br>**MPI-4.0–MPI-5.0:** return status of receive operation (status) |
| `datatype` | IN | **MPI-1.3–MPI-5.0:** datatype used by receive operation (handle) |
| `count` | OUT | **MPI-1.3–MPI-5.0:** number of received basic elements (integer) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_GET_ELEMENTS|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_GET_ELEMENTS|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_GET_ELEMENTS|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_GET_ELEMENTS|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_GET_ELEMENTS|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_GET_ELEMENTS|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_GET_ELEMENTS|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_GET_ELEMENTS|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
