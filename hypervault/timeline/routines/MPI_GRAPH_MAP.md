---
title: MPI_GRAPH_MAP
c_name: MPI_Graph_map
chapter: topol
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GRAPH_MAP, MPI_Graph_map]
tags: [mpi/routine, mpi/topol]
---

# MPI_GRAPH_MAP

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_GRAPH_MAP|MPI-1.3]] · [[versions/v21/API/MPI_GRAPH_MAP|MPI-2.1]] Δ · [[versions/v22/API/MPI_GRAPH_MAP|MPI-2.2]] Δ · [[versions/v30/API/MPI_GRAPH_MAP|MPI-3.0]] Δ · [[versions/v31/API/MPI_GRAPH_MAP|MPI-3.1]] Δ · [[versions/v40/API/MPI_GRAPH_MAP|MPI-4.0]] · [[versions/v41/API/MPI_GRAPH_MAP|MPI-4.1]] Δ · [[versions/v50/API/MPI_GRAPH_MAP|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Graph_map(MPI_Comm comm, int nnodes, int *index, int *edges, int *newrank)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Graph_map(MPI_Comm comm, int nnodes, const int index[], const int edges[], int *newrank)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI::Graphcomm::Map(int nnodes, const int index[], const int edges[]) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Graph_map(comm, nnodes, index, edges, newrank, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: nnodes, index(nnodes), edges(*)
    INTEGER, INTENT(OUT) :: newrank
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Graph_map(comm, nnodes, index, edges, newrank, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: nnodes, index(nnodes), edges(*)
    INTEGER, INTENT(OUT) :: newrank
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_GRAPH_MAP(COMM, NNODES, INDEX, EDGES, NEWRANK, IERROR)
    INTEGER COMM, NNODES, INDEX(*), EDGES(*), NEWRANK, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3–MPI-5.0:** input communicator (handle) |
| `nnodes` | IN | **MPI-1.3–MPI-5.0:** number of graph nodes (integer) |
| `index` | IN | **MPI-1.3–MPI-4.0:** integer array specifying the graph structure, see `MPI_GRAPH_CREATE`<br>**MPI-4.1–MPI-5.0:** integer array specifying the graph structure (for details see the definition of `MPI_GRAPH_CREATE`) |
| `edges` | IN | **MPI-1.3–MPI-5.0:** integer array specifying the graph structure |
| `newrank` | OUT | **MPI-1.3–MPI-2.1:** reordered rank of the calling process; MPI_UNDEFINED if the calling process does not belong to graph (integer)<br>**MPI-2.2–MPI-4.0:** reordered rank of the calling process; `MPI_UNDEFINED` if the calling process does not belong to graph (integer)<br>**MPI-4.1–MPI-5.0:** reordered rank of the calling MPI process; `MPI_UNDEFINED` if the calling MPI process does not belong to graph (integer) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_GRAPH_MAP|API note]] · chapter [[versions/v13/sections/topol|topol]]
- MPI-2.1: [[versions/v21/API/MPI_GRAPH_MAP|API note]] · chapter [[versions/v21/sections/topol|topol]]
- MPI-2.2: [[versions/v22/API/MPI_GRAPH_MAP|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_GRAPH_MAP|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_GRAPH_MAP|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_GRAPH_MAP|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_GRAPH_MAP|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_GRAPH_MAP|API note]] · chapter [[versions/v50/sections/topol|topol]]
