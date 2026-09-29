---
title: MPI_DIST_GRAPH_CREATE
c_name: MPI_Dist_graph_create
chapter: topol
introduced: "MPI-2.2"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_DIST_GRAPH_CREATE, MPI_Dist_graph_create]
tags: [mpi/routine, mpi/topol]
---

# MPI_DIST_GRAPH_CREATE

**Introduced** in MPI-2.2.

Releases: [[versions/v22/API/MPI_DIST_GRAPH_CREATE|MPI-2.2]] · [[versions/v30/API/MPI_DIST_GRAPH_CREATE|MPI-3.0]] Δ · [[versions/v31/API/MPI_DIST_GRAPH_CREATE|MPI-3.1]] Δ · [[versions/v40/API/MPI_DIST_GRAPH_CREATE|MPI-4.0]] Δ · [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI-4.1]] Δ · [[versions/v50/API/MPI_DIST_GRAPH_CREATE|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.2**
```c
int MPI_Dist_graph_create(MPI_Comm comm_old, int n, int sources[], int degrees[], int destinations[], int weights[], MPI_Info info, int reorder, MPI_Comm *comm_dist_graph)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Dist_graph_create(MPI_Comm comm_old, int n, const int sources[], const int degrees[], const int destinations[], const int weights[], MPI_Info info, int reorder, MPI_Comm *comm_dist_graph)
```

## C++

**MPI-2.2**
```c
MPI::Distgraphcomm MPI::Intracomm::Dist_graph_create(int n, const int sources[], const int degrees[], const int destinations[], const int weights[], const MPI::Info& info, bool reorder) const
MPI::Distgraphcomm MPI::Intracomm::Dist_graph_create(int n, const int sources[], const int degrees[], const int destinations[], const MPI::Info& info, bool reorder) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Dist_graph_create(comm_old, n, sources, degrees, destinations, weights, info, reorder, comm_dist_graph, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm_old
    INTEGER, INTENT(IN) :: n, sources(n), degrees(n), destinations(*)
    INTEGER, INTENT(IN) :: weights(*)
    TYPE(MPI_Info), INTENT(IN) :: info
    LOGICAL, INTENT(IN) :: reorder
    TYPE(MPI_Comm), INTENT(OUT) :: comm_dist_graph
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Dist_graph_create(comm_old, n, sources, degrees, destinations, weights, info, reorder, comm_dist_graph, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm_old
    INTEGER, INTENT(IN) :: n, sources(n), degrees(n), destinations(*)
    INTEGER, INTENT(IN) :: weights(*)
    TYPE(MPI_Info), INTENT(IN) :: info
    LOGICAL, INTENT(IN) :: reorder
    TYPE(MPI_Comm), INTENT(OUT) :: comm_dist_graph
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Dist_graph_create(comm_old, n, sources, degrees, destinations, weights, info, reorder, comm_dist_graph, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm_old
    INTEGER, INTENT(IN) :: n, sources(n), degrees(n), destinations(*), weights(*)
    TYPE(MPI_Info), INTENT(IN) :: info
    LOGICAL, INTENT(IN) :: reorder
    TYPE(MPI_Comm), INTENT(OUT) :: comm_dist_graph
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.2–MPI-3.0**
```fortran
MPI_DIST_GRAPH_CREATE(COMM_OLD, N, SOURCES, DEGREES, DESTINATIONS, WEIGHTS, INFO, REORDER, COMM_DIST_GRAPH, IERROR)
    INTEGER COMM_OLD, N, SOURCES(*), DEGREES(*), DESTINATIONS(*), WEIGHTS(*), INFO, COMM_DIST_GRAPH, IERROR
    LOGICAL REORDER
```

**MPI-3.1**
```fortran
MPI_DIST_GRAPH_CREATE(COMM_OLD, N, SOURCES, DEGREES, DESTINATIONS, WEIGHTS, INFO, REORDER, COMM_DIST_GRAPH, IERROR)
    INTEGER COMM_OLD, N, SOURCES(*), DEGREES(*), DESTINATIONS(*),
    WEIGHTS(*), INFO, COMM_DIST_GRAPH, IERROR
    LOGICAL REORDER
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_DIST_GRAPH_CREATE(COMM_OLD, N, SOURCES, DEGREES, DESTINATIONS, WEIGHTS, INFO, REORDER, COMM_DIST_GRAPH, IERROR)
    INTEGER COMM_OLD, N, SOURCES(*), DEGREES(*), DESTINATIONS(*), WEIGHTS(*), INFO, COMM_DIST_GRAPH, IERROR
    LOGICAL REORDER
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm_old` | IN | **MPI-2.2–MPI-5.0:** input communicator (handle) |
| `n` | IN | **MPI-2.2–MPI-4.0:** number of source nodes for which this process specifies edges (non-negative integer)<br>**MPI-4.1:** number of source nodes for which this MPI process specifies edges (non-negative integer)<br>**MPI-5.0:** number of source nodes for which this MPI process specifies edges (nonnegative integer) |
| `sources` | IN | **MPI-2.2–MPI-4.0:** array containing the `n` source nodes for which this process specifies edges (array of non-negative integers)<br>**MPI-4.1:** array containing the `n` source nodes for which this MPI process specifies edges (array of non-negative integers)<br>**MPI-5.0:** array containing the `n` source nodes for which this MPI process specifies edges (array of nonnegative integers) |
| `degrees` | IN | **MPI-2.2–MPI-4.1:** array specifying the number of destinations for each source node in the source node array (array of non-negative integers)<br>**MPI-5.0:** array specifying the number of destinations for each source node in the source node array (array of nonnegative integers) |
| `destinations` | IN | **MPI-2.2–MPI-4.1:** destination nodes for the source nodes in the source node array (array of non-negative integers)<br>**MPI-5.0:** destination nodes for the source nodes in the source node array (array of nonnegative integers) |
| `weights` | IN | **MPI-2.2–MPI-4.1:** weights for source to destination edges (array of non-negative integers)<br>**MPI-5.0:** weights for source to destination edges (array of nonnegative integers) |
| `info` | IN | **MPI-2.2–MPI-5.0:** hints on optimization and interpretation of weights (handle) |
| `reorder` | IN | **MPI-2.2–MPI-3.1:** the process may be reordered (`true`) or not (`false`) (logical)<br>**MPI-4.0:** the ranks may be reordered (`true`) or not (`false`) (logical)<br>**MPI-4.1–MPI-5.0:** ranks may be reordered (`true`) or not (`false`) (logical) |
| `comm_dist_graph` | OUT | **MPI-2.2–MPI-4.0:** communicator with distributed graph topology added (handle)<br>**MPI-4.1–MPI-5.0:** new communicator with associated distributed graph topology (handle) |

## Named in the change log of

[[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.2: [[versions/v22/API/MPI_DIST_GRAPH_CREATE|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_DIST_GRAPH_CREATE|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_DIST_GRAPH_CREATE|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_DIST_GRAPH_CREATE|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_DIST_GRAPH_CREATE|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_DIST_GRAPH_CREATE|API note]] · chapter [[versions/v50/sections/topol|topol]]
