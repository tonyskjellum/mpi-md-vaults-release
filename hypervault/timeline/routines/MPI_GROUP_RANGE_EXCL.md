---
title: MPI_GROUP_RANGE_EXCL
c_name: MPI_Group_range_excl
chapter: context
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GROUP_RANGE_EXCL, MPI_Group_range_excl]
tags: [mpi/routine, mpi/context]
---

# MPI_GROUP_RANGE_EXCL

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_GROUP_RANGE_EXCL|MPI-1.3]] · [[versions/v21/API/MPI_GROUP_RANGE_EXCL|MPI-2.1]] Δ · [[versions/v22/API/MPI_GROUP_RANGE_EXCL|MPI-2.2]] · [[versions/v30/API/MPI_GROUP_RANGE_EXCL|MPI-3.0]] Δ · [[versions/v31/API/MPI_GROUP_RANGE_EXCL|MPI-3.1]] Δ · [[versions/v40/API/MPI_GROUP_RANGE_EXCL|MPI-4.0]] Δ · [[versions/v41/API/MPI_GROUP_RANGE_EXCL|MPI-4.1]] Δ · [[versions/v50/API/MPI_GROUP_RANGE_EXCL|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Group_range_excl(MPI_Group group, int n, int ranges[][3], MPI_Group *newgroup)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
MPI::Group MPI::Group::Range_excl(int n, const int ranges[][3]) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Group_range_excl(group, n, ranges, newgroup, ierror) BIND(C)
    TYPE(MPI_Group), INTENT(IN) :: group
    INTEGER, INTENT(IN) :: n, ranges(3,n)
    TYPE(MPI_Group), INTENT(OUT) :: newgroup
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Group_range_excl(group, n, ranges, newgroup, ierror)
    TYPE(MPI_Group), INTENT(IN) :: group
    INTEGER, INTENT(IN) :: n, ranges(3,n)
    TYPE(MPI_Group), INTENT(OUT) :: newgroup
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Group_range_excl(group, n, ranges, newgroup, ierror)
    TYPE(MPI_Group), INTENT(IN) :: group
    INTEGER, INTENT(IN) :: n, ranges(3, n)
    TYPE(MPI_Group), INTENT(OUT) :: newgroup
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-3.1**
```fortran
MPI_GROUP_RANGE_EXCL(GROUP, N, RANGES, NEWGROUP, IERROR)
    INTEGER GROUP, N, RANGES(3,*), NEWGROUP, IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_GROUP_RANGE_EXCL(GROUP, N, RANGES, NEWGROUP, IERROR)
    INTEGER GROUP, N, RANGES(3, *), NEWGROUP, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `group` | IN | **MPI-1.3–MPI-5.0:** group (handle) |
| `n` | IN | **MPI-1.3–MPI-3.1:** number of elements in array ranges (integer)<br>**MPI-4.0–MPI-5.0:** number of triplets in array `ranges` (integer) |
| `ranges` | IN | **MPI-1.3–MPI-3.1:** a one-dimensional array of integer triplets of the form (first rank, last rank, stride), indicating the ranks in `group` of processes to be excluded from the output group `newgroup`.<br>**MPI-4.0:** a one-dimensional array of integer triplets, of the form (first rank, last rank, stride) indicating ranks in `group` of processes to be excluded from the output group `newgroup` (array of integers)<br>**MPI-4.1–MPI-5.0:** a one-dimensional array of integer triplets, of the form (first rank, last rank, stride) indicating ranks in `group` of MPI processes to be excluded from the output group `newgroup` (array of integers) |
| `newgroup` | OUT | **MPI-1.3–MPI-5.0:** new group derived from above, preserving the order in `group` (handle) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_GROUP_RANGE_EXCL|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_GROUP_RANGE_EXCL|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_GROUP_RANGE_EXCL|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_GROUP_RANGE_EXCL|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_GROUP_RANGE_EXCL|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_GROUP_RANGE_EXCL|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_GROUP_RANGE_EXCL|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_GROUP_RANGE_EXCL|API note]] · chapter [[versions/v50/sections/context|context]]
