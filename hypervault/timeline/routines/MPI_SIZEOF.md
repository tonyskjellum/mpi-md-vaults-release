---
title: MPI_SIZEOF
c_name: MPI_Sizeof
chapter: deprecated
introduced: "MPI-2.0"
deprecated: "MPI-4.0"
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SIZEOF, MPI_Sizeof]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_SIZEOF

**Introduced** in MPI-2.0 · **deprecated** in MPI-4.0.

Releases: [[versions/v20/API/MPI_SIZEOF|MPI-2.0]] · [[versions/v21/API/MPI_SIZEOF|MPI-2.1]] · [[versions/v22/API/MPI_SIZEOF|MPI-2.2]] · [[versions/v30/API/MPI_SIZEOF|MPI-3.0]] Δ · [[versions/v31/API/MPI_SIZEOF|MPI-3.1]] Δ · [[versions/v40/API/MPI_SIZEOF|MPI-4.0]] † · [[versions/v41/API/MPI_SIZEOF|MPI-4.1]] † · [[versions/v50/API/MPI_SIZEOF|MPI-5.0]] †

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Sizeof(x, size, ierror) BIND(C)
    TYPE(*), DIMENSION(..) :: x
    INTEGER, INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Sizeof(x, size, ierror)
    TYPE(*), DIMENSION(..) :: x
    INTEGER, INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_SIZEOF(X, SIZE, IERROR)
    <type> X
    INTEGER SIZE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `x` | IN | **MPI-2.0–MPI-5.0:** a Fortran variable of numeric intrinsic type (choice) |
| `size` | OUT | **MPI-2.0–MPI-5.0:** size of machine representation of that type (integer) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_SIZEOF|API note]] · chapter [[versions/v20/sections/binding|binding]]
- MPI-2.1: [[versions/v21/API/MPI_SIZEOF|API note]] · chapter [[versions/v21/sections/binding|binding]]
- MPI-2.2: [[versions/v22/API/MPI_SIZEOF|API note]] · chapter [[versions/v22/sections/binding|binding]]
- MPI-3.0: [[versions/v30/API/MPI_SIZEOF|API note]] · chapter [[versions/v30/sections/binding|binding]]
- MPI-3.1: [[versions/v31/API/MPI_SIZEOF|API note]] · chapter [[versions/v31/sections/binding|binding]]
- MPI-4.0: [[versions/v40/API/MPI_SIZEOF|API note]] · chapter [[versions/v40/sections/deprecated|deprecated]]
- MPI-4.1: [[versions/v41/API/MPI_SIZEOF|API note]] · chapter [[versions/v41/sections/deprecated|deprecated]]
- MPI-5.0: [[versions/v50/API/MPI_SIZEOF|API note]] · chapter [[versions/v50/sections/deprecated|deprecated]]
