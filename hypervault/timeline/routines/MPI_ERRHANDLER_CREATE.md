---
title: MPI_ERRHANDLER_CREATE
c_name: MPI_Errhandler_create
chapter: deprecated
introduced: "MPI-1.3"
deprecated: "MPI-2.1"
removed: "MPI-3.0"
continued_as: "MPI_COMM_CREATE_ERRHANDLER"
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2"]
aliases: [MPI_ERRHANDLER_CREATE, MPI_Errhandler_create]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_ERRHANDLER_CREATE

**Introduced** in MPI-1.3 · **deprecated** in MPI-2.1 · **removed** in MPI-3.0 · **continued as** [[timeline/routines/MPI_COMM_CREATE_ERRHANDLER|MPI_COMM_CREATE_ERRHANDLER]] (MPI-2.0 deprecated names and functions).

Releases: [[versions/v13/API/MPI_ERRHANDLER_CREATE|MPI-1.3]] · [[versions/v21/API/MPI_ERRHANDLER_CREATE|MPI-2.1]] † · [[versions/v22/API/MPI_ERRHANDLER_CREATE|MPI-2.2]] † · ~~MPI-3.0~~

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Errhandler_create(MPI_Handler_function *function, MPI_Errhandler *errhandler)
```

## mpif.h

**MPI-1.3–MPI-2.2**
```fortran
MPI_ERRHANDLER_CREATE(FUNCTION, ERRHANDLER, IERROR)
    EXTERNAL FUNCTION
    INTEGER ERRHANDLER, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `function` | IN | **MPI-1.3–MPI-2.2:** user defined error handling procedure |
| `errhandler` | OUT | **MPI-1.3–MPI-2.2:** MPI error handler (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_ERRHANDLER_CREATE|API note]] · chapter [[versions/v13/sections/inquiry|inquiry]]
- MPI-2.1: [[versions/v21/API/MPI_ERRHANDLER_CREATE|API note]] · chapter [[versions/v21/sections/deprecated|deprecated]]
- MPI-2.2: [[versions/v22/API/MPI_ERRHANDLER_CREATE|API note]] · chapter [[versions/v22/sections/deprecated|deprecated]]
