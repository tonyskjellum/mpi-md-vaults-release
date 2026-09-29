---
title: MPI_ISENDRECV
c_name: MPI_Isendrecv
chapter: pt2pt
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ISENDRECV, MPI_Isendrecv]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_ISENDRECV

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_ISENDRECV|MPI-4.0]] · [[versions/v41/API/MPI_ISENDRECV|MPI-4.1]] · [[versions/v50/API/MPI_ISENDRECV|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Isendrecv(const void *sendbuf, int sendcount, MPI_Datatype sendtype, int dest, int sendtag, void *recvbuf, int recvcount, MPI_Datatype recvtype, int source, int recvtag, MPI_Comm comm, MPI_Request *request)
int MPI_Isendrecv_c(const void *sendbuf, MPI_Count sendcount, MPI_Datatype sendtype, int dest, int sendtag, void *recvbuf, MPI_Count recvcount, MPI_Datatype recvtype, int source, int recvtag, MPI_Comm comm, MPI_Request *request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Isendrecv(sendbuf, sendcount, sendtype, dest, sendtag, recvbuf, recvcount, recvtype, source, recvtag, comm, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER, INTENT(IN) :: sendcount, dest, sendtag, recvcount, source, recvtag
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Isendrecv(sendbuf, sendcount, sendtype, dest, sendtag, recvbuf, recvcount, recvtype, source, recvtag, comm, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcount, recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    INTEGER, INTENT(IN) :: dest, sendtag, source, recvtag
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_ISENDRECV(SENDBUF, SENDCOUNT, SENDTYPE, DEST, SENDTAG, RECVBUF, RECVCOUNT, RECVTYPE, SOURCE, RECVTAG, COMM, REQUEST, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNT, SENDTYPE, DEST, SENDTAG, RECVCOUNT, RECVTYPE, SOURCE, RECVTAG, COMM, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-4.0–MPI-5.0:** initial address of send buffer (choice) |
| `sendcount` | IN | **MPI-4.0–MPI-4.1:** number of elements in send buffer (non-negative integer)<br>**MPI-5.0:** number of elements in send buffer (nonnegative integer) |
| `sendtype` | IN | **MPI-4.0–MPI-5.0:** datatype of each send buffer element (handle) |
| `dest` | IN | **MPI-4.0–MPI-5.0:** rank of destination (integer) |
| `sendtag` | IN | **MPI-4.0–MPI-5.0:** send tag (integer) |
| `recvbuf` | OUT | **MPI-4.0–MPI-5.0:** initial address of receive buffer (choice) |
| `recvcount` | IN | **MPI-4.0–MPI-4.1:** number of elements in receive buffer (non-negative integer)<br>**MPI-5.0:** number of elements in receive buffer (nonnegative integer) |
| `recvtype` | IN | **MPI-4.0–MPI-5.0:** datatype of each receive buffer element (handle) |
| `source` | IN | **MPI-4.0–MPI-5.0:** rank of source or `MPI_ANY_SOURCE` (integer) |
| `recvtag` | IN | **MPI-4.0–MPI-5.0:** receive tag or `MPI_ANY_TAG` (integer) |
| `comm` | IN | **MPI-4.0–MPI-5.0:** communicator (handle) |
| `request` | OUT | **MPI-4.0–MPI-5.0:** communication request (handle) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_ISENDRECV|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_ISENDRECV|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_ISENDRECV|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
