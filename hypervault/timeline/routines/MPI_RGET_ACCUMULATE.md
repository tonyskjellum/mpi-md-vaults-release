---
title: MPI_RGET_ACCUMULATE
c_name: MPI_Rget_accumulate
chapter: one-side
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_RGET_ACCUMULATE, MPI_Rget_accumulate]
tags: [mpi/routine, mpi/one-side]
---

# MPI_RGET_ACCUMULATE

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_RGET_ACCUMULATE|MPI-3.0]] · [[versions/v31/API/MPI_RGET_ACCUMULATE|MPI-3.1]] Δ · [[versions/v40/API/MPI_RGET_ACCUMULATE|MPI-4.0]] Δ · [[versions/v41/API/MPI_RGET_ACCUMULATE|MPI-4.1]] Δ · [[versions/v50/API/MPI_RGET_ACCUMULATE|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_Rget_accumulate(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype, void *result_addr, int result_count, MPI_Datatype result_datatype, int target_rank, MPI_Aint target_disp, int target_count, MPI_Datatype target_datatype, MPI_Op op, MPI_Win win, MPI_Request *request)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Rget_accumulate(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype, void *result_addr, int result_count, MPI_Datatype result_datatype, int target_rank, MPI_Aint target_disp, int target_count, MPI_Datatype target_datatype, MPI_Op op, MPI_Win win, MPI_Request *request)
int MPI_Rget_accumulate_c(const void *origin_addr, MPI_Count origin_count, MPI_Datatype origin_datatype, void *result_addr, MPI_Count result_count, MPI_Datatype result_datatype, int target_rank, MPI_Aint target_disp, MPI_Count target_count, MPI_Datatype target_datatype, MPI_Op op, MPI_Win win, MPI_Request *request)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Rget_accumulate(origin_addr, origin_count, origin_datatype, result_addr, result_count, result_datatype, target_rank, target_disp, target_count, target_datatype, op, win, request, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: origin_addr
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: result_addr
    INTEGER, INTENT(IN) :: origin_count, result_count, target_rank, target_count
    TYPE(MPI_Datatype), INTENT(IN) :: origin_datatype, target_datatype, result_datatype
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Win), INTENT(IN) :: win
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Rget_accumulate(origin_addr, origin_count, origin_datatype, result_addr, result_count, result_datatype, target_rank, target_disp, target_count, target_datatype, op, win, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: origin_addr
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: result_addr
    INTEGER, INTENT(IN) :: origin_count, result_count, target_rank, target_count
    TYPE(MPI_Datatype), INTENT(IN) :: origin_datatype, target_datatype, result_datatype
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Win), INTENT(IN) :: win
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Rget_accumulate(origin_addr, origin_count, origin_datatype, result_addr, result_count, result_datatype, target_rank, target_disp, target_count, target_datatype, op, win, request, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: origin_addr
    INTEGER, INTENT(IN) :: origin_count, result_count, target_rank, target_count
    TYPE(MPI_Datatype), INTENT(IN) :: origin_datatype, result_datatype, target_datatype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: result_addr
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Win), INTENT(IN) :: win
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Rget_accumulate(origin_addr, origin_count, origin_datatype, result_addr, result_count, result_datatype, target_rank, target_disp, target_count, target_datatype, op, win, request, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: origin_addr
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: origin_count, result_count, target_count
    TYPE(MPI_Datatype), INTENT(IN) :: origin_datatype, result_datatype, target_datatype
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: result_addr
    INTEGER, INTENT(IN) :: target_rank
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
    TYPE(MPI_Op), INTENT(IN) :: op
    TYPE(MPI_Win), INTENT(IN) :: win
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-3.1**
```fortran
MPI_RGET_ACCUMULATE(ORIGIN_ADDR, ORIGIN_COUNT, ORIGIN_DATATYPE, RESULT_ADDR, RESULT_COUNT, RESULT_DATATYPE, TARGET_RANK, TARGET_DISP, TARGET_COUNT, TARGET_DATATYPE, OP, WIN, REQUEST, IERROR)
    <type> ORIGIN_ADDR(*), RESULT_ADDR(*)
    INTEGER(KIND=MPI_ADDRESS_KIND) TARGET_DISP
    INTEGER ORIGIN_COUNT, ORIGIN_DATATYPE, RESULT_COUNT, RESULT_DATATYPE, TARGET_RANK, TARGET_COUNT, TARGET_DATATYPE, OP, WIN, REQUEST, IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_RGET_ACCUMULATE(ORIGIN_ADDR, ORIGIN_COUNT, ORIGIN_DATATYPE, RESULT_ADDR, RESULT_COUNT, RESULT_DATATYPE, TARGET_RANK, TARGET_DISP, TARGET_COUNT, TARGET_DATATYPE, OP, WIN, REQUEST, IERROR)
    <type> ORIGIN_ADDR(*), RESULT_ADDR(*)
    INTEGER ORIGIN_COUNT, ORIGIN_DATATYPE, RESULT_COUNT, RESULT_DATATYPE, TARGET_RANK, TARGET_COUNT, TARGET_DATATYPE, OP, WIN, REQUEST, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) TARGET_DISP
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `origin_addr` | IN | **MPI-3.0–MPI-5.0:** initial address of buffer (choice) |
| `origin_count` | IN | **MPI-3.0–MPI-4.1:** number of entries in origin buffer (non-negative integer)<br>**MPI-5.0:** number of entries in origin buffer (nonnegative integer) |
| `origin_datatype` | IN | **MPI-3.0–MPI-5.0:** datatype of each entry in origin buffer (handle) |
| `result_addr` | OUT | **MPI-3.0–MPI-5.0:** initial address of result buffer (choice) |
| `result_count` | IN | **MPI-3.0–MPI-4.1:** number of entries in result buffer (non-negative integer)<br>**MPI-5.0:** number of entries in result buffer (nonnegative integer) |
| `result_datatype` | IN | **MPI-3.0–MPI-3.1:** datatype of each entry in result buffer (handle)<br>**MPI-4.0–MPI-5.0:** datatype of entries in result buffer (handle) |
| `target_rank` | IN | **MPI-3.0–MPI-4.1:** rank of target (non-negative integer)<br>**MPI-5.0:** rank of target (nonnegative integer) |
| `target_disp` | IN | **MPI-3.0–MPI-4.1:** displacement from start of window to beginning of target buffer (non-negative integer)<br>**MPI-5.0:** displacement from start of window to beginning of target buffer (nonnegative integer) |
| `target_count` | IN | **MPI-3.0–MPI-4.1:** number of entries in target buffer (non-negative integer)<br>**MPI-5.0:** number of entries in target buffer (nonnegative integer) |
| `target_datatype` | IN | **MPI-3.0–MPI-5.0:** datatype of each entry in target buffer (handle) |
| `op` | IN | **MPI-3.0–MPI-4.0:** reduce operation (handle)<br>**MPI-4.1–MPI-5.0:** accumulate operator (handle) |
| `win` | IN | **MPI-3.0–MPI-5.0:** window object (handle) |
| `request` | OUT | **MPI-3.0–MPI-5.0:** RMA request (handle) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_RGET_ACCUMULATE|API note]] · chapter [[versions/v30/sections/one-side|one-side]]
- MPI-3.1: [[versions/v31/API/MPI_RGET_ACCUMULATE|API note]] · chapter [[versions/v31/sections/one-side|one-side]]
- MPI-4.0: [[versions/v40/API/MPI_RGET_ACCUMULATE|API note]] · chapter [[versions/v40/sections/one-side|one-side]]
- MPI-4.1: [[versions/v41/API/MPI_RGET_ACCUMULATE|API note]] · chapter [[versions/v41/sections/one-side|one-side]]
- MPI-5.0: [[versions/v50/API/MPI_RGET_ACCUMULATE|API note]] · chapter [[versions/v50/sections/one-side|one-side]]
