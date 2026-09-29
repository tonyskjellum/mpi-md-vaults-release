---
title: MPI_WIN_SHARED_QUERY
c_name: MPI_Win_shared_query
chapter: one-side
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WIN_SHARED_QUERY, MPI_Win_shared_query]
tags: [mpi/routine, mpi/one-side]
---

# MPI_WIN_SHARED_QUERY

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_WIN_SHARED_QUERY|MPI-3.0]] · [[versions/v31/API/MPI_WIN_SHARED_QUERY|MPI-3.1]] Δ · [[versions/v40/API/MPI_WIN_SHARED_QUERY|MPI-4.0]] Δ · [[versions/v41/API/MPI_WIN_SHARED_QUERY|MPI-4.1]] Δ · [[versions/v50/API/MPI_WIN_SHARED_QUERY|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_Win_shared_query(MPI_Win win, int rank, MPI_Aint *size, int *disp_unit, void *baseptr)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Win_shared_query(MPI_Win win, int rank, MPI_Aint *size, int *disp_unit, void *baseptr)
int MPI_Win_shared_query_c(MPI_Win win, int rank, MPI_Aint *size, MPI_Aint *disp_unit, void *baseptr)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Win_shared_query(win, rank, size, disp_unit, baseptr, ierror) BIND(C)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, INTENT(IN) :: rank
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: size
    INTEGER, INTENT(OUT) :: disp_unit
    TYPE(C_PTR), INTENT(OUT) :: baseptr
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Win_shared_query(win, rank, size, disp_unit, baseptr, ierror)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, INTENT(IN) :: rank
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: size
    INTEGER, INTENT(OUT) :: disp_unit
    TYPE(C_PTR), INTENT(OUT) :: baseptr
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Win_shared_query(win, rank, size, disp_unit, baseptr, ierror)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, INTENT(IN) :: rank
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: size
    INTEGER, INTENT(OUT) :: disp_unit
    TYPE(C_PTR), INTENT(OUT) :: baseptr
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Win_shared_query(win, rank, size, disp_unit, baseptr, ierror) !(_c)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, INTENT(IN) :: rank
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: size, disp_unit
    TYPE(C_PTR), INTENT(OUT) :: baseptr
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-3.1**
```fortran
MPI_WIN_SHARED_QUERY(WIN, RANK, SIZE, DISP_UNIT, BASEPTR, IERROR)
    INTEGER WIN, RANK, DISP_UNIT, IERROR
    INTEGER (KIND=MPI_ADDRESS_KIND) SIZE, BASEPTR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_WIN_SHARED_QUERY(WIN, RANK, SIZE, DISP_UNIT, BASEPTR, IERROR)
    INTEGER WIN, RANK, DISP_UNIT, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) SIZE, BASEPTR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `win` | IN | **MPI-3.0–MPI-4.0:** shared memory window object (handle)<br>**MPI-4.1–MPI-5.0:** shared memory window (handle) |
| `rank` | IN | **MPI-3.0–MPI-3.1:** rank in the group of window win (non-negative integer) or `MPI_PROC_NULL`<br>**MPI-4.0–MPI-4.1:** rank in the group of window win or `MPI_PROC_NULL` (non-negative integer)<br>**MPI-5.0:** rank in the group of window win or `MPI_PROC_NULL` (nonnegative integer) |
| `size` | OUT | **MPI-3.0–MPI-4.1:** size of the window segment (non-negative integer)<br>**MPI-5.0:** size of the window segment (nonnegative integer) |
| `disp_unit` | OUT | **MPI-3.0–MPI-5.0:** local unit size for displacements, in bytes (positive integer) |
| `baseptr` | OUT | **MPI-3.0–MPI-5.0:** address for load/store access to window segment (choice) |

## Named in the change log of

[[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_WIN_SHARED_QUERY|API note]] · chapter [[versions/v30/sections/one-side|one-side]]
- MPI-3.1: [[versions/v31/API/MPI_WIN_SHARED_QUERY|API note]] · chapter [[versions/v31/sections/one-side|one-side]]
- MPI-4.0: [[versions/v40/API/MPI_WIN_SHARED_QUERY|API note]] · chapter [[versions/v40/sections/one-side|one-side]]
- MPI-4.1: [[versions/v41/API/MPI_WIN_SHARED_QUERY|API note]] · chapter [[versions/v41/sections/one-side|one-side]]
- MPI-5.0: [[versions/v50/API/MPI_WIN_SHARED_QUERY|API note]] · chapter [[versions/v50/sections/one-side|one-side]]
