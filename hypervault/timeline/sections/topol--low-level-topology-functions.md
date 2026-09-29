---
title: "Low-Level Topology Functions"
chapter: topol
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# Low-Level Topology Functions

Chapter **topol** · in [[versions/v13/sections/topol#Low-level topology functions|MPI-1.3]], [[versions/v21/sections/topol#Low-Level Topology Functions|MPI-2.1]], [[versions/v22/sections/topol#Low-Level Topology Functions|MPI-2.2]], [[versions/v30/sections/topol#Low-Level Topology Functions|MPI-3.0]], [[versions/v31/sections/topol#Low-Level Topology Functions|MPI-3.1]], [[versions/v40/sections/topol#Low-Level Topology Functions|MPI-4.0]], [[versions/v41/sections/topol#Low-Level Topology Functions|MPI-4.1]], [[versions/v50/sections/topol#Low-Level Topology Functions|MPI-5.0]]

Heading by release: MPI-1.3: “Low-level topology functions”; MPI-2.1: “Low-Level Topology Functions”; MPI-2.2: “Low-Level Topology Functions”; MPI-3.0: “Low-Level Topology Functions”; MPI-3.1: “Low-Level Topology Functions”; MPI-4.0: “Low-Level Topology Functions”; MPI-4.1: “Low-Level Topology Functions”; MPI-5.0: “Low-Level Topology Functions”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

> The function [[versions/v21/API/MPI_CART_CREATE|MPI_CART_CREATE]] , with `reorder = true` can be implemented by calling [[versions/v21/API/MPI_CART_MAP|MPI_CART_MAP]] , then calling > > [[versions/v21/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] , with `color = 0` if `newrank `$`\neq`$` MPI_UNDEFINED`, `color = MPI_UNDEFINED` otherwise, and `key = newrank`. > > The function `MPI_CART_SUB(comm, remain_dims, comm_new)` can be implemented by a call to `MPI_COMM_SPLIT(comm, color, key, comm_new)`, using a single number encoding of the lost dimensions as `color` and a single number encoding of the preserved dimensions as `key`. > > All other ~~cartesian~~ ==Cartesian== topology functions can be implemented locally, using the topology information that is cached with the communicator.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

The two additional functions introduced in this section can be used to implement all other topology functions. In general they will not be called by the user directly, unless he or she is creating additional virtual topology capability other than that provided by MPI. ==The two calls are both local.==

> The function [[versions/v30/API/MPI_CART_CREATE|MPI_CART_CREATE]] , with `reorder = true` can be implemented by calling [[versions/v30/API/MPI_CART_MAP|MPI_CART_MAP]] , then calling > > [[versions/v30/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] , with `color = 0` if `newrank `$`\neq`$` MPI_UNDEFINED`, `color = MPI_UNDEFINED` otherwise, and `key = newrank`. ==If `ndims` is zero then a zero-dimensional Cartesian topology is created.== > > The function `MPI_CART_SUB(comm, remain_dims, comm_new)` can be implemented by a call to `MPI_COMM_SPLIT(comm, color, key, comm_new)`, using a single number encoding of the lost dimensions as `color` and a single number encoding of the preserved dimensions as `key`. > > All other Cartesian topology functions can be implemented locally, using the topology information that is cached with the communicator.

The corresponding ~~new~~ function for ~~general~~ graph structures is as follows.

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~`MPI_CART_MAP`~~ ==[[versions/v31/API/MPI_CART_MAP|MPI_CART_MAP]]== computes an “optimal” placement for the calling process on the physical machine. A possible implementation of this function is to always return the rank of the calling process, that is, not to perform any reordering.

> The function [[versions/v31/API/MPI_CART_CREATE|MPI_CART_CREATE]] , with `reorder = true` can be implemented by calling [[versions/v31/API/MPI_CART_MAP|MPI_CART_MAP]] , then calling ~~> >~~ [[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] , with `color = 0` if `newrank `$`\neq`$` MPI_UNDEFINED`, `color = MPI_UNDEFINED` otherwise, and `key = newrank`. If `ndims` is zero then a zero-dimensional Cartesian topology is created. > > The function ~~`MPI_CART_SUB(comm, remain_dims, comm_new)`~~ ==[[versions/v31/API/MPI_CART_SUB|MPI_CART_SUB]]== can be implemented by a call to ~~`MPI_COMM_SPLIT(comm, color, key, comm_new)`,~~ ==[[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] ,== using a single number encoding of the lost dimensions as `color` and a single number encoding of the preserved dimensions as `key`. > > All other Cartesian topology functions can be implemented locally, using the topology information that is cached with the communicator.

> The function [[versions/v31/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] , with `reorder = true` can be implemented by calling [[versions/v31/API/MPI_GRAPH_MAP|MPI_GRAPH_MAP]] , then calling ~~> >~~ [[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] , with `color = 0` if `newrank `$`\neq`$` MPI_UNDEFINED`, `color = MPI_UNDEFINED` otherwise, and `key = newrank`. > > All other graph topology functions can be implemented locally, using the topology information that is cached with the communicator.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The two additional functions introduced in this section can be used to implement all other topology functions. In general they will not be called by the user directly, ~~unless he or she is~~ ==except when== creating additional virtual topology ~~capability~~ ==capabilities== other than ~~that~~ ==those== provided by MPI. The two calls are both local.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

The two additional functions introduced in this section can be used to implement all other topology functions. In general they will not be called by the user directly, except when creating additional ~~virtual topology~~ ==*virtual topology*== capabilities other than those provided by MPI. The two calls are both local.

[[versions/v41/API/MPI_CART_MAP|MPI_CART_MAP]] computes an “optimal” placement for the calling ==MPI== process on the physical machine. A possible implementation of this function is to always return the rank of the calling ==MPI== process, that is, not to perform any reordering.

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

> The function [[versions/v50/API/MPI_CART_CREATE|MPI_CART_CREATE]] ~~,~~ ==`(comm, ndims, dims, periods, reorder, comm_cart)`,== with `reorder = true` can be implemented by calling [[versions/v50/API/MPI_CART_MAP|MPI_CART_MAP]] ~~,~~ ==`(comm, ndims, dims, periods, newrank)`,== then calling [[versions/v50/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] ~~,~~ ==`(comm, color, key, comm_cart)`,== with `color = 0` if `newrank ~~`$`\neq`$` MPI_UNDEFINED`,~~ ==`$`\neq`$ `MPI_UNDEFINED`,== `color ~~= MPI_UNDEFINED`~~ ===``MPI_UNDEFINED`== otherwise, and `key = newrank`. If `ndims` is zero then a zero-dimensional Cartesian topology is created. > > The function [[versions/v50/API/MPI_CART_SUB|MPI_CART_SUB]] ==`(comm, remain_dims, comm_new)`== can be implemented by a call to [[versions/v50/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] ~~,~~ ==`(comm, color, key, comm_new)`,== using a single number encoding of the lost dimensions as `color` and a single number encoding of the preserved dimensions as `key`. > > All other Cartesian topology functions can be implemented locally, using the topology information that is cached with the communicator.

> The function [[versions/v50/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] ~~,~~ ==`(comm, nnodes, index, edges, reorder, comm_graph)`,== with `reorder = true` can be implemented by calling [[versions/v50/API/MPI_GRAPH_MAP|MPI_GRAPH_MAP]] ~~,~~ ==`(comm, nnodes, index, edges, newrank)`,== then calling [[versions/v50/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] ~~,~~ ==`(comm, color, key, comm_graph)`,== with `color = 0` if `newrank ~~`$`\neq`$` MPI_UNDEFINED`,~~ ==`$`\neq`$ `MPI_UNDEFINED`,== `color ~~= MPI_UNDEFINED`~~ ===``MPI_UNDEFINED`== otherwise, and `key = newrank`. > > All other graph topology functions can be implemented locally, using the topology information that is cached with the communicator.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/topol#Low-level topology functions]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/topol#Low-Level Topology Functions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/topol#Low-Level Topology Functions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#Low-Level Topology Functions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#Low-Level Topology Functions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#Low-Level Topology Functions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#Low-Level Topology Functions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#Low-Level Topology Functions]]
