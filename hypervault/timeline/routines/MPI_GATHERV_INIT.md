---
title: MPI_GATHERV_INIT
c_name: MPI_Gatherv_init
chapter: coll
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GATHERV_INIT, MPI_Gatherv_init]
tags: [mpi/routine, mpi/coll]
---

# MPI_GATHERV_INIT

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_GATHERV_INIT|MPI-4.0]] · [[versions/v41/API/MPI_GATHERV_INIT|MPI-4.1]] Δ · [[versions/v50/API/MPI_GATHERV_INIT|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Gatherv_init(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int displs[], MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Info info, MPI_Request *request)
int MPI_Gatherv_init_c(const void *sendbuf, MPI_Count sendcount, MPI_Datatype sendtype, void *recvbuf, const MPI_Count recvcounts[], const MPI_Aint displs[], MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Info info, MPI_Request *request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Gatherv_init(sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, root, comm, info, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER, INTENT(IN) :: sendcount, root
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN), ASYNCHRONOUS :: recvcounts(*), displs(*)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Gatherv_init(sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, root, comm, info, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcount
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN), ASYNCHRONOUS :: recvcounts(*)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN), ASYNCHRONOUS :: displs(*)
    INTEGER, INTENT(IN) :: root
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_GATHERV_INIT(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNTS, DISPLS, RECVTYPE, ROOT, COMM, INFO, REQUEST, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNT, SENDTYPE, RECVCOUNTS(*), DISPLS(*), RECVTYPE, ROOT, COMM, INFO, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-4.0–MPI-5.0:** starting address of send buffer (choice) |
| `sendcount` | IN | **MPI-4.0–MPI-4.1:** number of elements in send buffer (non-negative integer)<br>**MPI-5.0:** number of elements in send buffer (nonnegative integer) |
| `sendtype` | IN | **MPI-4.0–MPI-5.0:** datatype of send buffer elements (handle) |
| `recvbuf` | OUT | **MPI-4.0–MPI-5.0:** address of receive buffer (choice, significant only at root) |
| `recvcounts` | IN | **MPI-4.0:** non-negative integer array (of length group size) containing the number of elements that are received from each process (significant only at root)<br>**MPI-4.1–MPI-5.0:** nonnegative integer array (of length group size) containing the number of elements that are received from each MPI process (significant only at root) |
| `displs` | IN | **MPI-4.0:** integer array (of length group size). Entry `i` specifies the displacement relative to `recvbuf` at which to place the incoming data from process `i` (significant only at root)<br>**MPI-4.1–MPI-5.0:** integer array (of length group size). Entry `i` specifies the displacement relative to `recvbuf` at which to place the incoming data from MPI process `i` (significant only at root) |
| `recvtype` | IN | **MPI-4.0–MPI-5.0:** datatype of recv buffer elements (handle, significant only at root) |
| `root` | IN | **MPI-4.0:** rank of receiving process (integer)<br>**MPI-4.1–MPI-5.0:** rank of receiving MPI process (integer) |
| `comm` | IN | **MPI-4.0–MPI-5.0:** communicator (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info argument (handle) |
| `request` | OUT | **MPI-4.0–MPI-5.0:** communication request (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_GATHERV_INIT|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_GATHERV_INIT|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_GATHERV_INIT|API note]] · chapter [[versions/v50/sections/coll|coll]]
