---
title: MPI_WIN_ALLOCATE_SHARED
c_name: MPI_Win_allocate_shared
chapter: one-side
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WIN_ALLOCATE_SHARED, MPI_Win_allocate_shared]
tags: [mpi/routine, mpi/one-side]
---

# MPI_WIN_ALLOCATE_SHARED

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_WIN_ALLOCATE_SHARED|MPI-3.0]] · [[versions/v31/API/MPI_WIN_ALLOCATE_SHARED|MPI-3.1]] Δ · [[versions/v40/API/MPI_WIN_ALLOCATE_SHARED|MPI-4.0]] Δ · [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI-4.1]] Δ · [[versions/v50/API/MPI_WIN_ALLOCATE_SHARED|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_Win_allocate_shared(MPI_Aint size, int disp_unit, MPI_Info info, MPI_Comm comm, void *baseptr, MPI_Win *win)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Win_allocate_shared(MPI_Aint size, int disp_unit, MPI_Info info, MPI_Comm comm, void *baseptr, MPI_Win *win)
int MPI_Win_allocate_shared_c(MPI_Aint size, MPI_Aint disp_unit, MPI_Info info, MPI_Comm comm, void *baseptr, MPI_Win *win)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Win_allocate_shared(size, disp_unit, info, comm, baseptr, win, ierror) BIND(C)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size
    INTEGER, INTENT(IN) :: disp_unit
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(C_PTR), INTENT(OUT) :: baseptr
    TYPE(MPI_Win), INTENT(OUT) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Win_allocate_shared(size, disp_unit, info, comm, baseptr, win, ierror)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size
    INTEGER, INTENT(IN) :: disp_unit
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(C_PTR), INTENT(OUT) :: baseptr
    TYPE(MPI_Win), INTENT(OUT) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Win_allocate_shared(size, disp_unit, info, comm, baseptr, win, ierror)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size
    INTEGER, INTENT(IN) :: disp_unit
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(C_PTR), INTENT(OUT) :: baseptr
    TYPE(MPI_Win), INTENT(OUT) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Win_allocate_shared(size, disp_unit, info, comm, baseptr, win, ierror) !(_c)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size, disp_unit
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(C_PTR), INTENT(OUT) :: baseptr
    TYPE(MPI_Win), INTENT(OUT) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-3.1**
```fortran
MPI_WIN_ALLOCATE_SHARED(SIZE, DISP_UNIT, INFO, COMM, BASEPTR, WIN, IERROR)
    INTEGER DISP_UNIT, INFO, COMM, WIN, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) SIZE, BASEPTR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_WIN_ALLOCATE_SHARED(SIZE, DISP_UNIT, INFO, COMM, BASEPTR, WIN, IERROR)
    INTEGER(KIND=MPI_ADDRESS_KIND) SIZE, BASEPTR
    INTEGER DISP_UNIT, INFO, COMM, WIN, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `size` | IN | **MPI-3.0–MPI-4.1:** size of local window in bytes (non-negative integer)<br>**MPI-5.0:** size of local window in bytes (nonnegative integer) |
| `disp_unit` | IN | **MPI-3.0–MPI-5.0:** local unit size for displacements, in bytes (positive integer) |
| `info` | IN | **MPI-3.0–MPI-5.0:** info argument (handle) |
| `comm` | IN | **MPI-3.0–MPI-5.0:** intra-communicator (handle) |
| `baseptr` | OUT | **MPI-3.0–MPI-5.0:** address of local allocated window segment (choice) |
| `win` | OUT | **MPI-3.0–MPI-4.0:** window object returned by the call (handle)<br>**MPI-4.1–MPI-5.0:** window object (handle) |

## Named in the change log of

[[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_WIN_ALLOCATE_SHARED|API note]] · chapter [[versions/v30/sections/one-side|one-side]]
- MPI-3.1: [[versions/v31/API/MPI_WIN_ALLOCATE_SHARED|API note]] · chapter [[versions/v31/sections/one-side|one-side]]
- MPI-4.0: [[versions/v40/API/MPI_WIN_ALLOCATE_SHARED|API note]] · chapter [[versions/v40/sections/one-side|one-side]]
- MPI-4.1: [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|API note]] · chapter [[versions/v41/sections/one-side|one-side]]
- MPI-5.0: [[versions/v50/API/MPI_WIN_ALLOCATE_SHARED|API note]] · chapter [[versions/v50/sections/one-side|one-side]]
