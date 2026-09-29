---
title: "General (Graph) Constructor"
chapter: topol
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/topol]
---

# General (Graph) Constructor

Chapter **topol** · in [[versions/v13/sections/topol#General (Graph) Constructor|MPI-1.3]], [[versions/v21/sections/topol#General (Graph) Constructor|MPI-2.1]], [[versions/v22/sections/topol#General (Graph) Constructor|MPI-2.2]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

~~`MPI_GRAPH_CREATE` returns a handle to a new communicator to which the graph topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes. If the size, `nnodes`, of the graph is smaller than the size of the group of `comm`, then some processes are returned MPI_COMM_NULL, in analogy to [[versions/v21/API/MPI_CART_CREATE|MPI_CART_CREATE]] and [[versions/v21/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] . The call is erroneous if it specifies a graph that is larger than the group size of the input communicator.~~

~~The three parameters `nnodes, index` and `edges` define the graph structure. `nnodes` is the number of nodes of the graph. The nodes are numbered from `0` to `nnodes-1`. The `i`th entry of array `index` stores the total number of neighbors of the first `i` graph nodes. The lists of neighbors of nodes `0, 1, ..., nnodes-1` are stored in consecutive locations in array `edges`. The array `edges` is a flattened representation of the edge lists. The total number of entries in `index` is `nnodes` and the total number of entries in `edges` is equal to the number of graph edges.~~

==`MPI_GRAPH_CREATE` returns a handle to a new communicator to which the graph topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes. If the size, `nnodes`, of the graph is smaller than the size of the group of `comm`, then some processes are returned MPI_COMM_NULL, in analogy to [[versions/v21/API/MPI_CART_CREATE|MPI_CART_CREATE]] and [[versions/v21/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .==

==If the graph is empty, i.e., `nnodes == 0`, then MPI_COMM_NULL is returned in all processes.==

==The call is erroneous if it specifies a graph that is larger than the group size of the input communicator.==

==The three parameters `nnodes, index` and `edges` define the graph structure. `nnodes` is the number of nodes of the graph. The nodes are numbered from `0` to `nnodes-1`. The==

==`i`-th==

==entry of array `index` stores the total number of neighbors of the first `i` graph nodes. The lists of neighbors of nodes `0, 1, ..., nnodes-1` are stored in consecutive locations in array `edges`. The array `edges` is a flattened representation of the edge lists. The total number of entries in `index` is `nnodes` and the total number of entries in `edges` is equal to the number of graph edges.==

==A single process is allowed to be defined multiple times in the list of neighbors of a process (i.e., there may be multiple edges between two processes). A process is also allowed to be a neighbor to itself (i.e., a self loop in the graph). The adjacency matrix is allowed to be non-symmetric.==

==> [!note] Advice to users==

==> Performance implications of using multiple edges or a non-symmetric adjacency matrix are not defined. The definition of a node-neighbor edge does not imply a direction of the communication.==

> The following topology information is likely to be stored with a communicator: > > - Type of topology ~~(cartesian/graph),~~ ==(Cartesian/graph),== > > - For a ~~cartesian~~ ==Cartesian== topology: > > 1. `ndims` (number of dimensions), > > 2. `dims` (numbers of processes per coordinate direction), > > 3. `periods` (periodicity information), > > 4. `own_position` (own position in grid, could also be computed from rank and dims) > > - For a graph topology: > > 1. `index`, > > 2. `edges`, > > which are the vectors defining the graph structure. > > For a graph structure the number of nodes is equal to the number of processes in the group. Therefore, the number of nodes does not have to be stored explicitly. An additional zero entry at the start of array `index` simplifies access to the topology information.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

`MPI_GRAPH_CREATE` returns a handle to a new communicator to which the graph topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes. If the size, `nnodes`, of the graph is smaller than the size of the group of `comm`, then some processes are returned ~~MPI_COMM_NULL,~~ ==`MPI_COMM_NULL`,== in analogy to [[versions/v22/API/MPI_CART_CREATE|MPI_CART_CREATE]] and [[versions/v22/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .

If the graph is empty, i.e., `nnodes == 0`, then ~~MPI_COMM_NULL~~ ==`MPI_COMM_NULL`== is returned in all processes.

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/topol#General (Graph) Constructor]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/topol#General (Graph) Constructor]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/topol#General (Graph) Constructor]]
