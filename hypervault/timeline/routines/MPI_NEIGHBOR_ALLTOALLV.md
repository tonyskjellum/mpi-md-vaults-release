---
title: MPI_NEIGHBOR_ALLTOALLV
c_name: MPI_Neighbor_alltoallv
chapter: topol
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_NEIGHBOR_ALLTOALLV, MPI_Neighbor_alltoallv]
tags: [mpi/routine, mpi/topol]
---

# MPI_NEIGHBOR_ALLTOALLV

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_NEIGHBOR_ALLTOALLV|MPI-3.0]] · [[versions/v31/API/MPI_NEIGHBOR_ALLTOALLV|MPI-3.1]] Δ · [[versions/v40/API/MPI_NEIGHBOR_ALLTOALLV|MPI-4.0]] Δ · [[versions/v41/API/MPI_NEIGHBOR_ALLTOALLV|MPI-4.1]] Δ · [[versions/v50/API/MPI_NEIGHBOR_ALLTOALLV|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_Neighbor_alltoallv(const void* sendbuf, const int sendcounts[], const int sdispls[], MPI_Datatype sendtype, void* recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Neighbor_alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[], MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm)
int MPI_Neighbor_alltoallv_c(const void *sendbuf, const MPI_Count sendcounts[], const MPI_Aint sdispls[], MPI_Datatype sendtype, void *recvbuf, const MPI_Count recvcounts[], const MPI_Aint rdispls[], MPI_Datatype recvtype, MPI_Comm comm)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Neighbor_alltoallv(sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: sendcounts(*), sdispls(*), recvcounts(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Neighbor_alltoallv(sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: sendcounts(*), sdispls(*), recvcounts(*),
    rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Neighbor_alltoallv(sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    INTEGER, INTENT(IN) :: sendcounts(*), sdispls(*), recvcounts(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..) :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Neighbor_alltoallv(sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcounts(*), recvcounts(*)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: sdispls(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..) :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-3.1**
```fortran
MPI_NEIGHBOR_ALLTOALLV(SENDBUF, SENDCOUNTS, SDISPLS, SENDTYPE, RECVBUF, RECVCOUNTS, RDISPLS, RECVTYPE, COMM, IERROR)
    $<$type$>$ SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNTS(*), SDISPLS(*), SENDTYPE, RECVCOUNTS(*), RDISPLS(*), RECVTYPE, COMM, IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_NEIGHBOR_ALLTOALLV(SENDBUF, SENDCOUNTS, SDISPLS, SENDTYPE, RECVBUF, RECVCOUNTS, RDISPLS, RECVTYPE, COMM, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNTS(*), SDISPLS(*), SENDTYPE, RECVCOUNTS(*), RDISPLS(*), RECVTYPE, COMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-3.0–MPI-5.0:** starting address of send buffer (choice) |
| `sendcounts` | IN | **MPI-3.0–MPI-4.0:** non-negative integer array (of length outdegree) specifying the number of elements to send to each neighbor<br>**MPI-4.1–MPI-5.0:** nonnegative integer array (of length outdegree) specifying the number of elements to send to each neighbor |
| `sdispls` | IN | **MPI-3.0–MPI-5.0:** integer array (of length outdegree). Entry `j` specifies the displacement (relative to `sendbuf`) from which to send the outgoing data to neighbor `j` |
| `sendtype` | IN | **MPI-3.0–MPI-3.1:** data type of send buffer elements (handle)<br>**MPI-4.0–MPI-5.0:** datatype of send buffer elements (handle) |
| `recvbuf` | OUT | **MPI-3.0–MPI-5.0:** starting address of receive buffer (choice) |
| `recvcounts` | IN | **MPI-3.0–MPI-4.0:** non-negative integer array (of length indegree) specifying the number of elements that are received from each neighbor<br>**MPI-4.1–MPI-5.0:** nonnegative integer array (of length indegree) specifying the number of elements that are received from each neighbor |
| `rdispls` | IN | **MPI-3.0–MPI-5.0:** integer array (of length indegree). Entry `i` specifies the displacement (relative to `recvbuf`) at which to place the incoming data from neighbor `i` |
| `recvtype` | IN | **MPI-3.0–MPI-3.1:** data type of receive buffer elements (handle)<br>**MPI-4.0–MPI-5.0:** datatype of receive buffer elements (handle) |
| `comm` | IN | **MPI-3.0–MPI-4.0:** communicator with topology structure (handle)<br>**MPI-4.1–MPI-5.0:** communicator with associated virtual topology (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_NEIGHBOR_ALLTOALLV|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_NEIGHBOR_ALLTOALLV|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_NEIGHBOR_ALLTOALLV|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_NEIGHBOR_ALLTOALLV|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_NEIGHBOR_ALLTOALLV|API note]] · chapter [[versions/v50/sections/topol|topol]]
