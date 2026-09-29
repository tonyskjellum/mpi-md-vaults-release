---
title: MPI_ATTR_GET
c_name: MPI_Attr_get
chapter: deprecated
introduced: "MPI-1.3"
deprecated: "MPI-2.1"
removed: null
continued_as: "MPI_COMM_GET_ATTR"
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_ATTR_GET, MPI_Attr_get]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_ATTR_GET

**Introduced** in MPI-1.3 · **deprecated** in MPI-2.1 · **continued as** [[timeline/routines/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] (MPI-2.0 deprecated names and functions).

Releases: [[versions/v13/API/MPI_ATTR_GET|MPI-1.3]] · [[versions/v21/API/MPI_ATTR_GET|MPI-2.1]] † · [[versions/v22/API/MPI_ATTR_GET|MPI-2.2]] † · [[versions/v30/API/MPI_ATTR_GET|MPI-3.0]] † · [[versions/v31/API/MPI_ATTR_GET|MPI-3.1]] † · [[versions/v40/API/MPI_ATTR_GET|MPI-4.0]] † · [[versions/v41/API/MPI_ATTR_GET|MPI-4.1]] † · [[versions/v50/API/MPI_ATTR_GET|MPI-5.0]] †

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Attr_get(MPI_Comm comm, int keyval, void *attribute_val, int *flag)
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_ATTR_GET(COMM, KEYVAL, ATTRIBUTE_VAL, FLAG, IERROR)
    INTEGER COMM, KEYVAL, ATTRIBUTE_VAL, IERROR
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator to which attribute is attached (handle) |
| `keyval` | IN | **MPI-1.3–MPI-5.0:** key value (integer) |
| `attribute_val` | OUT | **MPI-1.3–MPI-3.0:** attribute value, unless `flag` = false<br>**MPI-3.1–MPI-5.0:** attribute value, unless `flag` `= false` |
| `flag` | OUT | **MPI-1.3–MPI-5.0:** `true` if an attribute value was extracted; `false` if no attribute is associated with the key |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_ATTR_GET|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_ATTR_GET|API note]] · chapter [[versions/v21/sections/deprecated|deprecated]]
- MPI-2.2: [[versions/v22/API/MPI_ATTR_GET|API note]] · chapter [[versions/v22/sections/deprecated|deprecated]]
- MPI-3.0: [[versions/v30/API/MPI_ATTR_GET|API note]] · chapter [[versions/v30/sections/deprecated|deprecated]]
- MPI-3.1: [[versions/v31/API/MPI_ATTR_GET|API note]] · chapter [[versions/v31/sections/deprecated|deprecated]]
- MPI-4.0: [[versions/v40/API/MPI_ATTR_GET|API note]] · chapter [[versions/v40/sections/deprecated|deprecated]]
- MPI-4.1: [[versions/v41/API/MPI_ATTR_GET|API note]] · chapter [[versions/v41/sections/deprecated|deprecated]]
- MPI-5.0: [[versions/v50/API/MPI_ATTR_GET|API note]] · chapter [[versions/v50/sections/deprecated|deprecated]]
