---
title: MPI_STATUS_SET_ELEMENTS
c_name: MPI_Status_set_elements
chapter: ei
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_STATUS_SET_ELEMENTS, MPI_Status_set_elements]
tags: [mpi/routine, mpi/ei]
---

# MPI_STATUS_SET_ELEMENTS

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_STATUS_SET_ELEMENTS|MPI-2.0]] · [[versions/v21/API/MPI_STATUS_SET_ELEMENTS|MPI-2.1]] Δ · [[versions/v22/API/MPI_STATUS_SET_ELEMENTS|MPI-2.2]] · [[versions/v30/API/MPI_STATUS_SET_ELEMENTS|MPI-3.0]] Δ · [[versions/v31/API/MPI_STATUS_SET_ELEMENTS|MPI-3.1]] Δ · [[versions/v40/API/MPI_STATUS_SET_ELEMENTS|MPI-4.0]] Δ · [[versions/v41/API/MPI_STATUS_SET_ELEMENTS|MPI-4.1]] Δ · [[versions/v50/API/MPI_STATUS_SET_ELEMENTS|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-4.0**
```c
int MPI_Status_set_elements(MPI_Status *status, MPI_Datatype datatype, int count)
```

**MPI-4.1–MPI-5.0**
```c
int MPI_Status_set_elements(MPI_Status *status, MPI_Datatype datatype, int count)
int MPI_Status_set_elements_c(MPI_Status *status, MPI_Datatype datatype, MPI_Count count)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Status::Set_elements(const MPI::Datatype& datatype, int count)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Status_set_elements(status, datatype, count, ierror) BIND(C)
    TYPE(MPI_Status), INTENT(INOUT) :: status
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: count
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-4.0**
```fortran
MPI_Status_set_elements(status, datatype, count, ierror)
    TYPE(MPI_Status), INTENT(INOUT) :: status
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: count
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.1–MPI-5.0**
```fortran
MPI_Status_set_elements(status, datatype, count, ierror)
    TYPE(MPI_Status), INTENT(INOUT) :: status
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: count
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Status_set_elements(status, datatype, count, ierror) !(_c)
    TYPE(MPI_Status), INTENT(INOUT) :: status
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_STATUS_SET_ELEMENTS(STATUS, DATATYPE, COUNT, IERROR)
    INTEGER STATUS(MPI_STATUS_SIZE), DATATYPE, COUNT, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `status` | INOUT | **MPI-2.0:** status to associate count with (Status)<br>**MPI-2.1–MPI-3.1:** status with which to associate count (Status)<br>**MPI-4.0–MPI-5.0:** status with which to associate count (status) |
| `datatype` | IN | **MPI-2.0–MPI-5.0:** datatype associated with count (handle) |
| `count` | IN | **MPI-2.0–MPI-5.0:** number of elements to associate with status (integer) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_STATUS_SET_ELEMENTS|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_STATUS_SET_ELEMENTS|API note]] · chapter [[versions/v21/sections/ei|ei]]
- MPI-2.2: [[versions/v22/API/MPI_STATUS_SET_ELEMENTS|API note]] · chapter [[versions/v22/sections/ei|ei]]
- MPI-3.0: [[versions/v30/API/MPI_STATUS_SET_ELEMENTS|API note]] · chapter [[versions/v30/sections/ei|ei]]
- MPI-3.1: [[versions/v31/API/MPI_STATUS_SET_ELEMENTS|API note]] · chapter [[versions/v31/sections/ei|ei]]
- MPI-4.0: [[versions/v40/API/MPI_STATUS_SET_ELEMENTS|API note]] · chapter [[versions/v40/sections/ei|ei]]
- MPI-4.1: [[versions/v41/API/MPI_STATUS_SET_ELEMENTS|API note]] · chapter [[versions/v41/sections/ei|ei]]
- MPI-5.0: [[versions/v50/API/MPI_STATUS_SET_ELEMENTS|API note]] · chapter [[versions/v50/sections/ei|ei]]
