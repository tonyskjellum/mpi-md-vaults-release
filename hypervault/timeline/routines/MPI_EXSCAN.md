---
title: MPI_EXSCAN
c_name: MPI_Exscan
chapter: coll
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_EXSCAN, MPI_Exscan]
tags: [mpi/routine, mpi/coll]
---

# MPI_EXSCAN

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_EXSCAN|MPI-2.0]] · [[versions/v21/API/MPI_EXSCAN|MPI-2.1]] Δ · [[versions/v22/API/MPI_EXSCAN|MPI-2.2]] · [[versions/v30/API/MPI_EXSCAN|MPI-3.0]] Δ · [[versions/v31/API/MPI_EXSCAN|MPI-3.1]] Δ · [[versions/v40/API/MPI_EXSCAN|MPI-4.0]] Δ · [[versions/v41/API/MPI_EXSCAN|MPI-4.1]] · [[versions/v50/API/MPI_EXSCAN|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Exscan(void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Exscan(const void* sendbuf, void* recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Exscan(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm)
int MPI_Exscan_c(const void *sendbuf, void *recvbuf, MPI_Count count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Intracomm::Exscan(const void* sendbuf, void* recvbuf, int count, const MPI::Datatype& datatype, const MPI::Op& op) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Exscan(sendbuf, recvbuf, count, datatype, op, comm, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Exscan(sendbuf, recvbuf, count, datatype, op, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Exscan(sendbuf, recvbuf, count, datatype, op, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Exscan(sendbuf, recvbuf, count, datatype, op, comm, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_EXSCAN(SENDBUF, RECVBUF, COUNT, DATATYPE, OP, COMM, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER COUNT, DATATYPE, OP, COMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-2.0–MPI-5.0:** starting address of send buffer (choice) |
| `recvbuf` | OUT | **MPI-2.0–MPI-5.0:** starting address of receive buffer (choice) |
| `count` | IN | **MPI-2.0:** number of elements in input buffer (integer)<br>**MPI-2.1–MPI-4.1:** number of elements in input buffer (non-negative integer)<br>**MPI-5.0:** number of elements in input buffer (nonnegative integer) |
| `datatype` | IN | **MPI-2.0–MPI-3.1:** data type of elements of input buffer (handle)<br>**MPI-4.0–MPI-5.0:** datatype of elements of input buffer (handle) |
| `op` | IN | **MPI-2.0–MPI-5.0:** operation (handle) |
| `comm` | IN | **MPI-2.0–MPI-3.1:** intracommunicator (handle)<br>**MPI-4.0–MPI-5.0:** intra-communicator (handle) |

## Named in the change log of

[[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_EXSCAN|API note]] · chapter [[versions/v20/sections/collective|collective]]
- MPI-2.1: [[versions/v21/API/MPI_EXSCAN|API note]] · chapter [[versions/v21/sections/coll|coll]]
- MPI-2.2: [[versions/v22/API/MPI_EXSCAN|API note]] · chapter [[versions/v22/sections/coll|coll]]
- MPI-3.0: [[versions/v30/API/MPI_EXSCAN|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_EXSCAN|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_EXSCAN|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_EXSCAN|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_EXSCAN|API note]] · chapter [[versions/v50/sections/coll|coll]]
