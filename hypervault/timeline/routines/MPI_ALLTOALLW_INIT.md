---
title: MPI_ALLTOALLW_INIT
c_name: MPI_Alltoallw_init
chapter: coll
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ALLTOALLW_INIT, MPI_Alltoallw_init]
tags: [mpi/routine, mpi/coll]
---

# MPI_ALLTOALLW_INIT

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_ALLTOALLW_INIT|MPI-4.0]] · [[versions/v41/API/MPI_ALLTOALLW_INIT|MPI-4.1]] Δ · [[versions/v50/API/MPI_ALLTOALLW_INIT|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Alltoallw_init(const void *sendbuf, const int sendcounts[], const int sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const int recvcounts[], const int rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm, MPI_Info info, MPI_Request *request)
int MPI_Alltoallw_init_c(const void *sendbuf, const MPI_Count sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const MPI_Count recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm, MPI_Info info, MPI_Request *request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Alltoallw_init(sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, info, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER, INTENT(IN), ASYNCHRONOUS :: sendcounts(*), sdispls(*), recvcounts(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN), ASYNCHRONOUS :: sendtypes(*), recvtypes(*)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Alltoallw_init(sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, info, request, ierror) !(_c)
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
MPI_ALLTOALLW_INIT(SENDBUF, SENDCOUNTS, SDISPLS, SENDTYPES, RECVBUF, RECVCOUNTS, RDISPLS, RECVTYPES, COMM, INFO, REQUEST, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNTS(*), SDISPLS(*), SENDTYPES(*), RECVCOUNTS(*), RDISPLS(*), RECVTYPES(*), COMM, INFO, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-4.0–MPI-5.0:** starting address of send buffer (choice) |
| `sendcounts` | IN | **MPI-4.0:** integer array (of length group size) specifying the number of elements to send to each rank (array of non-negative integers)<br>**MPI-4.1:** integer array (of length group size) specifying the number of elements to send to each MPI process (array of non-negative integers)<br>**MPI-5.0:** integer array (of length group size) specifying the number of elements to send to each MPI process (array of nonnegative integers) |
| `sdispls` | IN | **MPI-4.0:** integer array (of length group size). Entry `j` specifies the displacement in bytes (relative to `sendbuf`) from which to take the outgoing data destined for process `j` (array of integers)<br>**MPI-4.1–MPI-5.0:** integer array (of length group size). Entry `j` specifies the displacement in bytes (relative to `sendbuf`) from which to take the outgoing data destined for MPI process `j` (array of integers) |
| `sendtypes` | IN | **MPI-4.0:** Array of datatypes (of length group size). Entry `j` specifies the type of data to send to process `j` (array of handles)<br>**MPI-4.1–MPI-5.0:** array of datatypes (of length group size). Entry `j` specifies the type of data to send to MPI process `j` (array of handles) |
| `recvbuf` | OUT | **MPI-4.0–MPI-5.0:** address of receive buffer (choice) |
| `recvcounts` | IN | **MPI-4.0:** integer array (of length group size) specifying the number of elements that can be received from each rank (array of non-negative integers)<br>**MPI-4.1:** integer array (of length group size) specifying the number of elements that can be received from each MPI process (array of non-negative integers)<br>**MPI-5.0:** integer array (of length group size) specifying the number of elements that can be received from each MPI process (array of nonnegative integers) |
| `rdispls` | IN | **MPI-4.0:** integer array (of length group size). Entry `i` specifies the displacement in bytes (relative to `recvbuf`) at which to place the incoming data from process `i` (array of integers)<br>**MPI-4.1–MPI-5.0:** integer array (of length group size). Entry `i` specifies the displacement in bytes (relative to `recvbuf`) at which to place the incoming data from MPI process `i` (array of integers) |
| `recvtypes` | IN | **MPI-4.0:** array of datatypes (of length group size). Entry `i` specifies the type of data received from process `i` (array of handles)<br>**MPI-4.1–MPI-5.0:** array of datatypes (of length group size). Entry `i` specifies the type of data received from MPI process `i` (array of handles) |
| `comm` | IN | **MPI-4.0–MPI-5.0:** communicator (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info argument (handle) |
| `request` | OUT | **MPI-4.0–MPI-5.0:** communication request (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_ALLTOALLW_INIT|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_ALLTOALLW_INIT|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_ALLTOALLW_INIT|API note]] · chapter [[versions/v50/sections/coll|coll]]
