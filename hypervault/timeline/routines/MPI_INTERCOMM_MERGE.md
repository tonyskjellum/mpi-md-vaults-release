---
title: MPI_INTERCOMM_MERGE
c_name: MPI_Intercomm_merge
chapter: context
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_INTERCOMM_MERGE, MPI_Intercomm_merge]
tags: [mpi/routine, mpi/context]
---

# MPI_INTERCOMM_MERGE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_INTERCOMM_MERGE|MPI-1.3]] · [[versions/v21/API/MPI_INTERCOMM_MERGE|MPI-2.1]] Δ · [[versions/v22/API/MPI_INTERCOMM_MERGE|MPI-2.2]] · [[versions/v30/API/MPI_INTERCOMM_MERGE|MPI-3.0]] Δ · [[versions/v31/API/MPI_INTERCOMM_MERGE|MPI-3.1]] Δ · [[versions/v40/API/MPI_INTERCOMM_MERGE|MPI-4.0]] Δ · [[versions/v41/API/MPI_INTERCOMM_MERGE|MPI-4.1]] · [[versions/v50/API/MPI_INTERCOMM_MERGE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Intercomm_merge(MPI_Comm intercomm, int high, MPI_Comm *newintracomm)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
MPI::Intracomm MPI::Intercomm::Merge(bool high) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Intercomm_merge(intercomm, high, newintracomm, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: intercomm
    LOGICAL, INTENT(IN) :: high
    TYPE(MPI_Comm), INTENT(OUT) :: newintracomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Intercomm_merge(intercomm, high, newintracomm, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: intercomm
    LOGICAL, INTENT(IN) :: high
    TYPE(MPI_Comm), INTENT(OUT) :: newintracomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-2.2**
```fortran
MPI_INTERCOMM_MERGE(INTERCOMM, HIGH, INTRACOMM, IERROR)
    INTEGER INTERCOMM, INTRACOMM, IERROR
    LOGICAL HIGH
```

**MPI-3.0–MPI-5.0**
```fortran
MPI_INTERCOMM_MERGE(INTERCOMM, HIGH, NEWINTRACOMM, IERROR)
    INTEGER INTERCOMM, NEWINTRACOMM, IERROR
    LOGICAL HIGH
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `intercomm` | IN | **MPI-1.3–MPI-3.1:** Inter-Communicator (handle)<br>**MPI-4.0–MPI-5.0:** inter-communicator (handle) |
| `high` | IN | **MPI-1.3–MPI-3.1:** (logical)<br>**MPI-4.0–MPI-5.0:** ordering of the local and remote groups in the new intra-communicator (logical) |
| `newintracomm` | OUT | **MPI-1.3–MPI-5.0:** new intra-communicator (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_INTERCOMM_MERGE|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_INTERCOMM_MERGE|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_INTERCOMM_MERGE|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_INTERCOMM_MERGE|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_INTERCOMM_MERGE|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_INTERCOMM_MERGE|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_INTERCOMM_MERGE|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_INTERCOMM_MERGE|API note]] · chapter [[versions/v50/sections/context|context]]
