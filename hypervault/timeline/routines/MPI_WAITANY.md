---
title: MPI_WAITANY
c_name: MPI_Waitany
chapter: pt2pt
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WAITANY, MPI_Waitany]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_WAITANY

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_WAITANY|MPI-1.3]] · [[versions/v21/API/MPI_WAITANY|MPI-2.1]] Δ · [[versions/v22/API/MPI_WAITANY|MPI-2.2]] · [[versions/v30/API/MPI_WAITANY|MPI-3.0]] Δ · [[versions/v31/API/MPI_WAITANY|MPI-3.1]] Δ · [[versions/v40/API/MPI_WAITANY|MPI-4.0]] Δ · [[versions/v41/API/MPI_WAITANY|MPI-4.1]] · [[versions/v50/API/MPI_WAITANY|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Waitany(int count, MPI_Request *array_of_requests, int *index, MPI_Status *status)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Waitany(int count, MPI_Request array_of_requests[], int *index, MPI_Status *status)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
static int MPI::Request::Waitany(int count, MPI::Request array_of_requests[], MPI::Status& status)
static int MPI::Request::Waitany(int count, MPI::Request array_of_requests[])
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Waitany(count, array_of_requests, index, status, ierror) BIND(C)
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(count)
    INTEGER, INTENT(OUT) :: index
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Waitany(count, array_of_requests, index, status, ierror)
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(count)
    INTEGER, INTENT(OUT) :: index
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-3.0**
```fortran
MPI_WAITANY(COUNT, ARRAY_OF_REQUESTS, INDEX, STATUS, IERROR)
    INTEGER COUNT, ARRAY_OF_REQUESTS(*), INDEX, STATUS(MPI_STATUS_SIZE), IERROR
```

**MPI-3.1**
```fortran
MPI_WAITANY(COUNT, ARRAY_OF_REQUESTS, INDEX, STATUS, IERROR)
    INTEGER COUNT, ARRAY_OF_REQUESTS(*), INDEX, STATUS(MPI_STATUS_SIZE),
    IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_WAITANY(COUNT, ARRAY_OF_REQUESTS, INDEX, STATUS, IERROR)
    INTEGER COUNT, ARRAY_OF_REQUESTS(*), INDEX, STATUS(MPI_STATUS_SIZE), IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-1.3:** list length (integer)<br>**MPI-2.1–MPI-4.1:** list length (non-negative integer)<br>**MPI-5.0:** list length (nonnegative integer) |
| `array_of_requests` | INOUT | **MPI-1.3–MPI-5.0:** array of requests (array of handles) |
| `index` | OUT | **MPI-1.3–MPI-5.0:** index of handle for operation that completed (integer) |
| `status` | OUT | **MPI-1.3–MPI-3.1:** status object (Status)<br>**MPI-4.0–MPI-5.0:** status object (status) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_WAITANY|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_WAITANY|API note]] · chapter [[versions/v21/sections/pt2pt|pt2pt]]
- MPI-2.2: [[versions/v22/API/MPI_WAITANY|API note]] · chapter [[versions/v22/sections/pt2pt|pt2pt]]
- MPI-3.0: [[versions/v30/API/MPI_WAITANY|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_WAITANY|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_WAITANY|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_WAITANY|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_WAITANY|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
