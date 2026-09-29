---
title: MPI_ERRHANDLER_GET
c_name: MPI_Errhandler_get
chapter: deprecated
introduced: "MPI-1.3"
deprecated: "MPI-2.1"
removed: "MPI-3.0"
continued_as: "MPI_COMM_GET_ERRHANDLER"
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2"]
aliases: [MPI_ERRHANDLER_GET, MPI_Errhandler_get]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_ERRHANDLER_GET

**Introduced** in MPI-1.3 · **deprecated** in MPI-2.1 · **removed** in MPI-3.0 · **continued as** [[timeline/routines/MPI_COMM_GET_ERRHANDLER|MPI_COMM_GET_ERRHANDLER]] (MPI-2.0 deprecated names and functions).

Releases: [[versions/v13/API/MPI_ERRHANDLER_GET|MPI-1.3]] · [[versions/v21/API/MPI_ERRHANDLER_GET|MPI-2.1]] † · [[versions/v22/API/MPI_ERRHANDLER_GET|MPI-2.2]] † · ~~MPI-3.0~~

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Errhandler_get(MPI_Comm comm, MPI_Errhandler *errhandler)
```

## mpif.h

**MPI-1.3–MPI-2.2**
```fortran
MPI_ERRHANDLER_GET(COMM, ERRHANDLER, IERROR)
    INTEGER COMM, ERRHANDLER, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3–MPI-2.2:** communicator to get the error handler from (handle) |
| `errhandler` | OUT | **MPI-1.3–MPI-2.2:** MPI error handler currently associated with communicator (handle) |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_ERRHANDLER_GET|API note]] · chapter [[versions/v13/sections/inquiry|inquiry]]
- MPI-2.1: [[versions/v21/API/MPI_ERRHANDLER_GET|API note]] · chapter [[versions/v21/sections/deprecated|deprecated]]
- MPI-2.2: [[versions/v22/API/MPI_ERRHANDLER_GET|API note]] · chapter [[versions/v22/sections/deprecated|deprecated]]
