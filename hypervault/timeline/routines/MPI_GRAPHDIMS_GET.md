---
title: MPI_GRAPHDIMS_GET
c_name: MPI_Graphdims_get
chapter: topol
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GRAPHDIMS_GET, MPI_Graphdims_get]
tags: [mpi/routine, mpi/topol]
---

# MPI_GRAPHDIMS_GET

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_GRAPHDIMS_GET|MPI-1.3]] · [[versions/v21/API/MPI_GRAPHDIMS_GET|MPI-2.1]] Δ · [[versions/v22/API/MPI_GRAPHDIMS_GET|MPI-2.2]] · [[versions/v30/API/MPI_GRAPHDIMS_GET|MPI-3.0]] Δ · [[versions/v31/API/MPI_GRAPHDIMS_GET|MPI-3.1]] Δ · [[versions/v40/API/MPI_GRAPHDIMS_GET|MPI-4.0]] Δ · [[versions/v41/API/MPI_GRAPHDIMS_GET|MPI-4.1]] Δ · [[versions/v50/API/MPI_GRAPHDIMS_GET|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Graphdims_get(MPI_Comm comm, int *nnodes, int *nedges)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Graphcomm::Get_dims(int nnodes[], int nedges[]) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Graphdims_get(comm, nnodes, nedges, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: nnodes, nedges
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Graphdims_get(comm, nnodes, nedges, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: nnodes, nedges
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_GRAPHDIMS_GET(COMM, NNODES, NEDGES, IERROR)
    INTEGER COMM, NNODES, NEDGES, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3–MPI-4.0:** communicator for group with graph structure (handle)<br>**MPI-4.1–MPI-5.0:** communicator with associated graph topology (handle) |
| `nnodes` | OUT | **MPI-1.3–MPI-3.1:** number of nodes in graph (integer) (same as number of processes in the group)<br>**MPI-4.0:** number of nodes in graph (same as number of processes in the group) (integer)<br>**MPI-4.1–MPI-5.0:** number of nodes in graph (same as number of MPI processes in the group of `comm`) (integer) |
| `nedges` | OUT | **MPI-1.3–MPI-5.0:** number of edges in graph (integer) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_GRAPHDIMS_GET|API note]] · chapter [[versions/v13/sections/topol|topol]]
- MPI-2.1: [[versions/v21/API/MPI_GRAPHDIMS_GET|API note]] · chapter [[versions/v21/sections/topol|topol]]
- MPI-2.2: [[versions/v22/API/MPI_GRAPHDIMS_GET|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_GRAPHDIMS_GET|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_GRAPHDIMS_GET|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_GRAPHDIMS_GET|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_GRAPHDIMS_GET|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_GRAPHDIMS_GET|API note]] · chapter [[versions/v50/sections/topol|topol]]
