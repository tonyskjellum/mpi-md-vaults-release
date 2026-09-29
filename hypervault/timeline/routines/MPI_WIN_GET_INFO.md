---
title: MPI_WIN_GET_INFO
c_name: MPI_Win_get_info
chapter: one-side
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WIN_GET_INFO, MPI_Win_get_info]
tags: [mpi/routine, mpi/one-side]
---

# MPI_WIN_GET_INFO

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_WIN_GET_INFO|MPI-3.0]] · [[versions/v31/API/MPI_WIN_GET_INFO|MPI-3.1]] Δ · [[versions/v40/API/MPI_WIN_GET_INFO|MPI-4.0]] · [[versions/v41/API/MPI_WIN_GET_INFO|MPI-4.1]] · [[versions/v50/API/MPI_WIN_GET_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Win_get_info(MPI_Win win, MPI_Info *info_used)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Win_get_info(win, info_used, ierror) BIND(C)
    TYPE(MPI_Win), INTENT(IN) :: win
    TYPE(MPI_Info), INTENT(OUT) :: info_used
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Win_get_info(win, info_used, ierror)
    TYPE(MPI_Win), INTENT(IN) :: win
    TYPE(MPI_Info), INTENT(OUT) :: info_used
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_WIN_GET_INFO(WIN, INFO_USED, IERROR)
    INTEGER WIN, INFO_USED, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `win` | IN | **MPI-3.0–MPI-5.0:** window object (handle) |
| `info_used` | OUT | **MPI-3.0–MPI-5.0:** new info object (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_WIN_GET_INFO|API note]] · chapter [[versions/v30/sections/one-side|one-side]]
- MPI-3.1: [[versions/v31/API/MPI_WIN_GET_INFO|API note]] · chapter [[versions/v31/sections/one-side|one-side]]
- MPI-4.0: [[versions/v40/API/MPI_WIN_GET_INFO|API note]] · chapter [[versions/v40/sections/one-side|one-side]]
- MPI-4.1: [[versions/v41/API/MPI_WIN_GET_INFO|API note]] · chapter [[versions/v41/sections/one-side|one-side]]
- MPI-5.0: [[versions/v50/API/MPI_WIN_GET_INFO|API note]] · chapter [[versions/v50/sections/one-side|one-side]]
