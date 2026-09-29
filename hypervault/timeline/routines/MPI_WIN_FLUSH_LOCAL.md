---
title: MPI_WIN_FLUSH_LOCAL
c_name: MPI_Win_flush_local
chapter: one-side
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WIN_FLUSH_LOCAL, MPI_Win_flush_local]
tags: [mpi/routine, mpi/one-side]
---

# MPI_WIN_FLUSH_LOCAL

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_WIN_FLUSH_LOCAL|MPI-3.0]] · [[versions/v31/API/MPI_WIN_FLUSH_LOCAL|MPI-3.1]] Δ · [[versions/v40/API/MPI_WIN_FLUSH_LOCAL|MPI-4.0]] · [[versions/v41/API/MPI_WIN_FLUSH_LOCAL|MPI-4.1]] Δ · [[versions/v50/API/MPI_WIN_FLUSH_LOCAL|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Win_flush_local(int rank, MPI_Win win)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Win_flush_local(rank, win, ierror) BIND(C)
    INTEGER, INTENT(IN) :: rank
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Win_flush_local(rank, win, ierror)
    INTEGER, INTENT(IN) :: rank
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_WIN_FLUSH_LOCAL(RANK, WIN, IERROR)
    INTEGER RANK, WIN, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `rank` | IN | **MPI-3.0–MPI-4.0:** rank of target window (non-negative integer)<br>**MPI-4.1:** rank of target MPI process in the group of the window `win` (non-negative integer)<br>**MPI-5.0:** rank of target MPI process in the group of the window `win` (nonnegative integer) |
| `win` | IN | **MPI-3.0–MPI-5.0:** window object (handle) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_WIN_FLUSH_LOCAL|API note]] · chapter [[versions/v30/sections/one-side|one-side]]
- MPI-3.1: [[versions/v31/API/MPI_WIN_FLUSH_LOCAL|API note]] · chapter [[versions/v31/sections/one-side|one-side]]
- MPI-4.0: [[versions/v40/API/MPI_WIN_FLUSH_LOCAL|API note]] · chapter [[versions/v40/sections/one-side|one-side]]
- MPI-4.1: [[versions/v41/API/MPI_WIN_FLUSH_LOCAL|API note]] · chapter [[versions/v41/sections/one-side|one-side]]
- MPI-5.0: [[versions/v50/API/MPI_WIN_FLUSH_LOCAL|API note]] · chapter [[versions/v50/sections/one-side|one-side]]
