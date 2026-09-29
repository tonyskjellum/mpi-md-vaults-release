---
title: MPI_ALLTOALLV
c_name: MPI_Alltoallv
chapter: coll
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ALLTOALLV, MPI_Alltoallv]
tags: [mpi/routine, mpi/coll]
---

# MPI_ALLTOALLV

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_ALLTOALLV|MPI-1.3]] · [[versions/v20/API/MPI_ALLTOALLV|MPI-2.0]] · [[versions/v21/API/MPI_ALLTOALLV|MPI-2.1]] Δ · [[versions/v22/API/MPI_ALLTOALLV|MPI-2.2]] Δ · [[versions/v30/API/MPI_ALLTOALLV|MPI-3.0]] Δ · [[versions/v31/API/MPI_ALLTOALLV|MPI-3.1]] Δ · [[versions/v40/API/MPI_ALLTOALLV|MPI-4.0]] Δ · [[versions/v41/API/MPI_ALLTOALLV|MPI-4.1]] Δ · [[versions/v50/API/MPI_ALLTOALLV|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3**
```c
int MPI_Alltoallv(void* sendbuf, int *sendcounts, int *sdispls, MPI_Datatype sendtype, void* recvbuf, int *recvcounts, int *rdispls, MPI_Datatype recvtype, MPI_Comm comm)
```

**MPI-2.0**
_(no C binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI_Alltoallv(void* sendbuf, int *sendcounts, int *sdispls, MPI_Datatype sendtype, void* recvbuf, int *recvcounts, int *rdispls, MPI_Datatype recvtype, MPI_Comm comm)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Alltoallv(const void* sendbuf, const int sendcounts[], const int sdispls[], MPI_Datatype sendtype, void* recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[], MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm)
int MPI_Alltoallv_c(const void *sendbuf, const MPI_Count sendcounts[], const MPI_Aint sdispls[], MPI_Datatype sendtype, void *recvbuf, const MPI_Count recvcounts[], const MPI_Aint rdispls[], MPI_Datatype recvtype, MPI_Comm comm)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.0–MPI-2.2**
```c
void MPI::Comm::Alltoallv(const void* sendbuf, const int sendcounts[], const int sdispls[], const MPI::Datatype& sendtype, void* recvbuf, const int recvcounts[], const int rdispls[], const MPI::Datatype& recvtype) const = 0
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Alltoallv(sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: sendcounts(*), sdispls(*), recvcounts(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Alltoallv(sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: sendcounts(*), sdispls(*), recvcounts(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Alltoallv(sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    INTEGER, INTENT(IN) :: sendcounts(*), sdispls(*), recvcounts(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..) :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Alltoallv(sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcounts(*), recvcounts(*)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: sdispls(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..) :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3**
```fortran
MPI_ALLTOALLV(SENDBUF, SENDCOUNTS, SDISPLS, SENDTYPE, RECVBUF, RECVCOUNTS, RDISPLS, RECVTYPE, COMM, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNTS(*), SDISPLS(*), SENDTYPE, RECVCOUNTS(*), RDISPLS(*), RECVTYPE, COMM, IERROR
```

**MPI-2.0**
_(no mpif.h binding)_

**MPI-2.1–MPI-5.0**
```fortran
MPI_ALLTOALLV(SENDBUF, SENDCOUNTS, SDISPLS, SENDTYPE, RECVBUF, RECVCOUNTS, RDISPLS, RECVTYPE, COMM, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNTS(*), SDISPLS(*), SENDTYPE, RECVCOUNTS(*), RDISPLS(*), RECVTYPE, COMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-1.3–MPI-5.0:** starting address of send buffer (choice) |
| `sendcounts` | IN | **MPI-1.3–MPI-2.0:** integer array equal to the group size specifying the number of elements to send to each processor<br>**MPI-2.1:** non-negative integer array equal to the group size specifying the number of elements to send to each processor<br>**MPI-2.2:** non-negative integer array (of length group size) specifying the number of elements to send to each processor<br>**MPI-3.0–MPI-4.0:** non-negative integer array (of length group size) specifying the number of elements to send to each rank<br>**MPI-4.1–MPI-5.0:** nonnegative integer array (of length group size) specifying the number of elements to send to each rank |
| `sdispls` | IN | **MPI-1.3:** integer array (of length group size). Entry `j` specifies the displacement (relative to `sendbuf` from which to take the outgoing data destined for process `j`<br>**MPI-2.0:** integer array (of length group size). Entry `j` specifies the displacement (relative to `sendbuf`) from which to take the outgoing data destined for process `j`<br>**MPI-2.1–MPI-2.2:** integer array (of length group size). Entry `j` specifies the displacement (relative to `sendbuf` from which to take the outgoing data destined for process `j`<br>**MPI-3.0–MPI-4.0:** integer array (of length group size). Entry `j` specifies the displacement (relative to `sendbuf`) from which to take the outgoing data destined for process `j`<br>**MPI-4.1–MPI-5.0:** integer array (of length group size). Entry `j` specifies the displacement (relative to `sendbuf`) from which to take the outgoing data destined for MPI process `j` |
| `sendtype` | IN | **MPI-1.3–MPI-3.1:** data type of send buffer elements (handle)<br>**MPI-4.0–MPI-5.0:** datatype of send buffer elements (handle) |
| `recvbuf` | OUT | **MPI-1.3–MPI-5.0:** address of receive buffer (choice) |
| `recvcounts` | IN | **MPI-1.3–MPI-2.0:** integer array equal to the group size specifying the number of elements that can be received from each processor<br>**MPI-2.1:** non-negative integer array equal to the group size specifying the number of elements that can be received from each processor<br>**MPI-2.2:** non-negative integer array (of length group size) specifying the number of elements that can be received from each processor<br>**MPI-3.0–MPI-4.0:** non-negative integer array (of length group size) specifying the number of elements that can be received from each rank<br>**MPI-4.1–MPI-5.0:** nonnegative integer array (of length group size) specifying the number of elements that can be received from each rank |
| `rdispls` | IN | **MPI-1.3:** integer array (of length group size). Entry `i` specifies the displacement (relative to `recvbuf` at which to place the incoming data from process `i`<br>**MPI-2.0:** integer array (of length group size). Entry `i` specifies the displacement (relative to `recvbuf`) at which to place the incoming data from process `i`<br>**MPI-2.1–MPI-2.2:** integer array (of length group size). Entry `i` specifies the displacement (relative to `recvbuf` at which to place the incoming data from process `i`<br>**MPI-3.0–MPI-4.0:** integer array (of length group size). Entry `i` specifies the displacement (relative to `recvbuf`) at which to place the incoming data from process `i`<br>**MPI-4.1–MPI-5.0:** integer array (of length group size). Entry `i` specifies the displacement (relative to `recvbuf`) at which to place the incoming data from MPI process `i` |
| `recvtype` | IN | **MPI-1.3–MPI-3.1:** data type of receive buffer elements (handle)<br>**MPI-4.0–MPI-5.0:** datatype of receive buffer elements (handle) |
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |

## Named in the change log of

[[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_ALLTOALLV|API note]] · chapter [[versions/v13/sections/coll|coll]]
- MPI-2.0: [[versions/v20/API/MPI_ALLTOALLV|API note]] · chapter [[versions/v20/sections/collective|collective]]
- MPI-2.1: [[versions/v21/API/MPI_ALLTOALLV|API note]] · chapter [[versions/v21/sections/coll|coll]]
- MPI-2.2: [[versions/v22/API/MPI_ALLTOALLV|API note]] · chapter [[versions/v22/sections/coll|coll]]
- MPI-3.0: [[versions/v30/API/MPI_ALLTOALLV|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_ALLTOALLV|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_ALLTOALLV|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_ALLTOALLV|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_ALLTOALLV|API note]] · chapter [[versions/v50/sections/coll|coll]]
