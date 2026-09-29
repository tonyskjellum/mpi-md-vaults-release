---
title: MPI_DIST_GRAPH_NEIGHBORS
c_name: MPI_Dist_graph_neighbors
chapter: topol
introduced: "MPI-2.2"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_DIST_GRAPH_NEIGHBORS, MPI_Dist_graph_neighbors]
tags: [mpi/routine, mpi/topol]
---

# MPI_DIST_GRAPH_NEIGHBORS

**Introduced** in MPI-2.2.

Releases: [[versions/v22/API/MPI_DIST_GRAPH_NEIGHBORS|MPI-2.2]] · [[versions/v30/API/MPI_DIST_GRAPH_NEIGHBORS|MPI-3.0]] Δ · [[versions/v31/API/MPI_DIST_GRAPH_NEIGHBORS|MPI-3.1]] Δ · [[versions/v40/API/MPI_DIST_GRAPH_NEIGHBORS|MPI-4.0]] Δ · [[versions/v41/API/MPI_DIST_GRAPH_NEIGHBORS|MPI-4.1]] Δ · [[versions/v50/API/MPI_DIST_GRAPH_NEIGHBORS|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.2–MPI-5.0**
```c
int MPI_Dist_graph_neighbors(MPI_Comm comm, int maxindegree, int sources[], int sourceweights[], int maxoutdegree, int destinations[], int destweights[])
```

## C++

**MPI-2.2**
```c
void MPI::Distgraphcomm::Get_dist_neighbors(int maxindegree, int sources[], int sourceweights[], int maxoutdegree, int destinations[], int destweights[])
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Dist_graph_neighbors(comm, maxindegree, sources, sourceweights, maxoutdegree, destinations, destweights, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: maxindegree, maxoutdegree
    INTEGER, INTENT(OUT) :: sources(maxindegree), destinations(maxoutdegree)
    INTEGER :: sourceweights(*), destweights(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Dist_graph_neighbors(comm, maxindegree, sources, sourceweights, maxoutdegree, destinations, destweights, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: maxindegree, maxoutdegree
    INTEGER, INTENT(OUT) :: sources(maxindegree),
    destinations(maxoutdegree)
    INTEGER :: sourceweights(*), destweights(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Dist_graph_neighbors(comm, maxindegree, sources, sourceweights, maxoutdegree, destinations, destweights, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(IN) :: maxindegree, maxoutdegree
    INTEGER, INTENT(OUT) :: sources(maxindegree), destinations(maxoutdegree)
    INTEGER :: sourceweights(*), destweights(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.2–MPI-3.1**
```fortran
MPI_DIST_GRAPH_NEIGHBORS(COMM, MAXINDEGREE, SOURCES, SOURCEWEIGHTS, MAXOUTDEGREE, DESTINATIONS, DESTWEIGHTS, IERROR)
    INTEGER COMM, MAXINDEGREE, SOURCES(*), SOURCEWEIGHTS(*), MAXOUTDEGREE,
    DESTINATIONS(*), DESTWEIGHTS(*), IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_DIST_GRAPH_NEIGHBORS(COMM, MAXINDEGREE, SOURCES, SOURCEWEIGHTS, MAXOUTDEGREE, DESTINATIONS, DESTWEIGHTS, IERROR)
    INTEGER COMM, MAXINDEGREE, SOURCES(*), SOURCEWEIGHTS(*), MAXOUTDEGREE, DESTINATIONS(*), DESTWEIGHTS(*), IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-2.2–MPI-4.0:** communicator with distributed graph topology (handle)<br>**MPI-4.1–MPI-5.0:** communicator with associated distributed graph topology (handle) |
| `maxindegree` | IN | **MPI-2.2–MPI-4.1:** size of sources and sourceweights arrays (non-negative integer)<br>**MPI-5.0:** size of sources and sourceweights arrays (nonnegative integer) |
| `sources` | OUT | **MPI-2.2–MPI-4.0:** processes for which the calling process is a destination (array of non-negative integers)<br>**MPI-4.1:** ranks of MPI processes for which the calling MPI process is a destination (array of non-negative integers)<br>**MPI-5.0:** ranks of MPI processes for which the calling MPI process is a destination (array of nonnegative integers) |
| `sourceweights` | OUT | **MPI-2.2–MPI-4.0:** weights of the edges into the calling process (array of non-negative integers)<br>**MPI-4.1:** weights of the edges into the calling MPI process (array of non-negative integers)<br>**MPI-5.0:** weights of the edges into the calling MPI process (array of nonnegative integers) |
| `maxoutdegree` | IN | **MPI-2.2–MPI-4.1:** size of destinations and destweights arrays (non-negative integer)<br>**MPI-5.0:** size of destinations and destweights arrays (nonnegative integer) |
| `destinations` | OUT | **MPI-2.2–MPI-4.0:** processes for which the calling process is a source (array of non-negative integers)<br>**MPI-4.1:** ranks of MPI processes for which the calling MPI process is a source (array of non-negative integers)<br>**MPI-5.0:** ranks of MPI processes for which the calling MPI process is a source (array of nonnegative integers) |
| `destweights` | OUT | **MPI-2.2–MPI-4.0:** weights of the edges out of the calling process (array of non-negative integers)<br>**MPI-4.1:** weights of the edges out of the calling MPI process (array of non-negative integers)<br>**MPI-5.0:** weights of the edges out of the calling MPI process (array of nonnegative integers) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.2: [[versions/v22/API/MPI_DIST_GRAPH_NEIGHBORS|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_DIST_GRAPH_NEIGHBORS|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_DIST_GRAPH_NEIGHBORS|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_DIST_GRAPH_NEIGHBORS|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_DIST_GRAPH_NEIGHBORS|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_DIST_GRAPH_NEIGHBORS|API note]] · chapter [[versions/v50/sections/topol|topol]]
