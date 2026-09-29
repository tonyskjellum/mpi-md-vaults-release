---
title: "Persistent Communication Requests"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Persistent Communication Requests

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Persistent communication requests|MPI-1.3]], [[versions/v21/sections/pt2pt#Persistent Communication Requests|MPI-2.1]], [[versions/v22/sections/pt2pt#Persistent Communication Requests|MPI-2.2]], [[versions/v30/sections/pt2pt#Persistent Communication Requests|MPI-3.0]], [[versions/v31/sections/pt2pt#Persistent Communication Requests|MPI-3.1]], [[versions/v40/sections/pt2pt#Persistent Communication Requests|MPI-4.0]], [[versions/v41/sections/pt2pt#Persistent Communication Requests|MPI-4.1]], [[versions/v50/sections/pt2pt#Persistent Communication Requests|MPI-5.0]]

Heading by release: MPI-1.3: “Persistent communication requests”; MPI-2.1: “Persistent Communication Requests”; MPI-2.2: “Persistent Communication Requests”; MPI-3.0: “Persistent Communication Requests”; MPI-3.1: “Persistent Communication Requests”; MPI-4.0: “Persistent Communication Requests”; MPI-4.1: “Persistent Communication Requests”; MPI-5.0: “Persistent Communication Requests”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (5 changed paragraphs)

~~A persistent communication request is created using one of the four following calls. These calls involve no communication.~~

==A persistent communication request is created using one of the==

==five==

==following calls. These calls involve no communication.==

The call is local, with similar semantics to the nonblocking communication operations described in ~~section~~ ==Section== [[versions/v21/sections/pt2pt#Nonblocking ~~communication|Nonblocking communication]]~~ ==Communication|Nonblocking Communication]]== . That is, a call to `MPI_START` with a request created by [[versions/v21/API/MPI_SEND_INIT|MPI_SEND_INIT]] starts a communication in the same manner as a call to [[versions/v21/API/MPI_ISEND|MPI_ISEND]] ; a call to `MPI_START` with a request created by [[versions/v21/API/MPI_BSEND_INIT|MPI_BSEND_INIT]] starts a communication in the same manner as a call to [[versions/v21/API/MPI_IBSEND|MPI_IBSEND]] ; and so on.

A communication started with a call to [[versions/v21/API/MPI_START|MPI_START]] or [[versions/v21/API/MPI_STARTALL|MPI_STARTALL]] is completed by a call to [[versions/v21/API/MPI_WAIT|MPI_WAIT]] , [[versions/v21/API/MPI_TEST|MPI_TEST]] , or one of the derived functions described in ~~section~~ ==Section== [[versions/v21/sections/pt2pt#Multiple Completions|Multiple Completions]] . The request becomes inactive after successful completion of such call. The request is not deallocated and it can be activated anew by an [[versions/v21/API/MPI_START|MPI_START]] or [[versions/v21/API/MPI_STARTALL|MPI_STARTALL]] call.

~~$`Create  (Start  Complete)^*  Free    ,`$~~

~~\ where $`*`$ indicates zero or more repetitions. If the same communication object is used in several concurrent threads, it is the user’s responsibility to coordinate calls so that the correct sequence is obeyed.~~

==$`Create  (Start  Complete)^*  Free`$==

==\ where==

==$`*`$ indicates zero or more repetitions. If the same communication object is used in several concurrent threads, it is the user’s responsibility to coordinate calls so that the correct sequence is obeyed.==

> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in subsections “Problems Due to Data Copying and Sequence Association,” and “A Problem with ==Register Optimization”== > > ~~Register Optimization”~~ in Section ~~10.2.2 of the MPI-2 Standard,~~ ==[[versions/v21/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] on== pages ~~286~~ ==[[versions/v21/sections/binding#Problems Due to Data Copying== and ~~289.~~ ==Sequence Association|Problems Due to Data Copying and Sequence Association]] and [[versions/v21/sections/binding#A Problem with Register Optimization|A Problem with Register Optimization]] .==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

If the request is for a send with ready mode, then a matching receive should be posted before the call is made. The communication buffer should not be ~~accessed~~ ==modified== after the call, and until the operation completes.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~five~~

~~following calls. These calls involve no communication.~~

==five following calls. These calls involve no communication.==

~~$`Create  (Start  Complete)^*  Free`$~~

~~\ where~~

~~$`*`$ indicates zero or more repetitions. If the same communication object is used in several concurrent threads, it is the user’s responsibility to coordinate calls so that the correct sequence is obeyed.~~

==$`Create  (Start  Complete)^*  Free`$\ where $`*`$ indicates zero or more repetitions. If the same communication object is used in several concurrent threads, it is the user’s responsibility to coordinate calls so that the correct sequence is obeyed.==

> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in ~~subsections “Problems Due to Data Copying and Sequence Association,” and “A Problem with Register Optimization”~~ > > ~~in Section~~ ==Sections== [[versions/v30/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] ==- [[versions/v30/sections/binding#Comparison with C|Comparison with C]] , especially in > > Sections [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] and [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]]== on pages [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence ~~Association|Problems~~ ==Association with Subscript Triplets|Problems== Due to Data Copying and Sequence ~~Association]]~~ ==Association with Subscript Triplets]] - [[versions/v30/sections/binding#Problems Due to Data Copying== and ~~[[binding#A Problem~~ ==Sequence Association== with ==Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] about “<span class="sans-serif">Problems Due to Data Copying and Sequence Association with Subscript Triplets</span>” and “<span class="sans-serif">Vector Subscripts</span>”, > > and in Sections [[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v30/sections/binding#Permanent Data Movement|Permanent Data Movement]] on pages [[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v30/sections/binding#Permanent Data Movement|Permanent Data Movement]] about “<span class="sans-serif">Optimization Problems</span>”, “<span class="sans-serif">Code Movements and== Register ~~Optimization|A Problem with Register Optimization]] .~~ ==Optimization</span>”, “<span class="sans-serif">Temporary Data Movements</span>” and “<span class="sans-serif">Permanent Data Movements</span>”.==

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

~~A persistent communication request is created using one of the~~

~~five following calls. These calls involve no communication.~~

==A persistent communication request is created using one of the five following calls. These calls involve no communication.==

Creates a persistent communication request for a receive operation. The argument `buf` is marked as `OUT` because the user gives permission to write on the receive buffer by passing the argument to ~~`MPI_RECV_INIT`.~~ ==[[versions/v31/API/MPI_RECV_INIT|MPI_RECV_INIT]] .==

~~`MPI_STARTALL(count, array_of_requests)`~~ ==[[versions/v31/API/MPI_STARTALL|MPI_STARTALL]]== has the same effect as calls to ~~`MPI_START`~~ ==[[versions/v31/API/MPI_START|MPI_START]]== `(&array_of_requests[i])`, executed for ~~<span class="sans-serif">i=0 ,..., count-1</span>,~~ ==`i=0 ,`$`...`$`, count-1`,== in some arbitrary order.

The call to [[versions/v31/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] can occur at any point in the program after the persistent request was created. However, the request will be deallocated only after it becomes inactive. Active receive requests should not be freed. Otherwise, it will not be possible to check that the receive has completed. It is preferable, in general, to free requests when they are inactive. If this rule is followed, then the functions described in this section will be invoked in a sequence of the form, ==``` math \textbf{Create (Start Complete)$^*$ Free} ```==

~~$`Create (Start Complete)^* Free`$\~~ where $`*`$ indicates zero or more repetitions. If the same communication object is used in several concurrent threads, it is the user’s responsibility to coordinate calls so that the correct sequence is obeyed.

A send operation initiated with ~~`MPI_START`~~ ==[[versions/v31/API/MPI_START|MPI_START]]== can be matched with any receive operation and, likewise, a receive operation initiated with ~~`MPI_START`~~ ==[[versions/v31/API/MPI_START|MPI_START]]== can receive messages generated by any send operation.

> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in ~~> >~~ Sections [[versions/v31/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] ~~-~~ ==–== [[versions/v31/sections/binding#Comparison with C|Comparison with C]] ~~, especially in > > Sections [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] and [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] on pages [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] - [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] about “<span class="sans-serif">Problems Due to Data Copying and Sequence Association with Subscript Triplets</span>” and “<span class="sans-serif">Vector Subscripts</span>”, > > and in Sections [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] on pages [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] about “<span class="sans-serif">Optimization Problems</span>”, “<span class="sans-serif">Code Movements and Register Optimization</span>”, “<span class="sans-serif">Temporary Data Movements</span>” and “<span class="sans-serif">Permanent Data Movements</span>”.~~ ==.==

### MPI-3.1 → MPI-4.0  (8 changed paragraphs)

~~Often a communication with the same argument list is repeatedly executed within the inner loop of a parallel computation. In such a situation, it may be possible to optimize the communication by binding the list of communication arguments to a **persistent** communication request once and, then, repeatedly using the request to initiate and complete messages. The persistent request thus created can be thought of as a communication port or a “half-channel.” It does not provide the full functionality of a conventional channel, since there is no binding of the send port to the receive port. This construct allows reduction of the overhead for communication between the process and communication controller, but not of the overhead for communication between one communication controller and another. It is not necessary that messages sent with a persistent request be received by a receive operation using a persistent request, or vice versa.~~

~~A persistent communication request is created using one of the five following calls. These calls involve no communication.~~

==Often a communication with the same argument list (with the exception of the buffer contents) is repeatedly executed within the inner loop of a parallel computation. In such a situation, it may be possible to optimize the communication by binding the list of communication arguments to a *persistent communication request* once and then repeatedly using the request to *start* and *complete* operations. In the case of point-to-point communication, the *persistent communication request* thus created can be thought of as a communication port or a “half-channel.” It does not provide the full functionality of a conventional channel, since there is no binding of the send port to the receive port. This construct allows reduction of the overhead for communication between the process and communication controller, but not of the overhead for communication between one communication controller and another. It is not necessary that messages sent with a persistent point-to-point request be received by a receive operation using a persistent point-to-point request, or vice versa.==

==There are also persistent collective communication operations defined in Section [[versions/v40/sections/coll#Persistent Collective Operations|Persistent Collective Operations]] and Section [[versions/v40/sections/topol#Persistent Neighborhood Communication on Process Topologies|Persistent Neighborhood Communication on Process Topologies]] . The remainder of this section covers the point-to-point persistent *initialization* operations and the start routines, which are used for persistent point-to-point, partitioned point-to-point, and persistent collective communication operations.==

==A point-to-point **persistent communication request** is created using one of the five following calls. These point-to-point persistent *initialization* calls involve no communication.==

Creates a ~~persistent~~ ==*persistent== communication ~~request~~ ==request*== for a ~~standard~~ ==*standard== mode ~~send operation, and binds to it all the arguments of a send~~ ==send*== operation.

Creates a ~~persistent~~ ==*persistent== communication ~~request~~ ==request*== for a ~~buffered~~ ==*buffered== mode ~~send.~~ ==send* operation.==

Creates a ~~persistent~~ ==*persistent== communication ~~object~~ ==request*== for a ~~synchronous~~ ==*synchronous== mode ~~send~~ ==send*== operation.

Creates a ~~persistent~~ ==*persistent== communication ~~object~~ ==request*== for a ~~ready~~ ==*ready== mode ~~send~~ ==send*== operation.

Creates a ~~persistent~~ ==*persistent== communication ~~request~~ ==request*== for a receive operation. The argument `buf` is marked as `OUT` because the user gives permission to write on the receive buffer by passing the argument to [[versions/v40/API/MPI_RECV_INIT|MPI_RECV_INIT]] .

A ~~persistent~~ ==*persistent== communication ~~request~~ ==request*== is ~~inactive~~ ==*inactive*== after it was ~~created — no~~ ==created—no== active communication is attached to the request.

A communication ~~(send or receive)~~ that uses a ~~persistent request~~ ==*persistent communication request*== is ~~initiated~~ ==*started*== by the function [[versions/v40/API/MPI_START|MPI_START]] .

The argument, `request`, is a handle returned by ~~one~~ ==any== of the ==*initialization* procedures for persistent point-to-point communication (the== previous five ~~calls.~~ ==procedures), or for partitioned point-to-point communication (see Section [[versions/v40/sections/part#Partitioned Point-to-Point Communication|Partitioned Point-to-Point Communication]] ), or for persistent collective communication (see Sections [[versions/v40/sections/coll#Persistent Collective Operations|Persistent Collective Operations]] and [[versions/v40/sections/topol#Persistent Neighborhood Communication on Process Topologies|Persistent Neighborhood Communication on Process Topologies]] ).== The associated request should be ~~inactive.~~ ==*inactive*.== The request becomes ~~active~~ ==*active*== once the call is made.

If the request is for a ~~send with ready mode,~~ ==*ready mode send* operation,== then a matching receive ==operation== should be posted before the call is made. The communication buffer should not be modified after the call, and until the operation ~~completes.~~ ==*completes*.==

The call is ~~local,~~ ==*local*,== with similar semantics to the nonblocking communication operations described in Section [[versions/v40/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] . That is, a call to ~~`MPI_START`~~ ==[[versions/v40/API/MPI_START|MPI_START]]== with a request created by [[versions/v40/API/MPI_SEND_INIT|MPI_SEND_INIT]] starts a communication in the same manner as a call to [[versions/v40/API/MPI_ISEND|MPI_ISEND]] ; a call to ~~`MPI_START`~~ ==[[versions/v40/API/MPI_START|MPI_START]]== with a request created by [[versions/v40/API/MPI_BSEND_INIT|MPI_BSEND_INIT]] starts a communication in the same manner as a call to [[versions/v40/API/MPI_IBSEND|MPI_IBSEND]] ; and so on.

~~Start all communications associated with requests in `array_of_requests`. A call to~~

~~[[versions/v40/API/MPI_STARTALL|MPI_STARTALL]] has the same effect as calls to [[versions/v40/API/MPI_START|MPI_START]] `(&array_of_requests[i])`, executed for `i=0 ,`$`...`$`, count-1`, in some arbitrary order.~~

~~A communication started with a call to [[versions/v40/API/MPI_START|MPI_START]] or [[versions/v40/API/MPI_STARTALL|MPI_STARTALL]] is completed by a call to [[versions/v40/API/MPI_WAIT|MPI_WAIT]] , [[versions/v40/API/MPI_TEST|MPI_TEST]] , or one of the derived functions described in Section [[versions/v40/sections/pt2pt#Multiple Completions|Multiple Completions]] . The request becomes inactive after successful completion of such call. The request is not deallocated and it can be activated anew by an [[versions/v40/API/MPI_START|MPI_START]] or [[versions/v40/API/MPI_STARTALL|MPI_STARTALL]] call.~~

~~A persistent request is deallocated by a call to [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] (Section [[versions/v40/sections/pt2pt#Communication Completion|Communication Completion]] ).~~

~~The call to [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] can occur at any point in the program after the persistent request was created. However, the request will be deallocated only after it becomes inactive. Active receive requests should not be freed. Otherwise, it will not be possible to check that the receive has completed. It is preferable, in general, to free requests when they are inactive. If this rule is followed, then the functions described in this section will be invoked in a sequence of the form, ``` math \textbf{Create  (Start  Complete)$^*$  Free} ```~~

~~where $`*`$ indicates zero or more repetitions. If the same communication object is used in several concurrent threads, it is the user’s responsibility to coordinate calls so that the correct sequence is obeyed.~~

~~A send operation initiated with [[versions/v40/API/MPI_START|MPI_START]] can be matched with any receive operation and, likewise, a receive operation initiated with [[versions/v40/API/MPI_START|MPI_START]] can receive messages generated by any send operation.~~

==The execution of [[versions/v40/API/MPI_STARTALL|MPI_STARTALL]] has the same effect as the execution of [[versions/v40/API/MPI_START|MPI_START]] for each of the array elements in some arbitrary order. [[versions/v40/API/MPI_STARTALL|MPI_STARTALL]] with an array of length one is equivalent to [[versions/v40/API/MPI_START|MPI_START]] .==

==A communication started with a call to [[versions/v40/API/MPI_START|MPI_START]] or [[versions/v40/API/MPI_STARTALL|MPI_STARTALL]] is completed by a call to [[versions/v40/API/MPI_WAIT|MPI_WAIT]] , [[versions/v40/API/MPI_TEST|MPI_TEST]] , or one of the derived functions described in Section [[versions/v40/sections/pt2pt#Multiple Completions|Multiple Completions]] . The request becomes *inactive* after successful completion of such call. The request is not deallocated and it can be activated anew by an [[versions/v40/API/MPI_START|MPI_START]] or [[versions/v40/API/MPI_STARTALL|MPI_STARTALL]] call.==

==A *persistent communication request* is deallocated by a call to [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] (Section [[versions/v40/sections/pt2pt#Communication Completion|Communication Completion]] ).==

==The call to [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] can occur at any point in the program after the persistent request was created. However, the request will be deallocated only after it becomes *inactive*. *Active* receive requests should not be *freed*. Otherwise, it will not be possible to check that the receive has *completed*. *Collective* operation requests (defined in Section [[versions/v40/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] and Section [[versions/v40/sections/topol#Nonblocking Neighborhood Communication on Process Topologies|Nonblocking Neighborhood Communication on Process Topologies]] for nonblocking collective operations, and Section [[versions/v40/sections/coll#Persistent Collective Operations|Persistent Collective Operations]] and Section [[versions/v40/sections/topol#Persistent Neighborhood Communication on Process Topologies|Persistent Neighborhood Communication on Process Topologies]] for persistent collective operations) must not be *freed* while *active*. It is preferable, in general, to free requests when they are inactive. If this rule is followed, then the functions described in this section will be invoked in a sequence of the form, ``` math \textbf{Create  (Start  Complete)$^*$  Free} ```==

==where $`*`$ indicates zero or more repetitions. If the same *persistent communication request* is used in several concurrent threads, it is the user’s responsibility to coordinate calls so that the correct sequence is obeyed.==

==A send operation *started* with [[versions/v40/API/MPI_START|MPI_START]] can be matched with any receive operation and, likewise, a receive operation *started* with [[versions/v40/API/MPI_START|MPI_START]] can receive messages generated by any send operation.==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

Often a communication with the same argument list (with the exception of the buffer contents) is repeatedly executed within the inner loop of a parallel computation. In such a situation, it may be possible to optimize the communication by binding the list of communication arguments to a *persistent communication request* once and then repeatedly using the request to *start* and *complete* operations. In the case of point-to-point communication, the *persistent communication request* thus created can be thought of as a communication port or a “half-channel.” It does not provide the full functionality of a conventional channel, since there is no binding of the send port to the receive port. This construct allows reduction of the overhead for communication between the ==MPI== process and communication controller, but not of the overhead for communication between one communication controller and another. It is not necessary that messages sent with a persistent point-to-point request be received by a receive operation using a persistent point-to-point request, or vice versa.

If the request is for a *ready mode send* operation, then a matching receive operation should be ~~posted~~ ==*started*== before the call is made. The communication buffer should not be modified after the call, and until the operation *completes*.

~~A send operation *started* with [[versions/v41/API/MPI_START|MPI_START]] can be matched with any receive operation and, likewise, a receive operation *started* with [[versions/v41/API/MPI_START|MPI_START]] can receive messages generated by any send operation.~~

==*Inactive persistent requests* are not automatically *freed* when the associated communicator is disconnected (via [[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , see [[versions/v41/sections/dynamic#Releasing Connections|Releasing Connections]] ) or the associated World Model or Sessions Model is finalized (via [[MPI_FNIALIZE]] , see [[versions/v41/sections/dynamic#Finalizing MPI|Finalizing MPI]] , or [[versions/v41/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] , see [[versions/v41/sections/dynamic#Session Creation and Destruction Methods|Session Creation and Destruction Methods]] ). In these situations, any further use of the request handle is erroneous. In particular, freeing associated inactive request handles after such a communicator disconnect or finalization is then impossible.==

==> [!note] Advice to users==

==> Persistent request handles may bind internal resources such as MPI buffers in shared memory for providing efficient communication. Therefore, it is highly recommended to explicitly free inactive request handles, using [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , when they are no longer in use, and in particular before freeing or disconnecting the associated communicator with [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] or [[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] or finalizing the associated session with [[versions/v41/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] .==

==A send operation *started* with [[versions/v41/API/MPI_START|MPI_START]] can be *matched* with any receive operation and, likewise, a receive operation *started* with [[versions/v41/API/MPI_START|MPI_START]] can receive messages generated by any send operation.==

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

Often a communication with the same argument list (with the exception of the buffer contents) is repeatedly executed within the inner loop of a parallel computation. In such a situation, it may be possible to optimize the communication by binding the list of communication arguments to a *persistent communication request* once and then repeatedly using the request to *start* and *complete* operations. In the case of point-to-point communication, the *persistent communication request* thus created can be thought of as a communication port or a “half-channel.” It does not provide the full functionality of a conventional channel, since there is no binding of the send port to the receive port. This construct allows ==the== reduction of the overhead for communication between the MPI process and communication controller, but not of the overhead for communication between one communication controller and another. It is not necessary that messages sent with a persistent point-to-point request be received by a receive operation using a persistent point-to-point request, or vice versa.

The argument, `request`, is a handle returned by any of the *initialization* procedures for persistent point-to-point communication (the previous five procedures), or for partitioned point-to-point communication (see ~~Section~~ ==Chapter== [[versions/v50/sections/part#Partitioned Point-to-Point Communication|Partitioned Point-to-Point Communication]] ), or for persistent collective communication (see Sections [[versions/v50/sections/coll#Persistent Collective Operations|Persistent Collective Operations]] and [[versions/v50/sections/topol#Persistent Neighborhood Communication on Process Topologies|Persistent Neighborhood Communication on Process Topologies]] ). The associated request should be *inactive*. The request becomes *active* once the call is made.

If the request is for a *ready mode send* operation, then a matching receive operation should be *started* before the call is made. The communication buffer ~~should~~ ==must== not be modified after the call, and until the operation *completes*.

*Inactive persistent requests* are not automatically *freed* when the associated communicator is disconnected (via [[versions/v50/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , see [[versions/v50/sections/dynamic#Releasing Connections|Releasing Connections]] ) or the associated World Model or Sessions Model is finalized (via ~~[[MPI_FNIALIZE]]~~ ==[[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]]== , see [[versions/v50/sections/dynamic#Finalizing MPI|Finalizing MPI]] , or [[versions/v50/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] , see [[versions/v50/sections/dynamic#Session Creation and Destruction Methods|Session Creation and Destruction Methods]] ). In these situations, any further use of the request handle is erroneous. In particular, freeing associated inactive request handles after such a communicator disconnect or finalization is then impossible.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Persistent communication requests]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Persistent Communication Requests]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Persistent Communication Requests]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Persistent Communication Requests]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Persistent Communication Requests]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Persistent Communication Requests]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Persistent Communication Requests]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Persistent Communication Requests]]
