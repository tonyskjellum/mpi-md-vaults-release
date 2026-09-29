---
title: MPI_TYPE_FREE_KEYVAL
c_name: MPI_Type_free_keyval
chapter: context
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_FREE_KEYVAL, MPI_Type_free_keyval]
tags: [mpi/routine, mpi/context]
---

# MPI_TYPE_FREE_KEYVAL

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_FREE_KEYVAL|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_FREE_KEYVAL|MPI-2.1]] · [[versions/v22/API/MPI_TYPE_FREE_KEYVAL|MPI-2.2]] · [[versions/v30/API/MPI_TYPE_FREE_KEYVAL|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_FREE_KEYVAL|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_FREE_KEYVAL|MPI-4.0]] · [[versions/v41/API/MPI_TYPE_FREE_KEYVAL|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_FREE_KEYVAL|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Type_free_keyval(int *type_keyval)
```

## C++

**MPI-2.0–MPI-2.2**
```c
static void MPI::Datatype::Free_keyval(int& type_keyval)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_free_keyval(type_keyval, ierror) BIND(C)
    INTEGER, INTENT(INOUT) :: type_keyval
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Type_free_keyval(type_keyval, ierror)
    INTEGER, INTENT(INOUT) :: type_keyval
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_TYPE_FREE_KEYVAL(TYPE_KEYVAL, IERROR)
    INTEGER TYPE_KEYVAL, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `type_keyval` | INOUT | **MPI-2.0–MPI-5.0:** key value (integer) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_FREE_KEYVAL|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_FREE_KEYVAL|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_FREE_KEYVAL|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_FREE_KEYVAL|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_FREE_KEYVAL|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_FREE_KEYVAL|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_FREE_KEYVAL|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_FREE_KEYVAL|API note]] · chapter [[versions/v50/sections/context|context]]
