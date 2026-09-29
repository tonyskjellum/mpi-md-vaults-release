---
title: MPI_PROBE
c_name: MPI_Probe
chapter: pt2pt
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_PROBE, MPI_Probe]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_PROBE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_PROBE|MPI-1.3]] · [[versions/v21/API/MPI_PROBE|MPI-2.1]] Δ · [[versions/v22/API/MPI_PROBE|MPI-2.2]] Δ · [[versions/v30/API/MPI_PROBE|MPI-3.0]] Δ · [[versions/v31/API/MPI_PROBE|MPI-3.1]] Δ · [[versions/v40/API/MPI_PROBE|MPI-4.0]] Δ · [[versions/v41/API/MPI_PROBE|MPI-4.1]] · [[versions/v50/API/MPI_PROBE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Probe(int source, int tag, MPI_Comm comm, MPI_Status *status)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Comm::Probe(int source, int tag, MPI::Status& status) const
void MPI::Comm::Probe(int source, int tag) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Probe(source, tag, comm, status, ierror) BIND(C)
    INTEGER, INTENT(IN) :: source, tag
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Probe(source, tag, comm, status, ierror)
    INTEGER, INTENT(IN) :: source, tag
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_PROBE(SOURCE, TAG, COMM, STATUS, IERROR)
    INTEGER SOURCE, TAG, COMM, STATUS(MPI_STATUS_SIZE), IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `source` | IN | **MPI-1.3–MPI-2.1:** source rank, or MPI_ANY_SOURCE (integer)<br>**MPI-2.2–MPI-5.0:** rank of source or `MPI_ANY_SOURCE` (integer) |
| `tag` | IN | **MPI-1.3–MPI-2.1:** tag value, or MPI_ANY_TAG (integer)<br>**MPI-2.2–MPI-5.0:** message tag or `MPI_ANY_TAG` (integer) |
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |
| `status` | OUT | **MPI-1.3–MPI-3.1:** status object (Status)<br>**MPI-4.0–MPI-5.0:** status object (status) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_PROBE|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_PROBE|API note]] · chapter [[versions/v21/sections/pt2pt|pt2pt]]
- MPI-2.2: [[versions/v22/API/MPI_PROBE|API note]] · chapter [[versions/v22/sections/pt2pt|pt2pt]]
- MPI-3.0: [[versions/v30/API/MPI_PROBE|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_PROBE|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_PROBE|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_PROBE|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_PROBE|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
