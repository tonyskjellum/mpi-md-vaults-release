---
title: MPI_SENDRECV_REPLACE
c_name: MPI_Sendrecv_replace
chapter: pt2pt
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SENDRECV_REPLACE, MPI_Sendrecv_replace]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_SENDRECV_REPLACE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_SENDRECV_REPLACE|MPI-1.3]] · [[versions/v21/API/MPI_SENDRECV_REPLACE|MPI-2.1]] Δ · [[versions/v22/API/MPI_SENDRECV_REPLACE|MPI-2.2]] Δ · [[versions/v30/API/MPI_SENDRECV_REPLACE|MPI-3.0]] Δ · [[versions/v31/API/MPI_SENDRECV_REPLACE|MPI-3.1]] Δ · [[versions/v40/API/MPI_SENDRECV_REPLACE|MPI-4.0]] Δ · [[versions/v41/API/MPI_SENDRECV_REPLACE|MPI-4.1]] · [[versions/v50/API/MPI_SENDRECV_REPLACE|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-3.1**
```c
int MPI_Sendrecv_replace(void* buf, int count, MPI_Datatype datatype, int dest, int sendtag, int source, int recvtag, MPI_Comm comm, MPI_Status *status)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Sendrecv_replace(void *buf, int count, MPI_Datatype datatype, int dest, int sendtag, int source, int recvtag, MPI_Comm comm, MPI_Status *status)
int MPI_Sendrecv_replace_c(void *buf, MPI_Count count, MPI_Datatype datatype, int dest, int sendtag, int source, int recvtag, MPI_Comm comm, MPI_Status *status)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Comm::Sendrecv_replace(void* buf, int count, const MPI::Datatype& datatype, int dest, int sendtag, int source, int recvtag, MPI::Status& status) const
void MPI::Comm::Sendrecv_replace(void* buf, int count, const MPI::Datatype& datatype, int dest, int sendtag, int source, int recvtag) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Sendrecv_replace(buf, count, datatype, dest, sendtag, source, recvtag, comm, status, ierror) BIND(C)
    TYPE(*), DIMENSION(..) :: buf
    INTEGER, INTENT(IN) :: count, dest, sendtag, source, recvtag
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Sendrecv_replace(buf, count, datatype, dest, sendtag, source, recvtag, comm, status, ierror)
    TYPE(*), DIMENSION(..) :: buf
    INTEGER, INTENT(IN) :: count, dest, sendtag, source, recvtag
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Sendrecv_replace(buf, count, datatype, dest, sendtag, source, recvtag, comm, status, ierror)
    TYPE(*), DIMENSION(..) :: buf
    INTEGER, INTENT(IN) :: count, dest, sendtag, source, recvtag
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Sendrecv_replace(buf, count, datatype, dest, sendtag, source, recvtag, comm, status, ierror) !(_c)
    TYPE(*), DIMENSION(..) :: buf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: dest, sendtag, source, recvtag
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-3.0**
```fortran
MPI_SENDRECV_REPLACE(BUF, COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM, STATUS, IERROR)
    <type> BUF(*)
    INTEGER COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM, STATUS(MPI_STATUS_SIZE), IERROR
```

**MPI-3.1**
```fortran
MPI_SENDRECV_REPLACE(BUF, COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM, STATUS, IERROR)
    <type> BUF(*)
    INTEGER COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM,
    STATUS(MPI_STATUS_SIZE), IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_SENDRECV_REPLACE(BUF, COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM, STATUS, IERROR)
    <type> BUF(*)
    INTEGER COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM, STATUS(MPI_STATUS_SIZE), IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `buf` | INOUT | **MPI-1.3–MPI-5.0:** initial address of send and receive buffer (choice) |
| `count` | IN | **MPI-1.3:** number of elements in send and receive buffer (integer)<br>**MPI-2.1–MPI-4.1:** number of elements in send and receive buffer (non-negative integer)<br>**MPI-5.0:** number of elements in send and receive buffer (nonnegative integer) |
| `datatype` | IN | **MPI-1.3–MPI-5.0:** type of elements in send and receive buffer (handle) |
| `dest` | IN | **MPI-1.3–MPI-5.0:** rank of destination (integer) |
| `sendtag` | IN | **MPI-1.3–MPI-5.0:** send message tag (integer) |
| `source` | IN | **MPI-1.3–MPI-2.1:** rank of source (integer)<br>**MPI-2.2–MPI-5.0:** rank of source or `MPI_ANY_SOURCE` (integer) |
| `recvtag` | IN | **MPI-1.3–MPI-2.1:** receive message tag (integer)<br>**MPI-2.2–MPI-5.0:** receive message tag or `MPI_ANY_TAG` (integer) |
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |
| `status` | OUT | **MPI-1.3–MPI-3.1:** status object (Status)<br>**MPI-4.0–MPI-5.0:** status object (status) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_SENDRECV_REPLACE|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_SENDRECV_REPLACE|API note]] · chapter [[versions/v21/sections/pt2pt|pt2pt]]
- MPI-2.2: [[versions/v22/API/MPI_SENDRECV_REPLACE|API note]] · chapter [[versions/v22/sections/pt2pt|pt2pt]]
- MPI-3.0: [[versions/v30/API/MPI_SENDRECV_REPLACE|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_SENDRECV_REPLACE|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_SENDRECV_REPLACE|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_SENDRECV_REPLACE|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_SENDRECV_REPLACE|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
