---
title: MPI_TYPE_STRUCT
c_name: MPI_Type_struct
chapter: deprecated
introduced: "MPI-1.3"
deprecated: "MPI-2.1"
removed: "MPI-3.0"
continued_as: "MPI_TYPE_CREATE_STRUCT"
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2"]
aliases: [MPI_TYPE_STRUCT, MPI_Type_struct]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_TYPE_STRUCT

**Introduced** in MPI-1.3 · **deprecated** in MPI-2.1 · **removed** in MPI-3.0 · **continued as** [[timeline/routines/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] (MPI-2.0 deprecated names and functions).

Releases: [[versions/v13/API/MPI_TYPE_STRUCT|MPI-1.3]] · [[versions/v21/API/MPI_TYPE_STRUCT|MPI-2.1]] † · [[versions/v22/API/MPI_TYPE_STRUCT|MPI-2.2]] † · ~~MPI-3.0~~

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Type_struct(int count, int *array_of_blocklengths, MPI_Aint *array_of_displacements, MPI_Datatype *array_of_types, MPI_Datatype *newtype)
```

## mpif.h

**MPI-1.3–MPI-2.2**
```fortran
MPI_TYPE_STRUCT(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, ARRAY_OF_TYPES, NEWTYPE, IERROR)
    INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_DISPLACEMENTS(*), ARRAY_OF_TYPES(*), NEWTYPE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-1.3:** number of blocks (integer) -- also number of entries in arrays `array_of_types`, `array_of_displacements` and `array_of_blocklengths`<br>**MPI-2.1:** number of blocks (integer) (nonnegative integer) -- also number of entries in arrays `array_of_types`, `array_of_displacements` and `array_of_blocklengths`<br>**MPI-2.2:** number of blocks (integer) (non-negative integer) -- also number of entries in arrays `array_of_types`, `array_of_displacements` and `array_of_blocklengths` |
| `array_of_blocklength` | IN | **MPI-1.3:** number of elements in each block (array of integer)<br>**MPI-2.1:** number of elements in each block (array of nonnegative integer)<br>**MPI-2.2:** number of elements in each block (array of non-negative integer) |
| `array_of_displacements` | IN | **MPI-1.3–MPI-2.2:** byte displacement of each block (array of integer) |
| `array_of_types` | IN | **MPI-1.3–MPI-2.2:** type of elements in each block (array of handles to datatype objects) |
| `newtype` | OUT | **MPI-1.3–MPI-2.2:** new datatype (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_TYPE_STRUCT|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_STRUCT|API note]] · chapter [[versions/v21/sections/deprecated|deprecated]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_STRUCT|API note]] · chapter [[versions/v22/sections/deprecated|deprecated]]
