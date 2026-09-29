---
title: MPI_SCATTERV_INIT
c_name: MPI_Scatterv_init
chapter: coll
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SCATTERV_INIT, MPI_Scatterv_init]
tags: [mpi/routine, mpi/coll]
---

# MPI_SCATTERV_INIT

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_SCATTERV_INIT|MPI-4.0]] · [[versions/v41/API/MPI_SCATTERV_INIT|MPI-4.1]] Δ · [[versions/v50/API/MPI_SCATTERV_INIT|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Scatterv_init(const void *sendbuf, const int sendcounts[], const int displs[], MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Info info, MPI_Request *request)
int MPI_Scatterv_init_c(const void *sendbuf, const MPI_Count sendcounts[], const MPI_Aint displs[], MPI_Datatype sendtype, void *recvbuf, MPI_Count recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Info info, MPI_Request *request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Scatterv_init(sendbuf, sendcounts, displs, sendtype, recvbuf, recvcount, recvtype, root, comm, info, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER, INTENT(IN), ASYNCHRONOUS :: sendcounts(*), displs(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN) :: recvcount, root
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Scatterv_init(sendbuf, sendcounts, displs, sendtype, recvbuf, recvcount, recvtype, root, comm, info, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN), ASYNCHRONOUS :: sendcounts(*)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN), ASYNCHRONOUS :: displs(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: recvcount
    INTEGER, INTENT(IN) :: root
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_SCATTERV_INIT(SENDBUF, SENDCOUNTS, DISPLS, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, ROOT, COMM, INFO, REQUEST, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNTS(*), DISPLS(*), SENDTYPE, RECVCOUNT, RECVTYPE, ROOT, COMM, INFO, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-4.0–MPI-5.0:** address of send buffer (choice, significant only at root) |
| `sendcounts` | IN | **MPI-4.0:** non-negative integer array (of length group size) specifying the number of elements to send to each rank (significant only at root)<br>**MPI-4.1–MPI-5.0:** nonnegative integer array (of length group size) specifying the number of elements to send to each MPI process (significant only at root) |
| `displs` | IN | **MPI-4.0:** integer array (of length group size). Entry `i` specifies the displacement (relative to `sendbuf`) from which to take the outgoing data to process `i` (significant only at root)<br>**MPI-4.1–MPI-5.0:** integer array (of length group size). Entry `i` specifies the displacement (relative to `sendbuf`) from which to take the outgoing data to MPI process `i` (significant only at root) |
| `sendtype` | IN | **MPI-4.0–MPI-5.0:** datatype of send buffer elements (handle, significant only at root) |
| `recvbuf` | OUT | **MPI-4.0–MPI-5.0:** address of receive buffer (choice, significant only at root) |
| `recvcount` | IN | **MPI-4.0–MPI-4.1:** number of elements in receive buffer (non-negative integer)<br>**MPI-5.0:** number of elements in receive buffer (nonnegative integer) |
| `recvtype` | IN | **MPI-4.0–MPI-5.0:** datatype of receive buffer elements (handle) |
| `root` | IN | **MPI-4.0:** rank of sending process (integer)<br>**MPI-4.1–MPI-5.0:** rank of sending MPI process (integer) |
| `comm` | IN | **MPI-4.0–MPI-5.0:** communicator (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info argument (handle) |
| `request` | OUT | **MPI-4.0–MPI-5.0:** communication request (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_SCATTERV_INIT|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_SCATTERV_INIT|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_SCATTERV_INIT|API note]] · chapter [[versions/v50/sections/coll|coll]]
