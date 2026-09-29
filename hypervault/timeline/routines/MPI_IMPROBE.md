---
title: MPI_IMPROBE
c_name: MPI_Improbe
chapter: pt2pt
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_IMPROBE, MPI_Improbe]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_IMPROBE

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_IMPROBE|MPI-3.0]] · [[versions/v31/API/MPI_IMPROBE|MPI-3.1]] Δ · [[versions/v40/API/MPI_IMPROBE|MPI-4.0]] Δ · [[versions/v41/API/MPI_IMPROBE|MPI-4.1]] · [[versions/v50/API/MPI_IMPROBE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Improbe(int source, int tag, MPI_Comm comm, int *flag, MPI_Message *message, MPI_Status *status)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Improbe(source, tag, comm, flag, message, status, ierror) BIND(C)
    INTEGER, INTENT(IN) :: source, tag
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: flag
    TYPE(MPI_Message), INTENT(OUT) :: message
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Improbe(source, tag, comm, flag, message, status, ierror)
    INTEGER, INTENT(IN) :: source, tag
    TYPE(MPI_Comm), INTENT(IN) :: comm
    LOGICAL, INTENT(OUT) :: flag
    TYPE(MPI_Message), INTENT(OUT) :: message
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0**
```fortran
MPI_IMPROBE(SOURCE, TAG, COMM, FLAG, MESSAGE, STATUS, IERROR)
    INTEGER SOURCE, TAG, COMM, FLAG, MESSAGE, STATUS(MPI_STATUS_SIZE), IERROR
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_IMPROBE(SOURCE, TAG, COMM, FLAG, MESSAGE, STATUS, IERROR)
    INTEGER SOURCE, TAG, COMM, MESSAGE, STATUS(MPI_STATUS_SIZE), IERROR
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `source` | IN | **MPI-3.0–MPI-5.0:** rank of source or `MPI_ANY_SOURCE` (integer) |
| `tag` | IN | **MPI-3.0–MPI-5.0:** message tag or `MPI_ANY_TAG` (integer) |
| `comm` | IN | **MPI-3.0–MPI-5.0:** communicator (handle) |
| `flag` | OUT | **MPI-3.0–MPI-3.1:** flag (logical)<br>**MPI-4.0–MPI-5.0:** `true` if there is a matching message that can be received (logical) |
| `message` | OUT | **MPI-3.0–MPI-5.0:** returned message (handle) |
| `status` | OUT | **MPI-3.0–MPI-3.1:** status object (Status)<br>**MPI-4.0–MPI-5.0:** status object (status) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_IMPROBE|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_IMPROBE|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_IMPROBE|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_IMPROBE|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_IMPROBE|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
