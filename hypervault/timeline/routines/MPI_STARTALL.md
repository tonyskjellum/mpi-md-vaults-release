---
title: MPI_STARTALL
c_name: MPI_Startall
chapter: pt2pt
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_STARTALL, MPI_Startall]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_STARTALL

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_STARTALL|MPI-1.3]] · [[versions/v21/API/MPI_STARTALL|MPI-2.1]] Δ · [[versions/v22/API/MPI_STARTALL|MPI-2.2]] · [[versions/v30/API/MPI_STARTALL|MPI-3.0]] Δ · [[versions/v31/API/MPI_STARTALL|MPI-3.1]] Δ · [[versions/v40/API/MPI_STARTALL|MPI-4.0]] Δ · [[versions/v41/API/MPI_STARTALL|MPI-4.1]] · [[versions/v50/API/MPI_STARTALL|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Startall(int count, MPI_Request *array_of_requests)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Startall(int count, MPI_Request array_of_requests[])
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
static void MPI::Prequest::Startall(int count, MPI::Prequest array_of_requests[])
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Startall(count, array_of_requests, ierror) BIND(C)
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(count)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Startall(count, array_of_requests, ierror)
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(count)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_STARTALL(COUNT, ARRAY_OF_REQUESTS, IERROR)
    INTEGER COUNT, ARRAY_OF_REQUESTS(*), IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-1.3:** list length (integer)<br>**MPI-2.1–MPI-4.1:** list length (non-negative integer)<br>**MPI-5.0:** list length (nonnegative integer) |
| `array_of_requests` | INOUT | **MPI-1.3–MPI-3.1:** array of requests (array of handle)<br>**MPI-4.0–MPI-5.0:** array of requests (array of handles) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_STARTALL|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_STARTALL|API note]] · chapter [[versions/v21/sections/pt2pt|pt2pt]]
- MPI-2.2: [[versions/v22/API/MPI_STARTALL|API note]] · chapter [[versions/v22/sections/pt2pt|pt2pt]]
- MPI-3.0: [[versions/v30/API/MPI_STARTALL|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_STARTALL|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_STARTALL|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_STARTALL|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_STARTALL|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
