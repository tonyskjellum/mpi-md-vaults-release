---
title: MPI_NEIGHBOR_ALLGATHERV_INIT
c_name: MPI_Neighbor_allgatherv_init
chapter: topol
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_NEIGHBOR_ALLGATHERV_INIT, MPI_Neighbor_allgatherv_init]
tags: [mpi/routine, mpi/topol]
---

# MPI_NEIGHBOR_ALLGATHERV_INIT

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_NEIGHBOR_ALLGATHERV_INIT|MPI-4.0]] · [[versions/v41/API/MPI_NEIGHBOR_ALLGATHERV_INIT|MPI-4.1]] Δ · [[versions/v50/API/MPI_NEIGHBOR_ALLGATHERV_INIT|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Neighbor_allgatherv_init(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int displs[], MPI_Datatype recvtype, MPI_Comm comm, MPI_Info info, MPI_Request *request)
int MPI_Neighbor_allgatherv_init_c(const void *sendbuf, MPI_Count sendcount, MPI_Datatype sendtype, void *recvbuf, const MPI_Count recvcounts[], const MPI_Aint displs[], MPI_Datatype recvtype, MPI_Comm comm, MPI_Info info, MPI_Request *request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Neighbor_allgatherv_init(sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, comm, info, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER, INTENT(IN) :: sendcount, displs(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN), ASYNCHRONOUS :: recvcounts(*)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Neighbor_allgatherv_init(sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, comm, info, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcount
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN), ASYNCHRONOUS :: recvcounts(*)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: displs(*)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_NEIGHBOR_ALLGATHERV_INIT(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNTS, DISPLS, RECVTYPE, COMM, INFO, REQUEST, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNT, SENDTYPE, RECVCOUNTS(*), DISPLS(*), RECVTYPE, COMM, INFO, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-4.0–MPI-5.0:** starting address of send buffer (choice) |
| `sendcount` | IN | **MPI-4.0–MPI-4.1:** number of elements sent to each neighbor (non-negative integer)<br>**MPI-5.0:** number of elements sent to each neighbor (nonnegative integer) |
| `sendtype` | IN | **MPI-4.0–MPI-5.0:** datatype of send buffer elements (handle) |
| `recvbuf` | OUT | **MPI-4.0–MPI-5.0:** starting address of receive buffer (choice) |
| `recvcounts` | IN | **MPI-4.0:** non-negative integer array (of length indegree) containing the number of elements that are received from each neighbor<br>**MPI-4.1–MPI-5.0:** nonnegative integer array (of length indegree) containing the number of elements that are received from each neighbor |
| `displs` | IN | **MPI-4.0–MPI-5.0:** integer array (of length indegree). Entry `i` specifies the displacement (relative to `recvbuf`) at which to place the incoming data from neighbor `i` |
| `recvtype` | IN | **MPI-4.0–MPI-5.0:** datatype of receive buffer elements (handle) |
| `comm` | IN | **MPI-4.0:** communicator with topology structure (handle)<br>**MPI-4.1–MPI-5.0:** communicator with associated virtual topology (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info argument (handle) |
| `request` | OUT | **MPI-4.0–MPI-5.0:** communication request (handle) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_NEIGHBOR_ALLGATHERV_INIT|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_NEIGHBOR_ALLGATHERV_INIT|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_NEIGHBOR_ALLGATHERV_INIT|API note]] · chapter [[versions/v50/sections/topol|topol]]
