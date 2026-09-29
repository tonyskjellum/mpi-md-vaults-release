---
title: MPI_SCATTER_INIT
c_name: MPI_Scatter_init
chapter: coll
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SCATTER_INIT, MPI_Scatter_init]
tags: [mpi/routine, mpi/coll]
---

# MPI_SCATTER_INIT

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_SCATTER_INIT|MPI-4.0]] · [[versions/v41/API/MPI_SCATTER_INIT|MPI-4.1]] Δ · [[versions/v50/API/MPI_SCATTER_INIT|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Scatter_init(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Info info, MPI_Request *request)
int MPI_Scatter_init_c(const void *sendbuf, MPI_Count sendcount, MPI_Datatype sendtype, void *recvbuf, MPI_Count recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Info info, MPI_Request *request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Scatter_init(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, info, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER, INTENT(IN) :: sendcount, recvcount, root
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Scatter_init(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, info, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcount, recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN) :: root
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_SCATTER_INIT(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, ROOT, COMM, INFO, REQUEST, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNT, SENDTYPE, RECVCOUNT, RECVTYPE, ROOT, COMM, INFO, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-4.0–MPI-5.0:** address of send buffer (choice, significant only at root) |
| `sendcount` | IN | **MPI-4.0:** number of elements sent to each process (non-negative integer, significant only at root)<br>**MPI-4.1:** number of elements sent to each MPI process (non-negative integer, significant only at root)<br>**MPI-5.0:** number of elements sent to each MPI process (nonnegative integer, significant only at root) |
| `sendtype` | IN | **MPI-4.0–MPI-5.0:** datatype of send buffer elements (handle, significant only at root) |
| `recvbuf` | OUT | **MPI-4.0–MPI-5.0:** address of receive buffer (choice) |
| `recvcount` | IN | **MPI-4.0–MPI-4.1:** number of elements in receive buffer (non-negative integer)<br>**MPI-5.0:** number of elements in receive buffer (nonnegative integer) |
| `recvtype` | IN | **MPI-4.0–MPI-5.0:** datatype of receive buffer elements (handle) |
| `root` | IN | **MPI-4.0:** rank of sending process (integer)<br>**MPI-4.1–MPI-5.0:** rank of sending MPI process (integer) |
| `comm` | IN | **MPI-4.0–MPI-5.0:** communicator (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info argument (handle) |
| `request` | OUT | **MPI-4.0–MPI-5.0:** communication request (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_SCATTER_INIT|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_SCATTER_INIT|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_SCATTER_INIT|API note]] · chapter [[versions/v50/sections/coll|coll]]
