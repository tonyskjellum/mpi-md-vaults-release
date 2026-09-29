---
title: MPI_STATUS_SET_CANCELLED
c_name: MPI_Status_set_cancelled
chapter: ei
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_STATUS_SET_CANCELLED, MPI_Status_set_cancelled]
tags: [mpi/routine, mpi/ei]
---

# MPI_STATUS_SET_CANCELLED

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_STATUS_SET_CANCELLED|MPI-2.0]] · [[versions/v21/API/MPI_STATUS_SET_CANCELLED|MPI-2.1]] Δ · [[versions/v22/API/MPI_STATUS_SET_CANCELLED|MPI-2.2]] · [[versions/v30/API/MPI_STATUS_SET_CANCELLED|MPI-3.0]] Δ · [[versions/v31/API/MPI_STATUS_SET_CANCELLED|MPI-3.1]] Δ · [[versions/v40/API/MPI_STATUS_SET_CANCELLED|MPI-4.0]] Δ · [[versions/v41/API/MPI_STATUS_SET_CANCELLED|MPI-4.1]] · [[versions/v50/API/MPI_STATUS_SET_CANCELLED|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Status_set_cancelled(MPI_Status *status, int flag)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Status::Set_cancelled(bool flag)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Status_set_cancelled(status, flag, ierror) BIND(C)
    TYPE(MPI_Status), INTENT(INOUT) :: status
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Status_set_cancelled(status, flag, ierror)
    TYPE(MPI_Status), INTENT(INOUT) :: status
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Status_set_cancelled(status, flag, ierror)
    TYPE(MPI_Status), INTENT(INOUT) :: status
    LOGICAL, INTENT(IN) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_STATUS_SET_CANCELLED(STATUS, FLAG, IERROR)
    INTEGER STATUS(MPI_STATUS_SIZE), IERROR
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `status` | INOUT | **MPI-2.0:** status to associate cancel flag with (Status)<br>**MPI-2.1–MPI-3.1:** status with which to associate cancel flag (Status)<br>**MPI-4.0–MPI-5.0:** status with which to associate cancel flag (status) |
| `flag` | IN | **MPI-2.0–MPI-3.1:** if true indicates request was cancelled (logical)<br>**MPI-4.0–MPI-5.0:** if true, indicates request was cancelled (logical) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_STATUS_SET_CANCELLED|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_STATUS_SET_CANCELLED|API note]] · chapter [[versions/v21/sections/ei|ei]]
- MPI-2.2: [[versions/v22/API/MPI_STATUS_SET_CANCELLED|API note]] · chapter [[versions/v22/sections/ei|ei]]
- MPI-3.0: [[versions/v30/API/MPI_STATUS_SET_CANCELLED|API note]] · chapter [[versions/v30/sections/ei|ei]]
- MPI-3.1: [[versions/v31/API/MPI_STATUS_SET_CANCELLED|API note]] · chapter [[versions/v31/sections/ei|ei]]
- MPI-4.0: [[versions/v40/API/MPI_STATUS_SET_CANCELLED|API note]] · chapter [[versions/v40/sections/ei|ei]]
- MPI-4.1: [[versions/v41/API/MPI_STATUS_SET_CANCELLED|API note]] · chapter [[versions/v41/sections/ei|ei]]
- MPI-5.0: [[versions/v50/API/MPI_STATUS_SET_CANCELLED|API note]] · chapter [[versions/v50/sections/ei|ei]]
