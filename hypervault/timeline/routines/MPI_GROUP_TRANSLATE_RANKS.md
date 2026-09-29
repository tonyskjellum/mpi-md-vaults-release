---
title: MPI_GROUP_TRANSLATE_RANKS
c_name: MPI_Group_translate_ranks
chapter: context
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GROUP_TRANSLATE_RANKS, MPI_Group_translate_ranks]
tags: [mpi/routine, mpi/context]
---

# MPI_GROUP_TRANSLATE_RANKS

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_GROUP_TRANSLATE_RANKS|MPI-1.3]] · [[versions/v21/API/MPI_GROUP_TRANSLATE_RANKS|MPI-2.1]] Δ · [[versions/v22/API/MPI_GROUP_TRANSLATE_RANKS|MPI-2.2]] Δ · [[versions/v30/API/MPI_GROUP_TRANSLATE_RANKS|MPI-3.0]] Δ · [[versions/v31/API/MPI_GROUP_TRANSLATE_RANKS|MPI-3.1]] Δ · [[versions/v40/API/MPI_GROUP_TRANSLATE_RANKS|MPI-4.0]] · [[versions/v41/API/MPI_GROUP_TRANSLATE_RANKS|MPI-4.1]] Δ · [[versions/v50/API/MPI_GROUP_TRANSLATE_RANKS|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Group_translate_ranks (MPI_Group group1, int n, int *ranks1, MPI_Group group2, int *ranks2)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Group_translate_ranks(MPI_Group group1, int n, const int ranks1[], MPI_Group group2, int ranks2[])
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
static void MPI::Group::Translate_ranks (const MPI::Group& group1, int n, const int ranks1[], const MPI::Group& group2, int ranks2[])
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Group_translate_ranks(group1, n, ranks1, group2, ranks2, ierror) BIND(C)
    TYPE(MPI_Group), INTENT(IN) :: group1, group2
    INTEGER, INTENT(IN) :: n, ranks1(n)
    INTEGER, INTENT(OUT) :: ranks2(n)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Group_translate_ranks(group1, n, ranks1, group2, ranks2, ierror)
    TYPE(MPI_Group), INTENT(IN) :: group1, group2
    INTEGER, INTENT(IN) :: n, ranks1(n)
    INTEGER, INTENT(OUT) :: ranks2(n)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_GROUP_TRANSLATE_RANKS(GROUP1, N, RANKS1, GROUP2, RANKS2, IERROR)
    INTEGER GROUP1, N, RANKS1(*), GROUP2, RANKS2(*), IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `group1` | IN | **MPI-1.3–MPI-5.0:** group1 (handle) |
| `n` | IN | **MPI-1.3–MPI-2.2:** number of ranks in ` ranks1` and `ranks2` arrays (integer)<br>**MPI-3.0–MPI-4.0:** number of ranks in `ranks1` and `ranks2` arrays (integer)<br>**MPI-4.1–MPI-5.0:** number of elements in `ranks1` and `ranks2` arrays (integer) |
| `ranks1` | IN | **MPI-1.3–MPI-5.0:** array of zero or more valid ranks in group1 |
| `group2` | IN | **MPI-1.3–MPI-5.0:** group2 (handle) |
| `ranks2` | OUT | **MPI-1.3:** array of corresponding ranks in group2, MPI_UNDE- FINED when no correspondence exists.<br>**MPI-2.1:** array of corresponding ranks in group2, MPI_UNDEFINED when no correspondence exists.<br>**MPI-2.2–MPI-5.0:** array of corresponding ranks in group2, `MPI_UNDEFINED` when no correspondence exists. |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_GROUP_TRANSLATE_RANKS|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_GROUP_TRANSLATE_RANKS|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_GROUP_TRANSLATE_RANKS|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_GROUP_TRANSLATE_RANKS|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_GROUP_TRANSLATE_RANKS|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_GROUP_TRANSLATE_RANKS|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_GROUP_TRANSLATE_RANKS|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_GROUP_TRANSLATE_RANKS|API note]] · chapter [[versions/v50/sections/context|context]]
