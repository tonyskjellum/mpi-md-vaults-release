---
title: "Topology Inquiry Functions"
chapter: topol
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# Topology Inquiry Functions

Chapter **topol** · in [[versions/v13/sections/topol#Topology inquiry functions|MPI-1.3]], [[versions/v21/sections/topol#Topology Inquiry Functions|MPI-2.1]], [[versions/v22/sections/topol#Topology Inquiry Functions|MPI-2.2]], [[versions/v30/sections/topol#Topology Inquiry Functions|MPI-3.0]], [[versions/v31/sections/topol#Topology Inquiry Functions|MPI-3.1]], [[versions/v40/sections/topol#Topology Inquiry Functions|MPI-4.0]], [[versions/v41/sections/topol#Topology Inquiry Functions|MPI-4.1]], [[versions/v50/sections/topol#Topology Inquiry Functions|MPI-5.0]]

Heading by release: MPI-1.3: “Topology inquiry functions”; MPI-2.1: “Topology Inquiry Functions”; MPI-2.2: “Topology Inquiry Functions”; MPI-3.0: “Topology Inquiry Functions”; MPI-3.1: “Topology Inquiry Functions”; MPI-4.0: “Topology Inquiry Functions”; MPI-4.1: “Topology Inquiry Functions”; MPI-5.0: “Topology Inquiry Functions”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (6 changed paragraphs)

~~cartesian~~ ==Cartesian== topology

~~The functions `MPI_CARTDIM_GET` and `MPI_CART_GET` return the cartesian topology information that was associated with a communicator by `MPI_CART_CREATE`.~~

==The functions `MPI_CARTDIM_GET` and `MPI_CART_GET` return the Cartesian topology information that was associated with a communicator by `MPI_CART_CREATE`.==

==If `comm` is associated with a zero-dimensional Cartesian topology, [[versions/v21/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]] returns `ndims=0` and [[versions/v21/API/MPI_CART_GET|MPI_CART_GET]] will keep all output arguments unchanged.==

For a process group with ~~cartesian~~ ==Cartesian== structure, the function `MPI_CART_RANK` translates the logical process coordinates to process ranks as they are used by the point-to-point routines.

==If `comm` is associated with a zero-dimensional Cartesian topology, `coord` is not significant and 0 is returned in `rank`.==

==If `comm` is associated with a zero-dimensional Cartesian topology, `coords` will be unchanged.==

~~`MPI_GRAPH_NEIGHBORS_COUNT` and `MPI_GRAPH_NEIGHBORS` provide adjacency information for a general, graph topology.~~

==`MPI_GRAPH_NEIGHBORS_COUNT` and `MPI_GRAPH_NEIGHBORS` provide==

==adjacency information for a general graph topology.==

### MPI-2.1 → MPI-2.2  (5 changed paragraphs)

==distributed graph topology==

If `comm` is associated with a zero-dimensional Cartesian topology, ~~`coord`~~ ==`coords`== is not significant and 0 is returned in `rank`.

~~`MPI_GRAPH_NEIGHBORS_COUNT` and `MPI_GRAPH_NEIGHBORS` provide~~

~~adjacency information for a general graph topology.~~

==[[versions/v22/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] and `MPI_GRAPH_NEIGHBORS` provide adjacency information for a general graph topology.==

==The returned count and array of neighbors for the queried rank will both include *all* neighbors and reflect the same edge ordering as was specified by the original call to [[versions/v22/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] .==

==Specifically, [[versions/v22/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] and [[versions/v22/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] will return values based on the original `index` and `edges` array passed to [[versions/v22/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] (assuming that `index[-1]` effectively equals zero):==

==- The `count` returned from [[versions/v22/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] will be (`index[rank]` - `index[rank-1]`).==

==- The `neighbors` array returned from [[versions/v22/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] will be edges\[index\[rank-1\]\] through edges\[index\[rank\]-1\].==

== Assume there are four processes 0, 1, 2, 3 with the following adjacency matrix (note that some neighbors are listed multiple times):\==

==\|c\|l\| process & neighbors   & 1, 1, 3  1 & 0, 0  2 & 3  3 & 0, 2, 2  ==

==Thus, the input arguments to [[versions/v22/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] are:\==

==ll nnodes = & 4  index = & 3, 5, 6, 9  edges = & 1, 1, 3, 0, 0, 3, 0, 2, 2==

==Therefore, calling [[versions/v22/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] and [[versions/v22/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] for each of the 4 processes will return:\==

==ccl **Input rank** & **Count** & **Neighbors**   & 3 & 1, 1, 3  1 & 2 & 0, 0  2 & 1 & 3  3 & 3 & 0, 2, 2  ==

==[[versions/v22/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI_DIST_GRAPH_NEIGHBORS_COUNT]] and [[versions/v22/API/MPI_DIST_GRAPH_NEIGHBORS|MPI_DIST_GRAPH_NEIGHBORS]] provide adjacency information for a distributed graph topology.==

==![[versions/v22/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT]]==

==![[versions/v22/API/MPI_DIST_GRAPH_NEIGHBORS]]==

==These calls are local. The number of edges into and out of the process returned by [[versions/v22/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI_DIST_GRAPH_NEIGHBORS_COUNT]] are the total number of such edges given in the call to [[versions/v22/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] or [[versions/v22/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] (potentially by processes other than the calling process in the case of [[versions/v22/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] ). Multiply defined edges are all counted and returned by [[versions/v22/API/MPI_DIST_GRAPH_NEIGHBORS|MPI_DIST_GRAPH_NEIGHBORS]] in some order. If `MPI_UNWEIGHTED` is supplied for `sourceweights` or `destweights` or both, or if `MPI_UNWEIGHTED` was supplied during the construction of the graph then no weight information is returned in that array or those arrays. The only requirement on the order of values in `sources` and `destinations` is that two calls to the routine with same input argument `comm` will return the same sequence of edges. If `maxindegree` or `maxoutdegree` is smaller than the numbers returned by [[MPI_DIST_GRAPH_NEIGHBOR_COUNT]] , then only the first part of the full list is returned. Note, that the order of returned edges does need not to be identical to the order that was provided in the creation of `comm` for the case that [[versions/v22/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] was used.==

==> [!warning] Advice to implementors==

==> Since the query calls are defined to be local, each process needs to store the list of its neighbors with incoming and outgoing edges. Communication is required at the collective [[versions/v22/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] call in order to compute the neighbor lists for each process from the distributed graph specification.==

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~The functions `MPI_CARTDIM_GET` and `MPI_CART_GET` return the Cartesian topology information that was associated with a communicator by `MPI_CART_CREATE`.~~

~~If `comm` is associated with a zero-dimensional Cartesian topology, [[versions/v30/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]] returns `ndims=0` and [[versions/v30/API/MPI_CART_GET|MPI_CART_GET]] will keep all output arguments unchanged.~~

==The functions `MPI_CARTDIM_GET` and `MPI_CART_GET` return the Cartesian topology information that was associated with a communicator by `MPI_CART_CREATE`. If `comm` is associated with a zero-dimensional Cartesian topology, [[versions/v30/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]] returns `ndims=0` and [[versions/v30/API/MPI_CART_GET|MPI_CART_GET]] will keep all output arguments unchanged.==

[[versions/v30/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] and `MPI_GRAPH_NEIGHBORS` provide adjacency information for a ~~general~~ graph topology.

- The ~~`count`~~ ==number of neighbors (`nneighbors`)== returned from [[versions/v30/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] will be (`index[rank]` - `index[rank-1]`).

~~These calls are local. The number of edges into and out of the process returned by [[versions/v30/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI_DIST_GRAPH_NEIGHBORS_COUNT]] are the total number of such edges given in the call to [[versions/v30/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] or [[versions/v30/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] (potentially by processes other than the calling process in the case of [[versions/v30/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] ). Multiply defined edges are all counted and returned by [[versions/v30/API/MPI_DIST_GRAPH_NEIGHBORS|MPI_DIST_GRAPH_NEIGHBORS]] in some order. If `MPI_UNWEIGHTED` is supplied for `sourceweights` or `destweights` or both, or if `MPI_UNWEIGHTED` was supplied during the construction of the graph then no weight information is returned in that array or those arrays. The only requirement on the order of values in `sources` and `destinations` is that two calls to the routine with same input argument `comm` will return the same sequence of edges. If `maxindegree` or `maxoutdegree` is smaller than the numbers returned by [[MPI_DIST_GRAPH_NEIGHBOR_COUNT]] , then only the first part of the full list is returned. Note, that the order of returned edges does need not to be identical to the order that was provided in the creation of `comm` for the case that [[versions/v30/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] was used.~~

==These calls are local. The number of edges into and out of the process returned by [[versions/v30/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI_DIST_GRAPH_NEIGHBORS_COUNT]] are the total number of such edges given in the call to [[versions/v30/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] or [[versions/v30/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] (potentially by processes other than the calling process in the case of [[versions/v30/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] ). Multiply defined edges are all counted and returned by [[versions/v30/API/MPI_DIST_GRAPH_NEIGHBORS|MPI_DIST_GRAPH_NEIGHBORS]] in some order. If `MPI_UNWEIGHTED` is supplied for `sourceweights` or `destweights` or both, or if `MPI_UNWEIGHTED` was supplied during the construction of the graph then no weight information is returned in that array or those arrays.==

==If the communicator was created with [[versions/v30/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] then for each rank in `comm`, the order of the values in `sources` and `destinations` is identical to the input that was used by the process with the same rank in `comm_old` in the creation call.==

==If the communicator was created with [[versions/v30/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] then the==

==only requirement on the order of values in `sources` and `destinations` is that two calls to the routine with same input argument `comm` will return the same sequence of edges. If `maxindegree` or `maxoutdegree` is smaller than the numbers returned by [[MPI_DIST_GRAPH_NEIGHBOR_COUNT]] , then only the first part of the full list is returned.==

### MPI-3.0 → MPI-3.1  (11 changed paragraphs)

The function ~~`MPI_TOPO_TEST`~~ ==[[versions/v31/API/MPI_TOPO_TEST|MPI_TOPO_TEST]]== returns the type of topology that is assigned to a communicator.

Functions ~~`MPI_GRAPHDIMS_GET`~~ ==[[versions/v31/API/MPI_GRAPHDIMS_GET|MPI_GRAPHDIMS_GET]]== and ~~`MPI_GRAPH_GET`~~ ==[[versions/v31/API/MPI_GRAPH_GET|MPI_GRAPH_GET]]== retrieve the graph-topology information that was associated with a communicator by ~~`MPI_GRAPH_CREATE`.~~ ==[[versions/v31/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] .==

The information provided by ~~`MPI_GRAPHDIMS_GET`~~ ==[[versions/v31/API/MPI_GRAPHDIMS_GET|MPI_GRAPHDIMS_GET]]== can be used to dimension the vectors `index` and `edges` correctly for the following call to ~~`MPI_GRAPH_GET`.~~ ==[[versions/v31/API/MPI_GRAPH_GET|MPI_GRAPH_GET]] .==

The functions ~~`MPI_CARTDIM_GET`~~ ==[[versions/v31/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]]== and ~~`MPI_CART_GET`~~ ==[[versions/v31/API/MPI_CART_GET|MPI_CART_GET]]== return the Cartesian topology information that was associated with a communicator by ~~`MPI_CART_CREATE`.~~ ==[[versions/v31/API/MPI_CART_CREATE|MPI_CART_CREATE]] .== If `comm` is associated with a zero-dimensional Cartesian topology, [[versions/v31/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]] returns `ndims=0` and [[versions/v31/API/MPI_CART_GET|MPI_CART_GET]] will keep all output arguments unchanged.

For a process group with Cartesian structure, the function ~~`MPI_CART_RANK`~~ ==[[versions/v31/API/MPI_CART_RANK|MPI_CART_RANK]]== translates the logical process coordinates to process ranks as they are used by the point-to-point routines.

The inverse mapping, rank-to-coordinates translation is provided by ~~`MPI_CART_COORDS`.~~ ==[[versions/v31/API/MPI_CART_COORDS|MPI_CART_COORDS]] .==

~~[[versions/v31/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] and `MPI_GRAPH_NEIGHBORS` provide adjacency information for a graph topology.~~

~~The returned count and array of neighbors for the queried rank will both include *all* neighbors and reflect the same edge ordering as was specified by the original call to [[versions/v31/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] .~~

~~Specifically, [[versions/v31/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] and [[versions/v31/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] will return values based on the original `index` and `edges` array passed to [[versions/v31/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] (assuming that `index[-1]` effectively equals zero):~~

==[[versions/v31/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] and [[versions/v31/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] provide adjacency information for a graph topology. The returned count and array of neighbors for the queried rank will both include *all* neighbors and reflect the same edge ordering as was specified by the original call to [[versions/v31/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] . Specifically, [[versions/v31/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] and [[versions/v31/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] will return values based on the original `index` and `edges` array passed to [[versions/v31/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] (for the purpose of this example, we assume that `index[-1]` is zero):==

- The `neighbors` array returned from [[versions/v31/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] will be ~~edges\[index\[rank-1\]\]~~ ==`edges[index[rank-1]]`== through ~~edges\[index\[rank\]-1\].~~ ==`edges[index[rank]-1]`.==

Assume there are four processes 0, 1, 2, 3 with the following adjacency matrix (note that some neighbors are listed multiple ~~times):\~~ ==times):==

Thus, the input arguments to [[versions/v31/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] ~~are:\~~ ==are:==

Therefore, calling [[versions/v31/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] and [[versions/v31/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] for each of the 4 processes will ~~return:\~~ ==return:==

ccl ~~**Input rank**~~ & ~~**Count**~~ & ~~**Neighbors**~~ & 3 & 1, 1, 3 1 & 2 & 0, 0 2 & 1 & 3 3 & 3 & 0, 2, 2

Suppose that `comm` is a communicator with a shuffle-exchange topology. The group has $`2^n`$ members. Each process is labeled by $`a_1 , ..., a_n`$ with $`a_i \in \{0,1\}`$, and has three neighbors: exchange($`a_1 , ..., a_n ) = a_1 ,..., a_{n-1}, \bar{a}_n`$ ($`\bar{a} = 1-a`$), shuffle($`a_1 , ..., a_n )= a_2 , ..., a_{n}, a_1`$, and unshuffle($`a_1 , ..., a_n ) = a_n , a_1 , ... , a_{n-1}`$. The graph adjacency list is illustrated below for ~~$`n=3`$.\~~ ==$`n=3`$.==

~~\|cc\|ccc\| **node**&**exchange**&**shuffle**&**unshuffle**\ & & neighbors(1) & neighbors(2) & neighbors(3)\ & (000) & 1 & 0 & 0\ 1 & (001) & 0 & 2 & 4\ 2 & (010) & 3 & 4 & 1\ 3 & (011) & 2 & 6 & 5\ 4 & (100) & 5 & 1 & 2\ 5 & (101) & 4 & 3 & 6\ 6 & (110) & 7 & 5 & 3\ 7 & (111) & 6 & 7 & 7\~~ ==<table> <tbody> <tr> <td colspan="2" style="text-align: center;"><strong>node</strong></td> <td style="text-align: center;"><span><strong>exchange</strong></span></td> <td style="text-align: center;"><span><strong>shuffle</strong></span></td> <td style="text-align: center;"><span><strong>unshuffle</strong></span></td> </tr> <tr> <td style="text-align: center;"></td> <td style="text-align: center;"></td> <td style="text-align: center;">neighbors(1)</td> <td style="text-align: center;">neighbors(2)</td> <td style="text-align: center;">neighbors(3)</td> </tr> <tr> <td style="text-align: center;">0</td> <td style="text-align: center;">(000)</td> <td style="text-align: center;">1</td> <td style="text-align: center;">0</td> <td style="text-align: center;">0</td> </tr> <tr> <td style="text-align: center;">1</td> <td style="text-align: center;">(001)</td> <td style="text-align: center;">0</td> <td style="text-align: center;">2</td> <td style="text-align: center;">4</td> </tr> <tr> <td style="text-align: center;">2</td> <td style="text-align: center;">(010)</td> <td style="text-align: center;">3</td> <td style="text-align: center;">4</td> <td style="text-align: center;">1</td> </tr> <tr> <td style="text-align: center;">3</td> <td style="text-align: center;">(011)</td> <td style="text-align: center;">2</td> <td style="text-align: center;">6</td> <td style="text-align: center;">5</td> </tr> <tr> <td style="text-align: center;">4</td> <td style="text-align: center;">(100)</td> <td style="text-align: center;">5</td> <td style="text-align: center;">1</td> <td style="text-align: center;">2</td> </tr> <tr> <td style="text-align: center;">5</td> <td style="text-align: center;">(101)</td> <td style="text-align: center;">4</td> <td style="text-align: center;">3</td> <td style="text-align: center;">6</td> </tr> <tr> <td style="text-align: center;">6</td> <td style="text-align: center;">(110)</td> <td style="text-align: center;">7</td> <td style="text-align: center;">5</td> <td style="text-align: center;">3</td> </tr> <tr> <td style="text-align: center;">7</td> <td style="text-align: center;">(111)</td> <td style="text-align: center;">6</td> <td style="text-align: center;">7</td> <td style="text-align: center;">7</td> </tr> </tbody> </table>==

~~C~~ ==!== assume: each process has stored a real number A. ~~C~~ ==!== extract neighborhood information CALL MPI_COMM_RANK(comm, myrank, ierr) CALL MPI_GRAPH_NEIGHBORS(comm, myrank, 3, neighbors, ierr) ~~C~~ ==!== perform exchange permutation CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(1), 0, ~~+~~ ==&== neighbors(1), 0, comm, status, ierr) ~~C~~ ==!== perform shuffle permutation CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(2), 0, ~~+~~ ==&== neighbors(3), 0, comm, status, ierr) ~~C~~ ==!== perform unshuffle permutation CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(3), 0, ~~+~~ ==&== neighbors(2), 0, comm, status, ierr)

~~These calls are local. The number of edges into and out of the process returned by [[versions/v31/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI_DIST_GRAPH_NEIGHBORS_COUNT]] are the total number of such edges given in the call to [[versions/v31/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] or [[versions/v31/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] (potentially by processes other than the calling process in the case of [[versions/v31/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] ). Multiply defined edges are all counted and returned by [[versions/v31/API/MPI_DIST_GRAPH_NEIGHBORS|MPI_DIST_GRAPH_NEIGHBORS]] in some order. If `MPI_UNWEIGHTED` is supplied for `sourceweights` or `destweights` or both, or if `MPI_UNWEIGHTED` was supplied during the construction of the graph then no weight information is returned in that array or those arrays.~~

~~If the communicator was created with [[versions/v31/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] then for each rank in `comm`, the order of the values in `sources` and `destinations` is identical to the input that was used by the process with the same rank in `comm_old` in the creation call.~~

~~If the communicator was created with [[versions/v31/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] then the~~

~~only requirement on the order of values in `sources` and `destinations` is that two calls to the routine with same input argument `comm` will return the same sequence of edges. If `maxindegree` or `maxoutdegree` is smaller than the numbers returned by [[MPI_DIST_GRAPH_NEIGHBOR_COUNT]] , then only the first part of the full list is returned.~~

==These calls are local. The number of edges into and out of the process returned by [[versions/v31/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI_DIST_GRAPH_NEIGHBORS_COUNT]] are the total number of such edges given in the call to [[versions/v31/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] or [[versions/v31/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] (potentially by processes other than the calling process in the case of [[versions/v31/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] ). Multiply defined edges are all counted and returned by [[versions/v31/API/MPI_DIST_GRAPH_NEIGHBORS|MPI_DIST_GRAPH_NEIGHBORS]] in some order. If `MPI_UNWEIGHTED` is supplied for `sourceweights` or `destweights` or both, or if `MPI_UNWEIGHTED` was supplied during the construction of the graph then no weight information is returned in that array or those arrays. If the communicator was created with [[versions/v31/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] then for each rank in `comm`, the order of the values in `sources` and `destinations` is identical to the input that was used by the process with the same rank in `comm_old` in the creation call. If the communicator was created with [[versions/v31/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] then the only requirement on the order of values in `sources` and `destinations` is that two calls to the routine with same input argument `comm` will return the same sequence of edges. If `maxindegree` or `maxoutdegree` is smaller than the numbers returned by [[MPI_DIST_GRAPH_NEIGHBOR_COUNT]] , then only the first part of the full list is returned.==

### MPI-3.1 → MPI-4.0  (6 changed paragraphs)

~~Functions [[versions/v40/API/MPI_GRAPHDIMS_GET|MPI_GRAPHDIMS_GET]] and [[versions/v40/API/MPI_GRAPH_GET|MPI_GRAPH_GET]] retrieve the graph-topology information that was associated with a communicator by [[versions/v40/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] .~~

~~The information provided by [[versions/v40/API/MPI_GRAPHDIMS_GET|MPI_GRAPHDIMS_GET]] can be used to dimension the vectors `index` and `edges` correctly for the following call to [[versions/v40/API/MPI_GRAPH_GET|MPI_GRAPH_GET]] .~~

==The functions [[versions/v40/API/MPI_GRAPHDIMS_GET|MPI_GRAPHDIMS_GET]] and [[versions/v40/API/MPI_GRAPH_GET|MPI_GRAPH_GET]] retrieve the graph-/topology information that is associated with the communicator. The information provided by [[versions/v40/API/MPI_GRAPHDIMS_GET|MPI_GRAPHDIMS_GET]] can be used to dimension the vectors `index` and `edges` correctly for the following call to [[versions/v40/API/MPI_GRAPH_GET|MPI_GRAPH_GET]] .==

The functions [[versions/v40/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]] and [[versions/v40/API/MPI_CART_GET|MPI_CART_GET]] return the Cartesian topology information that ~~was~~ ==is== associated with ~~a communicator by [[versions/v40/API/MPI_CART_CREATE|MPI_CART_CREATE]] .~~ ==the communicator.== If `comm` is associated with a zero-dimensional Cartesian topology, [[versions/v40/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]] returns ~~`ndims=0`~~ ==`ndims``= 0`== and [[versions/v40/API/MPI_CART_GET|MPI_CART_GET]] will keep all output arguments unchanged.

~~For a process group with Cartesian structure, the function [[versions/v40/API/MPI_CART_RANK|MPI_CART_RANK]] translates the logical process coordinates to process ranks as they are used by the point-to-point routines.~~

~~For dimension `i` with `periods(i) = true`, if the coordinate, `coords(i)`, is out of range, that is, `coords(i) `$`<`$` 0` or `coords(i) `$`\geq`$` dims(i)`, it is shifted back to the interval~~

~~`0 `$`\leq`$` coords(i) `$`<`$` dims(i)` automatically. Out-of-range coordinates are erroneous for non-periodic dimensions.~~

==For a communicator with an associated Cartesian topology, the function [[versions/v40/API/MPI_CART_RANK|MPI_CART_RANK]] translates the logical process coordinates to process ranks. For dimension `i` with `periods(i) = true`, if the coordinate, `coords(i)`, is out of range, that is, `coords(i) `$`<`$` 0` or `coords(i) `$`\geq`$` dims(i)`, it is shifted back to the interval `0 `$`\leq`$` coords(i) `$`<`$` dims(i)` automatically. Out-of-range coordinates are erroneous for nonperiodic dimensions.==

~~The inverse mapping, rank-to-coordinates translation is provided by [[versions/v40/API/MPI_CART_COORDS|MPI_CART_COORDS]] .~~

~~If `comm` is associated with a zero-dimensional Cartesian topology, `coords` will be unchanged.~~

==The inverse mapping, rank-to-coordinates translation is provided by [[versions/v40/API/MPI_CART_COORDS|MPI_CART_COORDS]] . If `comm` is associated with a zero-dimensional Cartesian topology, `coords` will be unchanged.==

! assume: each process has stored a real number A. ! extract neighborhood information CALL MPI_COMM_RANK(comm, myrank, ierr) CALL MPI_GRAPH_NEIGHBORS(comm, myrank, 3, neighbors, ierr) ! perform exchange permutation CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(1), 0, & neighbors(1), 0, comm, status, ierr) ! perform shuffle permutation CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(2), 0, & neighbors(3), 0, comm, status, ierr) ! perform unshuffle permutation CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(3), 0, & neighbors(2), 0, comm, status, ierr)

These calls are local. The number of edges into and out of the process returned by [[versions/v40/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI_DIST_GRAPH_NEIGHBORS_COUNT]] are the total number of such edges given in the call to [[versions/v40/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] or [[versions/v40/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] (potentially by processes other than the calling process in the case of [[versions/v40/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] ). ~~Multiply defined~~ ==Multiply-defined== edges are all counted and returned by [[versions/v40/API/MPI_DIST_GRAPH_NEIGHBORS|MPI_DIST_GRAPH_NEIGHBORS]] in some order. If `MPI_UNWEIGHTED` is supplied for `sourceweights` or `destweights` or both, or if `MPI_UNWEIGHTED` was supplied during the construction of the graph then no weight information is returned in that array or those arrays. If the communicator was created with [[versions/v40/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] then for each rank in `comm`, the order of the values in `sources` and `destinations` is identical to the input that was used by the process with the same rank in `comm_old` in the creation call. If the communicator was created with [[versions/v40/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] then the only requirement on the order of values in `sources` and `destinations` is that two calls to the routine with same input argument `comm` will return the same sequence of edges. If `maxindegree` or `maxoutdegree` is smaller than the numbers returned by ~~[[MPI_DIST_GRAPH_NEIGHBOR_COUNT]]~~ ==[[versions/v40/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI_DIST_GRAPH_NEIGHBORS_COUNT]]== , then only the first part of the full list is returned.

### MPI-4.0 → MPI-4.1  (12 changed paragraphs)

If a ~~topology~~ ==*virtual topology*== has been defined with one of the above functions, then the topology information can be looked up using inquiry functions. They all are local calls.

The function [[versions/v41/API/MPI_TOPO_TEST|MPI_TOPO_TEST]] returns the type of topology that is ~~assigned to~~ ==associated with== a communicator.

The functions [[versions/v41/API/MPI_GRAPHDIMS_GET|MPI_GRAPHDIMS_GET]] and [[versions/v41/API/MPI_GRAPH_GET|MPI_GRAPH_GET]] retrieve the ~~graph-/topology~~ ==graph topology== information that is associated with the communicator. The information provided by [[versions/v41/API/MPI_GRAPHDIMS_GET|MPI_GRAPHDIMS_GET]] can be used to dimension the vectors `index` and `edges` correctly for the following call to [[versions/v41/API/MPI_GRAPH_GET|MPI_GRAPH_GET]] .

==If `maxdims` in a call to [[versions/v41/API/MPI_CART_GET|MPI_CART_GET]] is less than the number of dimensions of the Cartesian topology associated with the communicator `comm`, the outcome is unspecified.==

For a communicator with an associated Cartesian topology, the function [[versions/v41/API/MPI_CART_RANK|MPI_CART_RANK]] translates the logical ==coordinates of an MPI== process ~~coordinates~~ to ~~process ranks.~~ ==the corresponding rank in the group of the communicator.== For dimension `i` with `periods(i) = true`, if the coordinate, `coords(i)`, is out of range, that is, `coords(i) `$`<`$` 0` or `coords(i) `$`\geq`$` dims(i)`, it is shifted back to the interval `0 `$`\leq`$` coords(i) `$`<`$` dims(i)` automatically. Out-of-range coordinates are erroneous for nonperiodic dimensions.

The inverse mapping, rank-to-coordinates translation is provided by [[versions/v41/API/MPI_CART_COORDS|MPI_CART_COORDS]] . If `comm` is associated with a zero-dimensional Cartesian topology, `coords` will be unchanged. ==If `maxdims` is less than the number of dimensions of the Cartesian topology associated with the communicator `comm`, the outcome is unspecified.==

~~Assume there are four processes 0, 1, 2, 3 with the following adjacency matrix (note that some neighbors are listed multiple times):~~

~~\|c\|l\| process & neighbors   & 1, 1, 3  1 & 0, 0  2 & 3  3 & 0, 2, 2  ~~

==Inquiry of graph topology information.==

==Assume there are four MPI processes with ranks 0, 1, 2, 3 in the input communicator with the following adjacency matrix (note that some neighbors are listed multiple times):==

==\|c\|l\| MPI process & neighbors   & 1, 1, 3  1 & 0, 0  2 & 3  3 & 0, 2, 2  ==

Therefore, calling [[versions/v41/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] and [[versions/v41/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] for each of the ~~4~~ ==four MPI== processes will return:

~~Suppose that `comm` is a communicator with a shuffle-exchange topology. The group has $`2^n`$ members. Each process is labeled by $`a_1 , ..., a_n`$ with $`a_i \in \{0,1\}`$, and has three neighbors: exchange($`a_1 , ..., a_n ) = a_1 ,..., a_{n-1}, \bar{a}_n`$ ($`\bar{a} = 1-a`$), shuffle($`a_1 , ..., a_n )= a_2 , ..., a_{n}, a_1`$, and unshuffle($`a_1 , ..., a_n ) = a_n , a_1 , ... , a_{n-1}`$. The graph adjacency list is illustrated below for $`n=3`$.~~

==Using a communicator with an associated graph topology that represents a shuffle-exchange network.==

==Suppose that `comm` is a communicator with a shuffle-exchange topology. The group has $`2^n`$ members. Each MPI process is labeled by $`a_1 , ..., a_n`$ with $`a_i \in \{0,1\}`$, and has three neighbors: exchange($`a_1 , ..., a_n ) = a_1 ,..., a_{n-1}, \bar{a}_n`$ ($`\bar{a} = 1-a`$), shuffle($`a_1 , ..., a_n )= a_2 , ..., a_{n}, a_1`$, and unshuffle($`a_1 , ..., a_n ) = a_n , a_1 , ... , a_{n-1}`$. The graph adjacency list is illustrated below for $`n=3`$.==

~~    !  assume: each process has stored a real number A.     !  extract neighborhood information     CALL MPI_COMM_RANK(comm, myrank, ierr)     CALL MPI_GRAPH_NEIGHBORS(comm, myrank, 3, neighbors, ierr)     !  perform exchange permutation     CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(1), 0, &                               neighbors(1), 0, comm, status, ierr)     !  perform shuffle permutation     CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(2), 0, &                               neighbors(3), 0, comm, status, ierr)     !  perform unshuffle permutation     CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, neighbors(3), 0, &                               neighbors(2), 0, comm, status, ierr)~~

==(code block added)==
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

These calls are local. The number of edges into and out of the ==MPI== process returned by [[versions/v41/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI_DIST_GRAPH_NEIGHBORS_COUNT]] are the total number of such edges given in the call to [[versions/v41/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] or [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] (potentially by ==MPI== processes other than the calling ==MPI== process in the case of [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] ). Multiply-defined edges are all counted and returned by [[versions/v41/API/MPI_DIST_GRAPH_NEIGHBORS|MPI_DIST_GRAPH_NEIGHBORS]] in some order. If `MPI_UNWEIGHTED` is supplied for `sourceweights` or `destweights` or both, or if `MPI_UNWEIGHTED` was supplied during the construction of the graph then no weight information is returned in that array or those arrays. If the communicator was created with [[versions/v41/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] then for each ~~rank~~ ==MPI process== in `comm`, the order of the values in `sources` and `destinations` is identical to the input that was used by the ==MPI== process with the same rank in `comm_old` in the creation call. If the communicator was created with [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] then the only requirement on the order of values in `sources` and `destinations` is that two calls to the routine with same input argument `comm` will return the same sequence of edges. If `maxindegree` or `maxoutdegree` is smaller than the numbers returned by [[versions/v41/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI_DIST_GRAPH_NEIGHBORS_COUNT]] , then only the first part of the full list is returned.

> Since the query calls are defined to be local, each ==MPI== process needs to store the list of its neighbors with incoming and outgoing edges. Communication is required at the collective [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] call in order to compute the neighbor lists for each ==MPI== process from the distributed graph specification.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/topol#Topology inquiry functions]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/topol#Topology Inquiry Functions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/topol#Topology Inquiry Functions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#Topology Inquiry Functions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#Topology Inquiry Functions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#Topology Inquiry Functions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#Topology Inquiry Functions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#Topology Inquiry Functions]]
