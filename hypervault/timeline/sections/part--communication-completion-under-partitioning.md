---
title: "Communication Completion under Partitioning"
chapter: part
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/part]
---

# Communication Completion under Partitioning

Chapter **part** · in [[versions/v40/sections/part#Communication Completion under Partitioning|MPI-4.0]], [[versions/v41/sections/part#Communication Completion under Partitioning|MPI-4.1]], [[versions/v50/sections/part#Communication Completion under Partitioning|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Repeated calls to [[versions/v41/API/MPI_PARRIVED|MPI_PARRIVED]] with the same `request` and `partition` arguments will eventually return `flag``= true` if the corresponding partitioned send operation has been started and all send partitions have been marked as ready. For additional information on MPI *progress* see ~~Section [[versions/v41/sections/pt2pt#Semantics of Nonblocking Communications|Semantics of Nonblocking Communications]] .~~ ==[[Sections]] subsec:terms:progress [[and]] subsec:pt2pt-semantics.==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

The function [[versions/v50/API/MPI_PARRIVED|MPI_PARRIVED]] can be used to test partial completion of partitioned receive operations. A call to [[versions/v50/API/MPI_PARRIVED|MPI_PARRIVED]] on an active partitioned communication request returns `flag``= true` if the operation identified by `request` for the specified `partition` is complete. The request is not marked as complete/inactive by this procedure. A subsequent call to an MPI completing procedure (e.g., [[versions/v50/API/MPI_TEST|MPI_TEST]] / [[versions/v50/API/MPI_WAIT|MPI_WAIT]] ) is required to complete the operation, as described in Chapter [[versions/v50/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] . [[versions/v50/API/MPI_PARRIVED|MPI_PARRIVED]] may be called multiple times for a partition. [[versions/v50/API/MPI_PARRIVED|MPI_PARRIVED]] may be called with a null or inactive `request` argument. In either case, the operation returns with ~~`flag =~~ ==`flag``=== true`. Calling [[versions/v50/API/MPI_PARRIVED|MPI_PARRIVED]] on a request that does not correspond to a partitioned receive operation is erroneous.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/part#Communication Completion under Partitioning]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/part#Communication Completion under Partitioning]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/part#Communication Completion under Partitioning]]
