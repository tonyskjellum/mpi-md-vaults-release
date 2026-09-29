---
title: MPI_ERRHANDLER_SET
c_name: MPI_Errhandler_set
chapter: deprecated
introduced: "MPI-1.3"
deprecated: "MPI-2.1"
removed: "MPI-3.0"
continued_as: "MPI_COMM_SET_ERRHANDLER"
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2"]
aliases: [MPI_ERRHANDLER_SET, MPI_Errhandler_set]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_ERRHANDLER_SET

**Introduced** in MPI-1.3 · **deprecated** in MPI-2.1 · **removed** in MPI-3.0 · **continued as** [[timeline/routines/MPI_COMM_SET_ERRHANDLER|MPI_COMM_SET_ERRHANDLER]] (MPI-2.0 deprecated names and functions).

Releases: [[versions/v13/API/MPI_ERRHANDLER_SET|MPI-1.3]] · [[versions/v21/API/MPI_ERRHANDLER_SET|MPI-2.1]] † · [[versions/v22/API/MPI_ERRHANDLER_SET|MPI-2.2]] † · ~~MPI-3.0~~

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Errhandler_set(MPI_Comm comm, MPI_Errhandler errhandler)
```

## mpif.h

**MPI-1.3–MPI-2.2**
```fortran
MPI_ERRHANDLER_SET(COMM, ERRHANDLER, IERROR)
    INTEGER COMM, ERRHANDLER, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN/INOUT | **MPI-1.3:** communicator to set the error handler for (handle)<br>**MPI-2.1–MPI-2.2:** communicator to set the error handler for (handle) |
| `errhandler` | IN | **MPI-1.3–MPI-2.2:** new MPI error handler for communicator (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_ERRHANDLER_SET|API note]] · chapter [[versions/v13/sections/inquiry|inquiry]]
- MPI-2.1: [[versions/v21/API/MPI_ERRHANDLER_SET|API note]] · chapter [[versions/v21/sections/deprecated|deprecated]]
- MPI-2.2: [[versions/v22/API/MPI_ERRHANDLER_SET|API note]] · chapter [[versions/v22/sections/deprecated|deprecated]]
