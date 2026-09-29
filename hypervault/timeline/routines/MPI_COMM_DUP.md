---
title: MPI_COMM_DUP
c_name: MPI_Comm_dup
chapter: context
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_DUP, MPI_Comm_dup]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_DUP

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_COMM_DUP|MPI-1.3]] · [[versions/v21/API/MPI_COMM_DUP|MPI-2.1]] Δ · [[versions/v22/API/MPI_COMM_DUP|MPI-2.2]] Δ · [[versions/v30/API/MPI_COMM_DUP|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_DUP|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_DUP|MPI-4.0]] · [[versions/v41/API/MPI_COMM_DUP|MPI-4.1]] · [[versions/v50/API/MPI_COMM_DUP|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Comm_dup(MPI_Comm comm, MPI_Comm *newcomm)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1**
```c
MPI::Intracomm MPI::Intracomm::Dup() const
MPI::Intercomm MPI::Intercomm::Dup() const
MPI::Cartcomm MPI::Cartcomm::Dup() const
MPI::Graphcomm MPI::Graphcomm::Dup() const
MPI::Comm& MPI::Comm::Clone() const = 0
MPI::Intracomm& MPI::Intracomm::Clone() const
MPI::Intercomm& MPI::Intercomm::Clone() const
MPI::Cartcomm& MPI::Cartcomm::Clone() const
MPI::Graphcomm& MPI::Graphcomm::Clone() const
```

**MPI-2.2**
```c
MPI::Intracomm MPI::Intracomm::Dup() const
MPI::Intercomm MPI::Intercomm::Dup() const
MPI::Cartcomm MPI::Cartcomm::Dup() const
MPI::Graphcomm MPI::Graphcomm::Dup() const
MPI::Distgraphcomm MPI::Distgraphcomm::Dup() const
MPI::Comm& MPI::Comm::Clone() const = 0
MPI::Intracomm& MPI::Intracomm::Clone() const
MPI::Intercomm& MPI::Intercomm::Clone() const
MPI::Cartcomm& MPI::Cartcomm::Clone() const
MPI::Graphcomm& MPI::Graphcomm::Clone() const
MPI::Distgraphcomm& MPI::Distgraphcomm::Clone() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_dup(comm, newcomm, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_dup(comm, newcomm, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_COMM_DUP(COMM, NEWCOMM, IERROR)
    INTEGER COMM, NEWCOMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |
| `newcomm` | OUT | **MPI-1.3–MPI-5.0:** copy of `comm` (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_COMM_DUP|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_DUP|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_DUP|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_DUP|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_DUP|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_DUP|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_DUP|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_DUP|API note]] · chapter [[versions/v50/sections/context|context]]
