---
title: MPI_AINT_DIFF
c_name: MPI_Aint_diff
chapter: datatypes
introduced: "MPI-3.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_AINT_DIFF, MPI_Aint_diff]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_AINT_DIFF

**Introduced** in MPI-3.1.

Releases: [[versions/v31/API/MPI_AINT_DIFF|MPI-3.1]] · [[versions/v40/API/MPI_AINT_DIFF|MPI-4.0]] · [[versions/v41/API/MPI_AINT_DIFF|MPI-4.1]] · [[versions/v50/API/MPI_AINT_DIFF|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.1–MPI-5.0**
```c
MPI_Aint MPI_Aint_diff(MPI_Aint addr1, MPI_Aint addr2)
```

## Fortran 2008

**MPI-3.1–MPI-5.0**
```fortran
INTEGER(KIND=MPI_ADDRESS_KIND) MPI_Aint_diff(addr1, addr2)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: addr1, addr2
```

## mpif.h

**MPI-3.1–MPI-5.0**
```fortran
INTEGER(KIND=MPI_ADDRESS_KIND) MPI_AINT_DIFF(ADDR1, ADDR2)
    INTEGER(KIND=MPI_ADDRESS_KIND) ADDR1, ADDR2
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `addr1` | IN | **MPI-3.1–MPI-5.0:** minuend address (integer) |
| `addr2` | IN | **MPI-3.1–MPI-5.0:** subtrahend address (integer) |

## Named in the change log of

[[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.1: [[versions/v31/API/MPI_AINT_DIFF|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_AINT_DIFF|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_AINT_DIFF|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_AINT_DIFF|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
