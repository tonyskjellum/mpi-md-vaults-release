---
title: MPI_WIN_CREATE_DYNAMIC
c_name: MPI_Win_create_dynamic
chapter: one-side
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WIN_CREATE_DYNAMIC, MPI_Win_create_dynamic]
tags: [mpi/routine, mpi/one-side]
---

# MPI_WIN_CREATE_DYNAMIC

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_WIN_CREATE_DYNAMIC|MPI-3.0]] · [[versions/v31/API/MPI_WIN_CREATE_DYNAMIC|MPI-3.1]] Δ · [[versions/v40/API/MPI_WIN_CREATE_DYNAMIC|MPI-4.0]] · [[versions/v41/API/MPI_WIN_CREATE_DYNAMIC|MPI-4.1]] Δ · [[versions/v50/API/MPI_WIN_CREATE_DYNAMIC|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Win_create_dynamic(MPI_Info info, MPI_Comm comm, MPI_Win *win)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Win_create_dynamic(info, comm, win, ierror) BIND(C)
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Win), INTENT(OUT) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Win_create_dynamic(info, comm, win, ierror)
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Win), INTENT(OUT) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_WIN_CREATE_DYNAMIC(INFO, COMM, WIN, IERROR)
    INTEGER INFO, COMM, WIN, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `info` | IN | **MPI-3.0–MPI-5.0:** info argument (handle) |
| `comm` | IN | **MPI-3.0–MPI-5.0:** intra-communicator (handle) |
| `win` | OUT | **MPI-3.0–MPI-4.0:** window object returned by the call (handle)<br>**MPI-4.1–MPI-5.0:** window object (handle) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_WIN_CREATE_DYNAMIC|API note]] · chapter [[versions/v30/sections/one-side|one-side]]
- MPI-3.1: [[versions/v31/API/MPI_WIN_CREATE_DYNAMIC|API note]] · chapter [[versions/v31/sections/one-side|one-side]]
- MPI-4.0: [[versions/v40/API/MPI_WIN_CREATE_DYNAMIC|API note]] · chapter [[versions/v40/sections/one-side|one-side]]
- MPI-4.1: [[versions/v41/API/MPI_WIN_CREATE_DYNAMIC|API note]] · chapter [[versions/v41/sections/one-side|one-side]]
- MPI-5.0: [[versions/v50/API/MPI_WIN_CREATE_DYNAMIC|API note]] · chapter [[versions/v50/sections/one-side|one-side]]
