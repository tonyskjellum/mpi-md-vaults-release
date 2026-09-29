---
title: MPI_COMPARE_AND_SWAP
c_name: MPI_Compare_and_swap
chapter: one-side
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMPARE_AND_SWAP, MPI_Compare_and_swap]
tags: [mpi/routine, mpi/one-side]
---

# MPI_COMPARE_AND_SWAP

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_COMPARE_AND_SWAP|MPI-3.0]] · [[versions/v31/API/MPI_COMPARE_AND_SWAP|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMPARE_AND_SWAP|MPI-4.0]] Δ · [[versions/v41/API/MPI_COMPARE_AND_SWAP|MPI-4.1]] · [[versions/v50/API/MPI_COMPARE_AND_SWAP|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Compare_and_swap(const void *origin_addr, const void *compare_addr, void *result_addr, MPI_Datatype datatype, int target_rank, MPI_Aint target_disp, MPI_Win win)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Compare_and_swap(origin_addr, compare_addr, result_addr, datatype, target_rank, target_disp, win, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: origin_addr
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: compare_addr
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: result_addr
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: target_rank
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Compare_and_swap(origin_addr, compare_addr, result_addr, datatype, target_rank, target_disp, win, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: origin_addr
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: compare_addr
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: result_addr
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: target_rank
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Compare_and_swap(origin_addr, compare_addr, result_addr, datatype, target_rank, target_disp, win, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: origin_addr, compare_addr
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: result_addr
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: target_rank
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-3.1**
```fortran
MPI_COMPARE_AND_SWAP(ORIGIN_ADDR, COMPARE_ADDR, RESULT_ADDR, DATATYPE, TARGET_RANK, TARGET_DISP, WIN, IERROR)
    <type> ORIGIN_ADDR(*), COMPARE_ADDR(*), RESULT_ADDR(*)
    INTEGER(KIND=MPI_ADDRESS_KIND) TARGET_DISP
    INTEGER DATATYPE, TARGET_RANK, WIN, IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_COMPARE_AND_SWAP(ORIGIN_ADDR, COMPARE_ADDR, RESULT_ADDR, DATATYPE, TARGET_RANK, TARGET_DISP, WIN, IERROR)
    <type> ORIGIN_ADDR(*), COMPARE_ADDR(*), RESULT_ADDR(*)
    INTEGER DATATYPE, TARGET_RANK, WIN, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) TARGET_DISP
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `origin_addr` | IN | **MPI-3.0–MPI-5.0:** initial address of buffer (choice) |
| `compare_addr` | IN | **MPI-3.0–MPI-5.0:** initial address of compare buffer (choice) |
| `result_addr` | OUT | **MPI-3.0–MPI-5.0:** initial address of result buffer (choice) |
| `datatype` | IN | **MPI-3.0–MPI-5.0:** datatype of the element in all buffers (handle) |
| `target_rank` | IN | **MPI-3.0–MPI-4.1:** rank of target (non-negative integer)<br>**MPI-5.0:** rank of target (nonnegative integer) |
| `target_disp` | IN | **MPI-3.0–MPI-4.1:** displacement from start of window to beginning of target buffer (non-negative integer)<br>**MPI-5.0:** displacement from start of window to beginning of target buffer (nonnegative integer) |
| `win` | IN | **MPI-3.0–MPI-5.0:** window object (handle) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_COMPARE_AND_SWAP|API note]] · chapter [[versions/v30/sections/one-side|one-side]]
- MPI-3.1: [[versions/v31/API/MPI_COMPARE_AND_SWAP|API note]] · chapter [[versions/v31/sections/one-side|one-side]]
- MPI-4.0: [[versions/v40/API/MPI_COMPARE_AND_SWAP|API note]] · chapter [[versions/v40/sections/one-side|one-side]]
- MPI-4.1: [[versions/v41/API/MPI_COMPARE_AND_SWAP|API note]] · chapter [[versions/v41/sections/one-side|one-side]]
- MPI-5.0: [[versions/v50/API/MPI_COMPARE_AND_SWAP|API note]] · chapter [[versions/v50/sections/one-side|one-side]]
