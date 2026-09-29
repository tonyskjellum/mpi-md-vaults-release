---
title: MPI_WIN_CREATE
c_name: MPI_Win_create
chapter: one-side
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WIN_CREATE, MPI_Win_create]
tags: [mpi/routine, mpi/one-side]
---

# MPI_WIN_CREATE

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_WIN_CREATE|MPI-2.0]] · [[versions/v21/API/MPI_WIN_CREATE|MPI-2.1]] · [[versions/v22/API/MPI_WIN_CREATE|MPI-2.2]] Δ · [[versions/v30/API/MPI_WIN_CREATE|MPI-3.0]] Δ · [[versions/v31/API/MPI_WIN_CREATE|MPI-3.1]] Δ · [[versions/v40/API/MPI_WIN_CREATE|MPI-4.0]] Δ · [[versions/v41/API/MPI_WIN_CREATE|MPI-4.1]] · [[versions/v50/API/MPI_WIN_CREATE|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-3.1**
```c
int MPI_Win_create(void *base, MPI_Aint size, int disp_unit, MPI_Info info, MPI_Comm comm, MPI_Win *win)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Win_create(void *base, MPI_Aint size, int disp_unit, MPI_Info info, MPI_Comm comm, MPI_Win *win)
int MPI_Win_create_c(void *base, MPI_Aint size, MPI_Aint disp_unit, MPI_Info info, MPI_Comm comm, MPI_Win *win)
```

## C++

**MPI-2.0–MPI-2.2**
```c
static MPI::Win MPI::Win::Create(const void* base, MPI::Aint size, int disp_unit, const MPI::Info& info, const MPI::Intracomm& comm)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Win_create(base, size, disp_unit, info, comm, win, ierror) BIND(C)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: base
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size
    INTEGER, INTENT(IN) :: disp_unit
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Win), INTENT(OUT) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Win_create(base, size, disp_unit, info, comm, win, ierror)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: base
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size
    INTEGER, INTENT(IN) :: disp_unit
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Win), INTENT(OUT) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Win_create(base, size, disp_unit, info, comm, win, ierror)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: base
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size
    INTEGER, INTENT(IN) :: disp_unit
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Win), INTENT(OUT) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Win_create(base, size, disp_unit, info, comm, win, ierror) !(_c)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: base
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size, disp_unit
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Win), INTENT(OUT) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_WIN_CREATE(BASE, SIZE, DISP_UNIT, INFO, COMM, WIN, IERROR)
    <type> BASE(*)
    INTEGER(KIND=MPI_ADDRESS_KIND) SIZE
    INTEGER DISP_UNIT, INFO, COMM, WIN, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `base` | IN | **MPI-2.0–MPI-5.0:** initial address of window (choice) |
| `size` | IN | **MPI-2.0–MPI-2.1:** size of window in bytes (nonnegative integer)<br>**MPI-2.2–MPI-4.1:** size of window in bytes (non-negative integer)<br>**MPI-5.0:** size of window in bytes (nonnegative integer) |
| `disp_unit` | IN | **MPI-2.0–MPI-5.0:** local unit size for displacements, in bytes (positive integer) |
| `info` | IN | **MPI-2.0–MPI-5.0:** info argument (handle) |
| `comm` | IN | **MPI-2.0–MPI-2.2:** communicator (handle)<br>**MPI-3.0–MPI-5.0:** intra-communicator (handle) |
| `win` | OUT | **MPI-2.0–MPI-3.1:** window object returned by the call (handle)<br>**MPI-4.0–MPI-5.0:** window object (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_WIN_CREATE|API note]] · chapter [[versions/v20/sections/one-side|one-side]]
- MPI-2.1: [[versions/v21/API/MPI_WIN_CREATE|API note]] · chapter [[versions/v21/sections/one-side|one-side]]
- MPI-2.2: [[versions/v22/API/MPI_WIN_CREATE|API note]] · chapter [[versions/v22/sections/one-side|one-side]]
- MPI-3.0: [[versions/v30/API/MPI_WIN_CREATE|API note]] · chapter [[versions/v30/sections/one-side|one-side]]
- MPI-3.1: [[versions/v31/API/MPI_WIN_CREATE|API note]] · chapter [[versions/v31/sections/one-side|one-side]]
- MPI-4.0: [[versions/v40/API/MPI_WIN_CREATE|API note]] · chapter [[versions/v40/sections/one-side|one-side]]
- MPI-4.1: [[versions/v41/API/MPI_WIN_CREATE|API note]] · chapter [[versions/v41/sections/one-side|one-side]]
- MPI-5.0: [[versions/v50/API/MPI_WIN_CREATE|API note]] · chapter [[versions/v50/sections/one-side|one-side]]
