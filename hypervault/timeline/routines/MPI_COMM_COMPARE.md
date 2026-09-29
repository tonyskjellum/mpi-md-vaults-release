---
title: MPI_COMM_COMPARE
c_name: MPI_Comm_compare
chapter: context
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_COMPARE, MPI_Comm_compare]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_COMPARE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_COMM_COMPARE|MPI-1.3]] · [[versions/v21/API/MPI_COMM_COMPARE|MPI-2.1]] Δ · [[versions/v22/API/MPI_COMM_COMPARE|MPI-2.2]] · [[versions/v30/API/MPI_COMM_COMPARE|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_COMPARE|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_COMPARE|MPI-4.0]] · [[versions/v41/API/MPI_COMM_COMPARE|MPI-4.1]] · [[versions/v50/API/MPI_COMM_COMPARE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Comm_compare(MPI_Comm comm1,MPI_Comm comm2, int *result)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Comm_compare(MPI_Comm comm1, MPI_Comm comm2, int *result)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
static int MPI::Comm::Compare(const MPI::Comm& comm1, const MPI::Comm& comm2)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_compare(comm1, comm2, result, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm1, comm2
    INTEGER, INTENT(OUT) :: result
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_compare(comm1, comm2, result, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm1, comm2
    INTEGER, INTENT(OUT) :: result
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_COMM_COMPARE(COMM1, COMM2, RESULT, IERROR)
    INTEGER COMM1, COMM2, RESULT, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm1` | IN | **MPI-1.3–MPI-5.0:** first communicator (handle) |
| `comm2` | IN | **MPI-1.3–MPI-5.0:** second communicator (handle) |
| `result` | OUT | **MPI-1.3–MPI-5.0:** result (integer) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_COMM_COMPARE|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_COMPARE|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_COMPARE|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_COMPARE|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_COMPARE|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_COMPARE|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_COMPARE|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_COMPARE|API note]] · chapter [[versions/v50/sections/context|context]]
