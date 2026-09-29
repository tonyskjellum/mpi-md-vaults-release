---
title: "Exclusive Scan"
chapter: coll
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Exclusive Scan

Chapter **coll** · in [[versions/v20/sections/collective#Exclusive Scan|MPI-2.0]], [[versions/v21/sections/coll#Exclusive Scan|MPI-2.1]], [[versions/v22/sections/coll#Exclusive Scan|MPI-2.2]], [[versions/v30/sections/coll#Exclusive Scan|MPI-3.0]], [[versions/v31/sections/coll#Exclusive Scan|MPI-3.1]], [[versions/v40/sections/coll#Exclusive Scan|MPI-4.0]], [[versions/v41/sections/coll#Exclusive Scan|MPI-4.1]], [[versions/v50/sections/coll#Exclusive Scan|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (4 changed paragraphs)

~~MPI-1 provides an inclusive scan operation. The exclusive scan is described here.~~

==If `comm` is an intracommunicator,==

==This operation is invalid for intercommunicators.==

> The exclusive scan is more general than the inclusive ~~scan provided in MPI-1 as [[versions/v21/API/MPI_SCAN|MPI_SCAN]] .~~ ==scan.== Any inclusive scan operation can be achieved by using the exclusive scan and then locally combining the local contribution. Note that for non-invertable operations such as ~~[[MPI_MAX]] ,~~ ==MPI_MAX,== the exclusive scan cannot be computed with the inclusive scan. > > ~~The reason that MPI-1 chose~~ ==No in-place version is specified for [[versions/v21/API/MPI_EXSCAN|MPI_EXSCAN]] because it is not clear what this means for== the ~~inclusive scan is that the definition of behavior on processes zero and one was thought to offer too many complexities in definition, particularly for user-defined operations.~~ ==process with rank zero.==

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

~~No~~ ==The== “in place” option ==for intracommunicators== is ~~supported.~~ ==specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the receive buffer, and replaced by the output data. The receive buffer on rank 0 is not changed by this operation.==

~~> [!note] Advice to users~~

~~> As for [[versions/v22/API/MPI_SCAN|MPI_SCAN]] , MPI does not specify which processes may call the operation, only that the result be correctly computed. In particular, note that the process with rank 1 need not call the `MPI_Op`, since all it needs to do is to receive the value from the process with rank 0. However, all processes, even the processes with ranks zero and one, must provide the same `op`.~~

> The exclusive scan is more general than the inclusive scan. Any inclusive scan operation can be achieved by using the exclusive scan and then locally combining the local contribution. Note that for non-invertable operations such as ~~MPI_MAX,~~ ==`MPI_MAX`,== the exclusive scan cannot be computed with the inclusive scan. ~~> > No in-place version is specified for [[versions/v22/API/MPI_EXSCAN|MPI_EXSCAN]] because it is not clear what this means for the process with rank zero.~~

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~If `comm` is an intracommunicator,~~

~~[[versions/v30/API/MPI_EXSCAN|MPI_EXSCAN]] is used to perform a prefix reduction on data distributed across the group. The value in `recvbuf` on the process with rank 0 is undefined, and `recvbuf` is not signficant on process 0. The value in `recvbuf` on the process with rank 1 is defined as the value in `sendbuf` on the process with rank 0. For processes with rank $`i > 1`$, the operation returns, in the receive buffer of the process with rank $`i`$, the reduction of the values in the send buffers of processes with ranks $`0,...,i-1`$ (inclusive). The type of operations supported, their semantics, and the constraints on send and receive buffers, are as for [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] .~~

==If `comm` is an intracommunicator, [[versions/v30/API/MPI_EXSCAN|MPI_EXSCAN]] is used to perform a prefix reduction on data distributed across the group. The value in `recvbuf` on the process with rank 0 is undefined, and `recvbuf` is not signficant on process 0. The value in `recvbuf` on the process with rank 1 is defined as the value in `sendbuf` on the process with rank 0. For processes with rank $`i > 1`$, the operation returns, in the receive buffer of the process with rank $`i`$, the reduction of the values in the send buffers of processes with ranks $`0,...,i-1`$ (inclusive). The routine is called by all group members using the same arguments for count, datatype, op and comm, except that for user-defined operations, the same rules apply as for `MPI_REDUCE`. The type of operations supported, their semantics, and the constraints on send and receive buffers, are as for [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] .==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

If `comm` is an intracommunicator, [[versions/v31/API/MPI_EXSCAN|MPI_EXSCAN]] is used to perform a prefix reduction on data distributed across the group. The value in `recvbuf` on the process with rank 0 is undefined, and `recvbuf` is not signficant on process 0. The value in `recvbuf` on the process with rank 1 is defined as the value in `sendbuf` on the process with rank 0. For processes with rank $`i > 1`$, the operation returns, in the receive buffer of the process with rank $`i`$, the reduction of the values in the send buffers of processes with ranks $`0,...,i-1`$ (inclusive). The routine is called by all group members using the same arguments for count, datatype, op and comm, except that for user-defined operations, the same rules apply as for ~~`MPI_REDUCE`.~~ ==[[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] .== The type of operations supported, their semantics, and the constraints on send and receive buffers, are as for [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] .

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== [[versions/v40/API/MPI_EXSCAN|MPI_EXSCAN]] is used to perform a prefix reduction on data distributed across the group. The value in `recvbuf` on the process with rank 0 is undefined, and `recvbuf` is not signficant on process 0. The value in `recvbuf` on the process with rank 1 is defined as the value in `sendbuf` on the process with rank 0. For processes with rank $`i > 1`$, the operation returns, in the receive buffer of the process with rank $`i`$, the reduction of the values in the send buffers of processes with ranks $`0,...,i-1`$ (inclusive). The routine is called by all group members using the same arguments for count, datatype, op and comm, except that for user-defined operations, the same rules apply as for [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] . The type of operations supported, their semantics, and the constraints on send and receive buffers, are as for [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] .

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the receive buffer, and replaced by the output data. The receive buffer on rank 0 is not changed by this operation.

This operation is invalid for ~~intercommunicators.~~ ==inter-communicators.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

If `comm` is an intra-communicator, [[versions/v41/API/MPI_EXSCAN|MPI_EXSCAN]] is used to perform a prefix reduction on data distributed across the group. The value in `recvbuf` on the ==MPI== process with rank ~~0~~ ==`0`== is undefined, and `recvbuf` is not signficant on ~~process 0.~~ ==that MPI process.== The value in `recvbuf` on the ==MPI== process with rank ~~1~~ ==`1`== is defined as the value in `sendbuf` on the ==MPI== process with rank ~~0.~~ ==`0`.== For ==MPI== processes with rank $`i > 1`$, the operation returns, in the receive buffer of the ==MPI== process with rank $`i`$, the reduction of the values in the send buffers of ==MPI== processes with ranks $`0,...,i-1`$ (inclusive). The routine is called by all group members using the same arguments for ~~count, datatype, op~~ ==`count`, `datatype`, `op`== and ~~comm,~~ ==`comm`,== except that for user-defined operations, the same rules apply as for [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] . The type of operations supported, their semantics, and the constraints on send and receive buffers, are as for [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] .

> The exclusive scan is more general than the inclusive scan. Any inclusive scan operation can be achieved by using the exclusive scan and then locally combining the local contribution. Note that for ~~non-invertable~~ ==noninvertable== operations such as `MPI_MAX`, the exclusive scan cannot be computed with the inclusive scan.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/collective#Exclusive Scan]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Exclusive Scan]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Exclusive Scan]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Exclusive Scan]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Exclusive Scan]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Exclusive Scan]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Exclusive Scan]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Exclusive Scan]]
