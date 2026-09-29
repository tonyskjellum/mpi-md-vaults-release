---
title: "Nonblocking Collective Operations"
chapter: coll
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Nonblocking Collective Operations

Chapter **coll** · in [[versions/v30/sections/coll#Nonblocking Collective Operations|MPI-3.0]], [[versions/v31/sections/coll#Nonblocking Collective Operations|MPI-3.1]], [[versions/v40/sections/coll#Nonblocking Collective Operations|MPI-4.0]], [[versions/v41/sections/coll#Nonblocking Collective Operations|MPI-4.1]], [[versions/v50/sections/coll#Nonblocking Collective Operations|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

Upon returning from a completion call in which a nonblocking collective operation completes, the `MPI_ERROR` field in the associated status object is set appropriately, see ~~Section [[versions/v31/sections/pt2pt#Return Status|Return Status]] on page~~ [[versions/v31/sections/pt2pt#Return Status|Return Status]] . The values of the `MPI_SOURCE` and `MPI_TAG` fields are undefined. It is valid to mix different request types (i.e., any combination of collective requests, I/O requests, generalized requests, or point-to-point requests) in functions that enable multiple completions (e.g., [[versions/v31/API/MPI_WAITALL|MPI_WAITALL]] ). It is erroneous to call [[versions/v31/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] or [[versions/v31/API/MPI_CANCEL|MPI_CANCEL]] for a request associated with a nonblocking collective operation. Nonblocking collective requests are not persistent.

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

~~Upon returning from a completion call in which a nonblocking collective operation completes, the `MPI_ERROR` field in the associated status object is set appropriately, see [[versions/v40/sections/pt2pt#Return Status|Return Status]] . The values of the `MPI_SOURCE` and `MPI_TAG` fields are undefined. It is valid to mix different request types (i.e., any combination of collective requests, I/O requests, generalized requests, or point-to-point requests) in functions that enable multiple completions (e.g., [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] ). It is erroneous to call [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] or [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] for a request associated with a nonblocking collective operation. Nonblocking collective requests are not persistent.~~

==Upon returning from a completion call in which a nonblocking collective operation completes, the values of the `MPI_SOURCE` and `MPI_TAG` fields in the associated status object, if any, are undefined. The value of `MPI_ERROR` may be defined, if appropriate, according to the specification in Section [[versions/v40/sections/pt2pt#Return Status|Return Status]] . It is valid to mix different request types (i.e., any combination of collective requests, I/O requests, generalized requests, or point-to-point requests) in functions that enable multiple completions (e.g., [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] ).==

==It is erroneous to call [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] or [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] for a request associated with a nonblocking collective operation .==

==Nonblocking collective requests created using the APIs described in this section are not persistent. However, persistent collective requests can be created using persistent collective operations described in Sections [[versions/v40/sections/coll#Persistent Collective Operations|Persistent Collective Operations]] and [[versions/v40/sections/topol#Persistent Neighborhood Communication on Process Topologies|Persistent Neighborhood Communication on Process Topologies]] .==

Multiple nonblocking collective operations can be outstanding on a single communicator. If the nonblocking call causes some system resource to be exhausted, then it will fail and ~~generate~~ ==raise== an ~~MPI exception.~~ ==error.== Quality implementations of MPI should ensure that this happens only in pathological cases. That is, an MPI implementation should be able to support a large number of pending nonblocking operations.

In terms of data ~~movements,~~ ==movement,== each nonblocking collective operation has the same effect as its blocking counterpart for ~~intracommunicators~~ ==intra-communicators== and ~~intercommunicators~~ ==inter-communicators== after completion. Likewise, upon completion, nonblocking collective reduction operations have the same effect as their blocking counterparts, and the same restrictions and recommendations on reduction orders apply.

~~Progression~~ ==*Progression*== rules for nonblocking collective operations are similar to progression of nonblocking point-to-point operations, refer to Section [[versions/v40/sections/pt2pt#Semantics of Nonblocking Communications|Semantics of Nonblocking Communications]] .

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

~~The nonblocking collective communication model is similar to the model used for nonblocking point-to-point communication. A nonblocking call initiates a collective operation, which must be completed in a separate completion call. Once initiated, the operation may progress independently of any computation or other communication at participating processes. In this manner, nonblocking collective operations can mitigate possible synchronizing effects of collective operations by running them in the “background.” In addition to enabling communication-computation overlap, nonblocking collective operations can perform collective operations on overlapping communicators, which would lead to deadlocks with blocking operations. Their semantic advantages can also be useful in combination with point-to-point communication.~~

~~As in the nonblocking point-to-point case, all calls are local and return immediately, irrespective of the status of other processes. The call initiates the operation, which indicates that the system may start to copy data out of the send buffer and into the receive buffer. Once initiated, all associated send buffers and buffers associated with input arguments (such as arrays of counts, displacements, or datatypes in the vector versions of the collectives) should not be modified, and all associated receive buffers should not be accessed, until the collective operation completes. The call returns a request handle, which must be passed to a completion call.~~

~~All completion calls (e.g., [[versions/v41/API/MPI_WAIT|MPI_WAIT]] ) described in Section [[versions/v41/sections/pt2pt#Communication Completion|Communication Completion]] are supported for nonblocking collective operations. Similarly to the blocking case, nonblocking collective operations are considered to be complete when the local part of the operation is finished, i.e., for the caller, the semantics of the operation are guaranteed and all buffers can be safely accessed and modified. Completion does not indicate that other processes have completed or even started the operation (unless otherwise implied by the description of the operation). Completion of a particular nonblocking collective operation also does not indicate completion of any other posted nonblocking collective (or send-receive) operations, whether they are posted before or after the completed operation.~~

==The nonblocking collective communication model is similar to the model used for nonblocking point-to-point communication. A nonblocking call initiates a collective operation, which must be completed in a separate completion call. Once initiated, the operation may progress==

==independently of any computation or other communication at participating MPI processes. In this manner, nonblocking collective operations can mitigate possible synchronizing effects of collective operations by running them in the “background.” In addition to enabling communication-computation overlap, nonblocking collective operations can perform collective operations on overlapping communicators, which would lead to deadlocks with blocking operations. Their semantic advantages can also be useful in combination with point-to-point communication.==

==As in the nonblocking point-to-point case, all calls are local and return immediately, irrespective of the status of other MPI processes. The call initiates the operation, which indicates that the system may start to copy data out of the send buffer and into the receive buffer. Once initiated, all associated send buffers and buffers associated with input arguments (such as arrays of counts, displacements, or datatypes in the vector versions of the collectives) should not be modified, and all associated receive buffers should not be accessed, until the collective operation completes. The call returns a request handle, which must be passed to a completion call.==

==All completion calls (e.g., [[versions/v41/API/MPI_WAIT|MPI_WAIT]] ) described in Section [[versions/v41/sections/pt2pt#Communication Completion|Communication Completion]] are supported for nonblocking collective operations. Similarly to the blocking case, nonblocking collective operations are considered to be complete when the local part of the operation is finished, i.e., for the caller, the semantics of the operation are guaranteed and all buffers can be safely accessed and modified. Completion does not indicate that other MPI processes have completed or even started the operation (unless otherwise implied by the description of the operation). Completion of a particular nonblocking collective operation also does not indicate completion of any other posted nonblocking collective (or send-receive) operations, whether they are posted before or after the completed operation.==

> Users should be aware that implementations are allowed, but not required (with exception of [[versions/v41/API/MPI_IBARRIER|MPI_IBARRIER]] ), to synchronize ==MPI== processes during the completion of a nonblocking collective operation.

Multiple nonblocking collective operations can be outstanding on a single communicator. If the nonblocking call causes some system resource to be exhausted, then it will fail and raise an error. Quality implementations of MPI should ensure that this happens only in pathological cases. That is, an MPI implementation should be able to support a large number of ~~pending~~ ==*pending*== nonblocking operations.

Unlike point-to-point operations, nonblocking collective operations do not match with blocking collective operations, and collective operations do not have a tag argument. All ==MPI== processes must call collective operations (blocking and nonblocking) in the same order per communicator. In particular, once a ==MPI== process calls a collective operation, all other ==MPI== processes in the communicator must eventually call the same collective operation, and no other collective operation with the same communicator in between. This is consistent with the ordering rules for blocking collective operations in threaded environments.

> Matching blocking and nonblocking collective operations is not allowed because the implementation might use different communication algorithms for the two cases. Blocking collective operations may be optimized for minimal time to completion, while nonblocking collective operations may balance time to completion with CPU overhead and asynchronous ~~progression.~~ ==progress.== > > The use of tags for collective operations can prevent certain hardware optimizations.

~~*Progression*~~ ==The *progress*== rules for nonblocking collective operations are similar to ~~progression of~~ ==the progress rules for== nonblocking point-to-point operations, refer to ~~Section [[versions/v41/sections/pt2pt#Semantics of Nonblocking Communications|Semantics of Nonblocking Communications]] .~~ ==[[Sections]] subsec:terms:progress [[and]] subsec:pt2pt-semantics.==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Nonblocking Collective Operations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Nonblocking Collective Operations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Nonblocking Collective Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Nonblocking Collective Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Nonblocking Collective Operations]]
