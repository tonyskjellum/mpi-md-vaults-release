---
title: MPI_GRAPH_CREATE
c_name: MPI_Graph_create
lis_name: MPI_GRAPH_CREATE
chapter: topol
aliases: [MPI_GRAPH_CREATE, MPI_Graph_create]
tags: [mpi/function, mpi/topol]
---

# MPI_GRAPH_CREATE

**C**
```c
int MPI_Graph_create(MPI_Comm comm_old, int nnodes, int *index, int *edges, int reorder, MPI_Comm *comm_graph)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm_old` | IN | input communicator (handle) |
| `nnodes` | IN | number of nodes in graph (integer) |
| `index` | IN | array of integers describing node degrees (see below) |
| `edges` | IN | array of integers describing graph edges (see below) |
| `reorder` | IN | ranking may be reordered (true) or not (false) (logical) |
| `comm_graph` | OUT | communicator with graph topology added (handle) |

**Fortran (mpif.h)**
```fortran
MPI_GRAPH_CREATE(COMM_OLD, NNODES, INDEX, EDGES, REORDER, COMM_GRAPH, IERROR)
  INTEGER COMM_OLD, NNODES, INDEX(*), EDGES(*), COMM_GRAPH, IERROR
  LOGICAL REORDER
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
