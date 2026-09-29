---
title: MPI_DIMS_CREATE
c_name: MPI_Dims_create
chapter: topol
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_DIMS_CREATE, MPI_Dims_create]
tags: [mpi/routine, mpi/topol]
---

# MPI_DIMS_CREATE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_DIMS_CREATE|MPI-1.3]] · [[versions/v21/API/MPI_DIMS_CREATE|MPI-2.1]] Δ · [[versions/v22/API/MPI_DIMS_CREATE|MPI-2.2]] · [[versions/v30/API/MPI_DIMS_CREATE|MPI-3.0]] Δ · [[versions/v31/API/MPI_DIMS_CREATE|MPI-3.1]] Δ · [[versions/v40/API/MPI_DIMS_CREATE|MPI-4.0]] · [[versions/v41/API/MPI_DIMS_CREATE|MPI-4.1]] · [[versions/v50/API/MPI_DIMS_CREATE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Dims_create(int nnodes, int ndims, int *dims)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Dims_create(int nnodes, int ndims, int dims[])
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Compute_dims(int nnodes, int ndims, int dims[])
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Dims_create(nnodes, ndims, dims, ierror) BIND(C)
    INTEGER, INTENT(IN) :: nnodes, ndims
    INTEGER, INTENT(INOUT) :: dims(ndims)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Dims_create(nnodes, ndims, dims, ierror)
    INTEGER, INTENT(IN) :: nnodes, ndims
    INTEGER, INTENT(INOUT) :: dims(ndims)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_DIMS_CREATE(NNODES, NDIMS, DIMS, IERROR)
    INTEGER NNODES, NDIMS, DIMS(*), IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `nnodes` | IN | **MPI-1.3–MPI-5.0:** number of nodes in a grid (integer) |
| `ndims` | IN | **MPI-1.3:** number of cartesian dimensions (integer)<br>**MPI-2.1–MPI-5.0:** number of Cartesian dimensions (integer) |
| `dims` | INOUT | **MPI-1.3–MPI-5.0:** integer array of size `ndims` specifying the number of nodes in each dimension |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_DIMS_CREATE|API note]] · chapter [[versions/v13/sections/topol|topol]]
- MPI-2.1: [[versions/v21/API/MPI_DIMS_CREATE|API note]] · chapter [[versions/v21/sections/topol|topol]]
- MPI-2.2: [[versions/v22/API/MPI_DIMS_CREATE|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_DIMS_CREATE|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_DIMS_CREATE|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_DIMS_CREATE|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_DIMS_CREATE|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_DIMS_CREATE|API note]] · chapter [[versions/v50/sections/topol|topol]]
