---
title: MPI_AINT_ADD
c_name: MPI_Aint_add
chapter: datatypes
introduced: "MPI-3.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_AINT_ADD, MPI_Aint_add]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_AINT_ADD

**Introduced** in MPI-3.1.

Releases: [[versions/v31/API/MPI_AINT_ADD|MPI-3.1]] · [[versions/v40/API/MPI_AINT_ADD|MPI-4.0]] · [[versions/v41/API/MPI_AINT_ADD|MPI-4.1]] · [[versions/v50/API/MPI_AINT_ADD|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.1–MPI-5.0**
```c
MPI_Aint MPI_Aint_add(MPI_Aint base, MPI_Aint disp)
```

## Fortran 2008

**MPI-3.1–MPI-5.0**
```fortran
INTEGER(KIND=MPI_ADDRESS_KIND) MPI_Aint_add(base, disp)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: base, disp
```

## mpif.h

**MPI-3.1–MPI-5.0**
```fortran
INTEGER(KIND=MPI_ADDRESS_KIND) MPI_AINT_ADD(BASE, DISP)
    INTEGER(KIND=MPI_ADDRESS_KIND) BASE, DISP
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `base` | IN | **MPI-3.1–MPI-5.0:** base address (integer) |
| `disp` | IN | **MPI-3.1–MPI-5.0:** displacement (integer) |

## Named in the change log of

[[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.1: [[versions/v31/API/MPI_AINT_ADD|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_AINT_ADD|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_AINT_ADD|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_AINT_ADD|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
