---
title: "Distributed (Graph) Constructor"
chapter: topol
present_in: ["MPI-2.2"]
tags: [mpi/section, mpi/topol]
---

# Distributed (Graph) Constructor

Chapter **topol** · in [[versions/v22/sections/topol#Distributed (Graph) Constructor|MPI-2.2]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2

_Section appears in MPI-2.2._

### MPI-2.2 → MPI-3.0  (7 changed paragraphs)

~~The general graph constructor assumes~~ ==[[versions/v30/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] requires== that each process passes the full (global) communication graph to the call. This limits the scalability of this constructor. With the distributed graph interface, the communication graph is specified in a fully distributed fashion. Each process specifies only the part of the communication graph of which it is aware. Typically, this could be the set of processes from which the process will eventually receive or get data, or the set of processes to which the process will send or put data, or some combination of such edges. Two different interfaces can be used to create a distributed graph topology. [[versions/v30/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] creates a distributed graph communicator with each process specifying ~~all~~ ==each== of its incoming and outgoing (adjacent) edges in the logical communication graph and thus requires minimal communication during creation. [[versions/v30/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] provides full ~~flexibility, and processes~~ ==flexibility such that any process== can indicate that communication will occur between ~~other pairs~~ ==any pair== of ~~processes.~~ ==processes in the graph.==

[[versions/v30/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] returns a handle to a new communicator to which the distributed graph topology information is attached. Each process passes all information about ~~the~~ ==its incoming and outgoing== edges ~~to its neighbors~~ in the virtual distributed graph topology. The calling processes must ensure that each edge of the graph is described in the source and in the destination process with the same weights. If there are multiple edges for a given `(source,dest)` pair, then the sequence of the weights of these edges does not matter. The complete communication topology is the combination of all edges shown in the `sources` arrays of all processes in `comm_old`, which must be identical to the combination of all edges shown in the `destinations` arrays. Source and destination ranks must be process ranks of `comm_old`. This allows a fully distributed specification of the communication graph. Isolated processes (i.e., processes with no outgoing or incoming edges, that is, processes that have specified `indegree` and `outdegree` as zero and ~~that~~ thus do not occur as source or destination rank in the graph specification) are allowed.

~~Weights are specified as non-negative integers and can be used to influence the process remapping strategy and other internal MPI optimizations. For instance, approximate count arguments of later communication calls along specific edges could be used as their edge weights. Multiplicity of edges can likewise indicate more intense communication between pairs of processes. However, the exact meaning of edge weights is not specified by the MPI standard and is left to the implementation. In C or Fortran, an application can supply the special value `MPI_UNWEIGHTED` for the weight array to indicate that all edges have the same (effectively no) weight. In C++, this constant does not exist and the weight arguments may be omitted from the argument list. It is erroneous to supply `MPI_UNWEIGHTED`, or in C++ omit the weight arrays, for some but not all processes of `comm_old`. Note that `MPI_UNWEIGHTED` is not a special weight value; rather it is a special value for the total array argument. In C, one would expect it to be `NULL`. In Fortran, `MPI_UNWEIGHTED` is an object like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[versions/v30/sections/terms#Named Constants|Named Constants]] .~~

==Weights are specified as non-negative integers and can be used to influence the process remapping strategy and other internal MPI optimizations. For instance, approximate count arguments of later communication calls along specific edges could be used as their edge weights. Multiplicity of edges can likewise indicate more intense communication between pairs of processes. However, the exact meaning of edge weights is not specified by the MPI standard and is left to the implementation. In C or Fortran, an application can supply the special value `MPI_UNWEIGHTED` for the weight array to indicate that all edges have the same (effectively no) weight. It is erroneous to supply `MPI_UNWEIGHTED` for some but not all processes of `comm_old`. If the graph is weighted but `indegree` or `outdegree` is zero, then `MPI_WEIGHTS_EMPTY` or any arbitrary array may be passed to `sourceweights` or `destweights` respectively. Note that `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are not special weight values; rather they are special values for the total array argument. In Fortran, `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are objects like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[versions/v30/sections/terms#Named Constants|Named Constants]] .==

==> [!note] Advice to users==

==> In the case of an empty weights array argument passed while constructing a weighted graph, one should not pass `NULL` because the value of `MPI_UNWEIGHTED` may be equal to `NULL`. The value of this argument would then be indistinguishable from `MPI_UNWEIGHTED` to the implementation. In this case `MPI_WEIGHTS_EMPTY` should be used instead.==

==> [!warning] Advice to implementors==

==> It is recommended that `MPI_UNWEIGHTED` not be implemented as `NULL`.==

==> [!tip] Rationale==

==> To ensure backward compatibility, `MPI_UNWEIGHTED` may still be implemented as NULL. See Annex [[versions/v30/sections/changes#Changes from Version 2.2 to Version 3.0|Changes from Version 2.2 to Version 3.0]] on page [[versions/v30/sections/changes#Changes from Version 2.2 to Version 3.0|Changes from Version 2.2 to Version 3.0]] .==

The call creates a new communicator `comm_dist_graph` of distributed graph topology type to which topology information has been attached. The number of processes in `comm_dist_graph` is identical to the number of processes in `comm_old`. The call to ~~[[versions/v30/API/MPI_DIST_GRAPH_CREATE|MPI_Dist_graph_create]]~~ ==[[versions/v30/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]]== is collective.

~~Weights are specified as non-negative integers and can be used to influence the process remapping strategy and other internal MPI optimizations. For instance, approximate count arguments of later communication calls along specific edges could be used as their edge weights. Multiplicity of edges can likewise indicate more intense communication between pairs of processes. However, the exact meaning of edge weights is not specified by the MPI standard and is left to the implementation. In C or Fortran, an application can supply the special value `MPI_UNWEIGHTED` for the weight array to indicate that all edges have the same (effectively no) weight. In C++, this constant does not exist and the weights argument may be omitted from the argument list. It is erroneous to supply `MPI_UNWEIGHTED`, or in C++ omit the weight arrays, for some but not all processes of `comm_old`. Note that `MPI_UNWEIGHTED` is not a special weight value; rather it is a special value for the total array argument. In C, one would expect it to be `NULL`. In Fortran, `MPI_UNWEIGHTED` is an object like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[versions/v30/sections/terms#Named Constants|Named Constants]]~~

==Weights are specified as non-negative integers and can be used to influence the process remapping strategy and other internal MPI optimizations. For instance, approximate count arguments of later communication calls along specific edges could be used as their edge weights. Multiplicity of edges can likewise indicate more intense communication between pairs of processes. However, the exact meaning of edge weights is not specified by the MPI standard and is left to the implementation. In C or Fortran, an application can supply the special value `MPI_UNWEIGHTED` for the weight array to indicate that all edges have the same (effectively no) weight. It is erroneous to supply `MPI_UNWEIGHTED` for some but not all processes of `comm_old`. If the graph is weighted but `n` = 0, then `MPI_WEIGHTS_EMPTY` or any arbitrary array may be passed to weights. Note that `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are not special weight values; rather they are special values for the total array argument. In Fortran, `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are objects like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[versions/v30/sections/terms#Named Constants|Named Constants]] .==

==> [!note] Advice to users==

==> In the case of an empty weights array argument passed while constructing a weighted graph, one should not pass `NULL` because the value of `MPI_UNWEIGHTED` may be equal to `NULL`. The value of this argument would then be indistinguishable from `MPI_UNWEIGHTED` to the implementation. In this case `MPI_WEIGHTS_EMPTY` should be used instead.==

==> [!warning] Advice to implementors==

==> It is recommended that `MPI_UNWEIGHTED` not be implemented as `NULL`.==

==> [!tip] Rationale==

==> To ensure backward compatibility, `MPI_UNWEIGHTED` may still be implemented as NULL. See Annex [[versions/v30/sections/changes#Changes from Version 2.2 to Version 3.0|Changes from Version 2.2 to Version 3.0]] on page [[versions/v30/sections/changes#Changes from Version 2.2 to Version 3.0|Changes from Version 2.2 to Version 3.0]] .==

~~A two-dimensional PxQ torus where all processes communicate along the dimensions and along the diagonal edges. This cannot be modelled with Cartesian topologies, but can easily be captured with [[versions/v30/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] as shown in the following code. In this example, the communication along the dimensions is twice as heavy as the communication along the diagonals:~~

~~    /*     Input:     dimensions P, Q     Condition: number of processes equal to P*Q; otherwise only                 ranks smaller than P*Q participate     */     int rank, x, y;     int sources[1], degrees[1];     int destinations[8], weights[8];~~

==A two-dimensional PxQ torus where all processes communicate along the dimensions and along the diagonal edges. This cannot be modeled with==

==Cartesian topologies, but can easily be captured with [[versions/v30/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] as shown in the following code. In this example, the communication along the dimensions is twice as heavy as the communication along the diagonals:==

==    /*     Input:     dimensions P, Q     Condition: number of processes equal to P*Q; otherwise only                 ranks smaller than P*Q participate     */     int rank, x, y;     int sources[1], degrees[1];     int destinations[8], weights[8];     MPI_Comm comm_dist_graph;==

sources[0] = rank; degrees[0] = 8; MPI_Dist_graph_create(MPI_COMM_WORLD, 1, sources, degrees, destinations, weights, MPI_INFO_NULL, 1, ~~comm_dist_graph)~~ ==&comm_dist_graph);==

### MPI-3.0 → MPI-3.1  (9 changed paragraphs)

> To ensure backward compatibility, `MPI_UNWEIGHTED` may still be implemented as NULL. See ~~Annex [[versions/v31/sections/changes#Changes from Version 2.2 to Version 3.0|Changes from Version 2.2 to Version 3.0]] on page [[versions/v31/sections/changes#Changes from Version 2.2 to Version 3.0|Changes from Version 2.2 to Version 3.0]]~~ .

[[versions/v31/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] returns a handle to a new communicator to which the distributed graph topology information is attached. Concretely, each process calls the constructor with a set of directed `(source,destination)` communication edges as described below. Every process passes an array of `n` source nodes in the `sources` array. For each source node, a non-negative number of destination nodes is specified in the `degrees` array. The destination nodes are stored in the corresponding consecutive segment of the `destinations` array. More precisely, if the `i`-th node in `sources` is `s`, this specifies `degrees[i]` edges `(s,d)` with `d` of the `j`-th such edge stored in ~~`destinations[degrees[0]+...+degrees[i-1]+j]`.~~ ==`destinations[degrees[0]+`$`...`$`+degrees[i-1]+j]`.== The weight of this edge is stored in ~~`weights[degrees[0]+...+degrees[i-1]+j]`.~~ ==`weights[degrees[0]+`$`...`$`+degrees[i-1]+j]`.== Both the `sources` and the `destinations` arrays may contain the same node more than once, and the order in which nodes are listed as destinations or sources is not significant. Similarly, different processes may specify edges with the same source and destination nodes. Source and destination nodes must be process ranks of `comm_old`. Different processes may specify different numbers of source and destination nodes, as well as different source to destination edges. This allows a fully distributed specification of the communication graph. Isolated processes (i.e., processes with no outgoing or incoming edges, that is, processes that do not occur as source or destination node in the graph specification) are allowed.

> In the case of an empty weights array argument passed while constructing a weighted graph, one should not pass `NULL` because the value of `MPI_UNWEIGHTED` may be equal to `NULL`. The value of this argument would then be indistinguishable from `MPI_UNWEIGHTED` to the implementation. ~~In this case~~ `MPI_WEIGHTS_EMPTY` should be used instead.

> To ensure backward compatibility, `MPI_UNWEIGHTED` may still be implemented as NULL. See ~~Annex [[versions/v31/sections/changes#Changes from Version 2.2 to Version 3.0|Changes from Version 2.2 to Version 3.0]] on page [[versions/v31/sections/changes#Changes from Version 2.2 to Version 3.0|Changes from Version 2.2 to Version 3.0]]~~ .

As for Example [[topol-exB]] , assume there are four processes 0, 1, 2, 3 with the following adjacency matrix and unit edge ~~weights:\~~ ==weights:==

With [[versions/v31/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] , this graph could be constructed in many different ways. One way would be that each process specifies its outgoing edges. The arguments per process would ~~be:\~~ ==be:==

Another way would be to pass the whole graph on process 0, which could be done with the following arguments per ~~process:\~~ ==process:==

[[versions/v31/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] could be used to specify this graph using the following ~~arguments:\~~ ==arguments:==

~~A two-dimensional PxQ torus where all processes communicate along the dimensions and along the diagonal edges. This cannot be modeled with~~

~~Cartesian topologies, but can easily be captured with [[versions/v31/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] as shown in the following code. In this example, the communication along the dimensions is twice as heavy as the communication along the diagonals:~~

==A two-dimensional PxQ torus where all processes communicate along the dimensions and along the diagonal edges. This cannot be modeled with Cartesian topologies, but can easily be captured with [[versions/v31/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] as shown in the following code. In this example, the communication along the dimensions is twice as heavy as the communication along the diagonals:==

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

[[versions/v40/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] returns a handle to a new communicator to which the distributed graph topology information is attached. Each process passes all information about its incoming and outgoing edges in the virtual distributed graph topology. The calling processes must ensure that each edge of the graph is described in the source and in the destination process with the same weights. If there are multiple edges for a given ~~`(source,dest)`~~ ==(`source`,`dest`)== pair, then the sequence of the weights of these edges does not matter. The complete communication topology is the combination of all edges shown in the `sources` arrays of all processes in `comm_old`, which must be identical to the combination of all edges shown in the `destinations` arrays. Source and destination ranks must be process ranks of `comm_old`. This allows a fully distributed specification of the communication graph. Isolated processes (i.e., processes with no outgoing or incoming edges, that is, processes that have specified `indegree` and `outdegree` as zero and thus do not occur as source or destination rank in the graph specification) are allowed.

> To ensure backward compatibility, `MPI_UNWEIGHTED` may still be implemented as ~~NULL.~~ ==`NULL`.== See .

[[versions/v40/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] returns a handle to a new communicator to which the distributed graph topology information is attached. Concretely, each process calls the constructor with a set of directed ~~`(source,destination)`~~ ==(`source`,`destination`)== communication edges as described below. Every process passes an array of `n` source nodes in the `sources` array. For each source node, a non-negative number of destination nodes is specified in the `degrees` array. The destination nodes are stored in the corresponding consecutive segment of the `destinations` array. More precisely, if the `i`-th node in `sources` is `s`, this specifies `degrees[i]` edges `(s,d)` with `d` of the `j`-th such edge stored in `destinations[degrees[0]+`$`...`$`+degrees[i-1]+j]`. The weight of this edge is stored in `weights[degrees[0]+`$`...`$`+degrees[i-1]+j]`. Both the `sources` and the `destinations` arrays may contain the same node more than once, and the order in which nodes are listed as destinations or sources is not significant. Similarly, different processes may specify edges with the same source and destination nodes. Source and destination nodes must be process ranks of `comm_old`. Different processes may specify different numbers of source and destination nodes, as well as different source to destination edges. This allows a fully distributed specification of the communication graph. Isolated processes (i.e., processes with no outgoing or incoming edges, that is, processes that do not occur as source or destination node in the graph specification) are allowed.

If ~~`reorder =~~ ==`reorder``=== false`, all processes will have the same rank in `comm_dist_graph` as in `comm_old`. If ~~`reorder =~~ ==`reorder``=== true` then the MPI library is free to remap to other processes (of `comm_old`) in order to improve communication on the edges of the communication graph. The weight associated with each edge is a hint to the MPI library about the amount or intensity of communication on that edge, and may be used to compute a “best” reordering.

Weights are specified as non-negative integers and can be used to influence the process remapping strategy and other internal MPI optimizations. For instance, approximate count arguments of later communication calls along specific edges could be used as their edge weights. Multiplicity of edges can likewise indicate more intense communication between pairs of processes. However, the exact meaning of edge weights is not specified by the MPI standard and is left to the implementation. In C or Fortran, an application can supply the special value `MPI_UNWEIGHTED` for the weight array to indicate that all edges have the same (effectively no) weight. It is erroneous to supply `MPI_UNWEIGHTED` for some but not all processes of `comm_old`. If the graph is weighted but ~~`n` = 0,~~ ==`n``= 0`,== then `MPI_WEIGHTS_EMPTY` or any arbitrary array may be passed to weights. Note that `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are not special weight values; rather they are special values for the total array argument. In Fortran, `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are objects like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[versions/v40/sections/terms#Named Constants|Named Constants]] .

> To ensure backward compatibility, `MPI_UNWEIGHTED` may still be implemented as ~~NULL.~~ ==`NULL`.== See .

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

[[versions/v41/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] requires that each ==MPI== process passes the full (global) communication graph to the call. This limits the scalability of this constructor. With the distributed graph interface, the communication graph is specified in a fully distributed fashion. Each ==MPI== process specifies only the part of the communication graph of which it is aware. Typically, this could be the set of ==MPI== processes from which the ==MPI== process will eventually receive or get data, or the set of ==MPI== processes to which the ==MPI== process will send or put data, or some combination of such edges. Two different interfaces can be used to create a distributed graph topology. [[versions/v41/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] creates a distributed graph communicator with each ==MPI== process specifying each of its incoming and outgoing (adjacent) edges in the logical communication graph and thus requires minimal communication during creation. [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] provides full flexibility such that any ==MPI== process can indicate that communication will occur between any pair of ==MPI== processes in the graph.

[[versions/v41/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] returns a handle to a new communicator to which the distributed graph topology information is attached. Each ==MPI== process passes all information about its incoming and outgoing edges in the virtual distributed graph topology. The calling ==MPI== processes must ensure that each edge of the graph is described in the source and in the destination process with the same weights. If there are multiple edges for a given (`source`,`dest`) pair, then the sequence of the weights of these edges does not matter. The complete communication topology is the combination of all edges shown in the `sources` arrays of all ==MPI== processes in `comm_old`, which must be identical to the combination of all edges shown in the `destinations` arrays. Source and destination ~~ranks~~ ==MPI processes== must be ~~process ranks~~ ==specified by their rank in the group== of `comm_old`. This allows a fully distributed specification of the communication graph. Isolated ==MPI== processes (i.e., ==MPI== processes with no outgoing or incoming edges, that is, ==MPI== processes that have specified `indegree` and `outdegree` as zero and thus do not occur as source or destination ~~rank~~ in the graph specification) are allowed.

The call creates a new communicator `comm_dist_graph` of distributed graph topology type to which topology information has been attached. The number of ==MPI== processes in `comm_dist_graph` is identical to the number of ==MPI== processes in `comm_old`. The call to [[versions/v41/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] is collective.

Weights are specified as ~~non-negative~~ ==nonnegative== integers and can be used to influence the process ~~remapping~~ ==mapping== strategy and other internal MPI optimizations. For instance, approximate count arguments of later communication calls along specific edges could be used as their edge weights. Multiplicity of edges can likewise indicate more intense communication between pairs of ==MPI== processes. However, the exact meaning of edge weights is not specified by the MPI standard and is left to the implementation. In C or Fortran, an application can supply the special value `MPI_UNWEIGHTED` for the weight array to indicate that all edges have the same (effectively no) weight. It is erroneous to supply `MPI_UNWEIGHTED` for some but not all ==MPI== processes of `comm_old`. If the graph is weighted but `indegree` or `outdegree` is zero, then `MPI_WEIGHTS_EMPTY` or any arbitrary array may be passed to `sourceweights` or `destweights` respectively. Note that `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are not special weight values; rather they are special values for the total array argument. In Fortran, `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are objects like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[versions/v41/sections/terms#Named Constants|Named Constants]] .

[[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] returns a handle to a new communicator to which the distributed graph topology information is attached. Concretely, each ==MPI== process calls the constructor with a set of directed (`source`,`destination`) communication edges as described below. Every ==MPI== process passes an array of `n` source nodes in the `sources` array. For each source node, a ~~non-negative~~ ==nonnegative== number of destination nodes is specified in the `degrees` array. The destination nodes are stored in the corresponding consecutive segment of the `destinations` array. More precisely, if the `i`-th node in `sources` is `s`, this specifies `degrees[i]` edges `(s,d)` with `d` of the `j`-th such edge stored in `destinations[degrees[0]+`$`...`$`+degrees[i-1]+j]`. The weight of this edge is stored in `weights[degrees[0]+`$`...`$`+degrees[i-1]+j]`. Both the `sources` and the `destinations` arrays may contain the same node more than once, and the order in which nodes are listed as destinations or sources is not significant. Similarly, different processes may specify edges with the same source and destination nodes. Source and destination nodes must be ~~process ranks~~ ==specified by their rank in the group== of `comm_old`. Different ==MPI== processes may specify different numbers of source and destination nodes, as well as different source to destination edges. This allows a fully distributed specification of the communication graph. Isolated ==MPI== processes (i.e., ==MPI== processes with no outgoing or incoming edges, that is, ==MPI== processes that do not occur as source or destination node in the graph specification) are allowed.

The call creates a new communicator `comm_dist_graph` of distributed graph topology type to which topology information has been attached. The number of ==MPI== processes in `comm_dist_graph` is identical to the number of ==MPI== processes in `comm_old`. The call to [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] is collective.

If `reorder``= false`, all ==MPI== processes will have the same rank in `comm_dist_graph` as in `comm_old`. If `reorder``= true` then the MPI library is free to remap to other ==MPI== processes (of `comm_old`) in order to improve communication on the edges of the communication graph. The weight associated with each edge is a hint to the MPI library about the amount or intensity of communication on that edge, and may be used to compute a “best” reordering.

Weights are specified as ~~non-negative~~ ==nonnegative== integers and can be used to influence the ==MPI== process remapping strategy and other internal MPI optimizations. For instance, approximate count arguments of later communication calls along specific edges could be used as their edge weights. Multiplicity of edges can likewise indicate more intense communication between pairs of ==MPI== processes. However, the exact meaning of edge weights ==and multiplicity of edges== is not specified by the MPI standard and is left to the implementation. In C or Fortran, an application can supply the special value `MPI_UNWEIGHTED` for the weight array to indicate that all edges have the same (effectively no) weight. It is erroneous to supply `MPI_UNWEIGHTED` for some but not all ==MPI== processes of `comm_old`. If the graph is weighted but `n``= 0`, then `MPI_WEIGHTS_EMPTY` or any arbitrary array may be passed to weights. Note that `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are not special weight values; rather they are special values for the total array argument. In Fortran, `MPI_UNWEIGHTED` and `MPI_WEIGHTS_EMPTY` are objects like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[versions/v41/sections/terms#Named Constants|Named Constants]] .

The meaning of the `weights` argument can be influenced by the `info` argument. ~~Info arguments~~ ==The info argument== can be used to guide the ~~mapping;~~ ==mapping of MPI processes to the hardware;== possible options include minimizing the maximum number of edges between processes on different SMP nodes, or minimizing the sum of all such edges. ~~An~~ ==As described in [[versions/v41/sections/misc#The Info Object|The Info Object]] , an== MPI implementation is not obliged to follow specific hints, and it is valid for an MPI implementation not to do any reordering. An MPI implementation may specify more `info` ~~key-value~~ ==(`key`,`value`)== pairs. All ==MPI== processes must specify the same set of ~~key-value~~ ==(`key`,`value`)== `info` pairs.

~~> MPI implementations must document any additionally supported key-value `info` pairs. `MPI_INFO_NULL` is always valid, and may indicate the default creation of the distributed graph topology to the MPI library. > > An implementation does not explicitly need to construct the topology from its distributed parts. However, all processes can construct the full topology from the distributed specification and use this in a call to [[versions/v41/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] to create the topology. This may serve as a reference implementation of the functionality, and may be acceptable for small communicators. However, a scalable high-quality implementation would save the topology graph in a distributed way.~~

~~As for Example [[topol-exB]] , assume there are four processes 0, 1, 2, 3 with the following adjacency matrix and unit edge weights:~~

~~| process | neighbors | |:-------:|:----------| |    0    | 1, 3      | |    1    | 0         | |    2    | 3         | |    3    | 0, 2      |~~

~~With [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] , this graph could be constructed in many different ways. One way would be that each process specifies its outgoing edges. The arguments per process would be:~~

~~| process | `n` | `sources` | `degrees` | `destinations` | `weights` | |:-------:|:----|:----------|:----------|:---------------|:----------| |    0    | 1   | 0         | 2         | 1,3            | 1,1       | |    1    | 1   | 1         | 1         | 0              | 1         | |    2    | 1   | 2         | 1         | 3              | 1         | |    3    | 1   | 3         | 2         | 0,2            | 1,1       |~~

~~Another way would be to pass the whole graph on process 0, which could be done with the following arguments per process:~~

~~| process | `n` | `sources` | `degrees` | `destinations` | `weights`   | |:-------:|:----|:----------|:----------|:---------------|:------------| |    0    | 4   | 0,1,2,3   | 2,1,1,2   | 1,3,0,3,0,2    | 1,1,1,1,1,1 | |    1    | 0   | \-        | \-        | \-             | \-          | |    2    | 0   | \-        | \-        | \-             | \-          | |    3    | 0   | \-        | \-        | \-             |             |~~

==> MPI implementations must document any additionally supported (`key`,`value`) `info` pairs. `MPI_INFO_NULL` is always valid, and may indicate the default creation of the distributed graph topology to the MPI library. > > An implementation does not explicitly need to construct the topology from its distributed parts. However, all MPI processes can construct the full topology from the distributed specification and use this in a call to [[versions/v41/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] to create the topology. This may serve as a reference implementation of the functionality, and may be acceptable for small communicators. However, a scalable high-quality implementation would save the topology graph in a distributed way.==

==Several ways to specify the adjacency matrix for [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] and [[versions/v41/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] .==

==As for Example [[topol-exB]] , assume there are four MPI processes with ranks 0, 1, 2, 3 in the input communicator with the following adjacency matrix and unit edge weights:==

==| MPI process | neighbors | |:-----------:|:----------| |      0      | 1, 3      | |      1      | 0         | |      2      | 3         | |      3      | 0, 2      |==

==With [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] , this graph could be constructed in many different ways. One way would be that each MPI process specifies its outgoing edges. The arguments per MPI process would be:==

==| MPI process | `n` | `sources` | `degrees` | `destinations` | `weights` | |:-----------:|:----|:----------|:----------|:---------------|:----------| |      0      | 1   | 0         | 2         | 1,3            | 1,1       | |      1      | 1   | 1         | 1         | 0              | 1         | |      2      | 1   | 2         | 1         | 3              | 1         | |      3      | 1   | 3         | 2         | 0,2            | 1,1       |==

==Another way would be to pass the whole graph on MPI process with rank `0` in the input communicator, which could be done with the following arguments per MPI process:==

==| MPI process | `n` | `sources` | `degrees` | `destinations` | `weights`   | |:-----------:|:----|:----------|:----------|:---------------|:------------| |      0      | 4   | 0,1,2,3   | 2,1,1,2   | 1,3,0,3,0,2    | 1,1,1,1,1,1 | |      1      | 0   | \-        | \-        | \-             | \-          | |      2      | 0   | \-        | \-        | \-             | \-          | |      3      | 0   | \-        | \-        | \-             |             |==

~~| process | `indegree` | `sources` | `sourceweights` | `outdegree` | `destinations` | `destweights` | |:--:|:---|:---|:---|:---|:---|:---| | 0 | 2 | 1,3 | 1,1 | 2 | 1,3 | 1,1 | | 1 | 1 | 0 | 1 | 1 | 0 | 1 | | 2 | 1 | 3 | 1 | 1 | 3 | 1 | | 3 | 2 | 0,2 | 1,1 | 2 | 0,2 | 1,1 |~~

~~A two-dimensional PxQ torus where all processes communicate along the dimensions and along the diagonal edges. This cannot be modeled with Cartesian topologies, but can easily be captured with [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] as shown in the following code. In this example, the communication along the dimensions is twice as heavy as the communication along the diagonals:~~

~~    /*     Input:     dimensions P, Q     Condition: number of processes equal to P*Q; otherwise only                 ranks smaller than P*Q participate     */     int rank, x, y;     int sources[1], degrees[1];     int destinations[8], weights[8];     MPI_Comm comm_dist_graph;~~

~~    MPI_Comm_rank(MPI_COMM_WORLD, &rank);~~

~~    /* get x and y dimension */     y=rank/P; x=rank%P;~~

~~    /* get my communication partners along x dimension */     destinations[0] = P*y+(x+1)%P; weights[0] = 2;     destinations[1] = P*y+(P+x-1)%P; weights[1] = 2;~~

~~    /* get my communication partners along y dimension */     destinations[2] = P*((y+1)%Q)+x; weights[2] = 2;     destinations[3] = P*((Q+y-1)%Q)+x; weights[3] = 2;~~

~~    /* get my communication partners along diagonals */     destinations[4] = P*((y+1)%Q)+(x+1)%P; weights[4] = 1;     destinations[5] = P*((Q+y-1)%Q)+(x+1)%P; weights[5] = 1;     destinations[6] = P*((y+1)%Q)+(P+x-1)%P; weights[6] = 1;     destinations[7] = P*((Q+y-1)%Q)+(P+x-1)%P; weights[7] = 1;~~

~~    sources[0] = rank;     degrees[0] = 8;     MPI_Dist_graph_create(MPI_COMM_WORLD, 1, sources, degrees, destinations,                           weights, MPI_INFO_NULL, 1, &comm_dist_graph);~~

==| MPI process | `indegree` | `sources` | `sourceweights` | `outdegree` | `destinations` | `destweights` | |:--:|:---|:---|:---|:---|:---|:---| | 0 | 2 | 1,3 | 1,1 | 2 | 1,3 | 1,1 | | 1 | 1 | 0 | 1 | 1 | 0 | 1 | | 2 | 1 | 3 | 1 | 1 | 3 | 1 | | 3 | 2 | 0,2 | 1,1 | 2 | 0,2 | 1,1 |==

==Cartesian grid plus diagonals specified with [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] .==

==A two-dimensional $`P \times Q`$ torus where all MPI processes communicate along the dimensions and along the diagonal edges cannot be modeled with Cartesian topologies, but can easily be captured with [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] as shown in the following code. In this example, the communication along the dimensions is twice as heavy as the communication along the diagonals:==

==(code block added)==
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

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

> MPI implementations must document ~~any~~ ==every== additionally supported (`key`,`value`) `info` ~~pairs.~~ ==pair.== `MPI_INFO_NULL` is always valid, and may indicate the default creation of the distributed graph topology to the MPI library. > > An implementation does not explicitly need to construct the topology from its distributed parts. However, all MPI processes can construct the full topology from the distributed specification and use this in a call to [[versions/v50/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] to create the topology. This may serve as a reference implementation of the functionality, and may be acceptable for small communicators. However, a scalable high-quality implementation would save the topology graph in a distributed way.

## Text by release

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/topol#Distributed (Graph) Constructor]]
