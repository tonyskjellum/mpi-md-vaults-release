---
title: MPI_TYPE_HVECTOR
c_name: MPI_Type_hvector
chapter: deprecated
introduced: "MPI-1.3"
deprecated: "MPI-2.1"
removed: "MPI-3.0"
continued_as: "MPI_TYPE_CREATE_HVECTOR"
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2"]
aliases: [MPI_TYPE_HVECTOR, MPI_Type_hvector]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_TYPE_HVECTOR

**Introduced** in MPI-1.3 · **deprecated** in MPI-2.1 · **removed** in MPI-3.0 · **continued as** [[timeline/routines/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] (MPI-2.0 deprecated names and functions).

Releases: [[versions/v13/API/MPI_TYPE_HVECTOR|MPI-1.3]] · [[versions/v21/API/MPI_TYPE_HVECTOR|MPI-2.1]] † · [[versions/v22/API/MPI_TYPE_HVECTOR|MPI-2.2]] † · ~~MPI-3.0~~

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Type_hvector(int count, int blocklength, MPI_Aint stride, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

## mpif.h

**MPI-1.3–MPI-2.2**
```fortran
MPI_TYPE_HVECTOR(COUNT, BLOCKLENGTH, STRIDE, OLDTYPE, NEWTYPE, IERROR)
    INTEGER COUNT, BLOCKLENGTH, STRIDE, OLDTYPE, NEWTYPE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-1.3–MPI-2.1:** number of blocks (nonnegative integer)<br>**MPI-2.2:** number of blocks (non-negative integer) |
| `blocklength` | IN | **MPI-1.3–MPI-2.1:** number of elements in each block (nonnegative integer)<br>**MPI-2.2:** number of elements in each block (non-negative integer) |
| `stride` | IN | **MPI-1.3–MPI-2.2:** number of bytes between start of each block (integer) |
| `oldtype` | IN | **MPI-1.3–MPI-2.2:** old datatype (handle) |
| `newtype` | OUT | **MPI-1.3–MPI-2.2:** new datatype (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_TYPE_HVECTOR|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_HVECTOR|API note]] · chapter [[versions/v21/sections/deprecated|deprecated]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_HVECTOR|API note]] · chapter [[versions/v22/sections/deprecated|deprecated]]
