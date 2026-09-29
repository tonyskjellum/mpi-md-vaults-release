# Virtual Topologies for MPI Processes



## Introduction

This chapter discusses the MPI *virtual topology* mechanism. A *virtual topology* is an extra, optional attribute that one can give to an intra-communicator; *virtual topologies* cannot be added to inter-communicators. A *virtual topology* can provide a convenient naming mechanism for the MPI processes of a group (within a communicator), and additionally, may assist the runtime system in mapping the processes onto hardware.

As stated in Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] , a group in MPI is an ordered set of `n` process identifiers (henceforth MPI processes). Each MPI process in the group is assigned a rank between `0` and `n-1`. In many parallel applications, a linear assignment of integer ranks to the MPI processes does not adequately reflect the logical communication pattern of the MPI processes (which is usually determined by the underlying problem geometry and the numerical algorithm used). Often the MPI processes are arranged in topological patterns such as two- or three-dimensional grids. More generally, the logical MPI process arrangement is described by a graph. In this chapter we will refer to this logical MPI process arrangement as the *virtual topology*.

A clear distinction must be made between the *virtual topology* and the topology of the underlying, physical hardware. The *virtual topology* can be exploited by the system in the assignment of processes to physical processors, if this helps to improve the communication performance on a given machine. How this mapping is done, however, is outside the scope of MPI. The description of the *virtual topology*, on the other hand, depends only on the application, and is machine-independent. The functions that are described in this chapter deal with machine-independent mapping and communication on *virtual topologies*.

> [!tip] Rationale

> Though physical mapping is not discussed, the existence of the *virtual topology* information may be used as advice by the runtime system. There are well-known techniques for mapping grid/torus structures to hardware topologies such as hypercubes or grids. For more complicated graph structures good heuristics often yield nearly optimal results . On the other hand, if there is no way for the user to specify the logical process arrangement as a *virtual topology*, a random mapping is most likely to result. On some machines, this will lead to unnecessary contention in the interconnection network. Some details about predicted and measured performance improvements that result from good process-to-processor mapping on wormhole-routing architectures can be found in .
>
> Besides possible performance benefits, the *virtual topology* can function as a convenient, process-naming structure, with significant benefits for program readability and notational power in message-passing programming.

## Virtual Topologies

The communication pattern of a set of MPI processes can be represented by a graph. The nodes represent MPI processes, and the edges connect MPI processes that communicate with each other. MPI provides message-passing between any pair of MPI processes in a group. There is no requirement for opening a channel explicitly. Therefore, a “missing link” in the user-defined graph of MPI processes does not prevent the corresponding MPI processes from exchanging messages. It means rather that this connection is neglected in the *virtual topology*. This strategy implies that the *virtual topology* gives no convenient way of naming this pathway of communication. Another possible consequence is that an automatic mapping tool (if one exists for the runtime environment) will not take account of this edge when mapping.

Specifying the *virtual topology* in terms of a graph is sufficient for all applications. However, in many applications the graph structure is regular, and the detailed set-up of the graph would be inconvenient for the user and might be less efficient at run time. A large fraction of all parallel applications use MPI process topologies like rings, two- or higher-dimensional grids, or tori. These structures are completely defined by the number of dimensions and the numbers of MPI processes in each coordinate direction. Also, the mapping of grids and tori is generally an easier problem than that of general graphs. Thus, it is desirable to address these cases explicitly.

The coordinates of MPI processes in a Cartesian structure begin their numbering at $`0`$. Row-major numbering is always used for the MPI processes in a Cartesian structure. This means that, for example, for four MPI processes in a $`(2 \times 2)`$ grid, the relationship between their ranks in the group and their coordinates in the *virtual topology* is as follows:

|              |        |
|:-------------|:-------|
| coord (0,0): | rank 0 |
| coord (0,1): | rank 1 |
| coord (1,0): | rank 2 |
| coord (1,1): | rank 3 |

## Embedding in MPI

The support for *virtual topologies* as defined in this chapter is consistent with other parts of MPI, and, whenever possible, makes use of functions that are defined elsewhere. Topology information is associated with communicators. It is added to communicators using the caching mechanism described in Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] .

Information representing a *virtual topology* may be added to a communicator at the time of its creation. If a communicator creation function adds information representing a *virtual topology* to the output communicator it creates, then it either propagates the topology representation from the input communicator to the output communicator, or adds a new topology representation generated from the input parameters that describe a *virtual topology*. The description of every MPI communicator creation function explicitly states how topology information is handled. Communicator creation functions that create new topology representations are described in [[topol#Topology Constructors|Topology Constructors]] .

## Overview of the Functions



MPI supports three types of *virtual topology*: **Cartesian**, **graph**, and **distributed graph**. The function [[MPI_CART_CREATE]] can be used to create Cartesian topologies, the function [[MPI_GRAPH_CREATE]] can be used to create graph topologies, and the functions [[MPI_DIST_GRAPH_CREATE_ADJACENT]] and [[MPI_DIST_GRAPH_CREATE]] can be used to create distributed graph topologies. These topology creation functions are collective. As with other collective calls, the program must be written to work correctly, whether the call synchronizes or not.

The above topology creation functions take as input an existing communicator `comm_old`, which defines the set of MPI processes on which the topology is to be mapped. For [[MPI_GRAPH_CREATE]] and [[MPI_CART_CREATE]] , all input arguments must have identical values on all MPI processes of the group of `comm_old`. When calling [[MPI_GRAPH_CREATE]] , each MPI process specifies all nodes and edges in the graph. In contrast, the functions [[MPI_DIST_GRAPH_CREATE_ADJACENT]] or [[MPI_DIST_GRAPH_CREATE]] are used to specify the graph in a distributed fashion, whereby each MPI process only specifies a subset of the edges in the graph such that the entire graph structure is defined collectively across the set of MPI processes. Therefore the MPI processes provide different values for the arguments specifying the graph. However, all MPI processes must give the same value for `reorder` and the `info` argument. In all cases, a new communicator `comm_topol` is created that carries the topological structure as cached information (see Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] ). In analogy to function [[MPI_COMM_CREATE]] , no cached information propagates from `comm_old` to `comm_topol`.

[[MPI_CART_CREATE]] can be used to describe Cartesian structures of arbitrary dimension. For each coordinate direction one specifies whether the MPI process structure is periodic or not. Note that an $`n`$-dimensional hypercube is an $`n`$-dimensional torus with two processes per coordinate direction. Thus, special support for hypercube structures is not necessary. The local auxiliary function [[MPI_DIMS_CREATE]] can be used to compute a balanced distribution of MPI processes among a given number of dimensions.

MPI defines functions to query a communicator for topology information. The function [[MPI_TOPO_TEST]] is used to query for the type of topology associated with a communicator. Depending on the topology type, different information can be extracted. For a graph topology, the functions [[MPI_GRAPHDIMS_GET]] and [[MPI_GRAPH_GET]] retrieve the graph topology information that is associated with the communicator. Additionally, the functions [[MPI_GRAPH_NEIGHBORS_COUNT]] and [[MPI_GRAPH_NEIGHBORS]] can be used to obtain the neighbors of an arbitrary node in the graph. For a distributed graph topology, the functions [[MPI_DIST_GRAPH_NEIGHBORS_COUNT]] and [[MPI_DIST_GRAPH_NEIGHBORS]] can be used to obtain the neighbors of the calling MPI process. For a Cartesian topology, the function [[MPI_CARTDIM_GET]] returns the number of dimensions and [[MPI_CART_GET]] returns the numbers of MPI processes in each dimension and periodicity of the associated Cartesian topology. Additionally, the functions [[MPI_CART_RANK]] and [[MPI_CART_COORDS]] translate Cartesian coordinates into a group rank, and vice-versa. The function [[MPI_CART_SHIFT]] provides the information needed to communicate with neighbors along a Cartesian dimension. All of these query functions are local.

For Cartesian topologies, the function [[MPI_CART_SUB]] can be used to extract a Cartesian subspace (analogous to [[MPI_COMM_SPLIT]] ). This function is collective over the input communicator’s group.

The two additional functions, [[MPI_GRAPH_MAP]] and [[MPI_CART_MAP]] , are, in general, not called by the user directly. However, together with the communicator manipulation functions presented in Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] , they are sufficient to implement all other topology functions. Section [[topol#Low-Level Topology Functions|Low-Level Topology Functions]] outlines such an implementation.

The neighborhood collective communication routines [[MPI_NEIGHBOR_ALLGATHER]] , [[MPI_NEIGHBOR_ALLGATHERV]] , [[MPI_NEIGHBOR_ALLTOALL]] , [[MPI_NEIGHBOR_ALLTOALLV]] , and [[MPI_NEIGHBOR_ALLTOALLW]] communicate with the nearest neighbors on the topology associated with the communicator. The nonblocking variants are [[MPI_INEIGHBOR_ALLGATHER]] , [[MPI_INEIGHBOR_ALLGATHERV]] , [[MPI_INEIGHBOR_ALLTOALL]] , [[MPI_INEIGHBOR_ALLTOALLV]] , and [[MPI_INEIGHBOR_ALLTOALLW]] .

## Topology Constructors



### Cartesian Constructor



![[API/MPI_CART_CREATE]]

[[MPI_CART_CREATE]] returns a handle to a new communicator to which the Cartesian topology information is attached. If `reorder``= false` then the rank of each MPI process in the group of the new communicator is identical to its rank in the group of the old communicator. If `reorder``= true` then the procedure may reorder the ranks of the MPI processes (possibly so as to choose a good embedding of the *virtual topology* onto the physical machine). If the total size of the Cartesian grid is smaller than the size of the group of `comm_old`, then some MPI processes return `MPI_COMM_NULL`, in analogy to [[MPI_COMM_SPLIT]] . If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative. [[MPI_CART_CREATE]] will associate information representing a Cartesian topology with the specified number of dimensions, numbers of MPI processes in each coordinate direction, and periodicity with the new communicator.

### Cartesian Convenience Function: [[MPI_DIMS_CREATE]]

For Cartesian topologies, the function [[MPI_DIMS_CREATE]] helps the user select a balanced distribution of MPI processes per coordinate direction, depending on the number of MPI processes in the group to be balanced and optional constraints that can be specified by the user.

![[API/MPI_DIMS_CREATE]]

The entries in the array `dims` are set to describe a Cartesian grid with `ndims` dimensions and a total of `nnodes` nodes. The dimensions are set to be as close to each other as possible, using an appropriate divisibility algorithm. The caller may further constrain the operation of this routine by specifying elements of array `dims`. If `dims[i]` is set to a positive number, the routine will not modify the number of nodes in dimension `i`; only those entries where `dims[i]``= 0` are modified by the call.

Negative input values of `dims[i]` are erroneous. An error will occur if `nnodes` is not a multiple of
``` math
\prod_{i, \textsf{ {}dims}[i]\neq 0} \texttt{dims[$i$]}.
```

For `dims[i]` set by the call, `dims[i]` will be ordered in nonincreasing order. Array `dims` is suitable for use as input to routine [[MPI_CART_CREATE]] . [[MPI_DIMS_CREATE]] is local. If `ndims` is zero and `nnodes` is one, [[MPI_DIMS_CREATE]] returns `MPI_SUCCESS`.

 The use of the array argument `dims` in [[MPI_DIMS_CREATE]] .

|             |                                        |                |
|:------------|:---------------------------------------|:---------------|
| `dims`      | function call                          | `dims`         |
| before call |                                        | on return      |
| (0,0)       | [[MPI_DIMS_CREATE]] `(6, 2, dims)` | (3,2)          |
| (0,0)       | [[MPI_DIMS_CREATE]] `(7, 2, dims)` | (7,1)          |
| (0,3,0)     | [[MPI_DIMS_CREATE]] `(6, 3, dims)` | (2,3,1)        |
| (0,3,0)     | [[MPI_DIMS_CREATE]] `(7, 3, dims)` | erroneous call |

### Graph Constructor



![[API/MPI_GRAPH_CREATE]]

[[MPI_GRAPH_CREATE]] returns a handle to a new communicator to which the graph topology information is attached. If `reorder``= false` then the rank of each MPI process in the group of the new communicator is identical to its rank in the group of the old communicator. If `reorder``= true` then the procedure may reorder the ranks of the MPI processes. If the number of nodes in the graph (`nnodes`) is smaller than the size of the group of `comm_old`, then `MPI_COMM_NULL` is returned by some MPI processes, in analogy to [[MPI_CART_CREATE]] and [[MPI_COMM_SPLIT]] . If the graph is empty, i.e., `nnodes``= 0`, then `MPI_COMM_NULL` is returned in all MPI processes. The call is erroneous if it specifies a graph that is larger than the group size of the input communicator.

The three parameters `nnodes`, `index` and `edges` define the graph structure. `nnodes` is the number of nodes of the graph. The nodes are numbered from `0` to `nnodes-1`. The `i`-th entry of array `index` stores the total number of neighbors of the first `i` graph nodes. The lists of neighbors of nodes `0, 1, ..., nnodes-1` are stored in consecutive locations in array `edges`. The array `edges` is a flattened representation of the edge lists. The total number of entries in `index` is `nnodes` and the total number of entries in `edges` is equal to the number of graph edges.

The definitions of the arguments `nnodes`, `index`, and `edges` are illustrated with the following simple example.



Specification of the adjacency matrix for [[MPI_GRAPH_CREATE]] .

Assume there are four MPI processes with ranks 0, 1, 2, 3 in the input communicator with the following adjacency matrix:

| MPI process | neighbors |
|:-----------:|:----------|
|      0      | 1, 3      |
|      1      | 0         |
|      2      | 3         |
|      3      | 0, 2      |

Then, the input arguments are:

|          |                  |
|:---------|:-----------------|
| nnodes = | 4                |
| index =  | 2, 3, 4, 6       |
| edges =  | 1, 3, 0, 3, 0, 2 |

Thus, in C, `index[0]` is the degree of node zero, and `index[i] - index[i-1]` is the degree of node `i, i=1, ..., nnodes-1`; the list of neighbors of node zero is stored in `edges[j]`, for $`\texttt{0} \leq \texttt{j} \leq \texttt{index[0]}-\texttt{1}`$ and the list of neighbors of node `i`, $`\texttt{i} > \texttt{0}`$, is stored in `edges[j]`, $`\texttt{index[i-1]} \leq \texttt{j} \leq 
\texttt{index[i]}-\texttt{1}`$.

In Fortran, `index(1)` is the degree of node zero, and `index(i+1) - index(i)` is the degree of node `i, i=1, ..., nnodes-1`; the list of neighbors of node zero is stored in `edges(j)`, for $`\texttt{1} \leq \texttt{j} \leq \texttt{index(1)}`$ and the list of neighbors of node `i`, $`\texttt{i} > \texttt{0}`$, is stored in `edges(j)`, $`\texttt{index(i)+1} \leq \texttt{j} \leq 
\texttt{index(i+1)}`$.

A single MPI process is allowed to be defined multiple times in the list of neighbors of an MPI process (i.e., there may be multiple edges between two MPI processes). An MPI process is also allowed to be a neighbor to itself (i.e., a self loop in the graph). The adjacency matrix is allowed to be nonsymmetric.

> [!note] Advice to users

> Performance implications of using multiple edges or a nonsymmetric adjacency matrix are not defined. The definition of a node-neighbor edge does not imply a direction of the communication.

> [!warning] Advice to implementors

> The following topology information is likely to be stored with a communicator:
>
> - Type of topology (Cartesian/graph)
>
> - For a Cartesian topology:
>
>   1.  `ndims` (number of dimensions)
>
>   2.  `dims` (numbers of MPI processes per coordinate direction)
>
>   3.  `periods` (periodicity information)
>
>   4.  `own_position` (own position in grid, could also be computed from rank and dims)
>
> - For a graph topology:
>
>   1.  `index`
>
>   2.  `edges`
>
>   which are the arrays defining the graph structure.
>
> For a graph structure the number of nodes is equal to the number of MPI processes in the group. Therefore, the number of nodes does not have to be stored explicitly. An additional zero entry at the start of array `index` simplifies access to the topology information.

### Distributed Graph Constructor



[[MPI_GRAPH_CREATE]] requires that each MPI process passes the full (global) communication graph to the call. This limits the scalability of this constructor. With the distributed graph interface, the communication graph is specified in a fully distributed fashion. Each MPI process specifies only the part of the communication graph of which it is aware. Typically, this could be the set of MPI processes from which the MPI process will eventually receive or get data, or the set of MPI processes to which the MPI process will send or put data, or some combination of such edges. Two different interfaces can be used to create a distributed graph topology. [[MPI_DIST_GRAPH_CREATE_ADJACENT]] creates a distributed graph communicator with each MPI process specifying each of its incoming and outgoing (adjacent) edges in the logical communication graph and thus requires minimal communication during creation. [[MPI_DIST_GRAPH_CREATE]] provides full flexibility such that any MPI process can indicate that communication will occur between any pair of MPI processes in the graph.

To provide better possibilities for optimization by the MPI library, the distributed graph constructors permit weighted communication edges and take an `info` argument that can further influence process reordering or other optimizations performed by the MPI library. For example, hints can be provided on how edge weights are to be interpreted, the quality of the reordering, and/or the time permitted for the MPI library to process the graph.

![[API/MPI_DIST_GRAPH_CREATE_ADJACENT]]

[[MPI_DIST_GRAPH_CREATE_ADJACENT]] returns a handle to a new communicator to which the distributed graph topology information is attached. Each MPI process passes all information about its incoming and outgoing edges in the virtual distributed graph topology. The calling MPI processes must ensure that each edge of the graph is described in the source and in the destination process with the same weights. If there are multiple edges for a given (`source`,`dest`) pair, then the sequence of the weights of these edges does not matter. The complete communication topology is the combination of all edges shown in the `sources` arrays of all MPI processes in `comm_old`, which must be identical to the combination of all edges shown in the `destinations` arrays. Source and destination MPI processes must be specified by their rank in the group of `comm_old`. This allows a fully distributed specification of the communication graph. Isolated MPI processes (i.e., MPI processes with no outgoing or incoming edges, that is, MPI processes that have specified `indegree` and `outdegree` as zero and thus do not occur as source or destination in the graph specification) are allowed.

The call creates a new communicator `comm_dist_graph` of distributed graph topology type to which topology information has been attached. The number of MPI processes in `comm_dist_graph` is identical to the number of MPI processes in `comm_old`. The call to [[MPI_DIST_GRAPH_CREATE_ADJACENT]] is collective.

Weights are specified as nonnegative integers and can be used to influence the process mapping strategy and other internal MPI optimizations. For instance, approximate count arguments of later communication calls along specific edges could be used as their edge weights. Multiplicity of edges can likewise indicate more intense communication between pairs of MPI processes. However, the exact meaning of edge weights is not specified by the MPI standard and is left to the implementation. In C or Fortran, an application can supply the special value `MPI_UNWEIGHTED` for the weight array to indicate that all edges have the same (effectively no) weight. It is erroneous to supply `MPI_UNWEIGHTED` for some but not all MPI processes of `comm_old`. If the graph is weighted but `indegree` or `outdegree` is zero, then `MPI_WEIGHTS_EMPTY` or any arbitrary array may be passed to `sourceweights` or `destweights` respectively. Note that `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are not special weight values; rather they are special values for the total array argument. In Fortran, `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are objects like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[terms#Named Constants|Named Constants]] .

> [!note] Advice to users

> In the case of an empty weights array argument passed while constructing a weighted graph, one should not pass `NULL` because the value of `MPI_UNWEIGHTED` may be equal to `NULL`. The value of this argument would then be indistinguishable from `MPI_UNWEIGHTED` to the implementation. In this case `MPI_WEIGHTS_EMPTY` should be used instead.

> [!warning] Advice to implementors

> It is recommended that `MPI_UNWEIGHTED` not be implemented as `NULL`.

> [!tip] Rationale

> To ensure backward compatibility, `MPI_UNWEIGHTED` may still be implemented as `NULL`. See .

The meaning of the `info` and `reorder` arguments is defined in the description of the following routine.

![[API/MPI_DIST_GRAPH_CREATE]]

[[MPI_DIST_GRAPH_CREATE]] returns a handle to a new communicator to which the distributed graph topology information is attached. Concretely, each MPI process calls the constructor with a set of directed (`source`,`destination`) communication edges as described below. Every MPI process passes an array of `n` source nodes in the `sources` array. For each source node, a nonnegative number of destination nodes is specified in the `degrees` array. The destination nodes are stored in the corresponding consecutive segment of the `destinations` array. More precisely, if the `i`-th node in `sources` is `s`, this specifies `degrees[i]` edges `(s,d)` with `d` of the `j`-th such edge stored in `destinations[degrees[0]+`$`...`$`+degrees[i-1]+j]`. The weight of this edge is stored in `weights[degrees[0]+`$`...`$`+degrees[i-1]+j]`. Both the `sources` and the `destinations` arrays may contain the same node more than once, and the order in which nodes are listed as destinations or sources is not significant. Similarly, different processes may specify edges with the same source and destination nodes. Source and destination nodes must be specified by their rank in the group of `comm_old`. Different MPI processes may specify different numbers of source and destination nodes, as well as different source to destination edges. This allows a fully distributed specification of the communication graph. Isolated MPI processes (i.e., MPI processes with no outgoing or incoming edges, that is, MPI processes that do not occur as source or destination node in the graph specification) are allowed.

The call creates a new communicator `comm_dist_graph` of distributed graph topology type to which topology information has been attached. The number of MPI processes in `comm_dist_graph` is identical to the number of MPI processes in `comm_old`. The call to [[MPI_DIST_GRAPH_CREATE]] is collective.

If `reorder``= false`, all MPI processes will have the same rank in `comm_dist_graph` as in `comm_old`. If `reorder``= true` then the MPI library is free to remap to other MPI processes (of `comm_old`) in order to improve communication on the edges of the communication graph. The weight associated with each edge is a hint to the MPI library about the amount or intensity of communication on that edge, and may be used to compute a “best” reordering.

Weights are specified as nonnegative integers and can be used to influence the MPI process remapping strategy and other internal MPI optimizations. For instance, approximate count arguments of later communication calls along specific edges could be used as their edge weights. Multiplicity of edges can likewise indicate more intense communication between pairs of MPI processes. However, the exact meaning of edge weights and multiplicity of edges is not specified by the MPI standard and is left to the implementation. In C or Fortran, an application can supply the special value `MPI_UNWEIGHTED` for the weight array to indicate that all edges have the same (effectively no) weight. It is erroneous to supply `MPI_UNWEIGHTED` for some but not all MPI processes of `comm_old`. If the graph is weighted but `n``= 0`, then `MPI_WEIGHTS_EMPTY` or any arbitrary array may be passed to weights. Note that `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are not special weight values; rather they are special values for the total array argument. In Fortran, `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are objects like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[terms#Named Constants|Named Constants]] .

> [!note] Advice to users

> In the case of an empty weights array argument passed while constructing a weighted graph, one should not pass `NULL` because the value of `MPI_UNWEIGHTED` may be equal to `NULL`. The value of this argument would then be indistinguishable from `MPI_UNWEIGHTED` to the implementation. `MPI_WEIGHTS_EMPTY` should be used instead.

> [!warning] Advice to implementors

> It is recommended that `MPI_UNWEIGHTED` not be implemented as `NULL`.

> [!tip] Rationale

> To ensure backward compatibility, `MPI_UNWEIGHTED` may still be implemented as `NULL`. See .

The meaning of the `weights` argument can be influenced by the `info` argument. The info argument can be used to guide the mapping of MPI processes to the hardware; possible options include minimizing the maximum number of edges between processes on different SMP nodes, or minimizing the sum of all such edges. As described in [[misc#The Info Object|The Info Object]] , an MPI implementation is not obliged to follow specific hints, and it is valid for an MPI implementation not to do any reordering. An MPI implementation may specify more `info` (`key`,`value`) pairs. All MPI processes must specify the same set of (`key`,`value`) `info` pairs.

> [!warning] Advice to implementors

> MPI implementations must document every additionally supported (`key`,`value`) `info` pair. `MPI_INFO_NULL` is always valid, and may indicate the default creation of the distributed graph topology to the MPI library.
>
> An implementation does not explicitly need to construct the topology from its distributed parts. However, all MPI processes can construct the full topology from the distributed specification and use this in a call to [[MPI_GRAPH_CREATE]] to create the topology. This may serve as a reference implementation of the functionality, and may be acceptable for small communicators. However, a scalable high-quality implementation would save the topology graph in a distributed way.



Several ways to specify the adjacency matrix for [[MPI_DIST_GRAPH_CREATE]] and [[MPI_DIST_GRAPH_CREATE_ADJACENT]] .

As for Example [[topol-exB]] , assume there are four MPI processes with ranks 0, 1, 2, 3 in the input communicator with the following adjacency matrix and unit edge weights:

| MPI process | neighbors |
|:-----------:|:----------|
|      0      | 1, 3      |
|      1      | 0         |
|      2      | 3         |
|      3      | 0, 2      |

With [[MPI_DIST_GRAPH_CREATE]] , this graph could be constructed in many different ways. One way would be that each MPI process specifies its outgoing edges. The arguments per MPI process would be:

| MPI process | `n` | `sources` | `degrees` | `destinations` | `weights` |
|:-----------:|:----|:----------|:----------|:---------------|:----------|
|      0      | 1   | 0         | 2         | 1,3            | 1,1       |
|      1      | 1   | 1         | 1         | 0              | 1         |
|      2      | 1   | 2         | 1         | 3              | 1         |
|      3      | 1   | 3         | 2         | 0,2            | 1,1       |

Another way would be to pass the whole graph on MPI process with rank `0` in the input communicator, which could be done with the following arguments per MPI process:

| MPI process | `n` | `sources` | `degrees` | `destinations` | `weights`   |
|:-----------:|:----|:----------|:----------|:---------------|:------------|
|      0      | 4   | 0,1,2,3   | 2,1,1,2   | 1,3,0,3,0,2    | 1,1,1,1,1,1 |
|      1      | 0   | \-        | \-        | \-             | \-          |
|      2      | 0   | \-        | \-        | \-             | \-          |
|      3      | 0   | \-        | \-        | \-             |             |

In both cases above, the application could supply `MPI_UNWEIGHTED` instead of explicitly providing identical weights.

[[MPI_DIST_GRAPH_CREATE_ADJACENT]] could be used to specify this graph using the following arguments:

| MPI process | `indegree` | `sources` | `sourceweights` | `outdegree` | `destinations` | `destweights` |
|:--:|:---|:---|:---|:---|:---|:---|
| 0 | 2 | 1,3 | 1,1 | 2 | 1,3 | 1,1 |
| 1 | 1 | 0 | 1 | 1 | 0 | 1 |
| 2 | 1 | 3 | 1 | 1 | 3 | 1 |
| 3 | 2 | 0,2 | 1,1 | 2 | 0,2 | 1,1 |



Cartesian grid plus diagonals specified with [[MPI_DIST_GRAPH_CREATE]] .

A two-dimensional $`P \times Q`$ torus where all MPI processes communicate along the dimensions and along the diagonal edges cannot be modeled with Cartesian topologies, but can easily be captured with [[MPI_DIST_GRAPH_CREATE]] as shown in the following code. In this example, the communication along the dimensions is twice as heavy as the communication along the diagonals:

``` [MPI]C
/*
Input:     dimensions P, Q
Condition: number of MPI processes equal to P*Q
*/
int rank, x, y;
int sources[1], degrees[1];
int destinations[8], weights[8];
MPI_Comm comm_dist_graph;

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
                      weights, MPI_INFO_NULL, 1, &comm_dist_graph);
```

### Topology Inquiry Functions



If a *virtual topology* has been defined with one of the above functions, then the topology information can be looked up using inquiry functions. They all are local calls.

![[API/MPI_TOPO_TEST]]

The function [[MPI_TOPO_TEST]] returns the type of topology that is associated with a communicator.

The output value `status` is one of the following:

graph topology

Cartesian topology

distributed graph topology

no topology

![[API/MPI_GRAPHDIMS_GET]]

The functions [[MPI_GRAPHDIMS_GET]] and [[MPI_GRAPH_GET]] retrieve the graph topology information that is associated with the communicator. The information provided by [[MPI_GRAPHDIMS_GET]] can be used to dimension the vectors `index` and `edges` correctly for the following call to [[MPI_GRAPH_GET]] .

![[API/MPI_GRAPH_GET]]

![[API/MPI_CARTDIM_GET]]

The functions [[MPI_CARTDIM_GET]] and [[MPI_CART_GET]] return the Cartesian topology information that is associated with the communicator. If `comm` is associated with a zero-dimensional Cartesian topology, [[MPI_CARTDIM_GET]] returns `ndims``= 0` and [[MPI_CART_GET]] will keep all output arguments unchanged.

![[API/MPI_CART_GET]]

If `maxdims` in a call to [[MPI_CART_GET]] is less than the number of dimensions of the Cartesian topology associated with the communicator `comm`, the outcome is unspecified.

![[API/MPI_CART_RANK]]

For a communicator with an associated Cartesian topology, the function [[MPI_CART_RANK]] translates the logical coordinates of an MPI process to the corresponding rank in the group of the communicator. For dimension `i` with `periods(i) = true`, if the coordinate, `coords(i)`, is out of range, that is, `coords(i) `$`<`$` 0` or `coords(i) `$`\geq`$` dims(i)`, it is shifted back to the interval `0 `$`\leq`$` coords(i) `$`<`$` dims(i)` automatically. Out-of-range coordinates are erroneous for nonperiodic dimensions.

If `comm` is associated with a zero-dimensional Cartesian topology, `coords` is not significant and 0 is returned in `rank`.

![[API/MPI_CART_COORDS]]

The inverse mapping, rank-to-coordinates translation is provided by [[MPI_CART_COORDS]] . If `comm` is associated with a zero-dimensional Cartesian topology, `coords` will be unchanged. If `maxdims` is less than the number of dimensions of the Cartesian topology associated with the communicator `comm`, the outcome is unspecified.

![[API/MPI_GRAPH_NEIGHBORS_COUNT]]

![[API/MPI_GRAPH_NEIGHBORS]]

[[MPI_GRAPH_NEIGHBORS_COUNT]] and [[MPI_GRAPH_NEIGHBORS]] provide adjacency information for a graph topology. The returned count and array of neighbors for the queried rank will both include *all* neighbors and reflect the same edge ordering as was specified by the original call to [[MPI_GRAPH_CREATE]] . Specifically, [[MPI_GRAPH_NEIGHBORS_COUNT]] and [[MPI_GRAPH_NEIGHBORS]] will return values based on the original `index` and `edges` array passed to [[MPI_GRAPH_CREATE]] (for the purpose of this example, we assume that `index[-1]` is zero):

- The number of neighbors (`nneighbors`) returned from [[MPI_GRAPH_NEIGHBORS_COUNT]] will be (`index[rank]` - `index[rank-1]`).

- The `neighbors` array returned from [[MPI_GRAPH_NEIGHBORS]] will be `edges[index[rank-1]]` through `edges[index[rank]-1]`.



Inquiry of graph topology information.

Assume there are four MPI processes with ranks 0, 1, 2, 3 in the input communicator with the following adjacency matrix (note that some neighbors are listed multiple times):

\|c\|l\| MPI process & neighbors   & 1, 1, 3  1 & 0, 0  2 & 3  3 & 0, 2, 2  

Thus, the input arguments to [[MPI_GRAPH_CREATE]] are:

ll nnodes = & 4  index = & 3, 5, 6, 9  edges = & 1, 1, 3, 0, 0, 3, 0, 2, 2

Therefore, calling [[MPI_GRAPH_NEIGHBORS_COUNT]] and [[MPI_GRAPH_NEIGHBORS]] for each of the four MPI processes will return:

ccl & &   & 3 & 1, 1, 3  1 & 2 & 0, 0  2 & 1 & 3  3 & 3 & 0, 2, 2  



Using a communicator with an associated graph topology that represents a shuffle-exchange network.

Suppose that `comm` is a communicator with a shuffle-exchange topology. The group has $`2^n`$ members. Each MPI process is labeled by $`a_1 , ..., a_n`$ with $`a_i \in
\{0,1\}`$, and has three neighbors: exchange($`a_1 , ..., a_n ) = a_1 ,..., a_{n-1}, \bar{a}_n`$ ($`\bar{a} =
1-a`$), shuffle($`a_1 , ..., a_n )= a_2 , ...,
a_{n}, a_1`$, and unshuffle($`a_1 , ..., a_n ) = a_n , a_1 , ... , a_{n-1}`$. The graph adjacency list is illustrated below for $`n=3`$.

<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;"><strong>node</strong></td>
<td style="text-align: center;"><span><strong>exchange</strong></span></td>
<td style="text-align: center;"><span><strong>shuffle</strong></span></td>
<td style="text-align: center;"><span><strong>unshuffle</strong></span></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">neighbors(1)</td>
<td style="text-align: center;">neighbors(2)</td>
<td style="text-align: center;">neighbors(3)</td>
</tr>
<tr>
<td style="text-align: center;">0</td>
<td style="text-align: center;">(000)</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">0</td>
</tr>
<tr>
<td style="text-align: center;">1</td>
<td style="text-align: center;">(001)</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">2</td>
<td style="text-align: center;">4</td>
</tr>
<tr>
<td style="text-align: center;">2</td>
<td style="text-align: center;">(010)</td>
<td style="text-align: center;">3</td>
<td style="text-align: center;">4</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">3</td>
<td style="text-align: center;">(011)</td>
<td style="text-align: center;">2</td>
<td style="text-align: center;">6</td>
<td style="text-align: center;">5</td>
</tr>
<tr>
<td style="text-align: center;">4</td>
<td style="text-align: center;">(100)</td>
<td style="text-align: center;">5</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">2</td>
</tr>
<tr>
<td style="text-align: center;">5</td>
<td style="text-align: center;">(101)</td>
<td style="text-align: center;">4</td>
<td style="text-align: center;">3</td>
<td style="text-align: center;">6</td>
</tr>
<tr>
<td style="text-align: center;">6</td>
<td style="text-align: center;">(110)</td>
<td style="text-align: center;">7</td>
<td style="text-align: center;">5</td>
<td style="text-align: center;">3</td>
</tr>
<tr>
<td style="text-align: center;">7</td>
<td style="text-align: center;">(111)</td>
<td style="text-align: center;">6</td>
<td style="text-align: center;">7</td>
<td style="text-align: center;">7</td>
</tr>
</tbody>
</table>

Suppose that the communicator `comm` has this topology associated with it. The following code fragment cycles through the three types of neighbors and performs an appropriate permutation for each.

``` [MPI]Fortran
!  assume: each MPI process has stored a real number A.
!  extract neighborhood information
CALL MPI_COMM_RANK(comm, myrank, ierr)
CALL MPI_GRAPH_NEIGHBORS(comm, myrank, 3, neighbors, ierr)
!  perform exchange permutation
CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(1), 0, &
                          neighbors(1), 0, comm, status, ierr)
!  perform shuffle permutation
CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(2), 0, &
                          neighbors(3), 0, comm, status, ierr)
!  perform unshuffle permutation
CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(3), 0, &
                          neighbors(2), 0, comm, status, ierr)
```

[[MPI_DIST_GRAPH_NEIGHBORS_COUNT]] and [[MPI_DIST_GRAPH_NEIGHBORS]] provide adjacency information for a distributed graph topology.

![[API/MPI_DIST_GRAPH_NEIGHBORS_COUNT]]

![[API/MPI_DIST_GRAPH_NEIGHBORS]]

These calls are local. The number of edges into and out of the MPI process returned by [[MPI_DIST_GRAPH_NEIGHBORS_COUNT]] are the total number of such edges given in the call to [[MPI_DIST_GRAPH_CREATE_ADJACENT]] or [[MPI_DIST_GRAPH_CREATE]] (potentially by MPI processes other than the calling MPI process in the case of [[MPI_DIST_GRAPH_CREATE]] ). Multiply-defined edges are all counted and returned by [[MPI_DIST_GRAPH_NEIGHBORS]] in some order. If `MPI_UNWEIGHTED` is supplied for `sourceweights` or `destweights` or both, or if `MPI_UNWEIGHTED` was supplied during the construction of the graph then no weight information is returned in that array or those arrays. If the communicator was created with [[MPI_DIST_GRAPH_CREATE_ADJACENT]] then for each MPI process in `comm`, the order of the values in `sources` and `destinations` is identical to the input that was used by the MPI process with the same rank in `comm_old` in the creation call. If the communicator was created with [[MPI_DIST_GRAPH_CREATE]] then the only requirement on the order of values in `sources` and `destinations` is that two calls to the routine with same input argument `comm` will return the same sequence of edges. If `maxindegree` or `maxoutdegree` is smaller than the numbers returned by [[MPI_DIST_GRAPH_NEIGHBORS_COUNT]] , then only the first part of the full list is returned.

> [!warning] Advice to implementors

> Since the query calls are defined to be local, each MPI process needs to store the list of its neighbors with incoming and outgoing edges. Communication is required at the collective [[MPI_DIST_GRAPH_CREATE]] call in order to compute the neighbor lists for each MPI process from the distributed graph specification.

### Cartesian Shift Coordinates



If the MPI process topology is a Cartesian structure, an [[MPI_SENDRECV]] operation may be used along a coordinate direction to perform a shift of data. As input, [[MPI_SENDRECV]] takes the rank of a source MPI process for the receive, and the rank of a destination MPI process for the send. If the function [[MPI_CART_SHIFT]] is called for a communicator with an associated Cartesian topology, it provides the calling MPI process with the above identifiers, which then can be passed to [[MPI_SENDRECV]] . The user specifies the coordinate direction and the size of the step (positive or negative, but not zero). The function is local.

![[API/MPI_CART_SHIFT]]

The `direction` argument indicates the coordinate dimension to be traversed by the shift. The dimensions are numbered from `0` to `ndims-1`, where `ndims` is the number of dimensions.

Depending on the periodicity of the Cartesian topology in the specified coordinate direction, [[MPI_CART_SHIFT]] provides the identifiers for a circular or an end-off shift. In the case of an end-off shift, the value `MPI_PROC_NULL` is returned in `rank_source` or `rank_dest`, indicating that the source or the destination for the shift is out of range.

It is erroneous to call [[MPI_CART_SHIFT]] with a direction that is either negative or greater than or equal to the number of dimensions in the Cartesian communicator. This implies that it is erroneous to call [[MPI_CART_SHIFT]] with a `comm` that is associated with a zero-dimensional Cartesian topology.



Using [[MPI_CART_SHIFT]] for a Cartesian topology.

The communicator, `comm`, has a two-dimensional, periodic, Cartesian topology associated with it. A two-dimensional array of `REAL`s is stored one element per MPI process, in variable `A`. One wishes to skew this array, by shifting column `i` (vertically, i.e., along the column) by `i` steps.

``` [MPI]Fortran
...
! find MPI process rank
CALL MPI_COMM_RANK(comm, rank, ierr)
! find Cartesian coordinates
CALL MPI_CART_COORDS(comm, rank, maxdims, coords, ierr)
! compute shift source and destination
CALL MPI_CART_SHIFT(comm, 0, coords(2), source, dest, ierr)
! skew array
CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, dest, 0, source, 0, comm, &
                          status, ierr)
```

> [!note] Advice to users

> In Fortran, the dimension indicated by `DIRECTION = i` has `DIMS(i+1)` nodes, where `DIMS` is the array that was used to create the grid. In C, the dimension indicated by `direction = i` is the dimension specified by `dims[i]`.

### Partitioning of Cartesian Structures



![[API/MPI_CART_SUB]]

[[MPI_CART_SUB]] can be used to partition the group associated with a communicator that has an associated Cartesian topology into subgroups that form lower-dimensional Cartesian subgrids, and to create for each subgroup a communicator with the associated subgrid Cartesian topology. The topologies of the new communicators describe the subgrids. The number of dimensions of the subgrids is the number of remaining dimensions, i.e., the number of `true` values in `remain_dims`. The numbers of MPI processes in each coordinate direction of the subgrids are the remaining numbers of MPI processes in each coordinate direction of the grid associated with the original communicator, i.e., the values of the original grid dimensions for which the corresponding entry in `remain_dims` is `true`. The periodicity for the remaining dimensions in the new communicator is preserved from the original communicator. If all entries in `remain_dims` are `false` or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology. (This function is closely related to [[MPI_COMM_SPLIT]] .)



Creation of nonoverlapping Cartesian subcommunicators with [[MPI_CART_SUB]] .

Assume that `MPI_Cart_create(`$`...`$`, comm)` has defined a $`(2 \times 3 \times 4)`$ grid. Let `remain_dims``= (true, false, true)`. Then a call to

MPI_Cart_sub(comm, remain_dims, &newcomm);

will create three communicators each with eight MPI processes in a $`2 \times 4`$ Cartesian topology. If `remain_dims``= (false, false, true)` then the call to

MPI_Cart_sub(comm, remain_dims, &newcomm);

will create six nonoverlapping communicators, each with four MPI processes, in a one-dimensional Cartesian topology.

### Low-Level Topology Functions



The two additional functions introduced in this section can be used to implement all other topology functions. In general they will not be called by the user directly, except when creating additional *virtual topology* capabilities other than those provided by MPI. The two calls are both local.

![[API/MPI_CART_MAP]]

[[MPI_CART_MAP]] computes an “optimal” placement for the calling MPI process on the physical machine. A possible implementation of this function is to always return the rank of the calling MPI process, that is, not to perform any reordering.

> [!warning] Advice to implementors

> The function [[MPI_CART_CREATE]] `(comm, ndims, dims, periods, reorder, comm_cart)`, with `reorder = true` can be implemented by calling [[MPI_CART_MAP]] `(comm, ndims, dims, periods, newrank)`, then calling [[MPI_COMM_SPLIT]] `(comm, color, key, comm_cart)`, with `color = 0` if `newrank `$`\neq`$ `MPI_UNDEFINED`, `color =``MPI_UNDEFINED` otherwise, and `key = newrank`. If `ndims` is zero then a zero-dimensional Cartesian topology is created.
>
> The function [[MPI_CART_SUB]] `(comm, remain_dims, comm_new)` can be implemented by a call to [[MPI_COMM_SPLIT]] `(comm, color, key, comm_new)`, using a single number encoding of the lost dimensions as `color` and a single number encoding of the preserved dimensions as `key`.
>
> All other Cartesian topology functions can be implemented locally, using the topology information that is cached with the communicator.

The corresponding function for graph structures is as follows.

![[API/MPI_GRAPH_MAP]]

> [!warning] Advice to implementors

> The function [[MPI_GRAPH_CREATE]] `(comm, nnodes, index, edges, reorder, comm_graph)`, with `reorder = true` can be implemented by calling [[MPI_GRAPH_MAP]] `(comm, nnodes, index, edges, newrank)`, then calling [[MPI_COMM_SPLIT]] `(comm, color, key, comm_graph)`, with `color = 0` if `newrank `$`\neq`$ `MPI_UNDEFINED`, `color =``MPI_UNDEFINED` otherwise, and `key = newrank`.
>
> All other graph topology functions can be implemented locally, using the topology information that is cached with the communicator.

## Neighborhood Collective Communication on Virtual Topologies



*Virtual topologies* specify a communication graph, but they implement no communication function themselves. Many applications require sparse nearest neighbor communications that can be expressed as graph topologies. We now describe several collective operations that perform communication along the edges of a graph representing a *virtual topology*. All of these functions are collective; i.e., they must be called by all MPI processes in the specified communicator. See [[coll#Collective Communication|Collective Communication]] for an overview of other dense (global) collective communication operations and the semantics of collective operations.

If the graph was created with [[MPI_DIST_GRAPH_CREATE_ADJACENT]] with `sources` and `destinations` containing `0, `$`...`$`, n-1`, where `n` is the number of MPI processes in the group of `comm_old` (i.e., the graph is fully connected and also includes an edge from each node to itself), then the sparse neighborhood communication routine performs the same data exchange as the corresponding dense (fully-connected) collective operation. In the case of a Cartesian communicator, only nearest neighbor communication is provided, corresponding to `rank_source` and `rank_dest` in [[MPI_CART_SHIFT]] with input `disp``= 1`.

> [!tip] Rationale

> Neighborhood collective communications enable communication on a *virtual topology*. This high-level specification of data exchange among neighboring MPI processes enables optimizations in the MPI library because the communication pattern is known statically (the topology). Thus, the implementation can compute optimized message schedules during creation of the topology . This functionality can significantly simplify the implementation of neighbor exchanges .

For a distributed graph topology, created with [[MPI_DIST_GRAPH_CREATE]] , the sequence of neighbors in the send and receive buffers at each MPI process is defined as the sequence returned by [[MPI_DIST_GRAPH_NEIGHBORS]] for destinations and sources, respectively. For a general graph topology, created with [[MPI_GRAPH_CREATE]] , the use of neighborhood collective communication is restricted to adjacency matrices, where the number of edges between any two MPI processes is defined to be the same for both MPI processes (i.e., with a symmetric adjacency matrix). In this case, the order of neighbors in the send and receive buffers is defined as the sequence of neighbors as returned by [[MPI_GRAPH_NEIGHBORS]] . Note that graph topologies should generally be replaced by the distributed graph topologies.

For a Cartesian topology, created with [[MPI_CART_CREATE]] , the sequence of neighbors in the send and receive buffers at each MPI process is defined by the order of the dimensions, first the neighbor in the negative direction and then in the positive direction with displacement 1. The numbers of sources and destinations in the communication routines are `2*ndims` with `ndims` defined in [[MPI_CART_CREATE]] . If a neighbor does not exist, i.e., at the border of a Cartesian topology in the case of a nonperiodic virtual grid dimension (i.e., `periods[`$`...`$`]=false`), then this neighbor is defined to be `MPI_PROC_NULL`.

If a neighbor in any of the functions is `MPI_PROC_NULL`, then the neighborhood collective communication behaves like a point-to-point communication with `MPI_PROC_NULL` in this direction. That is, the buffer is still part of the sequence of neighbors but it is neither communicated nor updated.

### Neighborhood Gather



In the neighborhood gather operation, each MPI process $`i`$ gathers data items from each MPI process $`j`$ if an edge $`(j,i)`$ exists in the topology graph, and each MPI process $`i`$ sends the same data items to all MPI processes $`j`$ where an edge $`(i,j)`$ exists. The send buffer is sent to each neighboring MPI process and the $`l`$-th block in the receive buffer is received from the $`l`$-th neighbor.

![[API/MPI_NEIGHBOR_ALLGATHER]]

The [[MPI_NEIGHBOR_ALLGATHER]] procedure supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[topol#Neighborhood Collective Communication on Virtual Topologies|Neighborhood Collective Communication on Virtual Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each MPI process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:

``` [MPI]C
MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);
int *srcs=(int*)malloc(indegree*sizeof(int));
int *dsts=(int*)malloc(outdegree*sizeof(int));
MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED,
                         outdegree, dsts, MPI_UNWEIGHTED);
int k;

/* assume sendbuf and recvbuf are of type (char*) */
for(k=0; k<outdegree; ++k) 
  MPI_Isend(sendbuf, sendcount, sendtype, dsts[k],...); 

for(k=0; k<indegree; ++k) 
  MPI_Irecv(recvbuf+k*recvcount*extent(recvtype), recvcount, recvtype,
            srcs[k],...); 

MPI_Waitall(...);
```

Figure [[topol#Neighborhood Gather|Neighborhood Gather]] shows the neighborhood gather communication of one MPI process with outgoing neighbors $`d_0... d_3`$ and incoming neighbors $`s_0... s_5`$. The MPI process will send its `sendbuf` to all four `destinations` (outgoing neighbors) and it will receive the contribution from all six `sources` (incoming neighbors) into separate locations of its receive buffer.

*Figure: Neighborhood gather communication example*

All arguments are significant on all MPI processes and the argument `comm` must have identical values on all MPI processes.

The type signature associated with `sendcount`, `sendtype` at an MPI process must be equal to the type signature associated with `recvcount`, `recvtype` at all other MPI processes. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating MPI processes. Distinct type maps between sender and receiver are still allowed.

> [!tip] Rationale

> For optimization reasons, the same type signature is required independently of whether the topology graph is connected or not.

The “in place” option is not meaningful for this operation.



Buffer usage of [[MPI_NEIGHBOR_ALLGATHER]] in the case of a Cartesian virtual topology.

On a Cartesian virtual topology, the buffer usage in a given direction `d` with `dims[d]=3` and `1`, respectively during creation of the communicator is described in Figure [[topol#Neighborhood Gather|Neighborhood Gather]] .

The figure may apply to any (or multiple) directions in the Cartesian topology. The grey buffers are required in all cases but are only accessed if during creation of the communicator, `periods[d]` was defined as nonzero (in C) or `.TRUE.` (in Fortran).

*Figure: Cartesian neighborhood allgather example for 3 and 1 processes in a dimension*

The vector variant of [[MPI_NEIGHBOR_ALLGATHER]] allows one to gather different numbers of elements from each neighbor.

![[API/MPI_NEIGHBOR_ALLGATHERV]]

The [[MPI_NEIGHBOR_ALLGATHERV]] procedure supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[topol#Neighborhood Collective Communication on Virtual Topologies|Neighborhood Collective Communication on Virtual Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each MPI process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:

``` [MPI]C
MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);
int *srcs=(int*)malloc(indegree*sizeof(int));
int *dsts=(int*)malloc(outdegree*sizeof(int));
MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED,
                         outdegree, dsts, MPI_UNWEIGHTED);
int k;

/* assume sendbuf and recvbuf are of type (char*) */
for(k=0; k<outdegree; ++k) 
  MPI_Isend(sendbuf, sendcount, sendtype, dsts[k],...); 

for(k=0; k<indegree; ++k) 
  MPI_Irecv(recvbuf+displs[k]*extent(recvtype), recvcounts[k], recvtype,
            srcs[k],...); 

MPI_Waitall(...);
```

The type signature associated with `sendcount`, `sendtype` at MPI process $`j`$ must be equal to the type signature associated with `recvcounts``[l]`, `recvtype` at any other MPI process with `srcs[l]=`$`j`$. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating MPI processes. Distinct type maps between sender and receiver are still allowed. The data received from the `l`-th neighbor is placed into `recvbuf` beginning at offset `displs``[l]` elements (in terms of the `recvtype`).

The “in place” option is not meaningful for this operation.

All arguments are significant on all MPI processes and the argument `comm` must have identical values on all MPI processes.

### Neighborhood Alltoall



In the neighborhood alltoall operation, each MPI process $`i`$ receives data items from each MPI process $`j`$ if an edge $`(j,i)`$ exists in the topology graph or Cartesian topology. Similarly, each MPI process $`i`$ sends data items to all MPI processes $`j`$ where an edge $`(i,j)`$ exists. This call is more general than [[MPI_NEIGHBOR_ALLGATHER]] in that different data items can be sent to each neighbor. The $`k`$-th block in send buffer is sent to the $`k`$-th neighboring MPI process and the $`l`$-th block in the receive buffer is received from the $`l`$-th neighbor.

![[API/MPI_NEIGHBOR_ALLTOALL]]

The [[MPI_NEIGHBOR_ALLTOALL]] procedure supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[topol#Neighborhood Collective Communication on Virtual Topologies|Neighborhood Collective Communication on Virtual Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each MPI process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:

``` [MPI]C
MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);
int *srcs=(int*)malloc(indegree*sizeof(int));
int *dsts=(int*)malloc(outdegree*sizeof(int));
MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED,
                         outdegree, dsts, MPI_UNWEIGHTED);
int k;

/* assume sendbuf and recvbuf are of type (char*) */
for(k=0; k<outdegree; ++k)
  MPI_Isend(sendbuf+k*sendcount*extent(sendtype), sendcount, sendtype,
            dsts[k],...); 

for(k=0; k<indegree; ++k)
  MPI_Irecv(recvbuf+k*recvcount*extent(recvtype), recvcount, recvtype,
            srcs[k],...);

MPI_Waitall(...);
```

The type signature associated with `sendcount`, `sendtype` at an MPI process must be equal to the type signature associated with `recvcount`, `recvtype` at any other MPI process. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating MPI processes. Distinct type maps between sender and receiver are still allowed.

The “in place” option is not meaningful for this operation.

All arguments are significant on all MPI processes and the argument `comm` must have identical values on all MPI processes.



Buffer usage of [[MPI_NEIGHBOR_ALLTOALL]] in the case of a Cartesian virtual topology.

For a halo communication on a Cartesian grid, the buffer usage in a given direction `d` with `dims[d]=3` and `1`, respectively during creation of the communicator is described in Figure [[topol#Neighborhood Alltoall|Neighborhood Alltoall]] .

The figure may apply to any (or multiple) directions in the Cartesian topology. The grey buffers are required in all cases but are only accessed if during creation of the communicator, `periods[d]` was defined as nonzero (in C) or `.TRUE.` (in Fortran).

If `sendbuf` and `recvbuf` are declared as `(`char \*) and contain a sequence of buffers each described by `sendcount`,`sendtype` and `recvbuf`,`recvtype`, then after [[MPI_NEIGHBOR_ALLTOALL]] on a Cartesian communicator returned, the content of the `recvbuf` is as if the following code is executed:

    [language={[MPI]C},basicstyle=,escapeinside=`']
    MPI_Cartdim_get(comm, &ndims);
    MPI_Type_get_extent(sendtype, &send_lb, &send_extent);
    MPI_Type_get_extent(recvtype, &recv_lb, &recv_extent);
    for( /*direction*/ d=0; d < ndims; d++) {
        MPI_Cart_shift(comm, /*direction*/ d, /*disp*/ 1, &rank_source, &rank_dest);
        MPI_Sendrecv(sendbuf+(d*2`\underline{+0}')*sendcount*send_extent,
                                     sendcount,sendtype,`\underline{rank_source}',/*sendtag*/d*2,
                     recvbuf+(d*2`\underline{+1}')*recvcount*recv_extent,
                                     recvcount,recvtype,`\underline{rank_dest}', /*recvtag*/ d*2,
                     comm,&status);/*communication in direction of displacment -1*/
        MPI_Sendrecv(sendbuf+(d*2`\underline{+1}')*sendcount*send_extent,
                                     sendcount,sendtype,`\underline{rank_dest}', /*sendtag*/ d*2+1,
                     recvbuf+(d*2`\underline{+0}')*recvcount*recv_extent,
                                     recvcount,recvtype,`\underline{rank_source}',/*recvtag*/d*2+1,
                     comm,&status);/*communication in direction of displacment +1*/
    }

The first call to `MPI_Sendrecv` implements the solid arrows’ communication pattern in each diagram of Figure [[topol#Neighborhood Alltoall|Neighborhood Alltoall]] , whereas the second call is for the dashed arrows’ pattern.

*Figure: Cartesian neighborhood alltoall example for 3 and 1 MPI processes in a dimension*

> [!warning] Advice to implementors

> For a Cartesian topology, if the grid in a direction `d` is periodic and `dims[d]` is equal to 1 or 2, then `rank_source` and `rank_dest` are identical, but still all `ndims` send and `ndims` receive operations use different buffers. If in this case, the two send and receive operations per direction or of all directions are internally parallelized, then the several send and receive operations for the same sender-receiver MPI process pair shall be initiated in the same sequence on sender and receiver side or they shall be distinguished by different tags. The code above shows a valid sequence of operations and tags.

The vector variant of [[MPI_NEIGHBOR_ALLTOALL]] allows sending/receiving different numbers of elements to and from each neighbor.

![[API/MPI_NEIGHBOR_ALLTOALLV]]

The [[MPI_NEIGHBOR_ALLTOALLV]] procedure supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[topol#Neighborhood Collective Communication on Virtual Topologies|Neighborhood Collective Communication on Virtual Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each MPI process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:

``` [MPI]C
MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);
int *srcs=(int*)malloc(indegree*sizeof(int));
int *dsts=(int*)malloc(outdegree*sizeof(int));
MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED,
                         outdegree, dsts, MPI_UNWEIGHTED);
int k;

/* assume sendbuf and recvbuf are of type (char*) */
for(k=0; k<outdegree; ++k)
  MPI_Isend(sendbuf+sdispls[k]*extent(sendtype), sendcounts[k],
            sendtype, dsts[k],...);

for(k=0; k<indegree; ++k)
  MPI_Irecv(recvbuf+rdispls[k]*extent(recvtype), recvcounts[k],
            recvtype, srcs[k],...);

MPI_Waitall(...);
```

The type signature associated with `sendcounts``[k]`, `sendtype` with `dsts[k]=`$`j`$ at MPI process $`i`$ must be equal to the type signature associated with `recvcounts``[l]`, `recvtype` with `srcs[l]=`$`i`$ at MPI process $`j`$. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating MPI processes. Distinct type maps between sender and receiver are still allowed. The data in the `sendbuf` beginning at offset `sdispls``[k]` elements (in terms of the `sendtype`) is sent to the `k`-th outgoing neighbor. The data received from the `l`-th incoming neighbor is placed into `recvbuf` beginning at offset `rdispls``[l]` elements (in terms of the `recvtype`).

The “in place” option is not meaningful for this operation.

All arguments are significant on all MPI processes and the argument `comm` must have identical values on all MPI processes.

[[MPI_NEIGHBOR_ALLTOALLW]] allows one to send and receive with different datatypes to and from each neighbor.

![[API/MPI_NEIGHBOR_ALLTOALLW]]

The [[MPI_NEIGHBOR_ALLTOALLW]] procedure supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[topol#Neighborhood Collective Communication on Virtual Topologies|Neighborhood Collective Communication on Virtual Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each MPI process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:

``` [MPI]C
MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);
int *srcs=(int*)malloc(indegree*sizeof(int));
int *dsts=(int*)malloc(outdegree*sizeof(int));
MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED,
                         outdegree, dsts, MPI_UNWEIGHTED);
int k;

/* assume sendbuf and recvbuf are of type (char*) */
for(k=0; k<outdegree; ++k)
  MPI_Isend(sendbuf+sdispls[k], sendcounts[k], sendtypes[k],
            dsts[k],...);

for(k=0; k<indegree; ++k)
  MPI_Irecv(recvbuf+rdispls[k], recvcounts[k], recvtypes[k],
            srcs[k],...);

MPI_Waitall(...);
```

The type signature associated with `sendcounts``[k]`, `sendtypes``[k]` with `dsts[k]=`$`j`$ at MPI process $`i`$ must be equal to the type signature associated with `recvcounts``[l]`, `recvtypes``[l]` with `srcs[l]=`$`i`$ at MPI process $`j`$. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating MPI processes. Distinct type maps between sender and receiver are still allowed.

The “in place” option is not meaningful for this operation.

All arguments are significant on all MPI processes and the argument `comm` must have identical values on all MPI processes.

## Nonblocking Neighborhood Communication on Process Topologies



Nonblocking variants of the neighborhood collective operations allow relaxed synchronization and overlapping of computation and communication. The semantics are similar to nonblocking collective operations as described in Section [[coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] .

### Nonblocking Neighborhood Gather

![[API/MPI_INEIGHBOR_ALLGATHER]]

[[MPI_INEIGHBOR_ALLGATHER]] starts a nonblocking variant of [[MPI_NEIGHBOR_ALLGATHER]] .

![[API/MPI_INEIGHBOR_ALLGATHERV]]

[[MPI_INEIGHBOR_ALLGATHERV]] starts a nonblocking variant of [[MPI_NEIGHBOR_ALLGATHERV]] .

### Nonblocking Neighborhood Alltoall

![[API/MPI_INEIGHBOR_ALLTOALL]]

[[MPI_INEIGHBOR_ALLTOALL]] starts a nonblocking variant of [[MPI_NEIGHBOR_ALLTOALL]] .

![[API/MPI_INEIGHBOR_ALLTOALLV]]

[[MPI_INEIGHBOR_ALLTOALLV]] starts a nonblocking variant of [[MPI_NEIGHBOR_ALLTOALLV]] .

![[API/MPI_INEIGHBOR_ALLTOALLW]]

[[MPI_INEIGHBOR_ALLTOALLW]] starts a nonblocking variant of [[MPI_NEIGHBOR_ALLTOALLW]] .

## Persistent Neighborhood Communication on Process Topologies



Persistent variants of the neighborhood collective operations can offer significant performance benefits for programs with repetitive communication patterns. The semantics are similar to persistent collective operations as described in Section [[coll#Persistent Collective Operations|Persistent Collective Operations]] .

### Persistent Neighborhood Gather

![[API/MPI_NEIGHBOR_ALLGATHER_INIT]]

Creates a persistent collective communication request for the neighborhood allgather operation.

![[API/MPI_NEIGHBOR_ALLGATHERV_INIT]]

Creates a persistent collective communication request for the neighborhood allgatherv operation.

### Persistent Neighborhood Alltoall

![[API/MPI_NEIGHBOR_ALLTOALL_INIT]]

Creates a persistent collective communication request for the neighborhood alltoall operation.

![[API/MPI_NEIGHBOR_ALLTOALLV_INIT]]

Creates a persistent collective communication request for the neighborhood alltoallv operation.

![[API/MPI_NEIGHBOR_ALLTOALLW_INIT]]

Creates a persistent collective communication request for the neighborhood alltoallw operation.

## An Application Example





Neighborhood collective communication in a Cartesian virtual topology.

The example in Listings [[poisson-begin]] – [[poisson-persistent]] shows how the grid definition and inquiry functions can be used in an application program. A partial differential equation, for instance the Poisson equation, is to be solved on a rectangular domain. First, the MPI processes organize themselves in a two-dimensional structure. Each MPI process then inquires about the ranks of its neighbors in the four directions (up, down, right, left). The numerical problem is solved by an iterative method, the details of which are hidden in the subroutine `relax`.

In each relaxation step each MPI process computes new values for the solution grid function at the points `u(1:100,1:100)` owned by the MPI process. Then the values at inter-process boundaries have to be exchanged with neighboring MPI processes. For example, the newly calculated values in `u(1,1:100)` must be sent into the halo cells `u(101,1:100)` of the left-hand neighbor with coordinates `(own_coord(1)-1,own_coord(2))`.

    [language={[MPI]Fortran},basicstyle=,caption={Set-up of MPI process structure for two-dimensional parallel Poisson solver},label=poisson-begin]
    INTEGER ndims, num_neigh
    LOGICAL reorder
    PARAMETER (ndims=2, num_neigh=4, reorder=.true.)
    INTEGER comm, comm_size, comm_cart, dims(ndims), ierr
    INTEGER neigh_rank(num_neigh), own_coords(ndims), i, j, it
    LOGICAL periods(ndims)
    REAL u(0:101,0:101), f(0:101,0:101)
    DATA dims / ndims * 0 /
    comm = MPI_COMM_WORLD
    CALL MPI_COMM_SIZE(comm, comm_size, ierr)
    !   Set MPI process grid size and periodicity
    CALL MPI_DIMS_CREATE(comm_size, ndims, dims, ierr)
    periods(1) = .TRUE.
    periods(2) = .TRUE.
    !   Create a grid structure in WORLD group and inquire about own position
    CALL MPI_CART_CREATE(comm, ndims, dims, periods, reorder, &
                         comm_cart, ierr)
    CALL MPI_CART_GET(comm_cart, ndims, dims, periods, own_coords, ierr)
    i = own_coords(1)
    j = own_coords(2)
    ! Look up the ranks for the neighbors.  Own MPI process coordinates are (i,j).
    ! Neighbors are (i-1,j), (i+1,j), (i,j-1), (i,j+1) modulo (dims(1),dims(2))
    CALL MPI_CART_SHIFT(comm_cart, 0,1, neigh_rank(1), neigh_rank(2), ierr)
    CALL MPI_CART_SHIFT(comm_cart, 1,1, neigh_rank(3), neigh_rank(4), ierr)
    ! Initialize the grid functions and start the iteration
    CALL init(u, f)
    DO it=1,100
       CALL relax(u, f)
    !      Exchange data with neighbor processes
       CALL exchange(u, comm_cart, neigh_rank, num_neigh)
    END DO
    CALL output(u)

    [language={[MPI]Fortran},basicstyle=,caption={Communication routine with local data copying and sparse neighborhood alltoall}]
    SUBROUTINE exchange(u, comm_cart, neigh_rank, num_neigh)
    USE MPI
    REAL u(0:101,0:101)
    INTEGER comm_cart, num_neigh, neigh_rank(num_neigh)
    REAL sndbuf(100,num_neigh), rcvbuf(100,num_neigh)
    INTEGER ierr
    sndbuf(1:100,1) = u(  1,1:100)
    sndbuf(1:100,2) = u(100,1:100)
    sndbuf(1:100,3) = u(1:100,  1)
    sndbuf(1:100,4) = u(1:100,100)
    CALL MPI_NEIGHBOR_ALLTOALL(sndbuf, 100, MPI_REAL, rcvbuf, 100, MPI_REAL, &
                               comm_cart, ierr)
    ! instead of
    ! CALL MPI_IRECV(rcvbuf(1,1),100,MPI_REAL, neigh_rank(1),..., rq(1), ierr)
    ! CALL MPI_ISEND(sndbuf(1,2),100,MPI_REAL, neigh_rank(2),..., rq(2), ierr)
    !   Always pairing a receive from rank_source with a send to rank_dest
    !   of the same direction in MPI_CART_SHIFT!
    ! CALL MPI_IRECV(rcvbuf(1,2),100,MPI_REAL, neigh_rank(2),..., rq(3), ierr)
    ! CALL MPI_ISEND(sndbuf(1,1),100,MPI_REAL, neigh_rank(1),..., rq(4), ierr)
    ! CALL MPI_IRECV(rcvbuf(1,3),100,MPI_REAL, neigh_rank(3),..., rq(5), ierr)
    ! CALL MPI_ISEND(sndbuf(1,4),100,MPI_REAL, neigh_rank(4),..., rq(6), ierr)
    ! CALL MPI_IRECV(rcvbuf(1,4),100,MPI_REAL, neigh_rank(4),..., rq(7), ierr)
    ! CALL MPI_ISEND(sndbuf(1,3),100,MPI_REAL, neigh_rank(3),..., rq(8), ierr)
    !   Of course, one can first start all four IRECV and then all four ISEND,
    !   Or vice versa, but both in the sequence shown above. Otherwise, the
    !   matching would be wrong for 2 or only 1 MPI processes in a direction.
    ! CALL MPI_WAITALL(2*num_neigh, rq, statuses, ierr)
    u(  0,1:100) = rcvbuf(1:100,1)
    u(101,1:100) = rcvbuf(1:100,2)
    u(1:100,  0) = rcvbuf(1:100,3)
    u(1:100,101) = rcvbuf(1:100,4)
    END

    [language={[MPI]Fortran},basicstyle=,caption={Communication routine with sparse neighborhood alltoallw and without local data copying},label=poisson-end]
    SUBROUTINE exchange(u, comm_cart, neigh_rank, num_neigh)
    USE MPI
    IMPLICIT NONE
    REAL u(0:101,0:101)
    INTEGER comm_cart, num_neigh, neigh_rank(num_neigh)
    INTEGER sndcounts(num_neigh), sndtypes(num_neigh)
    INTEGER rcvcounts(num_neigh), rcvtypes(num_neigh)
    INTEGER(KIND=MPI_ADDRESS_KIND) lb, sizeofreal
    INTEGER(KIND=MPI_ADDRESS_KIND) sdispls(num_neigh), rdispls(num_neigh)
    INTEGER type_vec, ierr
    ! The following initialization need to be done only once
    ! before the first call of exchange.
    CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lb, sizeofreal, ierr)
    CALL MPI_TYPE_VECTOR(100, 1, 102, MPI_REAL, type_vec, ierr)
    CALL MPI_TYPE_COMMIT(type_vec, ierr)
    sndtypes(1:2) = type_vec
    sndcounts(1:2) = 1
    sndtypes(3:4) = MPI_REAL
    sndcounts(3:4) = 100
    rcvtypes = sndtypes
    rcvcounts = sndcounts
    sdispls(1) = ( 1  +   1*102) * sizeofreal ! first element of u(  1    ,  1:100)
    sdispls(2) = (100 +   1*102) * sizeofreal ! first element of u(100    ,  1:100)
    sdispls(3) = ( 1  +   1*102) * sizeofreal ! first element of u(  1:100,  1    )
    sdispls(4) = ( 1  + 100*102) * sizeofreal ! first element of u(  1:100,100    )
    rdispls(1) = ( 0  +   1*102) * sizeofreal ! first element of u(  0    ,  1:100)
    rdispls(2) = (101 +   1*102) * sizeofreal ! first element of u(101    ,  1:100)
    rdispls(3) = ( 1  +   0*102) * sizeofreal ! first element of u(  1:100,  0    )
    rdispls(4) = ( 1  + 101*102) * sizeofreal ! first element of u(  1:100,101    )
    ! the following communication has to be done in each call of exchange
    CALL MPI_NEIGHBOR_ALLTOALLW(u, sndcounts, sdispls, sndtypes, &
                                u, rcvcounts, rdispls, rcvtypes, &
                                comm_cart, ierr)
    ! The following finalizing need to be done only once
    ! after the last call of exchange.
    CALL MPI_TYPE_FREE(type_vec, ierr)
    END

    [language={[MPI]Fortran},caption={Two-dimensional parallel Poisson solver with persistent sparse neighborhood alltoallw and without local data copying},label=poisson-persistent,escapeinside={(*@}{@*)}]
    INTEGER ndims, num_neigh
    LOGICAL reorder
    PARAMETER (ndims=2, num_neigh=4, reorder=.true.)
    INTEGER comm, comm_size, comm_cart, dims(ndims), it, ierr
    LOGICAL periods(ndims)
    REAL u(0:101,0:101), f(0:101,0:101)
    DATA dims / ndims * 0 /
    INTEGER sndcounts(num_neigh), sndtypes(num_neigh)
    INTEGER rcvcounts(num_neigh), rcvtypes(num_neigh)
    INTEGER(KIND=MPI_ADDRESS_KIND) lb, sizeofreal
    INTEGER(KIND=MPI_ADDRESS_KIND) sdispls(num_neigh), rdispls(num_neigh)
    INTEGER type_vec, request, info, status(MPI_STATUS_SIZE)
    comm = MPI_COMM_WORLD
    CALL MPI_COMM_SIZE(comm, comm_size, ierr)
    !   Set MPI process grid size and periodicity
    CALL MPI_DIMS_CREATE(comm_size, ndims, dims, ierr)
    periods(1) = .TRUE.
    periods(2) = .TRUE.
    !   Create a grid structure in WORLD group
    CALL MPI_CART_CREATE(comm, ndims, dims, periods, reorder, &
                         comm_cart, ierr)
    ! Create datatypes for the neighborhood communication
    !
    ! Insert code from example in Listing (*@ [[poisson-end]] @*) to create and initialize
    ! sndcounts, sdispls, sndtypes, rcvcounts, rdispls, and rcvtypes
    !
    ! Initialize the neighborhood alltoallw operation
    info = MPI_INFO_NULL
    CALL MPI_NEIGHBOR_ALLTOALLW_INIT(u, sndcounts, sdispls, sndtypes, &
                                     u, rcvcounts, rdispls, rcvtypes, &
                                     comm_cart, info, request, ierr)
    ! Initialize the grid functions and start the iteration
    CALL init(u, f)
    DO it=1,100
    !      Start data exchange with neighbor processes
       CALL MPI_START(request, ierr)
    !      Compute inner cells
       CALL relax_inner (u, f)
    !      Check on completion of neighbor exchange
       CALL MPI_WAIT(request, status, ierr)
    !      Compute edge cells
       CALL relax_edges(u, f)
    END DO
    CALL output(u)
    CALL MPI_REQUEST_FREE(request, ierr)
    CALL MPI_TYPE_FREE(type_vec, ierr)

