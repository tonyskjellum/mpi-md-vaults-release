---
title: MPI_CART_SUB
c_name: MPI_Cart_sub
chapter: topol
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_CART_SUB, MPI_Cart_sub]
tags: [mpi/routine, mpi/topol]
---

# MPI_CART_SUB

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_CART_SUB|MPI-1.3]] · [[versions/v21/API/MPI_CART_SUB|MPI-2.1]] Δ · [[versions/v22/API/MPI_CART_SUB|MPI-2.2]] · [[versions/v30/API/MPI_CART_SUB|MPI-3.0]] Δ · [[versions/v31/API/MPI_CART_SUB|MPI-3.1]] Δ · [[versions/v40/API/MPI_CART_SUB|MPI-4.0]] Δ · [[versions/v41/API/MPI_CART_SUB|MPI-4.1]] Δ · [[versions/v50/API/MPI_CART_SUB|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Cart_sub(MPI_Comm comm, int *remain_dims, MPI_Comm *newcomm)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Cart_sub(MPI_Comm comm, const int remain_dims[], MPI_Comm *newcomm)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
MPI::Cartcomm MPI::Cartcomm::Sub(const bool remain_dims[]) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Cart_sub(comm, remain_dims, newcomm, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    LOGICAL, INTENT(IN) :: remain_dims(*)
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Cart_sub(comm, remain_dims, newcomm, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    LOGICAL, INTENT(IN) :: remain_dims(*)
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_CART_SUB(COMM, REMAIN_DIMS, NEWCOMM, IERROR)
    INTEGER COMM, NEWCOMM, IERROR
    LOGICAL REMAIN_DIMS(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3:** communicator with cartesian structure (handle)<br>**MPI-2.1–MPI-4.0:** communicator with Cartesian structure (handle)<br>**MPI-4.1–MPI-5.0:** communicator with associated Cartesian topology (handle) |
| `remain_dims` | IN | **MPI-1.3:** the `i`th entry of `remain_dims` specifies whether the `i`th dimension is kept in the subgrid (`true`) or is dropped (`false`) (logical vector)<br>**MPI-2.1–MPI-3.1:** the `i`-th entry of `remain_dims` specifies whether the `i`-th dimension is kept in the subgrid (`true`) or is dropped (`false`) (logical vector)<br>**MPI-4.0–MPI-5.0:** the `i`-th entry of `remain_dims` specifies whether the `i`-th dimension is kept in the subgrid (`true`) or is dropped (`false`) (array of logicals) |
| `newcomm` | OUT | **MPI-1.3–MPI-4.0:** communicator containing the subgrid that includes the calling process (handle)<br>**MPI-4.1–MPI-5.0:** new communicator with associated Cartesian topology containing the subgrid that includes the calling MPI process (handle) |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_CART_SUB|API note]] · chapter [[versions/v13/sections/topol|topol]]
- MPI-2.1: [[versions/v21/API/MPI_CART_SUB|API note]] · chapter [[versions/v21/sections/topol|topol]]
- MPI-2.2: [[versions/v22/API/MPI_CART_SUB|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_CART_SUB|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_CART_SUB|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_CART_SUB|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_CART_SUB|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_CART_SUB|API note]] · chapter [[versions/v50/sections/topol|topol]]
