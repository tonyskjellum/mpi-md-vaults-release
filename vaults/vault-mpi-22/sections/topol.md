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

and the edges connect processes that communicate with each other. MPI provides message-passing between any pair of processes in a group. There is no requirement for opening a channel explicitly. Therefore, a “missing link” in the user-defined process graph does not prevent the corresponding processes from exchanging messages. It means rather that this connection is neglected in the virtual topology. This strategy implies that the topology gives no convenient way of naming this pathway of communication. Another possible consequence is that an automatic mapping tool (if one exists for the runtime environment) will not take account of this edge when mapping.

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



The functions [[MPI_GRAPH_CREATE]] , [[MPI_DIST_GRAPH_CREATE_ADJACENT]] , [[MPI_DIST_GRAPH_CREATE]] and [[MPI_CART_CREATE]] are used to create general (graph) virtual topologies and Cartesian topologies, respectively. These topology creation functions are collective. As with other collective calls, the program must be written to work correctly, whether the call synchronizes or not.

The topology creation functions take as input an existing communicator `comm_old`, which defines the set of processes on which the topology is to be mapped.

For [[MPI_GRAPH_CREATE]] and [[MPI_CART_CREATE]] , all input arguments must have identical values on all processes of the group of `comm_old`. For [[MPI_DIST_GRAPH_CREATE_ADJACENT]] and [[MPI_DIST_GRAPH_CREATE]] the input communication graph is distributed across the calling processes. Therefore the processes provide different values for the arguments specifying the graph. However, all processes must give the same value for `reorder` and the `info` argument. In all cases, a

new communicator `comm_topol` is created that carries the topological structure as cached information (see Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] ). In analogy to function [[MPI_COMM_CREATE]] , no cached information propagates from `comm_old` to `comm_topol`.

`MPI_CART_CREATE` can be used to describe Cartesian structures of arbitrary dimension. For each coordinate direction one specifies whether the process structure is periodic or not. Note that an $`n`$-dimensional hypercube is an $`n`$-dimensional torus with 2 processes per coordinate direction. Thus, special support for hypercube structures is not necessary. The local auxiliary function [[MPI_DIMS_CREATE]] can be used to compute a balanced distribution of processes among a given number of dimensions.

> [!tip] Rationale

> Similar functions are contained in EXPRESS and PARMACS.

The function [[MPI_TOPO_TEST]] can be used to inquire about the topology associated with a communicator. The topological information can be extracted from the communicator using the functions [[MPI_GRAPHDIMS_GET]] and [[MPI_GRAPH_GET]] , for general graphs, and [[MPI_CARTDIM_GET]] and [[MPI_CART_GET]] , for Cartesian topologies. Several additional functions are provided to manipulate Cartesian topologies: the functions [[MPI_CART_RANK]] and [[MPI_CART_COORDS]] translate Cartesian coordinates into a group rank, and vice-versa; the function [[MPI_CART_SUB]] can be used to extract a Cartesian subspace (analogous to [[MPI_COMM_SPLIT]] ). The function [[MPI_CART_SHIFT]] provides the information needed to communicate with neighbors in a Cartesian dimension. The two functions

[[MPI_GRAPH_NEIGHBORS_COUNT]] and [[MPI_GRAPH_NEIGHBORS]] can be used to extract the neighbors of a node in a graph.

For distributed graphs, the functions [[MPI_DIST_NEIGHBORS_COUNT]] and [[MPI_DIST_NEIGHBORS]] can be used to extract the neighbors of the calling node.

The function [[MPI_CART_SUB]] is collective over the input communicator’s group; all other functions are local.

Two additional functions, [[MPI_GRAPH_MAP]] and [[MPI_CART_MAP]] are presented in the last section. In general these functions are not called by the user directly. However, together with the communicator manipulation functions presented in Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] , they are sufficient to implement all other topology functions. Section [[topol#Low-Level Topology Functions|Low-Level Topology Functions]] outlines such an implementation.

## Topology Constructors



### Cartesian Constructor



![[API/MPI_CART_CREATE]]

[[MPI_CART_CREATE]] returns a handle to a new communicator to which the Cartesian topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes (possibly so as to choose a good embedding of the virtual topology onto the physical machine). If the total size of the Cartesian grid is smaller than the size of the group of `comm`, then some processes are returned `MPI_COMM_NULL`, in analogy to [[MPI_COMM_SPLIT]] .

If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative.

### Cartesian Convenience Function: `MPI_DIMS_CREATE`

For Cartesian topologies, the function `MPI_DIMS_CREATE` helps the user select a balanced distribution of processes per coordinate direction, depending on the number of processes in the group to be balanced and optional constraints that can be specified by the user. One use is to partition all the processes (the size of `MPI_COMM_WORLD`’s group) into an $`n`$-dimensional topology.

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

`MPI_GRAPH_CREATE` returns a handle to a new communicator to which the graph topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes. If the size, `nnodes`, of the graph is smaller than the size of the group of `comm`, then some processes are returned `MPI_COMM_NULL`, in analogy to [[MPI_CART_CREATE]] and [[MPI_COMM_SPLIT]] .

If the graph is empty, i.e., `nnodes == 0`, then `MPI_COMM_NULL` is returned in all processes.

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

### Distributed (Graph) Constructor



The general graph constructor assumes that each process passes the full (global) communication graph to the call. This limits the scalability of this constructor. With the distributed graph interface, the communication graph is specified in a fully distributed fashion. Each process specifies only the part of the communication graph of which it is aware. Typically, this could be the set of processes from which the process will eventually receive or get data, or the set of processes to which the process will send or put data, or some combination of such edges. Two different interfaces can be used to create a distributed graph topology. [[MPI_DIST_GRAPH_CREATE_ADJACENT]] creates a distributed graph communicator with each process specifying all of its incoming and outgoing (adjacent) edges in the logical communication graph and thus requires minimal communication during creation. [[MPI_DIST_GRAPH_CREATE]] provides full flexibility, and processes can indicate that communication will occur between other pairs of processes.

To provide better possibilities for optimization by the MPI library, the distributed graph constructors permit weighted communication edges and take an `info` argument that can further influence process reordering or other optimizations performed by the MPI library. For example, hints can be provided on how edge weights are to be interpreted, the quality of the reordering, and/or the time permitted for the MPI library to process the graph.

![[API/MPI_DIST_GRAPH_CREATE_ADJACENT]]

[[MPI_DIST_GRAPH_CREATE_ADJACENT]] returns a handle to a new communicator to which the distributed graph topology information is attached. Each process passes all information about the edges to its neighbors in the virtual distributed graph topology. The calling processes must ensure that each edge of the graph is described in the source and in the destination process with the same weights. If there are multiple edges for a given `(source,dest)` pair, then the sequence of the weights of these edges does not matter. The complete communication topology is the combination of all edges shown in the `sources` arrays of all processes in `comm_old`, which must be identical to the combination of all edges shown in the `destinations` arrays. Source and destination ranks must be process ranks of `comm_old`. This allows a fully distributed specification of the communication graph. Isolated processes (i.e., processes with no outgoing or incoming edges, that is, processes that have specified `indegree` and `outdegree` as zero and that thus do not occur as source or destination rank in the graph specification) are allowed.

The call creates a new communicator `comm_dist_graph` of distributed graph topology type to which topology information has been attached. The number of processes in `comm_dist_graph` is identical to the number of processes in `comm_old`. The call to [[MPI_DIST_GRAPH_CREATE_ADJACENT]] is collective.

Weights are specified as non-negative integers and can be used to influence the process remapping strategy and other internal MPI optimizations. For instance, approximate count arguments of later communication calls along specific edges could be used as their edge weights. Multiplicity of edges can likewise indicate more intense communication between pairs of processes. However, the exact meaning of edge weights is not specified by the MPI standard and is left to the implementation. In C or Fortran, an application can supply the special value `MPI_UNWEIGHTED` for the weight array to indicate that all edges have the same (effectively no) weight. In C++, this constant does not exist and the weight arguments may be omitted from the argument list. It is erroneous to supply `MPI_UNWEIGHTED`, or in C++ omit the weight arrays, for some but not all processes of `comm_old`. Note that `MPI_UNWEIGHTED` is not a special weight value; rather it is a special value for the total array argument. In C, one would expect it to be `NULL`. In Fortran, `MPI_UNWEIGHTED` is an object like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[terms#Named Constants|Named Constants]] .

The meaning of the `info` and `reorder` arguments is defined in the description of the following routine.

![[API/MPI_DIST_GRAPH_CREATE]]

[[MPI_DIST_GRAPH_CREATE]] returns a handle to a new communicator to which the distributed graph topology information is attached. Concretely, each process calls the constructor with a set of directed `(source,destination)` communication edges as described below. Every process passes an array of `n` source nodes in the `sources` array. For each source node, a non-negative number of destination nodes is specified in the `degrees` array. The destination nodes are stored in the corresponding consecutive segment of the `destinations` array. More precisely, if the `i`-th node in `sources` is `s`, this specifies `degrees[i]` edges `(s,d)` with `d` of the `j`-th such edge stored in `destinations[degrees[0]+...+degrees[i-1]+j]`. The weight of this edge is stored in `weights[degrees[0]+...+degrees[i-1]+j]`. Both the `sources` and the `destinations` arrays may contain the same node more than once, and the order in which nodes are listed as destinations or sources is not significant. Similarly, different processes may specify edges with the same source and destination nodes. Source and destination nodes must be process ranks of `comm_old`. Different processes may specify different numbers of source and destination nodes, as well as different source to destination edges. This allows a fully distributed specification of the communication graph. Isolated processes (i.e., processes with no outgoing or incoming edges, that is, processes that do not occur as source or destination node in the graph specification) are allowed.

The call creates a new communicator `comm_dist_graph` of distributed graph topology type to which topology information has been attached. The number of processes in `comm_dist_graph` is identical to the number of processes in `comm_old`. The call to [[MPI_Dist_graph_create]] is collective.

If `reorder = false`, all processes will have the same rank in `comm_dist_graph` as in `comm_old`. If `reorder = true` then the MPI library is free to remap to other processes (of `comm_old`) in order to improve communication on the edges of the communication graph. The weight associated with each edge is a hint to the MPI library about the amount or intensity of communication on that edge, and may be used to compute a “best” reordering.

Weights are specified as non-negative integers and can be used to influence the process remapping strategy and other internal MPI optimizations. For instance, approximate count arguments of later communication calls along specific edges could be used as their edge weights. Multiplicity of edges can likewise indicate more intense communication between pairs of processes. However, the exact meaning of edge weights is not specified by the MPI standard and is left to the implementation. In C or Fortran, an application can supply the special value `MPI_UNWEIGHTED` for the weight array to indicate that all edges have the same (effectively no) weight. In C++, this constant does not exist and the weights argument may be omitted from the argument list. It is erroneous to supply `MPI_UNWEIGHTED`, or in C++ omit the weight arrays, for some but not all processes of `comm_old`. Note that `MPI_UNWEIGHTED` is not a special weight value; rather it is a special value for the total array argument. In C, one would expect it to be `NULL`. In Fortran, `MPI_UNWEIGHTED` is an object like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[terms#Named Constants|Named Constants]]

The meaning of the `weights` argument can be influenced by the `info` argument. Info arguments can be used to guide the mapping; possible options include minimizing the maximum number of edges between processes on different SMP nodes, or minimizing the sum of all such edges. An MPI implementation is not obliged to follow specific hints, and it is valid for an MPI implementation not to do any reordering. An MPI implementation may specify more `info` key-value pairs. All processes must specify the same set of key-value `info` pairs.

> [!warning] Advice to implementors

> MPI implementations must document any additionally supported key-value `info` pairs. `MPI_INFO_NULL` is always valid, and may indicate the default creation of the distributed graph topology to the MPI library.
>
> An implementation does not explicitly need to construct the topology from its distributed parts. However, all processes can construct the full topology from the distributed specification and use this in a call to [[MPI_GRAPH_CREATE]] to create the topology. This may serve as a reference implementation of the functionality, and may be acceptable for small communicators. However, a scalable high-quality implementation would save the topology graph in a distributed way.



As for Example [[topol-exB]] , assume there are four processes 0, 1, 2, 3 with the following adjacency matrix and unit edge weights:\

| process | neighbors |
|:-------:|:----------|
|    0    | 1, 3      |
|    1    | 0         |
|    2    | 3         |
|    3    | 0, 2      |

With [[MPI_DIST_GRAPH_CREATE]] , this graph could be constructed in many different ways. One way would be that each process specifies its outgoing edges. The arguments per process would be:\

| process | `n` | `sources` | `degrees` | `destinations` | `weights` |
|:-------:|:----|:----------|:----------|:---------------|:----------|
|    0    | 1   | 0         | 2         | 1,3            | 1,1       |
|    1    | 1   | 1         | 1         | 0              | 1         |
|    2    | 1   | 2         | 1         | 3              | 1         |
|    3    | 1   | 3         | 2         | 0,2            | 1,1       |

Another way would be to pass the whole graph on process 0, which could be done with the following arguments per process:\

| process | `n` | `sources` | `degrees` | `destinations` | `weights`   |
|:-------:|:----|:----------|:----------|:---------------|:------------|
|    0    | 4   | 0,1,2,3   | 2,1,1,2   | 1,3,0,3,0,2    | 1,1,1,1,1,1 |
|    1    | 0   | \-        | \-        | \-             | \-          |
|    2    | 0   | \-        | \-        | \-             | \-          |
|    3    | 0   | \-        | \-        | \-             |             |

In both cases above, the application could supply `MPI_UNWEIGHTED` instead of explicitly providing identical weights.

[[MPI_DIST_GRAPH_CREATE_ADJACENT]] could be used to specify this graph using the following arguments:\

| process | `indegree` | `sources` | `sourceweights` | `outdegree` | `destinations` | `destweights` |
|:--:|:---|:---|:---|:---|:---|:---|
| 0 | 2 | 1,3 | 1,1 | 2 | 1,3 | 1,1 |
| 1 | 1 | 0 | 1 | 1 | 0 | 1 |
| 2 | 1 | 3 | 1 | 1 | 3 | 1 |
| 3 | 2 | 0,2 | 1,1 | 2 | 0,2 | 1,1 |



A two-dimensional PxQ torus where all processes communicate along the dimensions and along the diagonal edges. This cannot be modelled with Cartesian topologies, but can easily be captured with [[MPI_DIST_GRAPH_CREATE]] as shown in the following code. In this example, the communication along the dimensions is twice as heavy as the communication along the diagonals:

    /*
    Input:     dimensions P, Q
    Condition: number of processes equal to P*Q; otherwise only 
               ranks smaller than P*Q participate
    */
    int rank, x, y;
    int sources[1], degrees[1];
    int destinations[8], weights[8];

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    /* get x and y dimension */
    y=rank/P; x=rank%P;

    /* get my communication partners along x dimension */
    destinations[0] = P*y+(x+1)%P; weights[0] = 2;
    destinations[1] = P*y+(P+x-1)%P; weights[1] = 2;

    /* get my communication partners along y dimension */
    destinations[2] = P*((y+1)%Q)+x; weights[2] = 2;
    destinations[3] = P*((Q+y-1)%Q)+x; weights[3] = 2;

    /* get my communication partners along diagonals */
    destinations[4] = P*((y+1)%Q)+(x+1)%P; weights[4] = 1;
    destinations[5] = P*((Q+y-1)%Q)+(x+1)%P; weights[5] = 1;
    destinations[6] = P*((y+1)%Q)+(P+x-1)%P; weights[6] = 1;
    destinations[7] = P*((Q+y-1)%Q)+(P+x-1)%P; weights[7] = 1;

    sources[0] = rank;
    degrees[0] = 8;
    MPI_Dist_graph_create(MPI_COMM_WORLD, 1, sources, degrees, destinations,
                          weights, MPI_INFO_NULL, 1, comm_dist_graph)

### Topology Inquiry Functions



If a topology has been defined with one of the above functions, then the topology information can be looked up using inquiry functions. They all are local calls.

![[API/MPI_TOPO_TEST]]

The function `MPI_TOPO_TEST` returns the type of topology that is assigned to a communicator.

The output value `status` is one of the following:

graph topology

Cartesian topology

distributed graph topology

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

If `comm` is associated with a zero-dimensional Cartesian topology, `coords` is not significant and 0 is returned in `rank`.

![[API/MPI_CART_COORDS]]

The inverse mapping, rank-to-coordinates translation is provided by `MPI_CART_COORDS`.

If `comm` is associated with a zero-dimensional Cartesian topology, `coords` will be unchanged.

![[API/MPI_GRAPH_NEIGHBORS_COUNT]]

![[API/MPI_GRAPH_NEIGHBORS]]

[[MPI_GRAPH_NEIGHBORS_COUNT]] and `MPI_GRAPH_NEIGHBORS` provide adjacency information for a general graph topology.

The returned count and array of neighbors for the queried rank will both include *all* neighbors and reflect the same edge ordering as was specified by the original call to [[MPI_GRAPH_CREATE]] .

Specifically, [[MPI_GRAPH_NEIGHBORS_COUNT]] and [[MPI_GRAPH_NEIGHBORS]] will return values based on the original `index` and `edges` array passed to [[MPI_GRAPH_CREATE]] (assuming that `index[-1]` effectively equals zero):

- The `count` returned from [[MPI_GRAPH_NEIGHBORS_COUNT]] will be (`index[rank]` - `index[rank-1]`).

- The `neighbors` array returned from [[MPI_GRAPH_NEIGHBORS]] will be edges\[index\[rank-1\]\] through edges\[index\[rank\]-1\].

 Assume there are four processes 0, 1, 2, 3 with the following adjacency matrix (note that some neighbors are listed multiple times):\

\|c\|l\| process & neighbors   & 1, 1, 3  1 & 0, 0  2 & 3  3 & 0, 2, 2  

Thus, the input arguments to [[MPI_GRAPH_CREATE]] are:\

ll nnodes = & 4  index = & 3, 5, 6, 9  edges = & 1, 1, 3, 0, 0, 3, 0, 2, 2

Therefore, calling [[MPI_GRAPH_NEIGHBORS_COUNT]] and [[MPI_GRAPH_NEIGHBORS]] for each of the 4 processes will return:\

ccl **Input rank** & **Count** & **Neighbors**   & 3 & 1, 1, 3  1 & 2 & 0, 0  2 & 1 & 3  3 & 3 & 0, 2, 2  

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

[[MPI_DIST_GRAPH_NEIGHBORS_COUNT]] and [[MPI_DIST_GRAPH_NEIGHBORS]] provide adjacency information for a distributed graph topology.

![[API/MPI_DIST_GRAPH_NEIGHBORS_COUNT]]

![[API/MPI_DIST_GRAPH_NEIGHBORS]]

These calls are local. The number of edges into and out of the process returned by [[MPI_DIST_GRAPH_NEIGHBORS_COUNT]] are the total number of such edges given in the call to [[MPI_DIST_GRAPH_CREATE_ADJACENT]] or [[MPI_DIST_GRAPH_CREATE]] (potentially by processes other than the calling process in the case of [[MPI_DIST_GRAPH_CREATE]] ). Multiply defined edges are all counted and returned by [[MPI_DIST_GRAPH_NEIGHBORS]] in some order. If `MPI_UNWEIGHTED` is supplied for `sourceweights` or `destweights` or both, or if `MPI_UNWEIGHTED` was supplied during the construction of the graph then no weight information is returned in that array or those arrays. The only requirement on the order of values in `sources` and `destinations` is that two calls to the routine with same input argument `comm` will return the same sequence of edges. If `maxindegree` or `maxoutdegree` is smaller than the numbers returned by [[MPI_DIST_GRAPH_NEIGHBOR_COUNT]] , then only the first part of the full list is returned. Note, that the order of returned edges does need not to be identical to the order that was provided in the creation of `comm` for the case that [[MPI_DIST_GRAPH_CREATE_ADJACENT]] was used.

> [!warning] Advice to implementors

> Since the query calls are defined to be local, each process needs to store the list of its neighbors with incoming and outgoing edges. Communication is required at the collective [[MPI_DIST_GRAPH_CREATE]] call in order to compute the neighbor lists for each process from the distributed graph specification.

### Cartesian Shift Coordinates



If the process topology is a Cartesian structure,

an

`MPI_SENDRECV` operation is likely to be used along a coordinate direction to perform a shift of data. As input, `MPI_SENDRECV` takes the rank of a source process for the receive, and the rank of a destination process for the send. If the function `MPI_CART_SHIFT` is called for a Cartesian process group, it provides the calling process with the above identifiers, which then can be passed to `MPI_SENDRECV`. The user specifies the coordinate direction and the size of the step (positive or negative). The function is local.

![[API/MPI_CART_SHIFT]]

The direction argument indicates the coordinate dimension to be traversed by the shift. The dimensions are numbered from 0 to `ndims-1`, where `ndims` is the number of dimensions.

Depending on the periodicity of the Cartesian group in the specified coordinate direction, `MPI_CART_SHIFT` provides the identifiers for a circular or an end-off shift. In the case of an end-off shift, the value `MPI_PROC_NULL` may be returned in `rank_source` or `rank_dest`, indicating that the source or the destination for the shift is out of range.

It is erroneous to call [[MPI_CART_SHIFT]] with a direction that is either negative or greater than or equal to the number of dimensions in the Cartesian communicator. This implies that it is erroneous to call [[MPI_CART_SHIFT]] with a `comm` that is associated with a zero-dimensional Cartesian topology.

 The communicator, `comm`, has a two-dimensional, periodic, Cartesian topology associated with it. A two-dimensional array of `REAL`s is stored one element per process, in variable `A`. One wishes to skew this array, by shifting column `i` (vertically, i.e., along the column) by `i` steps.

    ....
    C find process rank
          CALL MPI_COMM_RANK(comm, rank, ierr)
    C find Cartesian coordinates
          CALL MPI_CART_COORDS(comm, rank, maxdims, coords, ierr)
    C compute shift source and destination
          CALL MPI_CART_SHIFT(comm, 0, coords(2), source, dest, ierr)
    C skew array
          CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, dest, 0, source, 0, comm,
         +                          status, ierr)

> [!note] Advice to users

> In Fortran, the dimension indicated by `DIRECTION = i` has `DIMS(i+1)` nodes, where `DIMS` is the array that was used to create the grid. In C, the dimension indicated by `direction = i` is the dimension specified by `dims[i]`.

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
