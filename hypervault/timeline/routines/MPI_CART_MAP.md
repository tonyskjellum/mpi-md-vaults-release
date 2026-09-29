---
title: MPI_CART_MAP
c_name: MPI_Cart_map
chapter: topol
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_CART_MAP, MPI_Cart_map]
tags: [mpi/routine, mpi/topol]
---

# MPI_CART_MAP

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_CART_MAP|MPI-1.3]] · [[versions/v21/API/MPI_CART_MAP|MPI-2.1]] Δ · [[versions/v22/API/MPI_CART_MAP|MPI-2.2]] Δ · [[versions/v30/API/MPI_CART_MAP|MPI-3.0]] Δ · [[versions/v31/API/MPI_CART_MAP|MPI-3.1]] Δ · [[versions/v40/API/MPI_CART_MAP|MPI-4.0]] · [[versions/v41/API/MPI_CART_MAP|MPI-4.1]] Δ · [[versions/v50/API/MPI_CART_MAP|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Cart_map(MPI_Comm comm, int ndims, int *dims, int *periods, int *newrank)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Cart_map(MPI_Comm comm, int ndims, const int dims[], const int periods[], int *newrank)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI::Cartcomm::Map(int ndims, const int dims[], const bool periods[]) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Cart_map(comm, ndims, dims, periods, newrank, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: ndims, dims(ndims)
    LOGICAL, INTENT(IN) :: periods(ndims)
    INTEGER, INTENT(OUT) :: newrank
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Cart_map(comm, ndims, dims, periods, newrank, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: ndims, dims(ndims)
    LOGICAL, INTENT(IN) :: periods(ndims)
    INTEGER, INTENT(OUT) :: newrank
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_CART_MAP(COMM, NDIMS, DIMS, PERIODS, NEWRANK, IERROR)
    INTEGER COMM, NDIMS, DIMS(*), NEWRANK, IERROR
    LOGICAL PERIODS(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3–MPI-5.0:** input communicator (handle) |
| `ndims` | IN | **MPI-1.3:** number of dimensions of cartesian structure (integer)<br>**MPI-2.1–MPI-5.0:** number of dimensions of Cartesian structure (integer) |
| `dims` | IN | **MPI-1.3–MPI-5.0:** integer array of size `ndims` specifying the number of processes in each coordinate direction |
| `periods` | IN | **MPI-1.3–MPI-5.0:** logical array of size `ndims` specifying the periodicity specification in each coordinate direction |
| `newrank` | OUT | **MPI-1.3–MPI-2.1:** reordered rank of the calling process; MPI_UNDEFINED if calling process does not belong to grid (integer)<br>**MPI-2.2–MPI-4.0:** reordered rank of the calling process; `MPI_UNDEFINED` if calling process does not belong to grid (integer)<br>**MPI-4.1–MPI-5.0:** reordered rank of the calling MPI process; `MPI_UNDEFINED` if calling MPI process does not belong to grid (integer) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_CART_MAP|API note]] · chapter [[versions/v13/sections/topol|topol]]
- MPI-2.1: [[versions/v21/API/MPI_CART_MAP|API note]] · chapter [[versions/v21/sections/topol|topol]]
- MPI-2.2: [[versions/v22/API/MPI_CART_MAP|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_CART_MAP|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_CART_MAP|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_CART_MAP|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_CART_MAP|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_CART_MAP|API note]] · chapter [[versions/v50/sections/topol|topol]]
