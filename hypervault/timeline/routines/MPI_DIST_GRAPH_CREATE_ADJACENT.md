---
title: MPI_DIST_GRAPH_CREATE_ADJACENT
c_name: MPI_Dist_graph_create_adjacent
chapter: topol
introduced: "MPI-2.2"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_DIST_GRAPH_CREATE_ADJACENT, MPI_Dist_graph_create_adjacent]
tags: [mpi/routine, mpi/topol]
---

# MPI_DIST_GRAPH_CREATE_ADJACENT

**Introduced** in MPI-2.2.

Releases: [[versions/v22/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI-2.2]] · [[versions/v30/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI-3.0]] Δ · [[versions/v31/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI-3.1]] Δ · [[versions/v40/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI-4.0]] Δ · [[versions/v41/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI-4.1]] Δ · [[versions/v50/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.2**
```c
int MPI_Dist_graph_create_adjacent(MPI_Comm comm_old, int indegree, int sources[], int sourceweights[], int outdegree, int destinations[], int destweights[], MPI_Info info, int reorder, MPI_Comm *comm_dist_graph)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Dist_graph_create_adjacent(MPI_Comm comm_old, int indegree, const int sources[], const int sourceweights[], int outdegree, const int destinations[], const int destweights[], MPI_Info info, int reorder, MPI_Comm *comm_dist_graph)
```

## C++

**MPI-2.2**
```c
MPI::Distgraphcomm MPI::Intracomm::Dist_graph_create_adjacent(int indegree, const int sources[], const int sourceweights[], int outdegree, const int destinations[], const int destweights[], const MPI::Info& info, bool reorder) const
MPI::Distgraphcomm MPI::Intracomm::Dist_graph_create_adjacent(int indegree, const int sources[], int outdegree, const int destinations[], const MPI::Info& info, bool reorder) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Dist_graph_create_adjacent(comm_old, indegree, sources, sourceweights, outdegree, destinations, destweights, info, reorder, comm_dist_graph, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm_old
    INTEGER, INTENT(IN) :: indegree, sources(indegree), outdegree, destinations(outdegree)
    INTEGER, INTENT(IN) :: sourceweights(*), destweights(*)
    TYPE(MPI_Info), INTENT(IN) :: info
    LOGICAL, INTENT(IN) :: reorder
    TYPE(MPI_Comm), INTENT(OUT) :: comm_dist_graph
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Dist_graph_create_adjacent(comm_old, indegree, sources, sourceweights, outdegree, destinations, destweights, info, reorder, comm_dist_graph, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm_old
    INTEGER, INTENT(IN) :: indegree, sources(indegree), outdegree,
    destinations(outdegree)
    INTEGER, INTENT(IN) :: sourceweights(*), destweights(*)
    TYPE(MPI_Info), INTENT(IN) :: info
    LOGICAL, INTENT(IN) :: reorder
    TYPE(MPI_Comm), INTENT(OUT) :: comm_dist_graph
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Dist_graph_create_adjacent(comm_old, indegree, sources, sourceweights, outdegree, destinations, destweights, info, reorder, comm_dist_graph, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm_old
    INTEGER, INTENT(IN) :: indegree, sources(indegree), sourceweights(*), outdegree, destinations(outdegree), destweights(*)
    TYPE(MPI_Info), INTENT(IN) :: info
    LOGICAL, INTENT(IN) :: reorder
    TYPE(MPI_Comm), INTENT(OUT) :: comm_dist_graph
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.2–MPI-3.1**
```fortran
MPI_DIST_GRAPH_CREATE_ADJACENT(COMM_OLD, INDEGREE, SOURCES, SOURCEWEIGHTS, OUTDEGREE, DESTINATIONS, DESTWEIGHTS, INFO, REORDER, COMM_DIST_GRAPH, IERROR)
    INTEGER COMM_OLD, INDEGREE, SOURCES(*), SOURCEWEIGHTS(*), OUTDEGREE,
    DESTINATIONS(*), DESTWEIGHTS(*), INFO, COMM_DIST_GRAPH, IERROR
    LOGICAL REORDER
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_DIST_GRAPH_CREATE_ADJACENT(COMM_OLD, INDEGREE, SOURCES, SOURCEWEIGHTS, OUTDEGREE, DESTINATIONS, DESTWEIGHTS, INFO, REORDER, COMM_DIST_GRAPH, IERROR)
    INTEGER COMM_OLD, INDEGREE, SOURCES(*), SOURCEWEIGHTS(*), OUTDEGREE, DESTINATIONS(*), DESTWEIGHTS(*), INFO, COMM_DIST_GRAPH, IERROR
    LOGICAL REORDER
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm_old` | IN | **MPI-2.2–MPI-5.0:** input communicator (handle) |
| `indegree` | IN | **MPI-2.2–MPI-4.1:** size of `sources` and `sourceweights` arrays (non-negative integer)<br>**MPI-5.0:** size of `sources` and `sourceweights` arrays (nonnegative integer) |
| `sources` | IN | **MPI-2.2–MPI-4.0:** ranks of processes for which the calling process is a destination (array of non-negative integers)<br>**MPI-4.1:** ranks of MPI processes for which the calling process is a destination (array of non-negative integers)<br>**MPI-5.0:** ranks of MPI processes for which the calling process is a destination (array of nonnegative integers) |
| `sourceweights` | IN | **MPI-2.2–MPI-4.0:** weights of the edges into the calling process (array of non-negative integers)<br>**MPI-4.1:** weights of the edges into the calling MPI process (array of non-negative integers)<br>**MPI-5.0:** weights of the edges into the calling MPI process (array of nonnegative integers) |
| `outdegree` | IN | **MPI-2.2–MPI-4.1:** size of `destinations` and `destweights` arrays (non-negative integer)<br>**MPI-5.0:** size of `destinations` and `destweights` arrays (nonnegative integer) |
| `destinations` | IN | **MPI-2.2–MPI-4.0:** ranks of processes for which the calling process is a source (array of non-negative integers)<br>**MPI-4.1:** ranks of MPI processes for which the calling MPI process is a source (array of non-negative integers)<br>**MPI-5.0:** ranks of MPI processes for which the calling MPI process is a source (array of nonnegative integers) |
| `destweights` | IN | **MPI-2.2–MPI-4.0:** weights of the edges out of the calling process (array of non-negative integers)<br>**MPI-4.1:** weights of the edges out of the calling MPI process (array of non-negative integers)<br>**MPI-5.0:** weights of the edges out of the calling MPI process (array of nonnegative integers) |
| `info` | IN | **MPI-2.2–MPI-5.0:** hints on optimization and interpretation of weights (handle) |
| `reorder` | IN | **MPI-2.2–MPI-4.0:** the ranks may be reordered (`true`) or not (`false`) (logical)<br>**MPI-4.1–MPI-5.0:** ranks may be reordered (`true`) or not (`false`) (logical) |
| `comm_dist_graph` | OUT | **MPI-2.2–MPI-4.0:** communicator with distributed graph topology (handle)<br>**MPI-4.1–MPI-5.0:** new communicator with associated distributed graph topology (handle) |

## Named in the change log of

[[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.2: [[versions/v22/API/MPI_DIST_GRAPH_CREATE_ADJACENT|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_DIST_GRAPH_CREATE_ADJACENT|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_DIST_GRAPH_CREATE_ADJACENT|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_DIST_GRAPH_CREATE_ADJACENT|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_DIST_GRAPH_CREATE_ADJACENT|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_DIST_GRAPH_CREATE_ADJACENT|API note]] · chapter [[versions/v50/sections/topol|topol]]
