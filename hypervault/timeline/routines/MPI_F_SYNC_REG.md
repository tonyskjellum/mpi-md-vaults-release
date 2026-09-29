---
title: MPI_F_SYNC_REG
c_name: MPI_F_sync_reg
chapter: binding
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_F_SYNC_REG, MPI_F_sync_reg]
tags: [mpi/routine, mpi/binding]
---

# MPI_F_SYNC_REG

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_F_SYNC_REG|MPI-3.0]] · [[versions/v31/API/MPI_F_SYNC_REG|MPI-3.1]] Δ · [[versions/v40/API/MPI_F_SYNC_REG|MPI-4.0]] Δ · [[versions/v41/API/MPI_F_SYNC_REG|MPI-4.1]] · [[versions/v50/API/MPI_F_SYNC_REG|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## Fortran 2008

**MPI-3.0**
```fortran
MPI_F_sync_reg(buf) BIND(C)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_F_sync_reg(buf)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
```

## mpif.h

**MPI-3.0–MPI-3.1**
```fortran
MPI_F_SYNC_REG(buf)
    <type> buf(*)
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_F_SYNC_REG(BUF)
    <type> BUF(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `buf` | INOUT | **MPI-3.0–MPI-5.0:** initial address of buffer (choice) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_F_SYNC_REG|API note]] · chapter [[versions/v30/sections/binding|binding]]
- MPI-3.1: [[versions/v31/API/MPI_F_SYNC_REG|API note]] · chapter [[versions/v31/sections/binding|binding]]
- MPI-4.0: [[versions/v40/API/MPI_F_SYNC_REG|API note]] · chapter [[versions/v40/sections/binding|binding]]
- MPI-4.1: [[versions/v41/API/MPI_F_SYNC_REG|API note]] · chapter [[versions/v41/sections/binding|binding]]
- MPI-5.0: [[versions/v50/API/MPI_F_SYNC_REG|API note]] · chapter [[versions/v50/sections/binding|binding]]
