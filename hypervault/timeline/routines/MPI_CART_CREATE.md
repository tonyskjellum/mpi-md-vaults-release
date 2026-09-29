---
title: MPI_CART_CREATE
c_name: MPI_Cart_create
chapter: topol
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_CART_CREATE, MPI_Cart_create]
tags: [mpi/routine, mpi/topol]
---

# MPI_CART_CREATE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_CART_CREATE|MPI-1.3]] · [[versions/v21/API/MPI_CART_CREATE|MPI-2.1]] Δ · [[versions/v22/API/MPI_CART_CREATE|MPI-2.2]] Δ · [[versions/v30/API/MPI_CART_CREATE|MPI-3.0]] Δ · [[versions/v31/API/MPI_CART_CREATE|MPI-3.1]] Δ · [[versions/v40/API/MPI_CART_CREATE|MPI-4.0]] · [[versions/v41/API/MPI_CART_CREATE|MPI-4.1]] Δ · [[versions/v50/API/MPI_CART_CREATE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Cart_create(MPI_Comm comm_old, int ndims, int *dims, int *periods, int reorder, MPI_Comm *comm_cart)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Cart_create(MPI_Comm comm_old, int ndims, const int dims[], const int periods[], int reorder, MPI_Comm *comm_cart)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
MPI::Cartcomm MPI::Intracomm::Create_cart(int ndims, const int dims[], const bool periods[], bool reorder) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Cart_create(comm_old, ndims, dims, periods, reorder, comm_cart, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm_old
    INTEGER, INTENT(IN) :: ndims, dims(ndims)
    LOGICAL, INTENT(IN) :: periods(ndims), reorder
    TYPE(MPI_Comm), INTENT(OUT) :: comm_cart
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Cart_create(comm_old, ndims, dims, periods, reorder, comm_cart, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm_old
    INTEGER, INTENT(IN) :: ndims, dims(ndims)
    LOGICAL, INTENT(IN) :: periods(ndims), reorder
    TYPE(MPI_Comm), INTENT(OUT) :: comm_cart
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_CART_CREATE(COMM_OLD, NDIMS, DIMS, PERIODS, REORDER, COMM_CART, IERROR)
    INTEGER COMM_OLD, NDIMS, DIMS(*), COMM_CART, IERROR
    LOGICAL PERIODS(*), REORDER
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm_old` | IN | **MPI-1.3–MPI-5.0:** input communicator (handle) |
| `ndims` | IN | **MPI-1.3:** number of dimensions of cartesian grid (integer)<br>**MPI-2.1–MPI-5.0:** number of dimensions of Cartesian grid (integer) |
| `dims` | IN | **MPI-1.3–MPI-5.0:** integer array of size `ndims` specifying the number of processes in each dimension |
| `periods` | IN | **MPI-1.3–MPI-2.1:** logical array of size `ndims` specifying whether the grid is periodic (true) or not (false) in each dimension<br>**MPI-2.2–MPI-5.0:** logical array of size `ndims` specifying whether the grid is periodic (`true`) or not (`false`) in each dimension |
| `reorder` | IN | **MPI-1.3–MPI-2.1:** ranking may be reordered (true) or not (false) (logical)<br>**MPI-2.2–MPI-4.0:** ranking may be reordered (`true`) or not (`false`) (logical)<br>**MPI-4.1–MPI-5.0:** ranks may be reordered (`true`) or not (`false`) (logical) |
| `comm_cart` | OUT | **MPI-1.3:** communicator with new cartesian topology (handle)<br>**MPI-2.1–MPI-4.0:** communicator with new Cartesian topology (handle)<br>**MPI-4.1–MPI-5.0:** new communicator with associated Cartesian topology (handle) |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_CART_CREATE|API note]] · chapter [[versions/v13/sections/topol|topol]]
- MPI-2.1: [[versions/v21/API/MPI_CART_CREATE|API note]] · chapter [[versions/v21/sections/topol|topol]]
- MPI-2.2: [[versions/v22/API/MPI_CART_CREATE|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_CART_CREATE|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_CART_CREATE|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_CART_CREATE|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_CART_CREATE|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_CART_CREATE|API note]] · chapter [[versions/v50/sections/topol|topol]]
