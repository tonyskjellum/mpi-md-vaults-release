---
title: MPI_GRAPH_GET
c_name: MPI_Graph_get
lis_name: MPI_GRAPH_GET
chapter: topol
aliases: [MPI_GRAPH_GET, MPI_Graph_get]
tags: [mpi/function, mpi/topol]
---

# MPI_GRAPH_GET

**C**
```c
int MPI_Graph_get(MPI_Comm comm, int maxindex, int maxedges, int index[], int edges[])
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with associated graph topology (handle) |
| `maxindex` | IN | length of vector `index` in the calling program (integer) |
| `maxedges` | IN | length of vector `edges` in the calling program (integer) |
| `index` | OUT | array of integers containing the graph structure (for details see the definition of `MPI_GRAPH_CREATE`) |
| `edges` | OUT | array of integers containing the graph structure |

**Fortran 2008**
```fortran
MPI_Graph_get(comm, maxindex, maxedges, index, edges, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(IN) :: maxindex, maxedges
  INTEGER, INTENT(OUT) :: index(maxindex), edges(maxedges)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GRAPH_GET(COMM, MAXINDEX, MAXEDGES, INDEX, EDGES, IERROR)
  INTEGER COMM, MAXINDEX, MAXEDGES, INDEX(*), EDGES(*), IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
