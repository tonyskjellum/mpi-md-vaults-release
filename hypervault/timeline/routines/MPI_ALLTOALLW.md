---
title: MPI_ALLTOALLW
c_name: MPI_Alltoallw
chapter: coll
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ALLTOALLW, MPI_Alltoallw]
tags: [mpi/routine, mpi/coll]
---

# MPI_ALLTOALLW

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_ALLTOALLW|MPI-2.0]] · [[versions/v21/API/MPI_ALLTOALLW|MPI-2.1]] Δ · [[versions/v22/API/MPI_ALLTOALLW|MPI-2.2]] Δ · [[versions/v30/API/MPI_ALLTOALLW|MPI-3.0]] Δ · [[versions/v31/API/MPI_ALLTOALLW|MPI-3.1]] Δ · [[versions/v40/API/MPI_ALLTOALLW|MPI-4.0]] Δ · [[versions/v41/API/MPI_ALLTOALLW|MPI-4.1]] Δ · [[versions/v50/API/MPI_ALLTOALLW|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Alltoallw(void *sendbuf, int sendcounts[], int sdispls[], MPI_Datatype sendtypes[], void *recvbuf, int recvcounts[], int rdispls[], MPI_Datatype recvtypes[], MPI_Comm comm)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Alltoallw(const void* sendbuf, const int sendcounts[], const int sdispls[], const MPI_Datatype sendtypes[], void* recvbuf, const int recvcounts[], const int rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Alltoallw(const void *sendbuf, const int sendcounts[], const int sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const int recvcounts[], const int rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm)
int MPI_Alltoallw_c(const void *sendbuf, const MPI_Count sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const MPI_Count recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Comm::Alltoallw(const void* sendbuf, const int sendcounts[], const int sdispls[], const MPI::Datatype sendtypes[], void* recvbuf, const int recvcounts[], const int rdispls[], const MPI::Datatype recvtypes[]) const = 0
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Alltoallw(sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: sendcounts(*), sdispls(*), recvcounts(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtypes(*)
    TYPE(MPI_Datatype), INTENT(IN) :: recvtypes(*)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Alltoallw(sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: sendcounts(*), sdispls(*), recvcounts(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtypes(*)
    TYPE(MPI_Datatype), INTENT(IN) :: recvtypes(*)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Alltoallw(sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    INTEGER, INTENT(IN) :: sendcounts(*), sdispls(*), recvcounts(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtypes(*), recvtypes(*)
    TYPE(*), DIMENSION(..) :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Alltoallw(sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcounts(*), recvcounts(*)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: sdispls(*), rdispls(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtypes(*), recvtypes(*)
    TYPE(*), DIMENSION(..) :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_ALLTOALLW(SENDBUF, SENDCOUNTS, SDISPLS, SENDTYPES, RECVBUF, RECVCOUNTS, RDISPLS, RECVTYPES, COMM, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNTS(*), SDISPLS(*), SENDTYPES(*), RECVCOUNTS(*), RDISPLS(*), RECVTYPES(*), COMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-2.0–MPI-5.0:** starting address of send buffer (choice) |
| `sendcounts` | IN | **MPI-2.0:** integer array equal to the group size specifying the number of elements to send to each processor (integer)<br>**MPI-2.1:** integer array equal to the group size specifying the number of elements to send to each processor (array of non-negative integers)<br>**MPI-2.2:** non-negative integer array (of length group size) specifying the number of elements to send to each processor<br>**MPI-3.0–MPI-4.0:** non-negative integer array (of length group size) specifying the number of elements to send to each rank<br>**MPI-4.1–MPI-5.0:** nonnegative integer array (of length group size) specifying the number of elements to send to each rank |
| `sdispls` | IN | **MPI-2.0:** integer array (of length group size). Entry j specifies the displacement in bytes (relative to `sendbuf`) from which to take the outgoing data destined for process j<br>**MPI-2.1–MPI-4.0:** integer array (of length group size). Entry `j` specifies the displacement in bytes (relative to `sendbuf`) from which to take the outgoing data destined for process `j` (array of integers)<br>**MPI-4.1–MPI-5.0:** integer array (of length group size). Entry `j` specifies the displacement in bytes (relative to `sendbuf`) from which to take the outgoing data destined for MPI process `j` (array of integers) |
| `sendtypes` | IN | **MPI-2.0:** array of datatypes (of length group size). Entry j specifies the type of data to send to process j (handle)<br>**MPI-2.1–MPI-4.0:** array of datatypes (of length group size). Entry `j` specifies the type of data to send to process `j` (array of handles)<br>**MPI-4.1–MPI-5.0:** array of datatypes (of length group size). Entry `j` specifies the type of data to send to MPI process `j` (array of handles) |
| `recvbuf` | OUT | **MPI-2.0–MPI-5.0:** address of receive buffer (choice) |
| `recvcounts` | IN | **MPI-2.0:** integer array equal to the group size specifying the number of elements that can be received from each processor (integer)<br>**MPI-2.1:** integer array equal to the group size specifying the number of elements that can be received from each processor (array of non-negative integers)<br>**MPI-2.2:** non-negative integer array (of length group size) specifying the number of elements that can be received from each processor<br>**MPI-3.0–MPI-4.0:** non-negative integer array (of length group size) specifying the number of elements that can be received from each rank<br>**MPI-4.1–MPI-5.0:** nonnegative integer array (of length group size) specifying the number of elements that can be received from each rank |
| `rdispls` | IN | **MPI-2.0:** integer array (of length group size). Entry i specifies the displacement in bytes (relative to `recvbuf`) at which to place the incoming data from process i<br>**MPI-2.1–MPI-4.0:** integer array (of length group size). Entry `i` specifies the displacement in bytes (relative to `recvbuf`) at which to place the incoming data from process `i` (array of integers)<br>**MPI-4.1–MPI-5.0:** integer array (of length group size). Entry `i` specifies the displacement in bytes (relative to `recvbuf`) at which to place the incoming data from MPI process `i` (array of integers) |
| `recvtypes` | IN | **MPI-2.0:** array of datatypes (of length group size). Entry i specifies the type of data received from process i (handle)<br>**MPI-2.1–MPI-4.0:** array of datatypes (of length group size). Entry `i` specifies the type of data received from process `i` (array of handles)<br>**MPI-4.1–MPI-5.0:** array of datatypes (of length group size). Entry `i` specifies the type of data received from MPI process `i` (array of handles) |
| `comm` | IN | **MPI-2.0–MPI-5.0:** communicator (handle) |

## Named in the change log of

[[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_ALLTOALLW|API note]] · chapter [[versions/v20/sections/collective|collective]]
- MPI-2.1: [[versions/v21/API/MPI_ALLTOALLW|API note]] · chapter [[versions/v21/sections/coll|coll]]
- MPI-2.2: [[versions/v22/API/MPI_ALLTOALLW|API note]] · chapter [[versions/v22/sections/coll|coll]]
- MPI-3.0: [[versions/v30/API/MPI_ALLTOALLW|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_ALLTOALLW|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_ALLTOALLW|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_ALLTOALLW|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_ALLTOALLW|API note]] · chapter [[versions/v50/sections/coll|coll]]
