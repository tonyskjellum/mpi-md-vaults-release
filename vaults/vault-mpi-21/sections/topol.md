# Process Topologies



## Introduction

This chapter discusses the MPI topology mechanism. A topology is an extra, optional attribute that one can give to an intra-communicator; topologies cannot be added to inter-communicators. A topology can provide a convenient naming mechanism for the processes of a group (within a communicator), and additionally, may assist the runtime system in mapping the processes onto hardware.

As stated in Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] , a process group in MPI is a collection of `n` processes. Each process in the group is assigned a rank between `0` and `n-1`. In many parallel applications a linear ranking of processes does not adequately reflect the logical communication pattern of the processes (which is usually determined by the underlying problem geometry and the numerical algorithm used). Often the processes are arranged in topological patterns such as two- or three-dimensional grids. More generally, the logical process arrangement is described by a graph. In this chapter we will refer to this logical process arrangement as the “virtual topology.”

A clear distinction must be made between the virtual process topology and the topology of the underlying, physical hardware. The virtual topology can be exploited by the system in the assignment of processes to physical processors, if this helps to improve the communication performance on a given machine. How this mapping is done, however, is outside the scope of MPI. The description of the virtual topology, on the other hand, depends only on the application, and is machine-independent.

The functions that are described in this chapter deal only with machine-independent mapping.

> [!tip] Rationale

> Though physical mapping is not discussed, the existence of the virtual topology information may be used as advice by the runtime system. There are well-known techniques for mapping grid/torus structures to hardware to­po­logies such as hypercubes or grids. For more complicated graph structures good heuristics often yield nearly optimal results . On the other hand, if there is no way for the user to specify the logical process arrangement as a “virtual topology,” a random mapping is most likely to result. On some machines, this will lead to unnecessary contention in the interconnection network. Some details about predicted and measured performance improvements that result from good process-to-processor mapping on modern wormhole-routing architectures can be found in
>
> .
>
> Besides possible performance benefits, the virtual topology can function as a convenient, process-naming structure, with
>
> significant
>
> benefits for program readability and notational power in message-passing programming.

## Virtual Topologies

The communication pattern of a set of processes can be represented by a graph. The nodes

represent processes,

and the edges connect processes that communicate with each other. MPI provides message-passing between any pair of processes in a group. There is no requirement for opening a channel explicitly. Therefore, a “missing link” in the user-defined process graph does not prevent the corresponding processes from exchanging messages. It means rather that this connection is neglected in the virtual topology. This strategy implies that the topology gives no convenient way of naming this pathway of communication. Another possible consequence is that an automatic mapping tool (if one exists for the runtime environment) will not take account of this edge when mapping. Edges in the communication graph are not weighted, so that processes are either simply connected or not connected at all.

> [!tip] Rationale

> Experience with similar techniques in PARMACS
>
> show that this information is usually sufficient for a good mapping. Additionally, a more precise specification is more difficult for the user to set up, and it would make the interface functions substantially more complicated.

Specifying the virtual topology in terms of a graph is sufficient for all applications. However, in many applications the graph structure is regular, and the detailed set-up of the graph would be inconvenient for the user and might be less efficient at run time. A large fraction of all parallel applications use process topologies like rings, two- or higher-dimensional grids, or tori. These structures are completely defined by the number of dimensions and the numbers of processes in each coordinate direction. Also, the mapping of grids and tori is generally an easier problem then that of general graphs. Thus, it is desirable to address these cases explicitly.

Process coordinates in a Cartesian structure begin their numbering at $`0`$. Row-major numbering is always used for the processes in a Cartesian structure. This means that, for example, the relation between group rank and coordinates for four processes in a $`(2 \times 2)`$ grid is as follows.\

|              |        |
|:-------------|:-------|
| coord (0,0): | rank 0 |
| coord (0,1): | rank 1 |
| coord (1,0): | rank 2 |
| coord (1,1): | rank 3 |

## Embedding in MPI

The support for virtual topologies as defined in this chapter is consistent with other parts of MPI, and, whenever possible, makes use of functions that are defined elsewhere. Topology information is associated with communicators. It is added to communicators using the caching mechanism described in Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] .

## Overview of the Functions



The functions [[MPI_GRAPH_CREATE]] and [[MPI_CART_CREATE]] are used to create general (graph) virtual topologies and Cartesian topologies, respectively. These topology creation functions are collective. As with other collective calls, the program must be written to work correctly, whether the call synchronizes or not.

The topology creation functions take as input an existing communicator `comm_old`, which defines the set of processes on which the topology is to be mapped.

All input arguments must have identical values on all processes of the group of `comm_old`.

A new communicator `comm_topol` is created that carries the topological structure as cached information (see Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] ). In analogy to function [[MPI_COMM_CREATE]] , no cached information propagates from `comm_old` to `comm_topol`.

`MPI_CART_CREATE` can be used to describe Cartesian structures of arbitrary dimension. For each coordinate direction one specifies whether the process structure is periodic or not. Note that an $`n`$-dimensional hypercube is an $`n`$-dimensional torus with 2 processes per coordinate direction. Thus, special support for hypercube structures is not necessary. The local auxiliary function [[MPI_DIMS_CREATE]] can be used to compute a balanced distribution of processes among a given number of dimensions.

> [!tip] Rationale

> Similar functions are contained in EXPRESS and PARMACS.

The function [[MPI_TOPO_TEST]] can be used to inquire about the topology associated with a communicator. The topological information can be extracted from the communicator using the functions [[MPI_GRAPHDIMS_GET]] and [[MPI_GRAPH_GET]] , for general graphs, and [[MPI_CARTDIM_GET]] and [[MPI_CART_GET]] , for Cartesian topologies. Several additional functions are provided to manipulate Cartesian topologies: the functions [[MPI_CART_RANK]] and [[MPI_CART_COORDS]] translate Cartesian coordinates into a group rank, and vice-versa; the function [[MPI_CART_SUB]] can be used to extract a Cartesian subspace (analogous to [[MPI_COMM_SPLIT]] ). The function [[MPI_CART_SHIFT]] provides the information needed to communicate with neighbors in a Cartesian dimension. The two functions

[[MPI_GRAPH_NEIGHBORS_COUNT]] and [[MPI_GRAPH_NEIGHBORS]] can be used to extract the neighbors of a node in a graph. The function [[MPI_CART_SUB]] is collective over the input communicator’s group; all other functions are local.

Two additional functions, [[MPI_GRAPH_MAP]] and [[MPI_CART_MAP]] are presented in the last section. In general these functions are not called by the user directly. However, together with the communicator manipulation functions presented in Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] , they are sufficient to implement all other topology functions. Section [[topol#Low-Level Topology Functions|Low-Level Topology Functions]] outlines such an implementation.

## Topology Constructors



### Cartesian Constructor



![[API/MPI_CART_CREATE]]

[[MPI_CART_CREATE]] returns a handle to a new communicator to which the Cartesian topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes (possibly so as to choose a good embedding of the virtual topology onto the physical machine). If the total size of the Cartesian grid is smaller than the size of the group of `comm`, then some processes are returned MPI_COMM_NULL, in analogy to [[MPI_COMM_SPLIT]] .

If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative.

### Cartesian Convenience Function: `MPI_DIMS_CREATE`

For Cartesian topologies, the function `MPI_DIMS_CREATE` helps the user select a balanced distribution of processes per coordinate direction, depending on the number of processes in the group to be balanced and optional constraints that can be specified by the user. One use is to partition all the processes (the size of MPI_COMM_WORLD’s group) into an $`n`$-dimensional topology.

![[API/MPI_DIMS_CREATE]]

The entries in the array `dims` are set to describe a Cartesian grid with `ndims` dimensions and a total of `nnodes` nodes. The dimensions are set to be as close to each other as possible, using an appropriate divisibility algorithm. The caller may further constrain the operation of this routine by specifying elements of array `dims`. If `dims[i]` is set to a positive number, the routine will not modify the number of nodes in dimension `i`; only those entries where `dims[i] = 0` are modified by the call.

Negative input values of `dims[i]` are erroneous. An error will occur if `nnodes` is not a multiple of $`\displaystyle \prod_{i, dims[i]\neq 0} dims[i]`$.

For `dims[i]` set by the call, `dims[i]` will be ordered in non-increasing order. Array `dims` is suitable for use as input to routine `MPI_CART_CREATE`. [[MPI_DIMS_CREATE]] is local.



|             |                                     |                |
|:------------|:------------------------------------|:---------------|
| `dims`      | function call                       | `dims`         |
| before call |                                     | on return      |
| (0,0)       | [[MPI_DIMS_CREATE]] | (3,2)          |
| (0,0)       | [[MPI_DIMS_CREATE]] | (7,1)          |
| (0,3,0)     | [[MPI_DIMS_CREATE]] | (2,3,1)        |
| (0,3,0)     | [[MPI_DIMS_CREATE]] | erroneous call |

### General (Graph) Constructor



![[API/MPI_GRAPH_CREATE]]

`MPI_GRAPH_CREATE` returns a handle to a new communicator to which the graph topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes. If the size, `nnodes`, of the graph is smaller than the size of the group of `comm`, then some processes are returned MPI_COMM_NULL, in analogy to [[MPI_CART_CREATE]] and [[MPI_COMM_SPLIT]] .

If the graph is empty, i.e., `nnodes == 0`, then MPI_COMM_NULL is returned in all processes.

The call is erroneous if it specifies a graph that is larger than the group size of the input communicator.

The three parameters `nnodes, index` and `edges` define the graph structure. `nnodes` is the number of nodes of the graph. The nodes are numbered from `0` to `nnodes-1`. The

`i`-th

entry of array `index` stores the total number of neighbors of the first `i` graph nodes. The lists of neighbors of nodes `0, 1, ..., nnodes-1` are stored in consecutive locations in array `edges`. The array `edges` is a flattened representation of the edge lists. The total number of entries in `index` is `nnodes` and the total number of entries in `edges` is equal to the number of graph edges.

The definitions of the arguments `nnodes`, `index`, and `edges` are illustrated with the following simple example.

 Assume there are four processes 0, 1, 2, 3 with the following adjacency matrix:\

| process | neighbors |
|:-------:|:----------|
|    0    | 1, 3      |
|    1    | 0         |
|    2    | 3         |
|    3    | 0, 2      |

Then, the input arguments are:\

|          |                  |
|:---------|:-----------------|
| nnodes = | 4                |
| index =  | 2, 3, 4, 6       |
| edges =  | 1, 3, 0, 3, 0, 2 |

Thus, in C, `index[0]` is the degree of node zero, and `index[i] - index[i-1]` is the degree of node `i, i=1, ..., nnodes-1`; the list of neighbors of node zero is stored in `edges[j]`, for $`0 \leq j \leq index[0]-1`$ and the list of neighbors of node `i`, $`i > 0`$, is stored in `edges[j]`, $`index[i-1] \leq j \leq index[i]-1`$. In Fortran, `index(1)` is the degree of node zero, and `index(i+1) - index(i)` is the degree of node `i, i=1, ..., nnodes-1`; the list of neighbors of node zero is stored in `edges(j)`, for $`1 \leq j \leq index(1)`$ and the list of neighbors of node `i`, $`i > 0`$, is stored in `edges(j)`, $`index(i)+1 \leq j \leq index(i+1)`$.

A single process is allowed to be defined multiple times in the list of neighbors of a process (i.e., there may be multiple edges between two processes). A process is also allowed to be a neighbor to itself (i.e., a self loop in the graph). The adjacency matrix is allowed to be non-symmetric.

> [!note] Advice to users

> Performance implications of using multiple edges or a non-symmetric adjacency matrix are not defined. The definition of a node-neighbor edge does not imply a direction of the communication.

> [!warning] Advice to implementors

> The following topology information is likely to be stored with a communicator:
>
> - Type of topology (Cartesian/graph),
>
> - For a Cartesian topology:
>
>   1.  `ndims` (number of dimensions),
>
>   2.  `dims` (numbers of processes per coordinate direction),
>
>   3.  `periods` (periodicity information),
>
>   4.  `own_position` (own position in grid, could also be computed from rank and dims)
>
> - For a graph topology:
>
>   1.  `index`,
>
>   2.  `edges`,
>
>   which are the vectors defining the graph structure.
>
> For a graph structure the number of nodes is equal to the number of processes in the group. Therefore, the number of nodes does not have to be stored explicitly. An additional zero entry at the start of array `index` simplifies access to the topology information.

### Topology Inquiry Functions



If a topology has been defined with one of the above functions, then the topology information can be looked up using inquiry functions. They all are local calls.

![[API/MPI_TOPO_TEST]]

The function `MPI_TOPO_TEST` returns the type of topology that is assigned to a communicator.

The output value `status` is one of the following:

graph topology

Cartesian topology

no topology

![[API/MPI_GRAPHDIMS_GET]]

Functions `MPI_GRAPHDIMS_GET` and `MPI_GRAPH_GET` retrieve the graph-topology information that was associated with a communicator by `MPI_GRAPH_CREATE`.

The information provided by `MPI_GRAPHDIMS_GET` can be used to dimension the vectors `index` and `edges` correctly for the following call to `MPI_GRAPH_GET`.

![[API/MPI_GRAPH_GET]]

![[API/MPI_CARTDIM_GET]]

The functions `MPI_CARTDIM_GET` and `MPI_CART_GET` return the Cartesian topology information that was associated with a communicator by `MPI_CART_CREATE`.

If `comm` is associated with a zero-dimensional Cartesian topology, [[MPI_CARTDIM_GET]] returns `ndims=0` and [[MPI_CART_GET]] will keep all output arguments unchanged.

![[API/MPI_CART_GET]]

![[API/MPI_CART_RANK]]

For a process group with Cartesian structure, the function `MPI_CART_RANK` translates the logical process coordinates to process ranks as they are used by the point-to-point routines.

For dimension `i` with `periods(i) = true`, if the coordinate, `coords(i)`, is out of range, that is, `coords(i) `$`<`$` 0` or `coords(i) `$`\geq`$` dims(i)`, it is shifted back to the interval

`0 `$`\leq`$` coords(i) `$`<`$` dims(i)` automatically. Out-of-range coordinates are erroneous for non-periodic dimensions.

If `comm` is associated with a zero-dimensional Cartesian topology, `coord` is not significant and 0 is returned in `rank`.

![[API/MPI_CART_COORDS]]

The inverse mapping, rank-to-coordinates translation is provided by `MPI_CART_COORDS`.

If `comm` is associated with a zero-dimensional Cartesian topology, `coords` will be unchanged.

![[API/MPI_GRAPH_NEIGHBORS_COUNT]]

`MPI_GRAPH_NEIGHBORS_COUNT` and `MPI_GRAPH_NEIGHBORS` provide

adjacency information for a general graph topology.

![[API/MPI_GRAPH_NEIGHBORS]]

 Suppose that `comm` is a communicator with a shuffle-exchange topology. The group has $`2^n`$ members. Each process is labeled by $`a_1 , ..., a_n`$ with $`a_i \in
\{0,1\}`$, and has three neighbors: exchange($`a_1 , ..., a_n ) = a_1 ,..., a_{n-1}, \bar{a}_n`$ ($`\bar{a} =
1-a`$), shuffle($`a_1 , ..., a_n )= a_2 , ...,
a_{n}, a_1`$, and unshuffle($`a_1 , ..., a_n ) = a_n , a_1 , ... , a_{n-1}`$. The graph adjacency list is illustrated below for $`n=3`$.\

\|cc\|ccc\| **node**&**exchange**&**shuffle**&**unshuffle**\
& & neighbors(1) & neighbors(2) & neighbors(3)\
& (000) & 1 & 0 & 0\
1 & (001) & 0 & 2 & 4\
2 & (010) & 3 & 4 & 1\
3 & (011) & 2 & 6 & 5\
4 & (100) & 5 & 1 & 2\
5 & (101) & 4 & 3 & 6\
6 & (110) & 7 & 5 & 3\
7 & (111) & 6 & 7 & 7\

Suppose that the communicator `comm` has this topology associated with it. The following code fragment cycles through the three types of neighbors and performs an appropriate permutation for each.

    C  assume: each process has stored a real number A.
    C  extract neighborhood information
          CALL MPI_COMM_RANK(comm, myrank, ierr)
          CALL MPI_GRAPH_NEIGHBORS(comm, myrank, 3, neighbors, ierr)
    C  perform exchange permutation
          CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(1), 0,
         +     neighbors(1), 0, comm, status, ierr)
    C  perform shuffle permutation
          CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(2), 0,
         +     neighbors(3), 0, comm, status, ierr)
    C  perform unshuffle permutation
          CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(3), 0,
         +     neighbors(2), 0, comm, status, ierr)

### Cartesian Shift Coordinates



If the process topology is a Cartesian structure,

an

`MPI_SENDRECV` operation is likely to be used along a coordinate direction to perform a shift of data. As input, `MPI_SENDRECV` takes the rank of a source process for the receive, and the rank of a destination process for the send. If the function `MPI_CART_SHIFT` is called for a Cartesian process group, it provides the calling process with the above identifiers, which then can be passed to `MPI_SENDRECV`. The user specifies the coordinate direction and the size of the step (positive or negative). The function is local.

![[API/MPI_CART_SHIFT]]

The `direction` argument indicates the dimension of the shift, i.e., the coordinate which value is modified by the shift. The coordinates are numbered from 0 to `ndims-1`, when `ndims` is the number of dimensions.

Depending on the periodicity of the Cartesian group in the specified coordinate direction, `MPI_CART_SHIFT` provides the identifiers for a circular or an end-off shift. In the case of an end-off shift, the value MPI_PROC_NULL may be returned in `rank_source` or `rank_dest`, indicating that the source or the destination for the shift is out of range.

It is erroneous to call [[MPI_CART_SHIFT]] with a direction that is either negative or greater than or equal to the number of dimensions in the Cartesian communicator. This implies that it is erroneous to call [[MPI_CART_SHIFT]] with a `comm` that is associated with a zero-dimensional Cartesian topology.

 The communicator, `comm`, has a two-dimensional, periodic, Cartesian topology associated with it. A two-dimensional array of `REAL`s is stored one element per process, in variable `A`. One wishes to skew this array, by shifting column `i` (vertically, i.e., along the column) by `i` steps.

    ....
    C find process rank
          CALL MPI_COMM_RANK(comm, rank, ierr))
    C find Cartesian coordinates
          CALL MPI_CART_COORDS(comm, rank, maxdims, coords, ierr)
    C compute shift source and destination
          CALL MPI_CART_SHIFT(comm, 0, coords(2), source, dest, ierr)
    C skew array
          CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, dest, 0, source, 0, comm,
         +                          status, ierr)

> [!note] Advice to users

> In Fortran, the dimension indicated by DIRECTION = i has DIMS(i+1) nodes, where DIMS is the array that was used to create the grid. In C, the dimension indicated by direction = i is the dimension specified by dims\[i\].

### Partitioning of Cartesian structures



![[API/MPI_CART_SUB]]

If a Cartesian topology has been created with `MPI_CART_CREATE`, the function `MPI_CART_SUB` can be used to partition the communicator group into subgroups that form lower-dimensional Cartesian subgrids, and to build for each subgroup a communicator with the associated subgrid Cartesian topology.

If all entries in `remain_dims` are false or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology.

(This function is closely related to [[MPI_COMM_SPLIT]] .)

 Assume that `MPI_CART_CREATE``(..., comm)` has defined a $`(2 \times 3 \times 4)`$ grid. Let `remain_dims = (true, false, true)`. Then a call to,

         MPI_CART_SUB(comm, remain_dims, comm_new),

will create three communicators each with eight processes in a $`2 \times 4`$ Cartesian topology. If `remain_dims = (false, false, true)` then the call to `MPI_CART_SUB(comm, remain_dims, comm_new)` will create six non-overlapping communicators, each with four processes, in a one-dimensional Cartesian topology.

### Low-Level Topology Functions



The two additional functions introduced in this section can be used to implement all other topology functions. In general they will not be called by the user directly, unless he or she is creating additional virtual topology capability other than that provided by MPI.

![[API/MPI_CART_MAP]]

`MPI_CART_MAP` computes an “optimal” placement for the calling process on the physical machine. A possible implementation of this function is to always return the rank of the calling process, that is, not to perform any reordering.

> [!warning] Advice to implementors

> The function [[MPI_CART_CREATE]] , with `reorder = true` can be implemented by calling [[MPI_CART_MAP]] , then calling
>
> [[MPI_COMM_SPLIT]] , with `color = 0` if `newrank `$`\neq`$` MPI_UNDEFINED`, `color = MPI_UNDEFINED` otherwise, and `key = newrank`.
>
> The function `MPI_CART_SUB(comm, remain_dims, comm_new)` can be implemented by a call to `MPI_COMM_SPLIT(comm, color, key, comm_new)`, using a single number encoding of the lost dimensions as `color` and a single number encoding of the preserved dimensions as `key`.
>
> All other Cartesian topology functions can be implemented locally, using the topology information that is cached with the communicator.

The corresponding new function for general graph structures is as follows.

![[API/MPI_GRAPH_MAP]]

> [!warning] Advice to implementors

> The function [[MPI_GRAPH_CREATE]] , with `reorder = true` can be implemented by calling [[MPI_GRAPH_MAP]] , then calling
>
> [[MPI_COMM_SPLIT]] , with `color = 0` if `newrank `$`\neq`$` MPI_UNDEFINED`, `color = MPI_UNDEFINED` otherwise, and `key = newrank`.
>
> All other graph topology functions can be implemented locally, using the topology information that is cached with the communicator.

## An Application Example



 The example in Figure [[poisson]] shows how the grid definition and inquiry functions can be used in an application program. A partial differential equation, for instance the Poisson equation, is to be solved on a rectangular domain. First, the processes organize themselves in a two-dimensional structure. Each process then inquires about the ranks of its neighbors in the four directions (up, down, right, left). The numerical problem is solved by an iterative method, the details of which are hidden in the subroutine `relax`. In each relaxation step each process computes new values for the solution grid function at all points owned by the process. Then the values at inter-process boundaries have to be exchanged with neighboring processes. For example, the exchange subroutine might contain a call like `MPI_SEND(...,neigh_rank(1),...)` to send updated values to the left-hand neighbor `(i-1,j)`.

*Figure: Set-up of process structure for two-dimensional parallel Poisson solver.*
