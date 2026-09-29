---
title: MPI_KEYVAL_FREE
c_name: MPI_Keyval_free
chapter: deprecated
introduced: "MPI-1.3"
deprecated: "MPI-2.1"
removed: null
continued_as: "MPI_COMM_FREE_KEYVAL"
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_KEYVAL_FREE, MPI_Keyval_free]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_KEYVAL_FREE

**Introduced** in MPI-1.3 · **deprecated** in MPI-2.1 · **continued as** [[timeline/routines/MPI_COMM_FREE_KEYVAL|MPI_COMM_FREE_KEYVAL]] (MPI-2.0 deprecated names and functions).

Releases: [[versions/v13/API/MPI_KEYVAL_FREE|MPI-1.3]] · [[versions/v21/API/MPI_KEYVAL_FREE|MPI-2.1]] † · [[versions/v22/API/MPI_KEYVAL_FREE|MPI-2.2]] † · [[versions/v30/API/MPI_KEYVAL_FREE|MPI-3.0]] † · [[versions/v31/API/MPI_KEYVAL_FREE|MPI-3.1]] † · [[versions/v40/API/MPI_KEYVAL_FREE|MPI-4.0]] † · [[versions/v41/API/MPI_KEYVAL_FREE|MPI-4.1]] † · [[versions/v50/API/MPI_KEYVAL_FREE|MPI-5.0]] †

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Keyval_free(int *keyval)
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_KEYVAL_FREE(KEYVAL, IERROR)
    INTEGER KEYVAL, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `keyval` | INOUT | **MPI-1.3–MPI-5.0:** Frees the integer key value (integer) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_KEYVAL_FREE|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_KEYVAL_FREE|API note]] · chapter [[versions/v21/sections/deprecated|deprecated]]
- MPI-2.2: [[versions/v22/API/MPI_KEYVAL_FREE|API note]] · chapter [[versions/v22/sections/deprecated|deprecated]]
- MPI-3.0: [[versions/v30/API/MPI_KEYVAL_FREE|API note]] · chapter [[versions/v30/sections/deprecated|deprecated]]
- MPI-3.1: [[versions/v31/API/MPI_KEYVAL_FREE|API note]] · chapter [[versions/v31/sections/deprecated|deprecated]]
- MPI-4.0: [[versions/v40/API/MPI_KEYVAL_FREE|API note]] · chapter [[versions/v40/sections/deprecated|deprecated]]
- MPI-4.1: [[versions/v41/API/MPI_KEYVAL_FREE|API note]] · chapter [[versions/v41/sections/deprecated|deprecated]]
- MPI-5.0: [[versions/v50/API/MPI_KEYVAL_FREE|API note]] · chapter [[versions/v50/sections/deprecated|deprecated]]
