---
title: MPI_BCAST_INIT
c_name: MPI_Bcast_init
chapter: coll
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_BCAST_INIT, MPI_Bcast_init]
tags: [mpi/routine, mpi/coll]
---

# MPI_BCAST_INIT

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_BCAST_INIT|MPI-4.0]] · [[versions/v41/API/MPI_BCAST_INIT|MPI-4.1]] · [[versions/v50/API/MPI_BCAST_INIT|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Bcast_init(void *buffer, int count, MPI_Datatype datatype, int root, MPI_Comm comm, MPI_Info info, MPI_Request *request)
int MPI_Bcast_init_c(void *buffer, MPI_Count count, MPI_Datatype datatype, int root, MPI_Comm comm, MPI_Info info, MPI_Request *request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Bcast_init(buffer, count, datatype, root, comm, info, request, ierror)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
    INTEGER, INTENT(IN) :: count, root
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Bcast_init(buffer, count, datatype, root, comm, info, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: root
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_BCAST_INIT(BUFFER, COUNT, DATATYPE, ROOT, COMM, INFO, REQUEST, IERROR)
    <type> BUFFER(*)
    INTEGER COUNT, DATATYPE, ROOT, COMM, INFO, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `buffer` | INOUT | **MPI-4.0–MPI-5.0:** starting address of buffer (choice) |
| `count` | IN | **MPI-4.0–MPI-4.1:** number of entries in buffer (non-negative integer)<br>**MPI-5.0:** number of entries in buffer (nonnegative integer) |
| `datatype` | IN | **MPI-4.0–MPI-5.0:** datatype of buffer (handle) |
| `root` | IN | **MPI-4.0–MPI-5.0:** rank of broadcast root (integer) |
| `comm` | IN | **MPI-4.0–MPI-5.0:** communicator (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info argument (handle) |
| `request` | OUT | **MPI-4.0–MPI-5.0:** communication request (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_BCAST_INIT|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_BCAST_INIT|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_BCAST_INIT|API note]] · chapter [[versions/v50/sections/coll|coll]]
