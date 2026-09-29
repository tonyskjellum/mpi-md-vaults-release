---
title: MPI_IREDUCE_SCATTER_BLOCK
c_name: MPI_Ireduce_scatter_block
chapter: coll
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_IREDUCE_SCATTER_BLOCK, MPI_Ireduce_scatter_block]
tags: [mpi/routine, mpi/coll]
---

# MPI_IREDUCE_SCATTER_BLOCK

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_IREDUCE_SCATTER_BLOCK|MPI-3.0]] · [[versions/v31/API/MPI_IREDUCE_SCATTER_BLOCK|MPI-3.1]] Δ · [[versions/v40/API/MPI_IREDUCE_SCATTER_BLOCK|MPI-4.0]] Δ · [[versions/v41/API/MPI_IREDUCE_SCATTER_BLOCK|MPI-4.1]] · [[versions/v50/API/MPI_IREDUCE_SCATTER_BLOCK|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_Ireduce_scatter_block(const void* sendbuf, void* recvbuf, int recvcount, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Ireduce_scatter_block(const void *sendbuf, void *recvbuf, int recvcount, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request)
int MPI_Ireduce_scatter_block_c(const void *sendbuf, void *recvbuf, MPI_Count recvcount, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Ireduce_scatter_block(sendbuf, recvbuf, recvcount, datatype, op, comm, request, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN) :: recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Ireduce_scatter_block(sendbuf, recvbuf, recvcount, datatype, op, comm, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN) :: recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Ireduce_scatter_block(sendbuf, recvbuf, recvcount, datatype, op, comm, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN) :: recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Ireduce_scatter_block(sendbuf, recvbuf, recvcount, datatype, op, comm, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_IREDUCE_SCATTER_BLOCK(SENDBUF, RECVBUF, RECVCOUNT, DATATYPE, OP, COMM, REQUEST, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER RECVCOUNT, DATATYPE, OP, COMM, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-3.0–MPI-5.0:** starting address of send buffer (choice) |
| `recvbuf` | OUT | **MPI-3.0–MPI-5.0:** starting address of receive buffer (choice) |
| `recvcount` | IN | **MPI-3.0–MPI-4.1:** element count per block (non-negative integer)<br>**MPI-5.0:** element count per block (nonnegative integer) |
| `datatype` | IN | **MPI-3.0–MPI-3.1:** data type of elements of send and receive buffers (handle)<br>**MPI-4.0–MPI-5.0:** datatype of elements of send and receive buffers (handle) |
| `op` | IN | **MPI-3.0–MPI-5.0:** operation (handle) |
| `comm` | IN | **MPI-3.0–MPI-5.0:** communicator (handle) |
| `request` | OUT | **MPI-3.0–MPI-5.0:** communication request (handle) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_IREDUCE_SCATTER_BLOCK|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_IREDUCE_SCATTER_BLOCK|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_IREDUCE_SCATTER_BLOCK|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_IREDUCE_SCATTER_BLOCK|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_IREDUCE_SCATTER_BLOCK|API note]] · chapter [[versions/v50/sections/coll|coll]]
