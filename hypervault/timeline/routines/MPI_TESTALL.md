---
title: MPI_TESTALL
c_name: MPI_Testall
chapter: pt2pt
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TESTALL, MPI_Testall]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_TESTALL

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_TESTALL|MPI-1.3]] · [[versions/v21/API/MPI_TESTALL|MPI-2.1]] Δ · [[versions/v22/API/MPI_TESTALL|MPI-2.2]] · [[versions/v30/API/MPI_TESTALL|MPI-3.0]] Δ · [[versions/v31/API/MPI_TESTALL|MPI-3.1]] Δ · [[versions/v40/API/MPI_TESTALL|MPI-4.0]] Δ · [[versions/v41/API/MPI_TESTALL|MPI-4.1]] · [[versions/v50/API/MPI_TESTALL|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Testall(int count, MPI_Request *array_of_requests, int *flag, MPI_Status *array_of_statuses)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Testall(int count, MPI_Request array_of_requests[], int *flag, MPI_Status array_of_statuses[])
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
static bool MPI::Request::Testall(int count, MPI::Request array_of_requests[], MPI::Status array_of_statuses[])
static bool MPI::Request::Testall(int count, MPI::Request array_of_requests[])
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Testall(count, array_of_requests, flag, array_of_statuses, ierror) BIND(C)
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(count)
    LOGICAL, INTENT(OUT) :: flag
    TYPE(MPI_Status) :: array_of_statuses(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Testall(count, array_of_requests, flag, array_of_statuses, ierror)
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(count)
    LOGICAL, INTENT(OUT) :: flag
    TYPE(MPI_Status) :: array_of_statuses(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-3.0**
```fortran
MPI_TESTALL(COUNT, ARRAY_OF_REQUESTS, FLAG, ARRAY_OF_STATUSES, IERROR)
    LOGICAL FLAG
    INTEGER COUNT, ARRAY_OF_REQUESTS(*), ARRAY_OF_STATUSES(MPI_STATUS_SIZE,*), IERROR
```

**MPI-3.1**
```fortran
MPI_TESTALL(COUNT, ARRAY_OF_REQUESTS, FLAG, ARRAY_OF_STATUSES, IERROR)
    LOGICAL FLAG
    INTEGER COUNT, ARRAY_OF_REQUESTS(*),
    ARRAY_OF_STATUSES(MPI_STATUS_SIZE,*), IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_TESTALL(COUNT, ARRAY_OF_REQUESTS, FLAG, ARRAY_OF_STATUSES, IERROR)
    INTEGER COUNT, ARRAY_OF_REQUESTS(*), ARRAY_OF_STATUSES(MPI_STATUS_SIZE, *), IERROR
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-1.3:** lists length (integer)<br>**MPI-2.1–MPI-3.1:** lists length (non-negative integer)<br>**MPI-4.0–MPI-4.1:** list length (non-negative integer)<br>**MPI-5.0:** list length (nonnegative integer) |
| `array_of_requests` | INOUT | **MPI-1.3–MPI-5.0:** array of requests (array of handles) |
| `flag` | OUT | **MPI-1.3–MPI-3.1:** (logical)<br>**MPI-4.0–MPI-5.0:** `true` if all of the operations are complete (logical) |
| `array_of_statuses` | OUT | **MPI-1.3–MPI-3.1:** array of status objects (array of Status)<br>**MPI-4.0–MPI-5.0:** array of status objects (array of status) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_TESTALL|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_TESTALL|API note]] · chapter [[versions/v21/sections/pt2pt|pt2pt]]
- MPI-2.2: [[versions/v22/API/MPI_TESTALL|API note]] · chapter [[versions/v22/sections/pt2pt|pt2pt]]
- MPI-3.0: [[versions/v30/API/MPI_TESTALL|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_TESTALL|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_TESTALL|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_TESTALL|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_TESTALL|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
