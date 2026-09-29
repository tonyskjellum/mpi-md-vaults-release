---
title: "Semantics of Communications in Partitioned Mode"
chapter: part
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/part]
---

# Semantics of Communications in Partitioned Mode

Chapter **part** · in [[versions/v40/sections/part#Semantics of Communications in Partitioned Mode|MPI-4.0]], [[versions/v41/sections/part#Semantics of Communications in Partitioned Mode|MPI-4.1]], [[versions/v50/sections/part#Semantics of Communications in Partitioned Mode|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

==**Interpretation of count and datatype for partitioned communication.** Partitioned communication uses the `count` and `datatype` arguments in the partitioned communication initialization functions to describe a single partition. The argument `partitions` specifies how many equal partitions of a number (`count`) of objects of `datatype`s make up the entire buffer to be transferred in the partitioned communication. As partitioned communication describes many partitions, using absolute displacements in datatypes (e.g., `MPI_BOTTOM`) is not supported. Partitions are contiguous in memory, there is no padding in between them. Once a partitioned send operation is started, each partition must be marked as ready using [[versions/v41/API/MPI_PREADY|MPI_PREADY]] and the operation must be completed using a completion function, such as [[versions/v41/API/MPI_TEST|MPI_TEST]] or [[versions/v41/API/MPI_WAIT|MPI_WAIT]] .==

==**Order.** Matching follows the same MPI matching rules as for point-to-point communication (see Chapter [[versions/v41/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] ) with communicator, tag, and source dictating message matching. In the event that the communicator, tag, and source do not uniquely identify the message, the order in which partitioned communication initialization calls are made is the order in which they will eventually match.==

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/part#Semantics of Communications in Partitioned Mode]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/part#Semantics of Communications in Partitioned Mode]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/part#Semantics of Communications in Partitioned Mode]]
