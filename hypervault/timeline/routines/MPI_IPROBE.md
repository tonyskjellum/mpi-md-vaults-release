---
title: MPI_IPROBE
c_name: MPI_Iprobe
chapter: pt2pt
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_IPROBE, MPI_Iprobe]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_IPROBE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_IPROBE|MPI-1.3]] · [[versions/v21/API/MPI_IPROBE|MPI-2.1]] Δ · [[versions/v22/API/MPI_IPROBE|MPI-2.2]] Δ · [[versions/v30/API/MPI_IPROBE|MPI-3.0]] Δ · [[versions/v31/API/MPI_IPROBE|MPI-3.1]] Δ · [[versions/v40/API/MPI_IPROBE|MPI-4.0]] Δ · [[versions/v41/API/MPI_IPROBE|MPI-4.1]] · [[versions/v50/API/MPI_IPROBE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Iprobe(int source, int tag, MPI_Comm comm, int *flag, MPI_Status *status)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
bool MPI::Comm::Iprobe(int source, int tag, MPI::Status& status) const
bool MPI::Comm::Iprobe(int source, int tag) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Iprobe(source, tag, comm, flag, status, ierror) BIND(C)
    INTEGER, INTENT(IN) :: source, tag
    TYPE(MPI_Comm), INTENT(IN) :: comm
    LOGICAL, INTENT(OUT) :: flag
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Iprobe(source, tag, comm, flag, status, ierror)
    INTEGER, INTENT(IN) :: source, tag
    TYPE(MPI_Comm), INTENT(IN) :: comm
    LOGICAL, INTENT(OUT) :: flag
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-3.1**
```fortran
MPI_IPROBE(SOURCE, TAG, COMM, FLAG, STATUS, IERROR)
    LOGICAL FLAG
    INTEGER SOURCE, TAG, COMM, STATUS(MPI_STATUS_SIZE), IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_IPROBE(SOURCE, TAG, COMM, FLAG, STATUS, IERROR)
    INTEGER SOURCE, TAG, COMM, STATUS(MPI_STATUS_SIZE), IERROR
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `source` | IN | **MPI-1.3–MPI-2.1:** source rank, or MPI_ANY_SOURCE (integer)<br>**MPI-2.2–MPI-5.0:** rank of source or `MPI_ANY_SOURCE` (integer) |
| `tag` | IN | **MPI-1.3–MPI-2.1:** tag value or MPI_ANY_TAG (integer)<br>**MPI-2.2–MPI-5.0:** message tag or `MPI_ANY_TAG` (integer) |
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |
| `flag` | OUT | **MPI-1.3–MPI-3.1:** (logical)<br>**MPI-4.0–MPI-5.0:** `true` if there is a matching message that can be received (logical) |
| `status` | OUT | **MPI-1.3–MPI-3.1:** status object (Status)<br>**MPI-4.0–MPI-5.0:** status object (status) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_IPROBE|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_IPROBE|API note]] · chapter [[versions/v21/sections/pt2pt|pt2pt]]
- MPI-2.2: [[versions/v22/API/MPI_IPROBE|API note]] · chapter [[versions/v22/sections/pt2pt|pt2pt]]
- MPI-3.0: [[versions/v30/API/MPI_IPROBE|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_IPROBE|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_IPROBE|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_IPROBE|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_IPROBE|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
