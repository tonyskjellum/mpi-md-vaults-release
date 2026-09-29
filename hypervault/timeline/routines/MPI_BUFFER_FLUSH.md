---
title: MPI_BUFFER_FLUSH
c_name: MPI_Buffer_flush
chapter: pt2pt
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_BUFFER_FLUSH, MPI_Buffer_flush]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_BUFFER_FLUSH

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_BUFFER_FLUSH|MPI-4.1]] · [[versions/v50/API/MPI_BUFFER_FLUSH|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1–MPI-5.0**
```c
int MPI_Buffer_flush(void)
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Buffer_flush(ierror)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_BUFFER_FLUSH(IERROR)
    INTEGER IERROR
```

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_BUFFER_FLUSH|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_BUFFER_FLUSH|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]
