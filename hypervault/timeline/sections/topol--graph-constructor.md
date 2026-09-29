---
title: "Graph Constructor"
chapter: topol
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# Graph Constructor

Chapter **topol** · in [[versions/v30/sections/topol#Graph Constructor|MPI-3.0]], [[versions/v31/sections/topol#Graph Constructor|MPI-3.1]], [[versions/v40/sections/topol#Graph Constructor|MPI-4.0]], [[versions/v41/sections/topol#Graph Constructor|MPI-4.1]], [[versions/v50/sections/topol#Graph Constructor|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~`MPI_GRAPH_CREATE` returns a handle to a new communicator to which the graph topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes. If the size, `nnodes`, of the graph is smaller than the size of the group of `comm_old`, then some processes are returned `MPI_COMM_NULL`, in analogy to [[versions/v31/API/MPI_CART_CREATE|MPI_CART_CREATE]] and [[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] . If the graph is empty, i.e., `nnodes == 0`, then `MPI_COMM_NULL` is returned in all processes. The call is erroneous if it specifies a graph that is larger than the group size of the input communicator.~~

~~The three parameters `nnodes, index` and `edges` define the graph structure. `nnodes` is the number of nodes of the graph. The nodes are numbered from `0` to `nnodes-1`. The~~

~~`i`-th entry of array `index` stores the total number of neighbors of the first `i` graph nodes. The lists of neighbors of nodes `0, 1, ..., nnodes-1` are stored in consecutive locations in array `edges`. The array `edges` is a flattened representation of the edge lists. The total number of entries in `index` is `nnodes` and the total number of entries in `edges` is equal to the number of graph edges.~~

==[[versions/v31/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] returns a handle to a new communicator to which the graph topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes. If the size, `nnodes`, of the graph is smaller than the size of the group of `comm_old`, then some processes are returned `MPI_COMM_NULL`, in analogy to [[versions/v31/API/MPI_CART_CREATE|MPI_CART_CREATE]] and [[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] . If the graph is empty, i.e., `nnodes == 0`, then `MPI_COMM_NULL` is returned in all processes. The call is erroneous if it specifies a graph that is larger than the group size of the input communicator.==

==The three parameters `nnodes, index` and `edges` define the graph structure. `nnodes` is the number of nodes of the graph. The nodes are numbered from `0` to `nnodes-1`. The `i`-th entry of array `index` stores the total number of neighbors of the first `i` graph nodes. The lists of neighbors of nodes `0, 1, ..., nnodes-1` are stored in consecutive locations in array `edges`. The array `edges` is a flattened representation of the edge lists. The total number of entries in `index` is `nnodes` and the total number of entries in `edges` is equal to the number of graph edges.==

Assume there are four processes 0, 1, 2, 3 with the following adjacency ~~matrix:\~~ ==matrix:==

Then, the input arguments ~~are:\~~ ==are:==

~~Thus, in C, `index[0]` is the degree of node zero, and `index[i] - index[i-1]` is the degree of node `i, i=1, ..., nnodes-1`; the list of neighbors of node zero is stored in `edges[j]`, for $`0 \leq j \leq index[0]-1`$ and the list of neighbors of node `i`, $`i > 0`$, is stored in `edges[j]`, $`index[i-1] \leq j \leq index[i]-1`$. In Fortran, `index(1)` is the degree of node zero, and `index(i+1) - index(i)` is the degree of node `i, i=1, ..., nnodes-1`; the list of neighbors of node zero is stored in `edges(j)`, for $`1 \leq j \leq index(1)`$ and the list of neighbors of node `i`, $`i > 0`$, is stored in `edges(j)`, $`index(i)+1 \leq j \leq index(i+1)`$.~~

==Thus, in C, `index[0]` is the degree of node zero, and `index[i] - index[i-1]` is the degree of node `i, i=1, ..., nnodes-1`; the list of neighbors of node zero is stored in `edges[j]`, for $`\texttt{0} \leq \texttt{j} \leq \texttt{index[0]}-\texttt{1}`$ and the list of neighbors of node `i`, $`\texttt{i} > \texttt{0}`$, is stored in `edges[j]`, $`\texttt{index[i-1]} \leq \texttt{j} \leq  \texttt{index[i]}-\texttt{1}`$.==

==In Fortran, `index(1)` is the degree of node zero, and `index(i+1) - index(i)` is the degree of node `i, i=1, ..., nnodes-1`; the list of neighbors of node zero is stored in `edges(j)`, for $`\texttt{1} \leq \texttt{j} \leq \texttt{index(1)}`$ and the list of neighbors of node `i`, $`\texttt{i} > \texttt{0}`$, is stored in `edges(j)`, $`\texttt{index(i)+1} \leq \texttt{j} \leq  \texttt{index(i+1)}`$.==

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

[[versions/v40/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] returns a handle to a new communicator to which the graph topology information is attached. If ~~`reorder =~~ ==`reorder``=== false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes. If the size, `nnodes`, of the graph is smaller than the size of the group of `comm_old`, then some processes are returned `MPI_COMM_NULL`, in analogy to [[versions/v40/API/MPI_CART_CREATE|MPI_CART_CREATE]] and [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] . If the graph is empty, i.e., ~~`nnodes ==~~ ==`nnodes``==== 0`, then `MPI_COMM_NULL` is returned in all processes. The call is erroneous if it specifies a graph that is larger than the group size of the input communicator.

The three parameters ~~`nnodes, index`~~ ==`nnodes`, `index`== and `edges` define the graph structure. `nnodes` is the number of nodes of the graph. The nodes are numbered from `0` to `nnodes-1`. The `i`-th entry of array `index` stores the total number of neighbors of the first `i` graph nodes. The lists of neighbors of nodes `0, 1, ..., nnodes-1` are stored in consecutive locations in array `edges`. The array `edges` is a flattened representation of the edge lists. The total number of entries in `index` is `nnodes` and the total number of entries in `edges` is equal to the number of graph edges.

A single process is allowed to be defined multiple times in the list of neighbors of a process (i.e., there may be multiple edges between two processes). A process is also allowed to be a neighbor to itself (i.e., a self loop in the graph). The adjacency matrix is allowed to be ~~non-symmetric.~~ ==nonsymmetric.==

> Performance implications of using multiple edges or a ~~non-symmetric~~ ==nonsymmetric== adjacency matrix are not defined. The definition of a node-neighbor edge does not imply a direction of the communication.

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

[[versions/v41/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] returns a handle to a new communicator to which the graph topology information is attached. If `reorder``= false` then the rank of each ==MPI== process in the ==group of the== new ~~group~~ ==communicator== is identical to its rank in the ==group of the== old ~~group. Otherwise,~~ ==communicator. If `reorder``= true` then== the ~~function~~ ==procedure== may reorder the ==ranks of the MPI== processes. If the ~~size, `nnodes`,~~ ==number== of ==nodes in== the graph ==(`nnodes`)== is smaller than the size of the group of `comm_old`, then ==`MPI_COMM_NULL` is returned by== some ~~processes are returned `MPI_COMM_NULL`,~~ ==MPI processes,== in analogy to [[versions/v41/API/MPI_CART_CREATE|MPI_CART_CREATE]] and [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] . If the graph is empty, i.e., ~~`nnodes``==~~ ==`nnodes``=== 0`, then `MPI_COMM_NULL` is returned in all ==MPI== processes. The call is erroneous if it specifies a graph that is larger than the group size of the input communicator.

~~Assume there are four processes 0, 1, 2, 3 with the following adjacency matrix:~~

~~| process | neighbors | |:-------:|:----------| |    0    | 1, 3      | |    1    | 0         | |    2    | 3         | |    3    | 0, 2      |~~

==Specification of the adjacency matrix for [[versions/v41/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] .==

==Assume there are four MPI processes with ranks 0, 1, 2, 3 in the input communicator with the following adjacency matrix:==

==| MPI process | neighbors | |:-----------:|:----------| |      0      | 1, 3      | |      1      | 0         | |      2      | 3         | |      3      | 0, 2      |==

A single ==MPI== process is allowed to be defined multiple times in the list of neighbors of ~~a~~ ==an MPI== process (i.e., there may be multiple edges between two ==MPI== processes). ~~A~~ ==An MPI== process is also allowed to be a neighbor to itself (i.e., a self loop in the graph). The adjacency matrix is allowed to be nonsymmetric.

> The following topology information is likely to be stored with a communicator: > > - Type of topology ~~(Cartesian/graph),~~ ==(Cartesian/graph)== > > - For a Cartesian topology: > > 1. `ndims` (number of ~~dimensions),~~ ==dimensions)== > > 2. `dims` (numbers of ==MPI== processes per coordinate ~~direction),~~ ==direction)== > > 3. `periods` (periodicity ~~information),~~ ==information)== > > 4. `own_position` (own position in grid, could also be computed from rank and dims) > > - For a graph topology: > > 1. ~~`index`,~~ ==`index`== > > 2. ~~`edges`,~~ ==`edges`== > > which are the ~~vectors~~ ==arrays== defining the graph structure. > > For a graph structure the number of nodes is equal to the number of ==MPI== processes in the group. Therefore, the number of nodes does not have to be stored explicitly. An additional zero entry at the start of array `index` simplifies access to the topology information.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#Graph Constructor]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#Graph Constructor]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#Graph Constructor]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#Graph Constructor]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#Graph Constructor]]
