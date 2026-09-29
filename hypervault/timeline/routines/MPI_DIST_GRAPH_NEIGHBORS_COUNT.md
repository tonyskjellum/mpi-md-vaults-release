---
title: MPI_DIST_GRAPH_NEIGHBORS_COUNT
c_name: MPI_Dist_graph_neighbors_count
chapter: topol
introduced: "MPI-2.2"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_DIST_GRAPH_NEIGHBORS_COUNT, MPI_Dist_graph_neighbors_count]
tags: [mpi/routine, mpi/topol]
---

# MPI_DIST_GRAPH_NEIGHBORS_COUNT

**Introduced** in MPI-2.2.

Releases: [[versions/v22/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI-2.2]] · [[versions/v30/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI-3.0]] Δ · [[versions/v31/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI-3.1]] Δ · [[versions/v40/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI-4.0]] · [[versions/v41/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI-4.1]] Δ · [[versions/v50/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.2–MPI-5.0**
```c
int MPI_Dist_graph_neighbors_count(MPI_Comm comm, int *indegree, int *outdegree, int *weighted)
```

## C++

**MPI-2.2**
```c
void MPI::Distgraphcomm::Get_dist_neighbors_count(int rank, int indegree[], int outdegree[], bool& weighted) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Dist_graph_neighbors_count(comm, indegree, outdegree, weighted, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: indegree, outdegree
    LOGICAL, INTENT(OUT) :: weighted
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Dist_graph_neighbors_count(comm, indegree, outdegree, weighted, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: indegree, outdegree
    LOGICAL, INTENT(OUT) :: weighted
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.2–MPI-5.0**
```fortran
MPI_DIST_GRAPH_NEIGHBORS_COUNT(COMM, INDEGREE, OUTDEGREE, WEIGHTED, IERROR)
    INTEGER COMM, INDEGREE, OUTDEGREE, IERROR
    LOGICAL WEIGHTED
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-2.2–MPI-4.0:** communicator with distributed graph topology (handle)<br>**MPI-4.1–MPI-5.0:** communicator with associated distributed graph topology (handle) |
| `indegree` | OUT | **MPI-2.2–MPI-4.0:** number of edges into this process (non-negative integer)<br>**MPI-4.1:** number of edges into this MPI process (non-negative integer)<br>**MPI-5.0:** number of edges into this MPI process (nonnegative integer) |
| `outdegree` | OUT | **MPI-2.2–MPI-4.0:** number of edges out of this process (non-negative integer)<br>**MPI-4.1:** number of edges out of this MPI process (non-negative integer)<br>**MPI-5.0:** number of edges out of this MPI process (nonnegative integer) |
| `weighted` | OUT | **MPI-2.2–MPI-5.0:** `false` if `MPI_UNWEIGHTED` was supplied during creation, `true` otherwise (logical) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.2: [[versions/v22/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|API note]] · chapter [[versions/v50/sections/topol|topol]]
