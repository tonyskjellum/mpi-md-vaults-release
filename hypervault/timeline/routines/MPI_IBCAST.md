---
title: MPI_IBCAST
c_name: MPI_Ibcast
chapter: coll
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_IBCAST, MPI_Ibcast]
tags: [mpi/routine, mpi/coll]
---

# MPI_IBCAST

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_IBCAST|MPI-3.0]] · [[versions/v31/API/MPI_IBCAST|MPI-3.1]] Δ · [[versions/v40/API/MPI_IBCAST|MPI-4.0]] Δ · [[versions/v41/API/MPI_IBCAST|MPI-4.1]] · [[versions/v50/API/MPI_IBCAST|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_Ibcast(void* buffer, int count, MPI_Datatype datatype, int root, MPI_Comm comm, MPI_Request *request)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Ibcast(void *buffer, int count, MPI_Datatype datatype, int root, MPI_Comm comm, MPI_Request *request)
int MPI_Ibcast_c(void *buffer, MPI_Count count, MPI_Datatype datatype, int root, MPI_Comm comm, MPI_Request *request)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Ibcast(buffer, count, datatype, root, comm, request, ierror) BIND(C)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
    INTEGER, INTENT(IN) :: count, root
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Ibcast(buffer, count, datatype, root, comm, request, ierror)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
    INTEGER, INTENT(IN) :: count, root
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Ibcast(buffer, count, datatype, root, comm, request, ierror)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
    INTEGER, INTENT(IN) :: count, root
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Ibcast(buffer, count, datatype, root, comm, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: root
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_IBCAST(BUFFER, COUNT, DATATYPE, ROOT, COMM, REQUEST, IERROR)
    <type> BUFFER(*)
    INTEGER COUNT, DATATYPE, ROOT, COMM, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `buffer` | INOUT | **MPI-3.0–MPI-5.0:** starting address of buffer (choice) |
| `count` | IN | **MPI-3.0–MPI-4.1:** number of entries in buffer (non-negative integer)<br>**MPI-5.0:** number of entries in buffer (nonnegative integer) |
| `datatype` | IN | **MPI-3.0–MPI-3.1:** data type of buffer (handle)<br>**MPI-4.0–MPI-5.0:** datatype of buffer (handle) |
| `root` | IN | **MPI-3.0–MPI-5.0:** rank of broadcast root (integer) |
| `comm` | IN | **MPI-3.0–MPI-5.0:** communicator (handle) |
| `request` | OUT | **MPI-3.0–MPI-5.0:** communication request (handle) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_IBCAST|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_IBCAST|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_IBCAST|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_IBCAST|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_IBCAST|API note]] · chapter [[versions/v50/sections/coll|coll]]
