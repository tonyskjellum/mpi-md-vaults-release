---
title: MPI_GRAPH_MAP
c_name: MPI_Graph_map
lis_name: MPI_GRAPH_MAP
chapter: topol
aliases: [MPI_GRAPH_MAP, MPI_Graph_map]
tags: [mpi/function, mpi/topol]
---

# MPI_GRAPH_MAP

**C**
```c
int MPI_Graph_map(MPI_Comm comm, int nnodes, const int index[], const int edges[], int *newrank)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | input communicator (handle) |
| `nnodes` | IN | number of graph nodes (integer) |
| `index` | IN | integer array specifying the graph structure, see `MPI_GRAPH_CREATE` |
| `edges` | IN | integer array specifying the graph structure |
| `newrank` | OUT | reordered rank of the calling process; `MPI_UNDEFINED` if the calling process does not belong to graph (integer) |

**Fortran 2008**
```fortran
MPI_Graph_map(comm, nnodes, index, edges, newrank, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(IN) :: nnodes, index(nnodes), edges(*)
  INTEGER, INTENT(OUT) :: newrank
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GRAPH_MAP(COMM, NNODES, INDEX, EDGES, NEWRANK, IERROR)
  INTEGER COMM, NNODES, INDEX(*), EDGES(*), NEWRANK, IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
