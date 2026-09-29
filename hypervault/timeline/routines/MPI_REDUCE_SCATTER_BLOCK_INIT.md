---
title: MPI_REDUCE_SCATTER_BLOCK_INIT
c_name: MPI_Reduce_scatter_block_init
chapter: coll
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_REDUCE_SCATTER_BLOCK_INIT, MPI_Reduce_scatter_block_init]
tags: [mpi/routine, mpi/coll]
---

# MPI_REDUCE_SCATTER_BLOCK_INIT

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_REDUCE_SCATTER_BLOCK_INIT|MPI-4.0]] · [[versions/v41/API/MPI_REDUCE_SCATTER_BLOCK_INIT|MPI-4.1]] · [[versions/v50/API/MPI_REDUCE_SCATTER_BLOCK_INIT|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Reduce_scatter_block_init(const void *sendbuf, void *recvbuf, int recvcount, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Info info, MPI_Request *request)
int MPI_Reduce_scatter_block_init_c(const void *sendbuf, void *recvbuf, MPI_Count recvcount, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Info info, MPI_Request *request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Reduce_scatter_block_init(sendbuf, recvbuf, recvcount, datatype, op, comm, info, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER, INTENT(IN) :: recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Reduce_scatter_block_init(sendbuf, recvbuf, recvcount, datatype, op, comm, info, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_REDUCE_SCATTER_BLOCK_INIT(SENDBUF, RECVBUF, RECVCOUNT, DATATYPE, OP, COMM, INFO, REQUEST, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER RECVCOUNT, DATATYPE, OP, COMM, INFO, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-4.0–MPI-5.0:** starting address of send buffer (choice) |
| `recvbuf` | OUT | **MPI-4.0–MPI-5.0:** starting address of receive buffer (choice) |
| `recvcount` | IN | **MPI-4.0–MPI-4.1:** element count per block (non-negative integer)<br>**MPI-5.0:** element count per block (nonnegative integer) |
| `datatype` | IN | **MPI-4.0–MPI-5.0:** datatype of elements of send and receive buffers (handle) |
| `op` | IN | **MPI-4.0–MPI-5.0:** operation (handle) |
| `comm` | IN | **MPI-4.0–MPI-5.0:** communicator (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info argument (handle) |
| `request` | OUT | **MPI-4.0–MPI-5.0:** communication request (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_REDUCE_SCATTER_BLOCK_INIT|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_REDUCE_SCATTER_BLOCK_INIT|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_REDUCE_SCATTER_BLOCK_INIT|API note]] · chapter [[versions/v50/sections/coll|coll]]
