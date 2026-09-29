---
title: MPI_IRSEND
c_name: MPI_Irsend
chapter: pt2pt
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_IRSEND, MPI_Irsend]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_IRSEND

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_IRSEND|MPI-1.3]] · [[versions/v21/API/MPI_IRSEND|MPI-2.1]] Δ · [[versions/v22/API/MPI_IRSEND|MPI-2.2]] · [[versions/v30/API/MPI_IRSEND|MPI-3.0]] Δ · [[versions/v31/API/MPI_IRSEND|MPI-3.1]] Δ · [[versions/v40/API/MPI_IRSEND|MPI-4.0]] Δ · [[versions/v41/API/MPI_IRSEND|MPI-4.1]] · [[versions/v50/API/MPI_IRSEND|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Irsend(void* buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, MPI_Request *request)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Irsend(const void* buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, MPI_Request *request)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Irsend(const void *buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, MPI_Request *request)
int MPI_Irsend_c(const void *buf, MPI_Count count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, MPI_Request *request)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
MPI::Request MPI::Comm::Irsend(const void* buf, int count, const MPI::Datatype& datatype, int dest, int tag) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Irsend(buf, count, datatype, dest, tag, comm, request, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: buf
    INTEGER, INTENT(IN) :: count, dest, tag
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Irsend(buf, count, datatype, dest, tag, comm, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: buf
    INTEGER, INTENT(IN) :: count, dest, tag
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Irsend(buf, count, datatype, dest, tag, comm, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: buf
    INTEGER, INTENT(IN) :: count, dest, tag
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Irsend(buf, count, datatype, dest, tag, comm, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: buf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: dest, tag
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_IRSEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR)
    <type> BUF(*)
    INTEGER COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR
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
| `request` | OUT | **MPI-1.3–MPI-5.0:** communication request (handle) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_IRSEND|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_IRSEND|API note]] · chapter [[versions/v21/sections/pt2pt|pt2pt]]
- MPI-2.2: [[versions/v22/API/MPI_IRSEND|API note]] · chapter [[versions/v22/sections/pt2pt|pt2pt]]
- MPI-3.0: [[versions/v30/API/MPI_IRSEND|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_IRSEND|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_IRSEND|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_IRSEND|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_IRSEND|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
