---
title: "Communication Objects"
chapter: pt2pt
present_in: ["MPI-1.3"]
tags: [mpi/section, mpi/pt2pt]
---

# Communication Objects

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Communication Objects|MPI-1.3]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~Nonblocking communications use opaque <span class="sans-serif">request</span> objects to identify communication operations and match the operation that initiates the communication with the operation that terminates it. These are system objects that are accessed via a handle. A request object identifies various properties of a communication operation, such as the send mode, the communication buffer that is associated with it, its context, the tag and destination arguments to be used for a send, or the tag and source arguments to be used for a receive. In addition, this object stores information about the status of the pending communication operation.~~

==The send call described in Section [[versions/v21/sections/pt2pt#Blocking Send|Blocking Send]] is **blocking**: it does not return until the message data and envelope have been safely stored away so that the sender is free to access and overwrite the send buffer. The message might be copied directly into the matching receive buffer, or it might be copied into a temporary system buffer.==

==Message buffering decouples the send and receive operations. A blocking send can complete as soon as the message was buffered, even if no matching receive has been executed by the receiver. On the other hand, message buffering can be expensive, as it entails additional memory-to-memory copying, and it requires the allocation of memory for buffering. MPI offers the choice of several communication modes that allow one to control the choice of the communication protocol.==

==The send call described in Section [[versions/v21/sections/pt2pt#Blocking Send|Blocking Send]]==

==uses==

==the **standard** communication mode. In this mode, it is up to MPI to decide whether outgoing messages will be buffered. MPI may buffer outgoing messages. In such a case, the send call may complete before a matching receive is invoked. On the other hand, buffer space may be unavailable, or MPI may choose not to buffer outgoing messages, for performance reasons. In this case, the send call will not complete until a matching receive has been posted, and the data has been moved to the receiver.==

==Thus, a send in standard mode can be started whether or not a matching receive has been posted. It may complete before a matching receive is posted. The standard mode send is **non-local**: successful completion of the send operation may depend on the occurrence of a matching receive.==

==> [!tip] Rationale==

==> The reluctance of MPI to mandate whether standard sends are buffering or not stems from the desire to achieve portable programs. Since any system will run out of buffer resources as message sizes are increased, and some implementations may want to provide little buffering, MPI takes the position that correct (and therefore, portable) programs do not rely on system buffering in standard mode. Buffering may improve the performance of a correct program, but it doesn’t affect the result of the program. If the user wishes to guarantee a certain amount of buffering, the user-provided buffer system of Section [[versions/v21/sections/pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] should be used, along with the buffered-mode send.==

==There are three additional communication modes.==

==A **buffered** mode send operation can be started whether or not a matching receive has been posted. It may complete before a matching receive is posted. However, unlike the standard send, this operation is **local**, and its completion does not depend on the occurrence of a matching receive. Thus, if a send is executed and no matching receive is posted, then MPI must buffer the outgoing message, so as to allow the send call to complete. An error will occur if there is insufficient buffer space. The amount of available buffer space is controlled by the user — see Section [[versions/v21/sections/pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] . Buffer allocation by the user may be required for the buffered mode to be effective.==

==A send that uses the **synchronous** mode can be started whether or not a matching receive was posted. However, the send will complete successfully only if a matching receive is posted, and the receive operation has started to receive the message sent by the synchronous send. Thus, the completion of a synchronous send not only indicates that the send buffer can be reused, but==

==it==

==also indicates that the receiver has reached a certain point in its execution, namely that it has started executing the matching receive. If both sends and receives are blocking operations then the use of the synchronous mode provides synchronous communication semantics: a communication does not complete at either end before both processes rendezvous at the communication. A send executed in this mode is **non-local**.==

==A send that uses the **ready** communication mode may be started *only* if the matching receive is already posted. Otherwise, the operation is erroneous and its outcome is undefined. On some systems, this allows the removal of a hand-shake operation that is otherwise required and results in improved performance. The completion of the send operation does not depend on the status of a matching receive, and merely indicates that the send buffer can be reused. A send operation that uses the ready mode has the same semantics as a standard send operation, or a synchronous send operation; it is merely that the sender provides additional information to the system (namely that a matching receive is already posted), that can save some overhead. In a correct program, therefore, a ready send could be replaced by a standard send with no effect on the behavior of the program other than performance.==

==Three additional send functions are provided for the three additional communication modes. The communication mode is indicated by a one letter prefix: <span class="sans-serif">B</span> for buffered, <span class="sans-serif">S</span> for synchronous, and <span class="sans-serif">R</span> for ready.==

==![[versions/v21/API/MPI_BSEND]]==

==Send in buffered mode.==

==![[versions/v21/API/MPI_SSEND]]==

==Send in synchronous mode.==

==![[versions/v21/API/MPI_RSEND]]==

==Send in ready mode.==

==There is only one receive operation,==

==but it matches==

==any of the send modes. The receive operation described in the last section is **blocking**: it returns only after the receive buffer contains the newly received message. A receive can complete before the matching send has completed (of course, it can complete only after the matching send has started).==

==In a multi-threaded implementation of MPI, the system may de-schedule a thread that is blocked on a send or receive operation, and schedule another thread for execution in the same address space. In such a case it is the user’s responsibility not to access or modify a communication buffer until the communication completes. Otherwise, the outcome of the computation is undefined.==

==> [!tip] Rationale==

==> We prohibit read accesses to a send buffer while it is being used, even though the send operation is not supposed to alter the content of this buffer. This may seem more stringent than necessary, but the additional restriction causes little loss of functionality and allows better performance on some systems — consider the case where data transfer is done by a DMA engine that is not cache-coherent with the main processor.==

==> [!warning] Advice to implementors==

==> Since a synchronous send cannot complete before a matching receive is posted, one will not normally buffer messages sent by such an operation. > > It is recommended to choose buffering over blocking the sender, whenever possible, for standard sends. The programmer can signal his or her preference for blocking the sender until a matching receive occurs by using the synchronous send mode. > > A possible communication protocol for the various communication modes is outlined below. > > <span class="sans-serif">ready send</span>: The message is sent as soon as possible. > > <span class="sans-serif">synchronous send:</span> The sender sends a request-to-send message. The receiver stores this request. When a matching receive is posted, the receiver sends back a permission-to-send message, and the sender now sends the message. > > <span class="sans-serif">standard send:</span> First protocol may be used for short messages, and second protocol for long messages. > > <span class="sans-serif">buffered send:</span> The sender copies the message into a buffer and then sends it with a nonblocking send (using the same protocol as for standard send). > > Additional control messages might be needed for flow control and error recovery. Of course, there are many other possible protocols. > > Ready send can be implemented as a standard send. In this case there will be no performance advantage (or disadvantage) for the use of ready send. > > A standard send can be implemented as a synchronous send. In such a case, no data buffering is needed. However, > > users may > > expect some buffering. > > In a multi-threaded environment, the execution of a blocking communication should block only the executing thread, allowing the thread scheduler to de-schedule this thread and schedule another thread for execution.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

The send call described in Section [[versions/v22/sections/pt2pt#Blocking Send|Blocking Send]] is **blocking**: it does not return until the message data and envelope have been safely stored away so that the sender is free to ~~access and overwrite~~ ==modify== the send buffer. The message might be copied directly into the matching receive buffer, or it might be copied into a temporary system buffer.

~~In a multi-threaded implementation of MPI, the system may de-schedule a thread that is blocked on a send or receive operation, and schedule another thread for execution in the same address space. In such a case it is the user’s responsibility not to access or modify a communication buffer until the communication completes. Otherwise, the outcome of the computation is undefined.~~

~~> [!tip] Rationale~~

~~> We prohibit read accesses to a send buffer while it is being used, even though the send operation is not supposed to alter the content of this buffer. This may seem more stringent than necessary, but the additional restriction causes little loss of functionality and allows better performance on some systems — consider the case where data transfer is done by a DMA engine that is not cache-coherent with the main processor.~~

==In a multi-threaded implementation of MPI, the system may de-schedule a thread that is blocked on a send or receive operation, and schedule another thread for execution in the same address space. In such a case it is the user’s responsibility not to==

==modify a communication buffer until the communication completes. Otherwise, the outcome of the computation is undefined.==

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~uses~~

~~the **standard** communication mode. In this mode, it is up to MPI to decide whether outgoing messages will be buffered. MPI may buffer outgoing messages. In such a case, the send call may complete before a matching receive is invoked. On the other hand, buffer space may be unavailable, or MPI may choose not to buffer outgoing messages, for performance reasons. In this case, the send call will not complete until a matching receive has been posted, and the data has been moved to the receiver.~~

==uses the **standard** communication mode. In this mode, it is up to MPI to decide whether outgoing messages will be buffered. MPI may buffer outgoing messages. In such a case, the send call may complete before a matching receive is invoked. On the other hand, buffer space may be unavailable, or MPI may choose not to buffer outgoing messages, for performance reasons. In this case, the send call will not complete until a matching receive has been posted, and the data has been moved to the receiver.==

~~A send that uses the **synchronous** mode can be started whether or not a matching receive was posted. However, the send will complete successfully only if a matching receive is posted, and the receive operation has started to receive the message sent by the synchronous send. Thus, the completion of a synchronous send not only indicates that the send buffer can be reused, but~~

~~it~~

~~also indicates that the receiver has reached a certain point in its execution, namely that it has started executing the matching receive. If both sends and receives are blocking operations then the use of the synchronous mode provides synchronous communication semantics: a communication does not complete at either end before both processes rendezvous at the communication. A send executed in this mode is **non-local**.~~

==A send that uses the **synchronous** mode can be started whether or not a matching receive was posted. However, the send will complete successfully only if a matching receive is posted, and the receive operation has started to receive the message sent by the synchronous send. Thus, the completion of a synchronous send not only indicates that the send buffer can be reused, but it also indicates that the receiver has reached a certain point in its execution, namely that it has started executing the matching receive. If both sends and receives are blocking operations then the use of the synchronous mode provides synchronous communication semantics: a communication does not complete at either end before both processes rendezvous at the communication. A send executed in this mode is **non-local**.==

~~but it matches~~

~~any of the send modes. The receive operation described in the last section is **blocking**: it returns only after the receive buffer contains the newly received message. A receive can complete before the matching send has completed (of course, it can complete only after the matching send has started).~~

~~In a multi-threaded implementation of MPI, the system may de-schedule a thread that is blocked on a send or receive operation, and schedule another thread for execution in the same address space. In such a case it is the user’s responsibility not to~~

==but it matches any of the send modes. The receive operation described in the last section is **blocking**: it returns only after the receive buffer contains the newly received message. A receive can complete before the matching send has completed (of course, it can complete only after the matching send has started).==

==In a multithreaded implementation of MPI, the system may de-schedule a thread that is blocked on a send or receive operation, and schedule another thread for execution in the same address space. In such a case it is the user’s responsibility not to==

> Since a synchronous send cannot complete before a matching receive is posted, one will not normally buffer messages sent by such an operation. > > It is recommended to choose buffering over blocking the sender, whenever possible, for standard sends. The programmer can signal his or her preference for blocking the sender until a matching receive occurs by using the synchronous send mode. > > A possible communication protocol for the various communication modes is outlined below. > > <span class="sans-serif">ready send</span>: The message is sent as soon as possible. > > <span class="sans-serif">synchronous send:</span> The sender sends a request-to-send message. The receiver stores this request. When a matching receive is posted, the receiver sends back a permission-to-send message, and the sender now sends the message. > > <span class="sans-serif">standard send:</span> First protocol may be used for short messages, and second protocol for long messages. > > <span class="sans-serif">buffered send:</span> The sender copies the message into a buffer and then sends it with a nonblocking send (using the same protocol as for standard send). > > Additional control messages might be needed for flow control and error recovery. Of course, there are many other possible protocols. > > Ready send can be implemented as a standard send. In this case there will be no performance advantage (or disadvantage) for the use of ready send. > > A standard send can be implemented as a synchronous send. In such a case, no data buffering is needed. However, > > users may ~~> >~~ expect some buffering. > > In a ~~multi-threaded~~ ==multithreaded== environment, the execution of a blocking communication should block only the executing thread, allowing the thread scheduler to de-schedule this thread and schedule another thread for execution.

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

~~The send call described in Section [[versions/v31/sections/pt2pt#Blocking Send|Blocking Send]]~~

~~uses the **standard** communication mode. In this mode, it is up to MPI to decide whether outgoing messages will be buffered. MPI may buffer outgoing messages. In such a case, the send call may complete before a matching receive is invoked. On the other hand, buffer space may be unavailable, or MPI may choose not to buffer outgoing messages, for performance reasons. In this case, the send call will not complete until a matching receive has been posted, and the data has been moved to the receiver.~~

~~Thus, a send in standard mode can be started whether or not a matching receive has been posted. It may complete before a matching receive is posted. The standard mode send is **non-local**: successful completion of the send operation may depend on the occurrence of a matching receive.~~

==The send call described in Section [[versions/v31/sections/pt2pt#Blocking Send|Blocking Send]] uses the **standard** communication mode. In this mode, it is up to MPI to decide whether outgoing messages will be buffered. MPI may buffer outgoing messages. In such a case, the send call may complete before a matching receive is invoked. On the other hand, buffer space may be unavailable, or MPI may choose not to buffer outgoing messages, for performance reasons. In this case, the send call will not complete until a matching receive has been posted, and the data has been moved to the receiver.==

==Thus, a send in standard mode can be started whether or not a matching receive has been posted. It may complete before a matching receive is posted. The standard mode send is *non-local*: successful completion of the send operation may depend on the occurrence of a matching receive.==

A **buffered** mode send operation can be started whether or not a matching receive has been posted. It may complete before a matching receive is posted. However, unlike the standard send, this operation is ~~**local**,~~ ==*local*,== and its completion does not depend on the occurrence of a matching receive. Thus, if a send is executed and no matching receive is posted, then MPI must buffer the outgoing message, so as to allow the send call to complete. An error will occur if there is insufficient buffer space. The amount of available buffer space is controlled by the user — see Section [[versions/v31/sections/pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] . Buffer allocation by the user may be required for the buffered mode to be effective.

A send that uses the **synchronous** mode can be started whether or not a matching receive was posted. However, the send will complete successfully only if a matching receive is posted, and the receive operation has started to receive the message sent by the synchronous send. Thus, the completion of a synchronous send not only indicates that the send buffer can be reused, but it also indicates that the receiver has reached a certain point in its execution, namely that it has started executing the matching receive. If both sends and receives are blocking operations then the use of the synchronous mode provides synchronous communication semantics: a communication does not complete at either end before both processes rendezvous at the communication. A send executed in this mode is ~~**non-local**.~~ ==*non-local*.==

Three additional send functions are provided for the three additional communication modes. The communication mode is indicated by a one letter prefix: ~~<span class="sans-serif">B</span>~~ ==`B`== for buffered, ~~<span class="sans-serif">S</span>~~ ==`S`== for synchronous, and ~~<span class="sans-serif">R</span>~~ ==`R`== for ready.

~~There is only one receive operation,~~

~~but it matches any of the send modes. The receive operation described in the last section is **blocking**: it returns only after the receive buffer contains the newly received message. A receive can complete before the matching send has completed (of course, it can complete only after the matching send has started).~~

~~In a multithreaded implementation of MPI, the system may de-schedule a thread that is blocked on a send or receive operation, and schedule another thread for execution in the same address space. In such a case it is the user’s responsibility not to~~

~~modify a communication buffer until the communication completes. Otherwise, the outcome of the computation is undefined.~~

==There is only one receive operation, but it matches any of the send modes. The receive operation described in the last section is *blocking*: it returns only after the receive buffer contains the newly received message. A receive can complete before the matching send has completed (of course, it can complete only after the matching send has started).==

==In a multithreaded implementation of MPI, the system may de-schedule a thread that is blocked on a send or receive operation, and schedule another thread for execution in the same address space. In such a case it is the user’s responsibility not to modify a communication buffer until the communication completes. Otherwise, the outcome of the computation is undefined.==

> Since a synchronous send cannot complete before a matching receive is posted, one will not normally buffer messages sent by such an operation. > > It is recommended to choose buffering over blocking the sender, whenever possible, for standard sends. The programmer can signal his or her preference for blocking the sender until a matching receive occurs by using the synchronous send mode. > > A possible communication protocol for the various communication modes is outlined below. > > ~~<span class="sans-serif">ready send</span>:~~ ==*ready send*:== The message is sent as soon as possible. > > ~~<span class="sans-serif">synchronous send:</span>~~ ==*synchronous send*:== The sender sends a request-to-send message. The receiver stores this request. When a matching receive is posted, the receiver sends back a permission-to-send message, and the sender now sends the message. > > ~~<span class="sans-serif">standard send:</span>~~ ==*standard send*:== First protocol may be used for short messages, and second protocol for long messages. > > ~~<span class="sans-serif">buffered send:</span>~~ ==*buffered send*:== The sender copies the message into a buffer and then sends it with a nonblocking send (using the same protocol as for standard send). > > Additional control messages might be needed for flow control and error recovery. Of course, there are many other possible protocols. > > Ready send can be implemented as a standard send. In this case there will be no performance advantage (or disadvantage) for the use of ready send. > > A standard send can be implemented as a synchronous send. In such a case, no data buffering is needed. However, ~~> >~~ users may expect some buffering. > > In a multithreaded environment, the execution of a blocking communication should block only the executing thread, allowing the thread scheduler to de-schedule this thread and schedule another thread for execution.

### MPI-3.1 → MPI-4.0  (7 changed paragraphs)

The send call described in Section [[versions/v40/sections/pt2pt#Blocking Send|Blocking Send]] is ~~**blocking**:~~ ==*blocking*:== it does not return until the ~~message data~~ ==*message data*== and ~~envelope~~ ==*envelope*== have been safely stored away so that the sender is free to modify the send buffer. The message might be copied directly into the matching receive buffer, or it might be copied into a temporary system buffer.

Message buffering decouples the send and receive operations. A blocking send can complete as soon as the message was buffered, even if no matching receive has been executed by the receiver. On the other hand, message buffering can be expensive, as it entails additional memory-to-memory copying, and it requires the allocation of memory for buffering. MPI offers the choice of several ~~communication modes~~ ==**communication modes**== that allow one to control the choice of the communication protocol.

Thus, a ~~send in standard~~ ==*standard== mode ==send*== can be ~~started~~ ==*started*== whether or not a matching receive has been posted. It may ~~complete~~ ==*complete*== before a matching receive is posted. The standard mode send is *non-local*: successful completion of the send operation may depend on the occurrence of a matching receive.

A **buffered** mode send operation can be started whether or not a matching receive has been posted. It may complete before a matching receive is posted. However, unlike the standard send, this operation is *local*, and its completion does not depend on the occurrence of a matching receive. Thus, if a send is executed and no matching receive is posted, then MPI must buffer the outgoing message, so as to allow the send call to complete. An error will occur if there is insufficient buffer space. The amount of available buffer space is controlled by the ~~user — see~~ ==user—see== Section [[versions/v40/sections/pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] . Buffer allocation by the user may be required for the buffered mode to be effective.

A send that uses the **ready** communication mode may be started *only* if the matching receive is already posted. Otherwise, the operation is ~~erroneous~~ ==*erroneous*== and its outcome is undefined. On some systems, this allows the removal of a hand-shake ~~operation~~ ==protocol== that is otherwise required and results in improved performance. The completion of the send operation does not depend on the status of a matching receive, and merely indicates that the send buffer can be reused. A send operation that uses the ready mode has the same semantics as a standard send operation, or a synchronous send operation; it is merely that the sender provides additional information to the system (namely that a matching receive is already posted), that can save some overhead. In a correct program, therefore, a ready send could be replaced by a standard send with no effect on the behavior of the program other than performance.

==According to the definitions in Section [[versions/v40/sections/terms#MPI Procedures|MPI Procedures]] , [[versions/v40/API/MPI_BSEND|MPI_BSEND]] is a completing procedure and the user can re-use all resources given as arguments, including the *message data buffer*. It is also a local procedure because it returns immediately without depending on the execution of any MPI procedure in any other MPI process.==

==> [!note] Advice to users==

==> This is one of the exceptions in which a completing and therefore blocking operation-related procedure is local.==

There is only one receive operation, but it matches any of the send modes. The receive ~~operation~~ ==procedure== described in the last section is *blocking*: it returns only after the receive buffer contains the newly received message. A receive can complete before the matching send has completed (of course, it can complete only after the matching send has started).

> Since a synchronous send cannot complete before a matching receive is posted, one will not normally buffer messages sent by such an operation. > > It is recommended to choose buffering over blocking the sender, whenever possible, for standard sends. The programmer can signal ~~his or her~~ ==a== preference for blocking the sender until a matching receive occurs by using the synchronous send mode. > > A possible communication protocol for the various communication modes is outlined below. > > *ready send*: The message is sent as soon as possible. > > *synchronous send*: The sender sends a request-to-send message. The receiver stores this request. When a matching receive is posted, the receiver sends back a permission-to-send message, and the sender now sends the message. > > *standard send*: First protocol may be used for short messages, and second protocol for long messages. > > *buffered send*: The sender copies the message into a buffer and then sends it with a nonblocking send (using the same protocol as for standard send). > > Additional control messages might be needed for flow control and error recovery. Of course, there are many other possible protocols. > > Ready send can be implemented as a standard send. In this case there will be no performance advantage (or disadvantage) for the use of ready send. > > A standard send can be implemented as a synchronous send. In such a case, no data buffering is needed. However, users may expect some buffering. > > In a multithreaded environment, the execution of a blocking communication should block only the executing thread, allowing the thread scheduler to de-schedule this thread and schedule another thread for execution.

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

The send call described in Section [[versions/v41/sections/pt2pt#Blocking Send|Blocking Send]] uses the **standard** communication mode. In this mode, it is up to MPI to decide whether outgoing messages will be buffered. MPI may buffer outgoing messages. In such a case, the send call may complete before a matching receive is invoked. On the other hand, buffer space may be unavailable, or MPI may choose not to buffer outgoing messages, for performance reasons. In this case, the send call will not complete until a matching receive has been ~~posted,~~ ==*started*,== and the data has been moved to the receiver.

Thus, a *standard mode send* can be *started* whether or not a matching receive has been ~~posted.~~ ==*started*.== It may *complete* before a matching receive is ~~posted.~~ ==*started*.== The standard mode send is ~~*non-local*:~~ ==*nonlocal*:== successful completion of the send operation may depend on the occurrence of a matching receive.

A **buffered** mode send operation can be started whether or not a matching receive has been ~~posted.~~ ==*started*.== It may complete before a matching receive is ~~posted.~~ ==*started*.== However, unlike the standard send, this operation is *local*, and its completion does not depend on the occurrence of a matching receive. Thus, if a send is executed and no matching receive is ~~posted,~~ ==*started*,== then MPI must buffer the outgoing message, so as to allow the send call to complete. An error will occur if there is insufficient buffer space. The amount of available buffer space is controlled by the user—see Section [[versions/v41/sections/pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] . Buffer allocation by the user may be required for the buffered mode to be effective.

A send that uses the **synchronous** mode can be started whether or not a matching receive was ~~posted.~~ ==*started*.== However, the send will complete successfully only if a matching receive is ~~posted,~~ ==*started*,== and the receive operation has started to receive the message sent by the synchronous send. Thus, the completion of a synchronous send not only indicates that the send buffer can be reused, but it also indicates that the receiver has reached a certain point in its execution, namely that it has started executing the matching receive. If both sends and receives are blocking operations then the use of the synchronous mode provides synchronous communication semantics: a communication does not complete at either end before both ==MPI== processes rendezvous at the communication. A send executed in this mode is ~~*non-local*.~~ ==*nonlocal*.==

A send that uses the **ready** communication mode may be started *only* if the matching receive is already ~~posted.~~ ==*started*.== Otherwise, the operation is *erroneous* and its outcome is undefined. On some systems, this allows the removal of a hand-shake protocol that is otherwise required and results in improved performance. The completion of the send operation does not depend on the status of a matching receive, and merely indicates that the send buffer can be reused. A send operation that uses the ready mode has the same semantics as a standard send operation, or a synchronous send operation; it is merely that the sender provides additional information to the system (namely that a matching receive is already ~~posted),~~ ==*started*),== that can save some overhead. In a correct program, therefore, a ready send could be replaced by a standard send with no effect on the behavior of the program other than performance.

> Since a synchronous send cannot complete before a matching receive is ~~posted,~~ ==*started*,== one will not normally buffer messages sent by such an operation. > > It is recommended to choose buffering over blocking the sender, whenever possible, for standard sends. The programmer can signal a preference for blocking the sender until a matching receive occurs by using the synchronous send mode. > > A possible communication protocol for the various communication modes is outlined below. > > ~~*ready send*:~~ ==ready send: >== The message is sent as soon as possible. > > ~~*synchronous send*:~~ ==synchronous send: >== The sender sends a request-to-send message. The receiver stores this request. When a matching receive is ~~posted,~~ ==*started*,== the receiver sends back a permission-to-send message, and the sender now sends the message. > > ~~*standard send*:~~ ==standard send: >== First protocol may be used for short messages, and second protocol for long messages. > > ~~*buffered send*:~~ ==buffered send: >== The sender copies the message into a buffer and then sends it with a nonblocking send (using the same protocol as for standard send). > > Additional control messages might be needed for flow control and error recovery. Of course, there are many other possible protocols. > > Ready send can be implemented as a standard send. In this case there will be no performance advantage (or disadvantage) for the use of ready send. > > A standard send can be implemented as a synchronous send. In such a case, no data buffering is needed. However, users may expect some buffering. > > In a multithreaded environment, the execution of a blocking communication should block only the executing thread, allowing the thread scheduler to de-schedule this thread and schedule another thread for execution.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Communication Objects]]
