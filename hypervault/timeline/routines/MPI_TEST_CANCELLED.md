---
title: MPI_TEST_CANCELLED
c_name: MPI_Test_cancelled
chapter: pt2pt
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TEST_CANCELLED, MPI_Test_cancelled]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_TEST_CANCELLED

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_TEST_CANCELLED|MPI-1.3]] · [[versions/v21/API/MPI_TEST_CANCELLED|MPI-2.1]] Δ · [[versions/v22/API/MPI_TEST_CANCELLED|MPI-2.2]] · [[versions/v30/API/MPI_TEST_CANCELLED|MPI-3.0]] Δ · [[versions/v31/API/MPI_TEST_CANCELLED|MPI-3.1]] Δ · [[versions/v40/API/MPI_TEST_CANCELLED|MPI-4.0]] Δ · [[versions/v41/API/MPI_TEST_CANCELLED|MPI-4.1]] · [[versions/v50/API/MPI_TEST_CANCELLED|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Test_cancelled(MPI_Status *status, int *flag)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Test_cancelled(const MPI_Status *status, int *flag)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
bool MPI::Status::Is_cancelled() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Test_cancelled(status, flag, ierror) BIND(C)
    TYPE(MPI_Status), INTENT(IN) :: status
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Test_cancelled(status, flag, ierror)
    TYPE(MPI_Status), INTENT(IN) :: status
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-3.1**
```fortran
MPI_TEST_CANCELLED(STATUS, FLAG, IERROR)
    LOGICAL FLAG
    INTEGER STATUS(MPI_STATUS_SIZE), IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_TEST_CANCELLED(STATUS, FLAG, IERROR)
    INTEGER STATUS(MPI_STATUS_SIZE), IERROR
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `status` | IN | **MPI-1.3–MPI-3.1:** status object (Status)<br>**MPI-4.0–MPI-5.0:** status object (status) |
| `flag` | OUT | **MPI-1.3–MPI-3.1:** (logical)<br>**MPI-4.0–MPI-5.0:** `true` if the operation has been cancelled (logical) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_TEST_CANCELLED|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_TEST_CANCELLED|API note]] · chapter [[versions/v21/sections/pt2pt|pt2pt]]
- MPI-2.2: [[versions/v22/API/MPI_TEST_CANCELLED|API note]] · chapter [[versions/v22/sections/pt2pt|pt2pt]]
- MPI-3.0: [[versions/v30/API/MPI_TEST_CANCELLED|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_TEST_CANCELLED|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_TEST_CANCELLED|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_TEST_CANCELLED|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_TEST_CANCELLED|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
