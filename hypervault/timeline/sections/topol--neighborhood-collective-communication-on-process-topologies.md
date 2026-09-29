---
title: "Neighborhood Collective Communication on Process Topologies"
chapter: topol
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/topol]
---

# Neighborhood Collective Communication on Process Topologies

Chapter **topol** · in [[versions/v30/sections/topol#Neighborhood Collective Communication on Process Topologies|MPI-3.0]], [[versions/v31/sections/topol#Neighborhood Collective Communication on Process Topologies|MPI-3.1]], [[versions/v40/sections/topol#Neighborhood Collective Communication on Process Topologies|MPI-4.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

MPI process topologies specify a communication graph, but they implement no communication function themselves. Many applications require sparse nearest neighbor communications that can be expressed as graph topologies. We now describe several collective operations that perform communication along the edges of a process topology. All of these functions are collective; i.e., they must be called by all processes in the specified communicator. See ~~Section [[versions/v31/sections/coll#Collective Communication|Collective Communication]] on page~~ [[versions/v31/sections/coll#Collective Communication|Collective Communication]] for an overview of other dense (global) collective communication operations and the semantics of collective operations.

If the graph was created with [[versions/v31/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] with `sources` and `destinations` containing ~~<span class="sans-serif">0, ..., n-1</span>,~~ ==`0, `$`...`$`, n-1`,== where ~~<span class="sans-serif">n</span>~~ ==`n`== is the number of processes in the group of `comm_old` (i.e., the graph is fully connected and also includes an edge from each node to itself), then the sparse neighborhood communication routine performs the same data exchange as the corresponding dense (fully-connected) collective operation. In the case of a Cartesian communicator, only nearest neighbor communication is provided, corresponding to `rank_source` and `rank_dest` in [[versions/v31/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] with input `disp`=1.

For a distributed graph topology, created with [[versions/v31/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] , the sequence of neighbors in the send and receive buffers at each process is defined as the sequence returned by [[versions/v31/API/MPI_DIST_GRAPH_NEIGHBORS|MPI_DIST_GRAPH_NEIGHBORS]] for destinations and sources, respectively. For a general graph topology, created with [[versions/v31/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] , the ==use of neighborhood collective communication is restricted to adjacency matrices, where the number of edges between any two processes is defined to be the same for both processes (i.e., with a symmetric adjacency matrix). In this case, the== order of neighbors in the send and receive buffers is defined as the sequence of neighbors as returned by [[versions/v31/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] . Note that general graph topologies should generally be replaced by the distributed graph topologies.

For a Cartesian topology, created with [[versions/v31/API/MPI_CART_CREATE|MPI_CART_CREATE]] , the sequence of neighbors in the send and receive buffers at each process is defined by order of the dimensions, first the neighbor in the negative direction and then in the positive direction with displacement 1. The numbers of sources and destinations in the communication routines are `2*ndims` with `ndims` defined in [[versions/v31/API/MPI_CART_CREATE|MPI_CART_CREATE]] . If a neighbor does not exist, i.e., at the border of a Cartesian topology in the case of a non-periodic virtual grid dimension (i.e., ~~`periods[...]==false`),~~ ==`periods[`$`...`$`]==false`),== then this neighbor is defined to be `MPI_PROC_NULL`.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

If the graph was created with [[versions/v40/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] with `sources` and `destinations` containing `0, `$`...`$`, n-1`, where `n` is the number of processes in the group of `comm_old` (i.e., the graph is fully connected and also includes an edge from each node to itself), then the sparse neighborhood communication routine performs the same data exchange as the corresponding dense (fully-connected) collective operation. In the case of a Cartesian communicator, only nearest neighbor communication is provided, corresponding to `rank_source` and `rank_dest` in [[versions/v40/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] with input ~~`disp`=1.~~ ==`disp``= 1`.==

For a Cartesian topology, created with [[versions/v40/API/MPI_CART_CREATE|MPI_CART_CREATE]] , the sequence of neighbors in the send and receive buffers at each process is defined by order of the dimensions, first the neighbor in the negative direction and then in the positive direction with displacement 1. The numbers of sources and destinations in the communication routines are `2*ndims` with `ndims` defined in [[versions/v40/API/MPI_CART_CREATE|MPI_CART_CREATE]] . If a neighbor does not exist, i.e., at the border of a Cartesian topology in the case of a ~~non-periodic~~ ==nonperiodic== virtual grid dimension (i.e., `periods[`$`...`$`]==false`), then this neighbor is defined to be `MPI_PROC_NULL`.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~MPI process topologies~~ ==*Virtual topologies*== specify a communication graph, but they implement no communication function themselves. Many applications require sparse nearest neighbor communications that can be expressed as graph topologies. We now describe several collective operations that perform communication along the edges of a ~~process topology.~~ ==graph representing a *virtual topology*.== All of these functions are collective; i.e., they must be called by all ==MPI== processes in the specified communicator. See [[versions/v41/sections/coll#Collective Communication|Collective Communication]] for an overview of other dense (global) collective communication operations and the semantics of collective operations.

If the graph was created with [[versions/v41/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] with `sources` and `destinations` containing `0, `$`...`$`, n-1`, where `n` is the number of ==MPI== processes in the group of `comm_old` (i.e., the graph is fully connected and also includes an edge from each node to itself), then the sparse neighborhood communication routine performs the same data exchange as the corresponding dense (fully-connected) collective operation. In the case of a Cartesian communicator, only nearest neighbor communication is provided, corresponding to `rank_source` and `rank_dest` in [[versions/v41/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] with input `disp``= 1`.

> Neighborhood collective communications enable communication on a ~~process topology.~~ ==*virtual topology*.== This high-level specification of data exchange among neighboring ==MPI== processes enables optimizations in the MPI library because the communication pattern is known statically (the topology). Thus, the implementation can compute optimized message schedules during creation of the topology . This functionality can significantly simplify the implementation of neighbor exchanges .

For a distributed graph topology, created with [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] , the sequence of neighbors in the send and receive buffers at each ==MPI== process is defined as the sequence returned by [[versions/v41/API/MPI_DIST_GRAPH_NEIGHBORS|MPI_DIST_GRAPH_NEIGHBORS]] for destinations and sources, respectively. For a general graph topology, created with [[versions/v41/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] , the use of neighborhood collective communication is restricted to adjacency matrices, where the number of edges between any two ==MPI== processes is defined to be the same for both ==MPI== processes (i.e., with a symmetric adjacency matrix). In this case, the order of neighbors in the send and receive buffers is defined as the sequence of neighbors as returned by [[versions/v41/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] . Note that ~~general~~ graph topologies should generally be replaced by the distributed graph topologies.

For a Cartesian topology, created with [[versions/v41/API/MPI_CART_CREATE|MPI_CART_CREATE]] , the sequence of neighbors in the send and receive buffers at each ==MPI== process is defined by ==the== order of the dimensions, first the neighbor in the negative direction and then in the positive direction with displacement 1. The numbers of sources and destinations in the communication routines are `2*ndims` with `ndims` defined in [[versions/v41/API/MPI_CART_CREATE|MPI_CART_CREATE]] . If a neighbor does not exist, i.e., at the border of a Cartesian topology in the case of a nonperiodic virtual grid dimension (i.e., ~~`periods[`$`...`$`]==false`),~~ ==`periods[`$`...`$`]=false`),== then this neighbor is defined to be `MPI_PROC_NULL`.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#Neighborhood Collective Communication on Process Topologies]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#Neighborhood Collective Communication on Process Topologies]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#Neighborhood Collective Communication on Process Topologies]]
