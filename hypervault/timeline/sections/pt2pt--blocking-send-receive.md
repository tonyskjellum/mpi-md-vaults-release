---
title: "Blocking Send-Receive"
chapter: pt2pt
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Blocking Send-Receive

Chapter **pt2pt** · in [[versions/v40/sections/pt2pt#Blocking Send-Receive|MPI-4.0]], [[versions/v41/sections/pt2pt#Blocking Send-Receive|MPI-4.1]], [[versions/v50/sections/pt2pt#Blocking Send-Receive|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

The blocking semantics of this call are described in ~~Sec.~~ ==Section== [[versions/v21/sections/pt2pt#Communication Modes|Communication Modes]] .

~~The selection of a message by a receive operation is governed by the value of the message envelope. A message can be received by a receive operation if its envelope matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a wildcard MPI_ANY_SOURCE value for `source`, and/or a wildcard MPI_ANY_TAG value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless source= MPI_ANY_SOURCE in the pattern, and has a matching tag unless tag= MPI_ANY_TAG in the pattern.~~

==The selection of a message by a receive operation is governed by the value of the message envelope. A message can be received by a receive operation if its envelope matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a wildcard MPI_ANY_SOURCE value for `source`, and/or a wildcard MPI_ANY_TAG value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless==

==source=MPI_ANY_SOURCE==

==in the pattern, and has a matching tag unless==

==tag=MPI_ANY_TAG==

==in the pattern.==

Source = destination is allowed, that is, a process can send a message to itself. (However, it is unsafe to do so with the blocking send and receive operations described above, since this may lead to deadlock. See ~~Sec.~~ ==Section== [[versions/v21/sections/pt2pt#Semantics of ~~point-to-point communication|Semantics~~ ==Point-to-Point Communication|Semantics== of ~~point-to-point communication]]~~ ==Point-to-Point Communication]]== .)

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

The selection of a message by a receive operation is governed by the value of the message envelope. A message can be received by a receive operation if its envelope matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a wildcard ~~MPI_ANY_SOURCE~~ ==`MPI_ANY_SOURCE`== value for `source`, and/or a wildcard ~~MPI_ANY_TAG~~ ==`MPI_ANY_TAG`== value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless

~~source=MPI_ANY_SOURCE~~ ==source=`MPI_ANY_SOURCE`==

~~tag=MPI_ANY_TAG~~ ==tag=`MPI_ANY_TAG`==

The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from ~~MPI_ANY_SOURCE,~~ ==`MPI_ANY_SOURCE`,== is specified as a rank within the process group associated with that same communicator (remote process group, for intercommunicators). Thus, the range of valid values for the `source` argument is ~~{0,...,n-1}$`\cup`$ {MPI_ANY_SOURCE},~~ =={<span class="sans-serif">0,...,n-1</span>}$`\cup`${`MPI_ANY_SOURCE`},== where <span class="sans-serif">n</span> is the number of processes in this group.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~source=`MPI_ANY_SOURCE`~~

~~in the pattern, and has a matching tag unless~~

~~tag=`MPI_ANY_TAG`~~

~~in the pattern.~~

~~The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from `MPI_ANY_SOURCE`, is specified as a rank within the process group associated with that same communicator (remote process group, for intercommunicators). Thus, the range of valid values for the `source` argument is {<span class="sans-serif">0,...,n-1</span>}$`\cup`${`MPI_ANY_SOURCE`}, where <span class="sans-serif">n</span> is the number of processes in this group.~~

==source=`MPI_ANY_SOURCE` in the pattern, and has a matching tag unless==

==tag=`MPI_ANY_TAG` in the pattern.==

==The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from `MPI_ANY_SOURCE`, is specified as a rank within the process group associated with that same communicator (remote process group, for intercommunicators). Thus, the range of valid values for the `source` argument is {<span class="sans-serif">0,...,n-1</span>}$`\cup`${`MPI_ANY_SOURCE`},$`\cup`${`MPI_PROC_NULL`}, where <span class="sans-serif">n</span> is the number of processes in this group.==

==The use of dest or source=`MPI_PROC_NULL` to define a “dummy” destination or source in any send or receive call is described in Section [[versions/v30/sections/pt2pt#Null Processes|Null Processes]] on page [[versions/v30/sections/pt2pt#Null Processes|Null Processes]] .==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~The selection of a message by a receive operation is governed by the value of the message envelope. A message can be received by a receive operation if its envelope matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a wildcard `MPI_ANY_SOURCE` value for `source`, and/or a wildcard `MPI_ANY_TAG` value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless~~

~~source=`MPI_ANY_SOURCE` in the pattern, and has a matching tag unless~~

~~tag=`MPI_ANY_TAG` in the pattern.~~

~~The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from `MPI_ANY_SOURCE`, is specified as a rank within the process group associated with that same communicator (remote process group, for intercommunicators). Thus, the range of valid values for the `source` argument is {<span class="sans-serif">0,...,n-1</span>}$`\cup`${`MPI_ANY_SOURCE`},$`\cup`${`MPI_PROC_NULL`}, where <span class="sans-serif">n</span> is the number of processes in this group.~~

==The selection of a message by a receive operation is governed by the value of the message envelope. A message can be received by a receive operation if its envelope matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a wildcard `MPI_ANY_SOURCE` value for `source`, and/or a wildcard `MPI_ANY_TAG` value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless source=`MPI_ANY_SOURCE` in the pattern, and has a matching tag unless tag=`MPI_ANY_TAG` in the pattern.==

==The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from `MPI_ANY_SOURCE`, is specified as a rank within the process group associated with that same communicator (remote process group, for intercommunicators). Thus, the range of valid values for the `source` argument is {$`0,...,n-1\}\cup\{\texttt{MPI_ANY_SOURCE}\}\cup\{\texttt{MPI_PROC_NULL}\}`$, where $`n`$ is the number of processes in this group.==

The use of dest or source=`MPI_PROC_NULL` to define a “dummy” destination or source in any send or receive call is described in ~~Section [[versions/v31/sections/pt2pt#Null Processes|Null Processes]] on page~~ [[versions/v31/sections/pt2pt#Null Processes|Null Processes]] .

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

The ~~syntax~~ ==**send-receive** operations combine in one operation the sending== of ==a message to one destination and== the ~~blocking receive~~ ==receiving of another message, from another process. The two (source and destination) are possibly the same. A send-receive== operation is ~~given below.~~ ==very useful for executing a shift operation across a chain of processes. If blocking sends and receives are used for such a shift, then one needs to order the sends and receives correctly (for example, even processes send, then receive, odd processes receive first, then send) so as to prevent cyclic dependencies that may lead to *deadlock*. When a send-receive operation is used, the communication subsystem takes care of these issues. The send-receive operation can be used in conjunction with the procedures described in Chapter [[versions/v40/sections/topol#Process Topologies|Process Topologies]] in order to perform shifts on various logical topologies. Also, a send-receive operation is useful for implementing remote procedure calls.==

~~![[versions/v40/API/MPI_RECV]]~~ ==A message sent by a send-receive operation can be received by a regular receive operation or probed by a probe operation; a send-receive operation can receive a message sent by a regular send operation.==

~~The blocking semantics of this call are described in Section [[versions/v40/sections/pt2pt#Communication Modes|Communication Modes]] .~~ ==![[versions/v40/API/MPI_SENDRECV]]==

==Execute a blocking send-receive operation. Both send and receive use the same communicator, but possibly different tags.== The ==send buffer and== receive ~~buffer consists of the storage containing `count` consecutive elements of the type specified by `datatype`, starting at address `buf`. The length of the received message~~ ==buffers== must be ~~less than or equal to the length of the receive buffer. An overflow error occurs if all incoming data does not fit, without truncation, into the receive buffer.~~ ==disjoint, and may have different lengths and datatypes.==

~~If~~ ==The semantics of== a ~~message that~~ ==send-receive operation== is ~~shorter than~~ ==what would be obtained if== the ~~receive buffer arrives, then only those locations corresponding~~ ==caller forked two concurrent threads, one== to ==execute== the ~~(shorter) message are modified.~~ ==send, and one to execute the receive, followed by a join of these two threads.==

~~> [!note] Advice to users~~ ==![[versions/v40/API/MPI_SENDRECV_REPLACE]]==

~~>~~ ==Execute a blocking send and receive.== The ~~[[versions/v40/API/MPI_PROBE|MPI_PROBE]] function described in Section [[versions/v40/sections/pt2pt#Probe~~ ==same buffer is used both for the send== and ~~Cancel|Probe and Cancel]] can be used to receive messages of unknown length.~~ ==for the receive, so that the message sent is replaced by the message received.==

~~> Even though no specific behavior is mandated by MPI for erroneous programs, the recommended handling of overflow situations is to return in `status` information about the source and tag of the incoming message. The receive operation will return an error code. A quality implementation will also ensure that no memory that is outside the receive buffer will ever be overwritten. > > In the case of a message shorter than the receive buffer, MPI is quite strict in that it allows no modification of the other locations. A more lenient statement would allow for some optimizations but this is not allowed. The implementation must be ready to end a copy into the receiver memory exactly at the end of the receive buffer, even if it is an odd address.~~

~~The selection of a message by a receive operation is governed by the value of the message envelope. A message can be received by a receive operation if its envelope matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a wildcard `MPI_ANY_SOURCE` value for `source`, and/or a wildcard `MPI_ANY_TAG` value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless source=`MPI_ANY_SOURCE` in the pattern, and has a matching tag unless tag=`MPI_ANY_TAG` in the pattern.~~

~~The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from `MPI_ANY_SOURCE`, is specified as a rank within the process group associated with that same communicator (remote process group, for intercommunicators). Thus, the range of valid values for the `source` argument is {$`0,...,n-1\}\cup\{\texttt{MPI_ANY_SOURCE}\}\cup\{\texttt{MPI_PROC_NULL}\}`$, where $`n`$ is the number of processes in this group.~~

~~Note the asymmetry between send and receive operations: A receive operation may accept messages from an arbitrary sender, on the other hand, a send operation must specify a unique receiver. This matches a “push” communication mechanism, where data transfer is effected by the sender (rather than a “pull” mechanism, where data transfer is effected by the receiver).~~

~~Source = destination is allowed, that is, a process can send a message to itself. (However, it is unsafe to do so with the blocking send and receive operations described above, since this may lead to deadlock. See Section [[versions/v40/sections/pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] .)~~

~~> [!warning] Advice to implementors~~

~~> Message context and other communicator information can be implemented as an additional tag field. It differs from the regular message tag in that wild card matching is not allowed on this field, and that value setting for this field is controlled by communicator manipulation functions.~~

~~The use of dest or source=`MPI_PROC_NULL` to define a “dummy” destination or source in any send or receive call is described in [[versions/v40/sections/pt2pt#Null Processes|Null Processes]] .~~

==> Additional intermediate buffering is needed for the “replace” variant.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The **send-receive** operations combine in one operation the sending of a message to one destination and the receiving of another message, from another ==MPI== process. The two (source and destination) are possibly the same. A send-receive operation is very useful for executing a shift operation across a chain of ==MPI== processes. If blocking sends and receives are used for such a shift, then one needs to order the sends and receives correctly (for example, ==MPI processes with== even ~~processes~~ ==rank in the communicator== send, then receive, ==MPI processes with== odd ~~processes~~ ==rank in the communicator== receive first, then send) so as to prevent cyclic dependencies that may lead to *deadlock*. When a send-receive operation is used, the communication subsystem takes care of these issues. The send-receive operation can be used in conjunction with the procedures described in Chapter ~~[[versions/v41/sections/topol#Process Topologies|Process Topologies]]~~ ==[[versions/v41/sections/topol#Virtual Topologies for MPI Processes|Virtual Topologies for MPI Processes]]== in order to perform shifts on various logical topologies. Also, a send-receive operation is useful for implementing remote procedure calls.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Blocking Send-Receive]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Blocking Send-Receive]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Blocking Send-Receive]]
