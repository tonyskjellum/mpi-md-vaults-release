---
title: MPI_INEIGHBOR_ALLGATHER
c_name: MPI_Ineighbor_allgather
chapter: topol
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_INEIGHBOR_ALLGATHER, MPI_Ineighbor_allgather]
tags: [mpi/routine, mpi/topol]
---

# MPI_INEIGHBOR_ALLGATHER

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_INEIGHBOR_ALLGATHER|MPI-3.0]] · [[versions/v31/API/MPI_INEIGHBOR_ALLGATHER|MPI-3.1]] Δ · [[versions/v40/API/MPI_INEIGHBOR_ALLGATHER|MPI-4.0]] Δ · [[versions/v41/API/MPI_INEIGHBOR_ALLGATHER|MPI-4.1]] Δ · [[versions/v50/API/MPI_INEIGHBOR_ALLGATHER|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_Ineighbor_allgather(const void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Ineighbor_allgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request)
int MPI_Ineighbor_allgather_c(const void *sendbuf, MPI_Count sendcount, MPI_Datatype sendtype, void *recvbuf, MPI_Count recvcount, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Ineighbor_allgather(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm, request, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN) :: sendcount, recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Ineighbor_allgather(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN) :: sendcount, recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Ineighbor_allgather(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER, INTENT(IN) :: sendcount, recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Ineighbor_allgather(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcount, recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-3.1**
```fortran
MPI_INEIGHBOR_ALLGATHER(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, COMM, REQUEST, IERROR)
    $<$type$>$ SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNT, SENDTYPE, RECVCOUNT, RECVTYPE, COMM, REQUEST, IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_INEIGHBOR_ALLGATHER(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, COMM, REQUEST, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNT, SENDTYPE, RECVCOUNT, RECVTYPE, COMM, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-3.0–MPI-5.0:** starting address of send buffer (choice) |
| `sendcount` | IN | **MPI-3.0–MPI-4.1:** number of elements sent to each neighbor (non-negative integer)<br>**MPI-5.0:** number of elements sent to each neighbor (nonnegative integer) |
| `sendtype` | IN | **MPI-3.0–MPI-3.1:** data type of send buffer elements (handle)<br>**MPI-4.0–MPI-5.0:** datatype of send buffer elements (handle) |
| `recvbuf` | OUT | **MPI-3.0–MPI-5.0:** starting address of receive buffer (choice) |
| `recvcount` | IN | **MPI-3.0–MPI-4.1:** number of elements received from each neighbor (non-negative integer)<br>**MPI-5.0:** number of elements received from each neighbor (nonnegative integer) |
| `recvtype` | IN | **MPI-3.0–MPI-3.1:** data type of receive buffer elements (handle)<br>**MPI-4.0–MPI-5.0:** datatype of receive buffer elements (handle) |
| `comm` | IN | **MPI-3.0–MPI-4.0:** communicator with topology structure (handle)<br>**MPI-4.1–MPI-5.0:** communicator with associated virtual topology (handle) |
| `request` | OUT | **MPI-3.0–MPI-5.0:** communication request (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_INEIGHBOR_ALLGATHER|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_INEIGHBOR_ALLGATHER|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_INEIGHBOR_ALLGATHER|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_INEIGHBOR_ALLGATHER|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_INEIGHBOR_ALLGATHER|API note]] · chapter [[versions/v50/sections/topol|topol]]
