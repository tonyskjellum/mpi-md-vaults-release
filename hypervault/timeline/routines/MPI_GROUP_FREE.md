---
title: MPI_GROUP_FREE
c_name: MPI_Group_free
chapter: context
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GROUP_FREE, MPI_Group_free]
tags: [mpi/routine, mpi/context]
---

# MPI_GROUP_FREE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_GROUP_FREE|MPI-1.3]] · [[versions/v21/API/MPI_GROUP_FREE|MPI-2.1]] Δ · [[versions/v22/API/MPI_GROUP_FREE|MPI-2.2]] · [[versions/v30/API/MPI_GROUP_FREE|MPI-3.0]] Δ · [[versions/v31/API/MPI_GROUP_FREE|MPI-3.1]] Δ · [[versions/v40/API/MPI_GROUP_FREE|MPI-4.0]] · [[versions/v41/API/MPI_GROUP_FREE|MPI-4.1]] · [[versions/v50/API/MPI_GROUP_FREE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Group_free(MPI_Group *group)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Group::Free()
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Group_free(group, ierror) BIND(C)
    TYPE(MPI_Group), INTENT(INOUT) :: group
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Group_free(group, ierror)
    TYPE(MPI_Group), INTENT(INOUT) :: group
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_GROUP_FREE(GROUP, IERROR)
    INTEGER GROUP, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `group` | INOUT | **MPI-1.3–MPI-5.0:** group (handle) |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_GROUP_FREE|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_GROUP_FREE|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_GROUP_FREE|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_GROUP_FREE|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_GROUP_FREE|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_GROUP_FREE|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_GROUP_FREE|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_GROUP_FREE|API note]] · chapter [[versions/v50/sections/context|context]]
