---
title: MPI_WIN_GET_ATTR
c_name: MPI_Win_get_attr
chapter: context
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WIN_GET_ATTR, MPI_Win_get_attr]
tags: [mpi/routine, mpi/context]
---

# MPI_WIN_GET_ATTR

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_WIN_GET_ATTR|MPI-2.0]] · [[versions/v21/API/MPI_WIN_GET_ATTR|MPI-2.1]] Δ · [[versions/v22/API/MPI_WIN_GET_ATTR|MPI-2.2]] Δ · [[versions/v30/API/MPI_WIN_GET_ATTR|MPI-3.0]] Δ · [[versions/v31/API/MPI_WIN_GET_ATTR|MPI-3.1]] Δ · [[versions/v40/API/MPI_WIN_GET_ATTR|MPI-4.0]] Δ · [[versions/v41/API/MPI_WIN_GET_ATTR|MPI-4.1]] · [[versions/v50/API/MPI_WIN_GET_ATTR|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Win_get_attr(MPI_Win win, int win_keyval, void *attribute_val, int *flag)
```

## C++

**MPI-2.0**
```c
bool MPI::Win::Get_attr(const MPI::Win& win, int win_keyval, void* attribute_val) const
```

**MPI-2.1–MPI-2.2**
```c
bool MPI::Win::Get_attr(int win_keyval, void* attribute_val) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Win_get_attr(win, win_keyval, attribute_val, flag, ierror) BIND(C)
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, INTENT(IN) :: win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: attribute_val
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Win_get_attr(win, win_keyval, attribute_val, flag, ierror)
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, INTENT(IN) :: win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: attribute_val
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_WIN_GET_ATTR(WIN, WIN_KEYVAL, ATTRIBUTE_VAL, FLAG, IERROR)
    INTEGER WIN, WIN_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `win` | IN | **MPI-2.0–MPI-5.0:** window to which the attribute is attached (handle) |
| `win_keyval` | IN | **MPI-2.0–MPI-5.0:** key value (integer) |
| `attribute_val` | OUT | **MPI-2.0–MPI-3.1:** attribute value, unless `flag = false`<br>**MPI-4.0–MPI-5.0:** attribute value, unless `flag" = false` |
| `flag` | OUT | **MPI-2.0–MPI-2.1:** false if no attribute is associated with the key (logical)<br>**MPI-2.2–MPI-5.0:** `false` if no attribute is associated with the key (logical) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_WIN_GET_ATTR|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_WIN_GET_ATTR|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_WIN_GET_ATTR|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_WIN_GET_ATTR|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_WIN_GET_ATTR|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_WIN_GET_ATTR|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_WIN_GET_ATTR|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_WIN_GET_ATTR|API note]] · chapter [[versions/v50/sections/context|context]]
