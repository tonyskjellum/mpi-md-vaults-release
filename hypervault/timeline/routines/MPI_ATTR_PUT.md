---
title: MPI_ATTR_PUT
c_name: MPI_Attr_put
chapter: deprecated
introduced: "MPI-1.3"
deprecated: "MPI-2.1"
removed: null
continued_as: "MPI_COMM_SET_ATTR"
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ATTR_PUT, MPI_Attr_put]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_ATTR_PUT

**Introduced** in MPI-1.3 · **deprecated** in MPI-2.1 · **continued as** [[timeline/routines/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] (MPI-2.0 deprecated names and functions).

Releases: [[versions/v13/API/MPI_ATTR_PUT|MPI-1.3]] · [[versions/v21/API/MPI_ATTR_PUT|MPI-2.1]] † · [[versions/v22/API/MPI_ATTR_PUT|MPI-2.2]] † · [[versions/v30/API/MPI_ATTR_PUT|MPI-3.0]] † · [[versions/v31/API/MPI_ATTR_PUT|MPI-3.1]] † · [[versions/v40/API/MPI_ATTR_PUT|MPI-4.0]] † · [[versions/v41/API/MPI_ATTR_PUT|MPI-4.1]] † · [[versions/v50/API/MPI_ATTR_PUT|MPI-5.0]] †

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-3.1**
```c
int MPI_Attr_put(MPI_Comm comm, int keyval, void* attribute_val)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Attr_put(MPI_Comm comm, int keyval, void *attribute_val)
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_ATTR_PUT(COMM, KEYVAL, ATTRIBUTE_VAL, IERROR)
    INTEGER COMM, KEYVAL, ATTRIBUTE_VAL, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN/INOUT | **MPI-1.3:** communicator to which attribute will be attached (handle)<br>**MPI-2.1–MPI-5.0:** communicator to which attribute will be attached (handle) |
| `keyval` | IN | **MPI-1.3–MPI-5.0:** key value, as returned by `MPI_KEYVAL_CREATE` (integer) |
| `attribute_val` | IN | **MPI-1.3–MPI-5.0:** attribute value |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_ATTR_PUT|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_ATTR_PUT|API note]] · chapter [[versions/v21/sections/deprecated|deprecated]]
- MPI-2.2: [[versions/v22/API/MPI_ATTR_PUT|API note]] · chapter [[versions/v22/sections/deprecated|deprecated]]
- MPI-3.0: [[versions/v30/API/MPI_ATTR_PUT|API note]] · chapter [[versions/v30/sections/deprecated|deprecated]]
- MPI-3.1: [[versions/v31/API/MPI_ATTR_PUT|API note]] · chapter [[versions/v31/sections/deprecated|deprecated]]
- MPI-4.0: [[versions/v40/API/MPI_ATTR_PUT|API note]] · chapter [[versions/v40/sections/deprecated|deprecated]]
- MPI-4.1: [[versions/v41/API/MPI_ATTR_PUT|API note]] · chapter [[versions/v41/sections/deprecated|deprecated]]
- MPI-5.0: [[versions/v50/API/MPI_ATTR_PUT|API note]] · chapter [[versions/v50/sections/deprecated|deprecated]]
