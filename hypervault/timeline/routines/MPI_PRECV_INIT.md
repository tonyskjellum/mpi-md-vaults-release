---
title: MPI_PRECV_INIT
c_name: MPI_Precv_init
chapter: part
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_PRECV_INIT, MPI_Precv_init]
tags: [mpi/routine, mpi/part]
---

# MPI_PRECV_INIT

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_PRECV_INIT|MPI-4.0]] · [[versions/v41/API/MPI_PRECV_INIT|MPI-4.1]] · [[versions/v50/API/MPI_PRECV_INIT|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Precv_init(void *buf, int partitions, MPI_Count count, MPI_Datatype datatype, int source, int tag, MPI_Comm comm, MPI_Info info, MPI_Request *request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Precv_init(buf, partitions, count, datatype, source, tag, comm, info, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: buf
    INTEGER, INTENT(IN) :: partitions, source, tag
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_PRECV_INIT(BUF, PARTITIONS, COUNT, DATATYPE, SOURCE, TAG, COMM, INFO, REQUEST, IERROR)
    <type> BUF(*)
    INTEGER PARTITIONS, DATATYPE, SOURCE, TAG, COMM, INFO, REQUEST, IERROR
    INTEGER(KIND=MPI_COUNT_KIND) COUNT
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `buf` | IN | **MPI-4.0–MPI-5.0:** initial address of recv buffer (choice) |
| `partitions` | IN | **MPI-4.0–MPI-4.1:** number of partitions (non-negative integer)<br>**MPI-5.0:** number of partitions (nonnegative integer) |
| `count` | IN | **MPI-4.0–MPI-4.1:** number of elements received per partition (non-negative integer)<br>**MPI-5.0:** number of elements received per partition (nonnegative integer) |
| `datatype` | IN | **MPI-4.0–MPI-5.0:** type of each element (handle) |
| `source` | IN | **MPI-4.0–MPI-5.0:** rank of source (integer) |
| `tag` | IN | **MPI-4.0–MPI-5.0:** message tag (integer) |
| `comm` | IN | **MPI-4.0–MPI-5.0:** communicator (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info argument (handle) |
| `request` | OUT | **MPI-4.0–MPI-5.0:** communication request (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_PRECV_INIT|API note]] · chapter [[versions/v40/sections/part|part]]
- MPI-4.1: [[versions/v41/API/MPI_PRECV_INIT|API note]] · chapter [[versions/v41/sections/part|part]]
- MPI-5.0: [[versions/v50/API/MPI_PRECV_INIT|API note]] · chapter [[versions/v50/sections/part|part]]
