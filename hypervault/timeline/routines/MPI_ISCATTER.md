---
title: MPI_ISCATTER
c_name: MPI_Iscatter
chapter: coll
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ISCATTER, MPI_Iscatter]
tags: [mpi/routine, mpi/coll]
---

# MPI_ISCATTER

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_ISCATTER|MPI-3.0]] · [[versions/v31/API/MPI_ISCATTER|MPI-3.1]] Δ · [[versions/v40/API/MPI_ISCATTER|MPI-4.0]] Δ · [[versions/v41/API/MPI_ISCATTER|MPI-4.1]] Δ · [[versions/v50/API/MPI_ISCATTER|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_Iscatter(const void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Iscatter(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request)
int MPI_Iscatter_c(const void *sendbuf, MPI_Count sendcount, MPI_Datatype sendtype, void *recvbuf, MPI_Count recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Iscatter(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, request, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN) :: sendcount, recvcount, root
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Iscatter(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN) :: sendcount, recvcount, root
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Iscatter(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER, INTENT(IN) :: sendcount, recvcount, root
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Iscatter(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcount, recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN) :: root
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_ISCATTER(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, ROOT, COMM, REQUEST, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNT, SENDTYPE, RECVCOUNT, RECVTYPE, ROOT, COMM, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-3.0–MPI-5.0:** address of send buffer (choice, significant only at root) |
| `sendcount` | IN | **MPI-3.0–MPI-4.0:** number of elements sent to each process (non-negative integer, significant only at root)<br>**MPI-4.1:** number of elements sent to each MPI process (non-negative integer, significant only at root)<br>**MPI-5.0:** number of elements sent to each MPI process (nonnegative integer, significant only at root) |
| `sendtype` | IN | **MPI-3.0–MPI-3.1:** data type of send buffer elements (significant only at root) (handle)<br>**MPI-4.0–MPI-5.0:** datatype of send buffer elements (handle, significant only at root) |
| `recvbuf` | OUT | **MPI-3.0–MPI-5.0:** address of receive buffer (choice) |
| `recvcount` | IN | **MPI-3.0–MPI-4.1:** number of elements in receive buffer (non-negative integer)<br>**MPI-5.0:** number of elements in receive buffer (nonnegative integer) |
| `recvtype` | IN | **MPI-3.0–MPI-3.1:** data type of receive buffer elements (handle)<br>**MPI-4.0–MPI-5.0:** datatype of receive buffer elements (handle) |
| `root` | IN | **MPI-3.0–MPI-4.0:** rank of sending process (integer)<br>**MPI-4.1–MPI-5.0:** rank of sending MPI process (integer) |
| `comm` | IN | **MPI-3.0–MPI-5.0:** communicator (handle) |
| `request` | OUT | **MPI-3.0–MPI-5.0:** communication request (handle) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_ISCATTER|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_ISCATTER|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_ISCATTER|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_ISCATTER|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_ISCATTER|API note]] · chapter [[versions/v50/sections/coll|coll]]
