---
title: MPI_WAITALL
c_name: MPI_Waitall
chapter: pt2pt
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WAITALL, MPI_Waitall]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_WAITALL

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_WAITALL|MPI-1.3]] · [[versions/v21/API/MPI_WAITALL|MPI-2.1]] Δ · [[versions/v22/API/MPI_WAITALL|MPI-2.2]] · [[versions/v30/API/MPI_WAITALL|MPI-3.0]] Δ · [[versions/v31/API/MPI_WAITALL|MPI-3.1]] Δ · [[versions/v40/API/MPI_WAITALL|MPI-4.0]] Δ · [[versions/v41/API/MPI_WAITALL|MPI-4.1]] · [[versions/v50/API/MPI_WAITALL|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Waitall(int count, MPI_Request *array_of_requests, MPI_Status *array_of_statuses)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Waitall(int count, MPI_Request array_of_requests[], MPI_Status array_of_statuses[])
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
static void MPI::Request::Waitall(int count, MPI::Request array_of_requests[], MPI::Status array_of_statuses[])
static void MPI::Request::Waitall(int count, MPI::Request array_of_requests[])
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Waitall(count, array_of_requests, array_of_statuses, ierror) BIND(C)
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(count)
    TYPE(MPI_Status) :: array_of_statuses(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Waitall(count, array_of_requests, array_of_statuses, ierror)
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(count)
    TYPE(MPI_Status) :: array_of_statuses(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-3.1**
```fortran
MPI_WAITALL(COUNT, ARRAY_OF_REQUESTS, ARRAY_OF_STATUSES, IERROR)
    INTEGER COUNT, ARRAY_OF_REQUESTS(*)
    INTEGER ARRAY_OF_STATUSES(MPI_STATUS_SIZE,*), IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_WAITALL(COUNT, ARRAY_OF_REQUESTS, ARRAY_OF_STATUSES, IERROR)
    INTEGER COUNT, ARRAY_OF_REQUESTS(*), ARRAY_OF_STATUSES(MPI_STATUS_SIZE, *), IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-1.3:** lists length (integer)<br>**MPI-2.1–MPI-3.1:** lists length (non-negative integer)<br>**MPI-4.0–MPI-4.1:** list length (non-negative integer)<br>**MPI-5.0:** list length (nonnegative integer) |
| `array_of_requests` | INOUT | **MPI-1.3–MPI-5.0:** array of requests (array of handles) |
| `array_of_statuses` | OUT | **MPI-1.3–MPI-3.1:** array of status objects (array of Status)<br>**MPI-4.0–MPI-5.0:** array of status objects (array of status) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_WAITALL|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_WAITALL|API note]] · chapter [[versions/v21/sections/pt2pt|pt2pt]]
- MPI-2.2: [[versions/v22/API/MPI_WAITALL|API note]] · chapter [[versions/v22/sections/pt2pt|pt2pt]]
- MPI-3.0: [[versions/v30/API/MPI_WAITALL|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_WAITALL|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_WAITALL|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_WAITALL|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_WAITALL|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
