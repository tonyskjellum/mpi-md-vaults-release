---
title: MPI_WIN_SET_ATTR
c_name: MPI_Win_set_attr
chapter: context
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WIN_SET_ATTR, MPI_Win_set_attr]
tags: [mpi/routine, mpi/context]
---

# MPI_WIN_SET_ATTR

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_WIN_SET_ATTR|MPI-2.0]] · [[versions/v21/API/MPI_WIN_SET_ATTR|MPI-2.1]] · [[versions/v22/API/MPI_WIN_SET_ATTR|MPI-2.2]] · [[versions/v30/API/MPI_WIN_SET_ATTR|MPI-3.0]] Δ · [[versions/v31/API/MPI_WIN_SET_ATTR|MPI-3.1]] Δ · [[versions/v40/API/MPI_WIN_SET_ATTR|MPI-4.0]] · [[versions/v41/API/MPI_WIN_SET_ATTR|MPI-4.1]] · [[versions/v50/API/MPI_WIN_SET_ATTR|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Win_set_attr(MPI_Win win, int win_keyval, void *attribute_val)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Win::Set_attr(int win_keyval, const void* attribute_val)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Win_set_attr(win, win_keyval, attribute_val, ierror) BIND(C)
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, INTENT(IN) :: win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: attribute_val
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Win_set_attr(win, win_keyval, attribute_val, ierror)
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, INTENT(IN) :: win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: attribute_val
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_WIN_SET_ATTR(WIN, WIN_KEYVAL, ATTRIBUTE_VAL, IERROR)
    INTEGER WIN, WIN_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `win` | INOUT | **MPI-2.0–MPI-5.0:** window to which attribute will be attached (handle) |
| `win_keyval` | IN | **MPI-2.0–MPI-5.0:** key value (integer) |
| `attribute_val` | IN | **MPI-2.0–MPI-5.0:** attribute value |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_WIN_SET_ATTR|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_WIN_SET_ATTR|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_WIN_SET_ATTR|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_WIN_SET_ATTR|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_WIN_SET_ATTR|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_WIN_SET_ATTR|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_WIN_SET_ATTR|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_WIN_SET_ATTR|API note]] · chapter [[versions/v50/sections/context|context]]
