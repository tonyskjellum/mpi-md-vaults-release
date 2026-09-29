---
title: MPI_NEIGHBOR_ALLTOALLW_INIT
c_name: MPI_Neighbor_alltoallw_init
chapter: topol
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_NEIGHBOR_ALLTOALLW_INIT, MPI_Neighbor_alltoallw_init]
tags: [mpi/routine, mpi/topol]
---

# MPI_NEIGHBOR_ALLTOALLW_INIT

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_NEIGHBOR_ALLTOALLW_INIT|MPI-4.0]] · [[versions/v41/API/MPI_NEIGHBOR_ALLTOALLW_INIT|MPI-4.1]] Δ · [[versions/v50/API/MPI_NEIGHBOR_ALLTOALLW_INIT|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Neighbor_alltoallw_init(const void *sendbuf, const int sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const int recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm, MPI_Info info, MPI_Request *request)
int MPI_Neighbor_alltoallw_init_c(const void *sendbuf, const MPI_Count sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const MPI_Count recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm, MPI_Info info, MPI_Request *request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Neighbor_alltoallw_init(sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, info, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER, INTENT(IN), ASYNCHRONOUS :: sendcounts(*), recvcounts(*)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN), ASYNCHRONOUS :: sdispls(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN), ASYNCHRONOUS :: sendtypes(*), recvtypes(*)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Neighbor_alltoallw_init(sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, info, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN), ASYNCHRONOUS :: sendcounts(*), recvcounts(*)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN), ASYNCHRONOUS :: sdispls(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN), ASYNCHRONOUS :: sendtypes(*), recvtypes(*)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_NEIGHBOR_ALLTOALLW_INIT(SENDBUF, SENDCOUNTS, SDISPLS, SENDTYPES, RECVBUF, RECVCOUNTS, RDISPLS, RECVTYPES, COMM, INFO, REQUEST, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNTS(*), SENDTYPES(*), RECVCOUNTS(*), RECVTYPES(*), COMM, INFO, REQUEST, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) SDISPLS(*), RDISPLS(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-4.0–MPI-5.0:** starting address of send buffer (choice) |
| `sendcounts` | IN | **MPI-4.0:** non-negative integer array (of length outdegree) specifying the number of elements to send to each neighbor<br>**MPI-4.1–MPI-5.0:** nonnegative integer array (of length outdegree) specifying the number of elements to send to each neighbor |
| `sdispls` | IN | **MPI-4.0–MPI-5.0:** integer array (of length outdegree). Entry `j` specifies the displacement in bytes (relative to `sendbuf`) from which to take the outgoing data destined for neighbor `j` (array of integers) |
| `sendtypes` | IN | **MPI-4.0–MPI-5.0:** array of datatypes (of length outdegree). Entry `j` specifies the type of data to send to neighbor `j` (array of handles) |
| `recvbuf` | OUT | **MPI-4.0–MPI-5.0:** starting address of receive buffer (choice) |
| `recvcounts` | IN | **MPI-4.0:** non-negative integer array (of length indegree) specifying the number of elements that are received from each neighbor<br>**MPI-4.1–MPI-5.0:** nonnegative integer array (of length indegree) specifying the number of elements that are received from each neighbor |
| `rdispls` | IN | **MPI-4.0–MPI-5.0:** integer array (of length indegree). Entry `i` specifies the displacement in bytes (relative to `recvbuf`) at which to place the incoming data from neighbor `i` (array of integers) |
| `recvtypes` | IN | **MPI-4.0–MPI-5.0:** array of datatypes (of length indegree). Entry `i` specifies the type of data received from neighbor `i` (array of handles) |
| `comm` | IN | **MPI-4.0:** communicator with topology structure (handle)<br>**MPI-4.1–MPI-5.0:** communicator with associated virtual topology (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info argument (handle) |
| `request` | OUT | **MPI-4.0–MPI-5.0:** communication request (handle) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_NEIGHBOR_ALLTOALLW_INIT|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_NEIGHBOR_ALLTOALLW_INIT|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_NEIGHBOR_ALLTOALLW_INIT|API note]] · chapter [[versions/v50/sections/topol|topol]]
