---
title: MPI_MRECV
c_name: MPI_Mrecv
chapter: pt2pt
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_MRECV, MPI_Mrecv]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_MRECV

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_MRECV|MPI-3.0]] · [[versions/v31/API/MPI_MRECV|MPI-3.1]] Δ · [[versions/v40/API/MPI_MRECV|MPI-4.0]] Δ · [[versions/v41/API/MPI_MRECV|MPI-4.1]] · [[versions/v50/API/MPI_MRECV|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_Mrecv(void* buf, int count, MPI_Datatype datatype, MPI_Message *message, MPI_Status *status)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Mrecv(void *buf, int count, MPI_Datatype datatype, MPI_Message *message, MPI_Status *status)
int MPI_Mrecv_c(void *buf, MPI_Count count, MPI_Datatype datatype, MPI_Message *message, MPI_Status *status)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Mrecv(buf, count, datatype, message, status, ierror) BIND(C)
    TYPE(*), DIMENSION(..) :: buf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Message), INTENT(INOUT) :: message
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Mrecv(buf, count, datatype, message, status, ierror)
    TYPE(*), DIMENSION(..) :: buf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Message), INTENT(INOUT) :: message
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Mrecv(buf, count, datatype, message, status, ierror)
    TYPE(*), DIMENSION(..) :: buf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Message), INTENT(INOUT) :: message
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Mrecv(buf, count, datatype, message, status, ierror) !(_c)
    TYPE(*), DIMENSION(..) :: buf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Message), INTENT(INOUT) :: message
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_MRECV(BUF, COUNT, DATATYPE, MESSAGE, STATUS, IERROR)
    <type> BUF(*)
    INTEGER COUNT, DATATYPE, MESSAGE, STATUS(MPI_STATUS_SIZE), IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `buf` | OUT | **MPI-3.0–MPI-5.0:** initial address of receive buffer (choice) |
| `count` | IN | **MPI-3.0–MPI-4.1:** number of elements in receive buffer (non-negative integer)<br>**MPI-5.0:** number of elements in receive buffer (nonnegative integer) |
| `datatype` | IN | **MPI-3.0–MPI-5.0:** datatype of each receive buffer element (handle) |
| `message` | INOUT | **MPI-3.0–MPI-5.0:** message (handle) |
| `status` | OUT | **MPI-3.0–MPI-3.1:** status object (Status)<br>**MPI-4.0–MPI-5.0:** status object (status) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_MRECV|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_MRECV|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_MRECV|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_MRECV|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_MRECV|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
