---
title: MPI_CART_GET
c_name: MPI_Cart_get
chapter: topol
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_CART_GET, MPI_Cart_get]
tags: [mpi/routine, mpi/topol]
---

# MPI_CART_GET

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_CART_GET|MPI-1.3]] · [[versions/v21/API/MPI_CART_GET|MPI-2.1]] Δ · [[versions/v22/API/MPI_CART_GET|MPI-2.2]] Δ · [[versions/v30/API/MPI_CART_GET|MPI-3.0]] Δ · [[versions/v31/API/MPI_CART_GET|MPI-3.1]] Δ · [[versions/v40/API/MPI_CART_GET|MPI-4.0]] Δ · [[versions/v41/API/MPI_CART_GET|MPI-4.1]] Δ · [[versions/v50/API/MPI_CART_GET|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Cart_get(MPI_Comm comm, int maxdims, int *dims, int *periods, int *coords)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Cart_get(MPI_Comm comm, int maxdims, int dims[], int periods[], int coords[])
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Cartcomm::Get_topo(int maxdims, int dims[], bool periods[], int coords[]) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Cart_get(comm, maxdims, dims, periods, coords, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: maxdims
    INTEGER, INTENT(OUT) :: dims(maxdims), coords(maxdims)
    LOGICAL, INTENT(OUT) :: periods(maxdims)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Cart_get(comm, maxdims, dims, periods, coords, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: maxdims
    INTEGER, INTENT(OUT) :: dims(maxdims), coords(maxdims)
    LOGICAL, INTENT(OUT) :: periods(maxdims)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_CART_GET(COMM, MAXDIMS, DIMS, PERIODS, COORDS, IERROR)
    INTEGER COMM, MAXDIMS, DIMS(*), COORDS(*), IERROR
    LOGICAL PERIODS(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3:** communicator with cartesian structure (handle)<br>**MPI-2.1–MPI-4.0:** communicator with Cartesian structure (handle)<br>**MPI-4.1–MPI-5.0:** communicator with associated Cartesian topology (handle) |
| `maxdims` | IN | **MPI-1.3–MPI-3.0:** length of vectors `dims, periods`, and `coords` in the calling program (integer)<br>**MPI-3.1–MPI-5.0:** length of vectors `dims`, `periods`, and `coords` in the calling program (integer) |
| `dims` | OUT | **MPI-1.3:** number of processes for each cartesian dimension (array of integer)<br>**MPI-2.1–MPI-3.1:** number of processes for each Cartesian dimension (array of integer)<br>**MPI-4.0:** number of processes for each Cartesian dimension (array of integers)<br>**MPI-4.1–MPI-5.0:** number of MPI processes for each Cartesian dimension (array of integers) |
| `periods` | OUT | **MPI-1.3:** periodicity (true/false) for each cartesian dimension (array of logical)<br>**MPI-2.1:** periodicity (true/false) for each Cartesian dimension (array of logical)<br>**MPI-2.2–MPI-3.1:** periodicity (`true`/`false`) for each Cartesian dimension (array of logical)<br>**MPI-4.0–MPI-5.0:** periodicity (`true`/`false`) for each Cartesian dimension (array of logicals) |
| `coords` | OUT | **MPI-1.3:** coordinates of calling process in cartesian structure (array of integer)<br>**MPI-2.1–MPI-3.1:** coordinates of calling process in Cartesian structure (array of integer)<br>**MPI-4.0:** coordinates of calling process in Cartesian structure (array of integers)<br>**MPI-4.1–MPI-5.0:** coordinates of calling MPI process in Cartesian structure (array of integers) |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_CART_GET|API note]] · chapter [[versions/v13/sections/topol|topol]]
- MPI-2.1: [[versions/v21/API/MPI_CART_GET|API note]] · chapter [[versions/v21/sections/topol|topol]]
- MPI-2.2: [[versions/v22/API/MPI_CART_GET|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_CART_GET|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_CART_GET|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_CART_GET|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_CART_GET|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_CART_GET|API note]] · chapter [[versions/v50/sections/topol|topol]]
