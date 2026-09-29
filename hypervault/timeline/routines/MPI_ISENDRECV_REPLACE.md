---
title: MPI_ISENDRECV_REPLACE
c_name: MPI_Isendrecv_replace
chapter: pt2pt
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ISENDRECV_REPLACE, MPI_Isendrecv_replace]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_ISENDRECV_REPLACE

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_ISENDRECV_REPLACE|MPI-4.0]] · [[versions/v41/API/MPI_ISENDRECV_REPLACE|MPI-4.1]] · [[versions/v50/API/MPI_ISENDRECV_REPLACE|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Isendrecv_replace(void *buf, int count, MPI_Datatype datatype, int dest, int sendtag, int source, int recvtag, MPI_Comm comm, MPI_Request *request)
int MPI_Isendrecv_replace_c(void *buf, MPI_Count count, MPI_Datatype datatype, int dest, int sendtag, int source, int recvtag, MPI_Comm comm, MPI_Request *request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Isendrecv_replace(buf, count, datatype, dest, sendtag, source, recvtag, comm, request, ierror)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
    INTEGER, INTENT(IN) :: count, dest, sendtag, source, recvtag
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Isendrecv_replace(buf, count, datatype, dest, sendtag, source, recvtag, comm, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: dest, sendtag, source, recvtag
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_ISENDRECV_REPLACE(BUF, COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM, REQUEST, IERROR)
    <type> BUF(*)
    INTEGER COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `buf` | INOUT | **MPI-4.0–MPI-5.0:** initial address of send and receive buffer (choice) |
| `count` | IN | **MPI-4.0–MPI-4.1:** number of elements in send and receive buffer (non-negative integer)<br>**MPI-5.0:** number of elements in send and receive buffer (nonnegative integer) |
| `datatype` | IN | **MPI-4.0–MPI-5.0:** type of elements in send and receive buffer (handle) |
| `dest` | IN | **MPI-4.0–MPI-5.0:** rank of destination (integer) |
| `sendtag` | IN | **MPI-4.0–MPI-5.0:** send message tag (integer) |
| `source` | IN | **MPI-4.0–MPI-5.0:** rank of source or `MPI_ANY_SOURCE` (integer) |
| `recvtag` | IN | **MPI-4.0–MPI-5.0:** receive message tag or `MPI_ANY_TAG` (integer) |
| `comm` | IN | **MPI-4.0–MPI-5.0:** communicator (handle) |
| `request` | OUT | **MPI-4.0–MPI-5.0:** communication request (handle) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_ISENDRECV_REPLACE|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_ISENDRECV_REPLACE|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_ISENDRECV_REPLACE|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
