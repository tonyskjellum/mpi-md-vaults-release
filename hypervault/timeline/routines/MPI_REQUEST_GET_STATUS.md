---
title: MPI_REQUEST_GET_STATUS
c_name: MPI_Request_get_status
chapter: pt2pt
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_REQUEST_GET_STATUS, MPI_Request_get_status]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_REQUEST_GET_STATUS

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_REQUEST_GET_STATUS|MPI-2.0]] · [[versions/v21/API/MPI_REQUEST_GET_STATUS|MPI-2.1]] · [[versions/v22/API/MPI_REQUEST_GET_STATUS|MPI-2.2]] · [[versions/v30/API/MPI_REQUEST_GET_STATUS|MPI-3.0]] Δ · [[versions/v31/API/MPI_REQUEST_GET_STATUS|MPI-3.1]] Δ · [[versions/v40/API/MPI_REQUEST_GET_STATUS|MPI-4.0]] Δ · [[versions/v41/API/MPI_REQUEST_GET_STATUS|MPI-4.1]] · [[versions/v50/API/MPI_REQUEST_GET_STATUS|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Request_get_status(MPI_Request request, int *flag, MPI_Status *status)
```

## C++

**MPI-2.0–MPI-2.2**
```c
bool MPI::Request::Get_status(MPI::Status& status) const
bool MPI::Request::Get_status() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Request_get_status(request, flag, status, ierror) BIND(C)
    TYPE(MPI_Request), INTENT(IN) :: request
    LOGICAL, INTENT(OUT) :: flag
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Request_get_status(request, flag, status, ierror)
    TYPE(MPI_Request), INTENT(IN) :: request
    LOGICAL, INTENT(OUT) :: flag
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_REQUEST_GET_STATUS( REQUEST, FLAG, STATUS, IERROR)
    INTEGER REQUEST, STATUS(MPI_STATUS_SIZE), IERROR
    LOGICAL FLAG
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_REQUEST_GET_STATUS(REQUEST, FLAG, STATUS, IERROR)
    INTEGER REQUEST, STATUS(MPI_STATUS_SIZE), IERROR
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `request` | IN | **MPI-2.0–MPI-5.0:** request (handle) |
| `flag` | OUT | **MPI-2.0–MPI-5.0:** boolean flag, same as from `MPI_TEST` (logical) |
| `status` | OUT | **MPI-2.0–MPI-2.2:** `MPI_STATUS` object if flag is true (Status)<br>**MPI-3.0–MPI-3.1:** status object if flag is true (Status)<br>**MPI-4.0–MPI-5.0:** status object if flag is true (status) |

## Named in the change log of

[[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_REQUEST_GET_STATUS|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_REQUEST_GET_STATUS|API note]] · chapter [[versions/v21/sections/pt2pt|pt2pt]]
- MPI-2.2: [[versions/v22/API/MPI_REQUEST_GET_STATUS|API note]] · chapter [[versions/v22/sections/pt2pt|pt2pt]]
- MPI-3.0: [[versions/v30/API/MPI_REQUEST_GET_STATUS|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_REQUEST_GET_STATUS|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_REQUEST_GET_STATUS|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_REQUEST_GET_STATUS|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_REQUEST_GET_STATUS|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
