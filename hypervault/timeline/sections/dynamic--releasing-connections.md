---
title: "Releasing Connections"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Releasing Connections

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Releasing Connections|MPI-2.0]], [[versions/v21/sections/dynamic#Releasing Connections|MPI-2.1]], [[versions/v22/sections/dynamic#Releasing Connections|MPI-2.2]], [[versions/v30/sections/dynamic#Releasing Connections|MPI-3.0]], [[versions/v31/sections/dynamic#Releasing Connections|MPI-3.1]], [[versions/v40/sections/dynamic#Releasing Connections|MPI-4.0]], [[versions/v41/sections/dynamic#Releasing Connections|MPI-4.1]], [[versions/v50/sections/dynamic#Releasing Connections|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (4 changed paragraphs)

1. they both belong to the same communicator (inter- or intra-, including ~~[[MPI_COMM_WORLD]] )~~ ==MPI_COMM_WORLD)== *or*

~~- Processes which are connected, but don’t share the same [[MPI_COMM_WORLD]] may become disconnected (independent) if the communication path between them is broken by using [[versions/v21/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] .~~

~~The following additional rules apply to MPI-1 functions:~~

==- Processes which are connected, but don’t share the same MPI_COMM_WORLD may become disconnected (independent) if the communication path between them is broken by using [[versions/v21/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] .==

==The following additional rules apply to==

==MPI routines in other chapters:==

~~- [[versions/v21/API/MPI_ABORT|MPI_ABORT]] does not abort independent processes. As in MPI-1, it may abort all processes in [[MPI_COMM_WORLD]] (ignoring its `comm` argument). Additionally, it may abort connected processes as well, though it makes a “best attempt” to abort only the processes in `comm`.~~

==- [[versions/v21/API/MPI_ABORT|MPI_ABORT]] does not abort independent processes.==

==  It may abort all processes in the caller’s==

==  MPI_COMM_WORLD (ignoring its `comm` argument). Additionally, it may abort connected processes as well, though it makes a “best attempt” to abort only the processes in `comm`.==

This function waits for all pending communication on `comm` to complete internally, deallocates the communicator object, and sets the handle to ~~[[MPI_COMM_NULL]] .~~ ==MPI_COMM_NULL.== It is a collective operation.

It may not be called with the communicator ~~[[MPI_COMM_WORLD]]~~ ==MPI_COMM_WORLD== or ~~[[MPI_COMM_SELF]] .~~ ==MPI_COMM_SELF.==

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

1. they both belong to the same communicator (inter- or intra-, including ~~MPI_COMM_WORLD)~~ ==`MPI_COMM_WORLD`)== *or*

- Processes which are connected, but don’t share the same ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== may become disconnected (independent) if the communication path between them is broken by using [[versions/v22/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] .

~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== (ignoring its `comm` argument). Additionally, it may abort connected processes as well, though it makes a “best attempt” to abort only the processes in `comm`.

This function waits for all pending communication on `comm` to complete internally, deallocates the communicator object, and sets the handle to ~~MPI_COMM_NULL.~~ ==`MPI_COMM_NULL`.== It is a collective operation.

It may not be called with the communicator ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== or ~~MPI_COMM_SELF.~~ ==`MPI_COMM_SELF`.==

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

- Processes which are connected, but ~~don’t~~ ==do not== share the same ~~`MPI_COMM_WORLD`~~ ==`MPI_COMM_WORLD`,== may become disconnected (independent) if the communication path between them is broken by using [[versions/v30/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] .

~~  It may abort all processes in the caller’s~~

~~  `MPI_COMM_WORLD` (ignoring its `comm` argument). Additionally, it may abort connected processes as well, though it makes a “best attempt” to abort only the processes in `comm`.~~

==  It may abort all processes in the caller’s `MPI_COMM_WORLD` (ignoring its `comm` argument). Additionally, it may abort connected processes as well, though it makes a “best attempt” to abort only the processes in `comm`.==

> To disconnect two processes you may need to call [[versions/v30/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , [[versions/v30/API/MPI_WIN_FREE|MPI_WIN_FREE]] ==,== and [[versions/v30/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] to remove all communication paths between the two processes. ~~Notes~~ ==Note== that it may be necessary to disconnect several communicators (or to free several windows or files) before two processes are completely independent.

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~The following additional rules apply to~~

~~MPI routines in other chapters:~~

==The following additional rules apply to MPI routines in other chapters:==

~~- [[versions/v31/API/MPI_ABORT|MPI_ABORT]] does not abort independent processes.~~

~~  It may abort all processes in the caller’s `MPI_COMM_WORLD` (ignoring its `comm` argument). Additionally, it may abort connected processes as well, though it makes a “best attempt” to abort only the processes in `comm`.~~

==- [[versions/v31/API/MPI_ABORT|MPI_ABORT]] does not abort independent processes. It may abort all processes in the caller’s `MPI_COMM_WORLD` (ignoring its `comm` argument). Additionally, it may abort connected processes as well, though it makes a “best attempt” to abort only the processes in `comm`.==

~~[[versions/v31/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] may be called only if~~

~~all communication is complete and matched, so that buffered data can be delivered to its destination. This requirement is the same as for [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] .~~

==[[versions/v31/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] may be called only if all communication is complete and matched, so that buffered data can be delivered to its destination. This requirement is the same as for [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] .==

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

Before a client and ==a== server connect, they are independent MPI applications. An error in one does not affect the other. After establishing a connection with [[versions/v40/API/MPI_COMM_CONNECT|MPI_COMM_CONNECT]] and [[versions/v40/API/MPI_COMM_ACCEPT|MPI_COMM_ACCEPT]] , an error in one may affect the other. It is desirable for a client and ==a== server to be able to disconnect, so that an error in one will not affect the other. Similarly, it might be desirable for a parent and child to disconnect, so that errors in the child do not affect the parent, or vice-versa.

3. they both belong to the group of the same window or ~~filehandle.~~ ==file handle.==

==> [!warning] Advice to implementors==

==> In practice, it may be difficult to distinguish between an MPI process failure > > and an erroneous program that terminates without calling an MPI finalization function: an implementation that defines semantics for process failure management may have to exhibit the behavior defined for MPI process failures with such erroneous programs. A high quality implementation should exhibit a different behavior for erroneous programs and MPI process failures.==

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

- Processes ~~which~~ ==that== are connected, but do not share the same `MPI_COMM_WORLD`, may become disconnected (independent) if the communication path between them is broken by using [[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] .

This function waits for all ~~pending communication~~ ==*decoupled MPI activities*== on `comm` to complete internally, deallocates the communicator object, and sets the handle to `MPI_COMM_NULL`. It is a collective operation.

~~[[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] may be called only if all communication is complete and matched, so that buffered data can be delivered to its destination. This requirement is the same as for [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] .~~

~~[[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] has the same action as [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] , except that it waits for pending communication to finish internally and enables the guarantee about the behavior of disconnected processes.~~

==[[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] may be called only if all communication is complete and matched, so that buffered data can be delivered to its destination. This requirement is the same as for [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] . This means that before calling [[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , all request handles associated with `comm` must be freed in the case of nonblocking operations, and must be inactive or freed in the case of persistent operations (i.e., by calling one of the procedures==

==`MPI\_{TEST$`|`$WAIT}{$`|`$ANY$`|`$SOME$`|`$ALL}` or [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] ).==

==[[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] has the same effect as [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] , except that it waits for *decoupled MPI activities* on `comm` to finish internally, disallows any further use of derived inactive persistent requests, and enables the guarantee about the behavior of disconnected processes. The *decoupled MPI activities* also include any communication that is needed to complete a nonblocking or persistent operation on `comm` that was freed with [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] . After calling [[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , freeing or starting an inactive persistent request handle for a communication operation on `comm` is erroneous.==

> It would be nice to be able to use [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] instead, but that ~~function~~ ==procedure== explicitly does not wait for ~~pending communication~~ ==*decoupled MPI activities*== to ~~complete.~~ ==complete, and it does not disallow freeing or starting of related inactive (but not yet freed) persistent request handles.==

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

> In practice, it may be difficult to distinguish between an MPI process failure > > and an erroneous program that terminates without calling an MPI finalization function: an implementation that defines semantics for process failure management may have to exhibit the behavior defined for MPI process failures with such erroneous programs. A ~~high quality~~ ==high-quality== implementation should exhibit a different behavior for erroneous programs and MPI process failures.

[[versions/v50/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] may be called only if all communication is complete and matched, so that buffered data can be delivered to its destination. This requirement is the same as for [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] . This means that before calling [[versions/v50/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , all request handles associated with `comm` must be freed in the case of nonblocking operations, and must be inactive or freed in the case of persistent ==or partitioned== operations (i.e., by calling one of the procedures

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Releasing Connections]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Releasing Connections]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Releasing Connections]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Releasing Connections]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Releasing Connections]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Releasing Connections]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Releasing Connections]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Releasing Connections]]
