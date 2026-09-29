---
title: MPI_SSEND
c_name: MPI_Ssend
chapter: pt2pt
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SSEND, MPI_Ssend]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_SSEND

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_SSEND|MPI-1.3]] · [[versions/v21/API/MPI_SSEND|MPI-2.1]] Δ · [[versions/v22/API/MPI_SSEND|MPI-2.2]] · [[versions/v30/API/MPI_SSEND|MPI-3.0]] Δ · [[versions/v31/API/MPI_SSEND|MPI-3.1]] Δ · [[versions/v40/API/MPI_SSEND|MPI-4.0]] Δ · [[versions/v41/API/MPI_SSEND|MPI-4.1]] · [[versions/v50/API/MPI_SSEND|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Ssend(void* buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Ssend(const void* buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Ssend(const void *buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm)
int MPI_Ssend_c(const void *buf, MPI_Count count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Comm::Ssend(const void* buf, int count, const MPI::Datatype& datatype, int dest, int tag) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Ssend(buf, count, datatype, dest, tag, comm, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN) :: buf
    INTEGER, INTENT(IN) :: count, dest, tag
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Ssend(buf, count, datatype, dest, tag, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: buf
    INTEGER, INTENT(IN) :: count, dest, tag
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Ssend(buf, count, datatype, dest, tag, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: buf
    INTEGER, INTENT(IN) :: count, dest, tag
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Ssend(buf, count, datatype, dest, tag, comm, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN) :: buf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: dest, tag
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_SSEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, IERROR)
    <type> BUF(*)
    INTEGER COUNT, DATATYPE, DEST, TAG, COMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `buf` | IN | **MPI-1.3–MPI-5.0:** initial address of send buffer (choice) |
| `count` | IN | **MPI-1.3:** number of elements in send buffer (integer)<br>**MPI-2.1–MPI-4.1:** number of elements in send buffer (non-negative integer)<br>**MPI-5.0:** number of elements in send buffer (nonnegative integer) |
| `datatype` | IN | **MPI-1.3–MPI-5.0:** datatype of each send buffer element (handle) |
| `dest` | IN | **MPI-1.3–MPI-5.0:** rank of destination (integer) |
| `tag` | IN | **MPI-1.3–MPI-5.0:** message tag (integer) |
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_SSEND|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_SSEND|API note]] · chapter [[versions/v21/sections/pt2pt|pt2pt]]
- MPI-2.2: [[versions/v22/API/MPI_SSEND|API note]] · chapter [[versions/v22/sections/pt2pt|pt2pt]]
- MPI-3.0: [[versions/v30/API/MPI_SSEND|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_SSEND|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_SSEND|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_SSEND|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_SSEND|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
