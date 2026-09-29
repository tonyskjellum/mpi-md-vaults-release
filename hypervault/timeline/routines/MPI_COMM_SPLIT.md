---
title: MPI_COMM_SPLIT
c_name: MPI_Comm_split
chapter: context
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_SPLIT, MPI_Comm_split]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_SPLIT

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_COMM_SPLIT|MPI-1.3]] · [[versions/v20/API/MPI_COMM_SPLIT|MPI-2.0]] · [[versions/v21/API/MPI_COMM_SPLIT|MPI-2.1]] Δ · [[versions/v22/API/MPI_COMM_SPLIT|MPI-2.2]] · [[versions/v30/API/MPI_COMM_SPLIT|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_SPLIT|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_SPLIT|MPI-4.0]] Δ · [[versions/v41/API/MPI_COMM_SPLIT|MPI-4.1]] · [[versions/v50/API/MPI_COMM_SPLIT|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3**
```c
int MPI_Comm_split(MPI_Comm comm, int color, int key, MPI_Comm *newcomm)
```

**MPI-2.0**
_(no C binding)_

**MPI-2.1–MPI-5.0**
```c
int MPI_Comm_split(MPI_Comm comm, int color, int key, MPI_Comm *newcomm)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.0–MPI-2.2**
```c
MPI::Intercomm MPI::Intercomm::Split(int color, int key) const
MPI::Intracomm MPI::Intracomm::Split(int color, int key) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_split(comm, color, key, newcomm, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: color, key
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_split(comm, color, key, newcomm, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: color, key
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3**
```fortran
MPI_COMM_SPLIT(COMM, COLOR, KEY, NEWCOMM, IERROR)
    INTEGER COMM, COLOR, KEY, NEWCOMM, IERROR
```

**MPI-2.0**
_(no mpif.h binding)_

**MPI-2.1–MPI-5.0**
```fortran
MPI_COMM_SPLIT(COMM, COLOR, KEY, NEWCOMM, IERROR)
    INTEGER COMM, COLOR, KEY, NEWCOMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3:** communicator (handle)<br>_MPI-2.0: absent_<br>**MPI-2.1–MPI-5.0:** communicator (handle) |
| `color` | IN | **MPI-1.3–MPI-5.0:** control of subset assignment (integer) |
| `key` | IN | **MPI-1.3:** control of rank assigment (integer)<br>**MPI-2.0:** control of rank assignment (integer)<br>**MPI-2.1–MPI-3.1:** control of rank assigment (integer)<br>**MPI-4.0–MPI-5.0:** control of rank assignment (integer) |
| `newcomm` | OUT | **MPI-1.3:** new communicator (handle)<br>_MPI-2.0: absent_<br>**MPI-2.1–MPI-5.0:** new communicator (handle) |
| `comm_in` | IN | _MPI-1.3: absent_<br>**MPI-2.0:** original communicator (handle)<br>_MPI-2.1–MPI-5.0: absent_ |
| `comm_out` | OUT | _MPI-1.3: absent_<br>**MPI-2.0:** new communicator (handle)<br>_MPI-2.1–MPI-5.0: absent_ |

## Named in the change log of

[[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_COMM_SPLIT|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.0: [[versions/v20/API/MPI_COMM_SPLIT|API note]] · chapter [[versions/v20/sections/collective|collective]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_SPLIT|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_SPLIT|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_SPLIT|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_SPLIT|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_SPLIT|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_SPLIT|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_SPLIT|API note]] · chapter [[versions/v50/sections/context|context]]
