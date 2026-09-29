---
title: "MPI_REDUCE_SCATTER_BLOCK"
chapter: coll
present_in: ["MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# MPI_REDUCE_SCATTER_BLOCK

Chapter **coll** · in [[versions/v22/sections/coll#MPI_REDUCE_SCATTER_BLOCK|MPI-2.2]], [[versions/v30/sections/coll#MPI_REDUCE_SCATTER_BLOCK|MPI-3.0]], [[versions/v31/sections/coll#MPI_REDUCE_SCATTER_BLOCK|MPI-3.1]], [[versions/v40/sections/coll#MPI_REDUCE_SCATTER_BLOCK|MPI-4.0]], [[versions/v41/sections/coll#MPI_REDUCE_SCATTER_BLOCK|MPI-4.1]], [[versions/v50/sections/coll#MPI_REDUCE_SCATTER_BLOCK|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2

_Section appears in MPI-2.2._

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

The “in place” option for ~~intracommunictors~~ ==intracommunicators== is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument on *all* processes. In this case, the input data is taken from the receive buffer.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== [[versions/v40/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] first performs a global, element-wise reduction on vectors of ~~`count = ``n``*recvcount`~~ ==`count``= n*``recvcount`== elements in the send buffers defined by `sendbuf`, `count` and `datatype`, using the operation `op`, where `n` is the number of processes in the group of `comm`. The routine is called by all group members using the same arguments for `recvcount`, `datatype`, `op` and `comm`. The resulting vector is treated as `n` consecutive blocks of `recvcount` elements that are scattered to the processes of the group. The `i`-th block is sent to process `i` and stored in the receive buffer defined by `recvbuf`, `recvcount`, and `datatype`.

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument on *all* processes. In this case, the input data is taken from the receive buffer.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the result of the reduction of the data provided by processes in one group (group A) is scattered among processes in the other group (group B) and vice versa. Within each group, all processes provide the same value for the `recvcount` argument, and provide input vectors of ~~`count = ``n``*recvcount`~~ ==`count``= n*``recvcount`== elements stored in the send buffers, where `n` is the size of the group. The number of elements `count` must be the same for the two groups. The resulting vector from the other group is scattered in blocks of `recvcount` elements among the processes in the group.

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

If `comm` is an intra-communicator, [[versions/v41/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] first performs a global, element-wise reduction on vectors of `count``= n*``recvcount` elements in the send buffers defined by `sendbuf`, `count` and `datatype`, using the operation `op`, where `n` is the number of ==MPI== processes in the group of `comm`. The routine is called by all group members using the same arguments for `recvcount`, `datatype`, `op` and `comm`. The resulting vector is treated as `n` consecutive blocks of `recvcount` elements that are scattered to the ==MPI== processes of the group. The `i`-th block is sent to ==MPI== process `i` and stored in the receive buffer defined by `recvbuf`, `recvcount`, and `datatype`.

> The [[versions/v41/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] routine is functionally equivalent ~~to:~~ ==to== an [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] collective operation with `count` equal to `recvcount*``n`, followed by an [[versions/v41/API/MPI_SCATTER|MPI_SCATTER]] with `sendcount` equal to `recvcount`. However, a direct implementation may run faster.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument on *all* ==MPI== processes. In this case, the input data is taken from the receive buffer.

If `comm` is an inter-communicator, then the result of the reduction of the data provided by ==MPI== processes in one group (group A) is scattered among ==MPI== processes in the other group (group B) and vice versa. Within each group, all ==MPI== processes provide the same value for the `recvcount` argument, and provide input vectors of `count``= n*``recvcount` elements stored in the send buffers, where `n` is the size of the group. The number of elements `count` must be the same for the two groups. The resulting vector from the other group is scattered in blocks of `recvcount` elements among the ==MPI== processes in the group.

> The last restriction is needed so that the length of the send buffer of one group can be determined by the local `recvcount` argument of the other group. Otherwise, ~~a~~ communication is needed to figure out how many elements are reduced.

## Text by release

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#MPI_REDUCE_SCATTER_BLOCK]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#MPI_REDUCE_SCATTER_BLOCK]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#MPI_REDUCE_SCATTER_BLOCK]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#MPI_REDUCE_SCATTER_BLOCK]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#MPI_REDUCE_SCATTER_BLOCK]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#MPI_REDUCE_SCATTER_BLOCK]]
