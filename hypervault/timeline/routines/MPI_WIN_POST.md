---
title: MPI_WIN_POST
c_name: MPI_Win_post
chapter: one-side
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WIN_POST, MPI_Win_post]
tags: [mpi/routine, mpi/one-side]
---

# MPI_WIN_POST

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_WIN_POST|MPI-2.0]] · [[versions/v21/API/MPI_WIN_POST|MPI-2.1]] · [[versions/v22/API/MPI_WIN_POST|MPI-2.2]] · [[versions/v30/API/MPI_WIN_POST|MPI-3.0]] Δ · [[versions/v31/API/MPI_WIN_POST|MPI-3.1]] Δ · [[versions/v40/API/MPI_WIN_POST|MPI-4.0]] · [[versions/v41/API/MPI_WIN_POST|MPI-4.1]] · [[versions/v50/API/MPI_WIN_POST|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Win_post(MPI_Group group, int assert, MPI_Win win)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Win::Post(const MPI::Group& group, int assert) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Win_post(group, assert, win, ierror) BIND(C)
    TYPE(MPI_Group), INTENT(IN) :: group
    INTEGER, INTENT(IN) :: assert
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Win_post(group, assert, win, ierror)
    TYPE(MPI_Group), INTENT(IN) :: group
    INTEGER, INTENT(IN) :: assert
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_WIN_POST(GROUP, ASSERT, WIN, IERROR)
    INTEGER GROUP, ASSERT, WIN, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `group` | IN | **MPI-2.0–MPI-5.0:** group of origin processes (handle) |
| `assert` | IN | **MPI-2.0–MPI-5.0:** program assertion (integer) |
| `win` | IN | **MPI-2.0–MPI-5.0:** window object (handle) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_WIN_POST|API note]] · chapter [[versions/v20/sections/one-side|one-side]]
- MPI-2.1: [[versions/v21/API/MPI_WIN_POST|API note]] · chapter [[versions/v21/sections/one-side|one-side]]
- MPI-2.2: [[versions/v22/API/MPI_WIN_POST|API note]] · chapter [[versions/v22/sections/one-side|one-side]]
- MPI-3.0: [[versions/v30/API/MPI_WIN_POST|API note]] · chapter [[versions/v30/sections/one-side|one-side]]
- MPI-3.1: [[versions/v31/API/MPI_WIN_POST|API note]] · chapter [[versions/v31/sections/one-side|one-side]]
- MPI-4.0: [[versions/v40/API/MPI_WIN_POST|API note]] · chapter [[versions/v40/sections/one-side|one-side]]
- MPI-4.1: [[versions/v41/API/MPI_WIN_POST|API note]] · chapter [[versions/v41/sections/one-side|one-side]]
- MPI-5.0: [[versions/v50/API/MPI_WIN_POST|API note]] · chapter [[versions/v50/sections/one-side|one-side]]
