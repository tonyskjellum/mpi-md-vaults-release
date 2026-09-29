---
title: MPI_CART_SHIFT
c_name: MPI_Cart_shift
chapter: topol
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_CART_SHIFT, MPI_Cart_shift]
tags: [mpi/routine, mpi/topol]
---

# MPI_CART_SHIFT

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_CART_SHIFT|MPI-1.3]] · [[versions/v21/API/MPI_CART_SHIFT|MPI-2.1]] Δ · [[versions/v22/API/MPI_CART_SHIFT|MPI-2.2]] · [[versions/v30/API/MPI_CART_SHIFT|MPI-3.0]] Δ · [[versions/v31/API/MPI_CART_SHIFT|MPI-3.1]] Δ · [[versions/v40/API/MPI_CART_SHIFT|MPI-4.0]] · [[versions/v41/API/MPI_CART_SHIFT|MPI-4.1]] Δ · [[versions/v50/API/MPI_CART_SHIFT|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Cart_shift(MPI_Comm comm, int direction, int disp, int *rank_source, int *rank_dest)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Cartcomm::Shift(int direction, int disp, int& rank_source, int& rank_dest) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Cart_shift(comm, direction, disp, rank_source, rank_dest, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: direction, disp
    INTEGER, INTENT(OUT) :: rank_source, rank_dest
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Cart_shift(comm, direction, disp, rank_source, rank_dest, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: direction, disp
    INTEGER, INTENT(OUT) :: rank_source, rank_dest
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_CART_SHIFT(COMM, DIRECTION, DISP, RANK_SOURCE, RANK_DEST, IERROR)
    INTEGER COMM, DIRECTION, DISP, RANK_SOURCE, RANK_DEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3:** communicator with cartesian structure (handle)<br>**MPI-2.1–MPI-4.0:** communicator with Cartesian structure (handle)<br>**MPI-4.1–MPI-5.0:** communicator with associated Cartesian topology (handle) |
| `direction` | IN | **MPI-1.3–MPI-5.0:** coordinate dimension of shift (integer) |
| `disp` | IN | **MPI-1.3–MPI-5.0:** displacement ($> 0$: upwards shift, $< 0$: downwards shift) (integer) |
| `rank_source` | OUT | **MPI-1.3–MPI-4.0:** rank of source process (integer)<br>**MPI-4.1–MPI-5.0:** rank of source MPI process (integer) |
| `rank_dest` | OUT | **MPI-1.3–MPI-4.0:** rank of destination process (integer)<br>**MPI-4.1–MPI-5.0:** rank of destination MPI process (integer) |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_CART_SHIFT|API note]] · chapter [[versions/v13/sections/topol|topol]]
- MPI-2.1: [[versions/v21/API/MPI_CART_SHIFT|API note]] · chapter [[versions/v21/sections/topol|topol]]
- MPI-2.2: [[versions/v22/API/MPI_CART_SHIFT|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_CART_SHIFT|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_CART_SHIFT|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_CART_SHIFT|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_CART_SHIFT|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_CART_SHIFT|API note]] · chapter [[versions/v50/sections/topol|topol]]
