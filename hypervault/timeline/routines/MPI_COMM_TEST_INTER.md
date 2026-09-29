---
title: MPI_COMM_TEST_INTER
c_name: MPI_Comm_test_inter
chapter: context
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_TEST_INTER, MPI_Comm_test_inter]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_TEST_INTER

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_COMM_TEST_INTER|MPI-1.3]] · [[versions/v21/API/MPI_COMM_TEST_INTER|MPI-2.1]] Δ · [[versions/v22/API/MPI_COMM_TEST_INTER|MPI-2.2]] · [[versions/v30/API/MPI_COMM_TEST_INTER|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_TEST_INTER|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_TEST_INTER|MPI-4.0]] Δ · [[versions/v41/API/MPI_COMM_TEST_INTER|MPI-4.1]] · [[versions/v50/API/MPI_COMM_TEST_INTER|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Comm_test_inter(MPI_Comm comm, int *flag)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
bool MPI::Comm::Is_inter() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_test_inter(comm, flag, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_test_inter(comm, flag, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_COMM_TEST_INTER(COMM, FLAG, IERROR)
    INTEGER COMM, IERROR
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |
| `flag` | OUT | **MPI-1.3–MPI-3.1:** (logical)<br>**MPI-4.0–MPI-5.0:** `true` if `comm` is an inter-communicator (logical) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_COMM_TEST_INTER|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_TEST_INTER|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_TEST_INTER|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_TEST_INTER|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_TEST_INTER|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_TEST_INTER|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_TEST_INTER|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_TEST_INTER|API note]] · chapter [[versions/v50/sections/context|context]]
