---
title: MPI_WIN_COMPLETE
c_name: MPI_Win_complete
chapter: one-side
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WIN_COMPLETE, MPI_Win_complete]
tags: [mpi/routine, mpi/one-side]
---

# MPI_WIN_COMPLETE

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_WIN_COMPLETE|MPI-2.0]] · [[versions/v21/API/MPI_WIN_COMPLETE|MPI-2.1]] · [[versions/v22/API/MPI_WIN_COMPLETE|MPI-2.2]] · [[versions/v30/API/MPI_WIN_COMPLETE|MPI-3.0]] Δ · [[versions/v31/API/MPI_WIN_COMPLETE|MPI-3.1]] Δ · [[versions/v40/API/MPI_WIN_COMPLETE|MPI-4.0]] · [[versions/v41/API/MPI_WIN_COMPLETE|MPI-4.1]] · [[versions/v50/API/MPI_WIN_COMPLETE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Win_complete(MPI_Win win)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Win::Complete() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Win_complete(win, ierror) BIND(C)
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Win_complete(win, ierror)
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_WIN_COMPLETE(WIN, IERROR)
    INTEGER WIN, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `win` | IN | **MPI-2.0–MPI-5.0:** window object (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_WIN_COMPLETE|API note]] · chapter [[versions/v20/sections/one-side|one-side]]
- MPI-2.1: [[versions/v21/API/MPI_WIN_COMPLETE|API note]] · chapter [[versions/v21/sections/one-side|one-side]]
- MPI-2.2: [[versions/v22/API/MPI_WIN_COMPLETE|API note]] · chapter [[versions/v22/sections/one-side|one-side]]
- MPI-3.0: [[versions/v30/API/MPI_WIN_COMPLETE|API note]] · chapter [[versions/v30/sections/one-side|one-side]]
- MPI-3.1: [[versions/v31/API/MPI_WIN_COMPLETE|API note]] · chapter [[versions/v31/sections/one-side|one-side]]
- MPI-4.0: [[versions/v40/API/MPI_WIN_COMPLETE|API note]] · chapter [[versions/v40/sections/one-side|one-side]]
- MPI-4.1: [[versions/v41/API/MPI_WIN_COMPLETE|API note]] · chapter [[versions/v41/sections/one-side|one-side]]
- MPI-5.0: [[versions/v50/API/MPI_WIN_COMPLETE|API note]] · chapter [[versions/v50/sections/one-side|one-side]]
