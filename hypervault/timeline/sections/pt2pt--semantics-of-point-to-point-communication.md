---
title: "Semantics of Point-to-Point Communication"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Semantics of Point-to-Point Communication

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Semantics of point-to-point communication|MPI-1.3]], [[versions/v21/sections/pt2pt#Semantics of Point-to-Point Communication|MPI-2.1]], [[versions/v22/sections/pt2pt#Semantics of Point-to-Point Communication|MPI-2.2]], [[versions/v30/sections/pt2pt#Semantics of Point-to-Point Communication|MPI-3.0]], [[versions/v31/sections/pt2pt#Semantics of Point-to-Point Communication|MPI-3.1]], [[versions/v40/sections/pt2pt#Semantics of Point-to-Point Communication|MPI-4.0]], [[versions/v41/sections/pt2pt#Semantics of Point-to-Point Communication|MPI-4.1]], [[versions/v50/sections/pt2pt#Semantics of Point-to-Point Communication|MPI-5.0]]

Heading by release: MPI-1.3: “Semantics of point-to-point communication”; MPI-2.1: “Semantics of Point-to-Point Communication”; MPI-2.2: “Semantics of Point-to-Point Communication”; MPI-3.0: “Semantics of Point-to-Point Communication”; MPI-3.1: “Semantics of Point-to-Point Communication”; MPI-4.0: “Semantics of Point-to-Point Communication”; MPI-4.1: “Semantics of Point-to-Point Communication”; MPI-5.0: “Semantics of Point-to-Point Communication”

## Changes along the time axis

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

==**Order.** Messages are **nonovertaking**: If a sender sends two messages in succession to the same destination, and both match the same receive, then this operation cannot receive the second message if the first one is still pending. If a receiver posts two receives in succession, and both match the same message, then the second receive operation cannot be satisfied by this message, if the first one is still pending. This requirement facilitates matching of sends to receives. It guarantees that message-passing code is deterministic, if MPI processes are single-threaded and the wildcard `MPI_ANY_SOURCE` is not used in receives. (Some of the calls described later, such as [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] or [[versions/v41/API/MPI_WAITANY|MPI_WAITANY]] , are additional sources of nondeterminism.)==

==If an MPI process has a single thread of execution, then any two communication operations executed by this MPI process are **ordered**.==

==> [!note] Advice to users==

==> The MPI Forum believes the following paragraph is ambiguous and may clarify the meaning in a future version of the MPI Standard.==

==On the other hand, if the MPI process is multithreaded, then the semantics of thread execution may not define a relative order between two send operations executed by two distinct threads. The operations are **logically concurrent**, even if one physically precedes the other. In such a case, the two messages sent can be received in any order. Similarly, if two receive operations that are **logically concurrent** receive two successively sent messages, then the two messages can match the two receives in either order.==

==> [!warning] Advice to implementors==

==> The MPI Forum believes the previous paragraph is ambiguous and may clarify the meaning in a future version of the MPI Standard.==

==An example of nonovertaking messages.==

==(code block added)==
``` [MPI]Fortran
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .EQ. 0) THEN
   CALL MPI_BSEND(buf1, count, MPI_REAL, 1, tag, comm, ierr)
   CALL MPI_BSEND(buf2, count, MPI_REAL, 1, tag, comm, ierr)
ELSE IF (rank .EQ. 1) THEN
   CALL MPI_RECV(buf1, count, MPI_REAL, 0, MPI_ANY_TAG, comm, status, &
                 ierr)
   CALL MPI_RECV(buf2, count, MPI_REAL, 0, tag, comm, status, ierr)
END IF
```

==The message sent by the first send must be received by the first receive, and the message sent by the second send must be received by the second receive.==

==**Progress.** If a pair of matching send and receive operations have been initiated, then at least one of these two operations will complete, independently of other actions in the system: the send operation will complete, unless the receive is satisfied by another message, and completes; the receive operation will complete, unless the message sent is consumed by another matching receive that was *started* at the same destination MPI process.==

==An example of two, intertwined matching pairs.==

==(code block added)==
``` [MPI]Fortran
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .EQ. 0) THEN
   CALL MPI_BSEND(buf1, count, MPI_REAL, 1, tag1, comm, ierr)
   CALL MPI_SSEND(buf2, count, MPI_REAL, 1, tag2, comm, ierr)
ELSE IF (rank .EQ. 1) THEN
   CALL MPI_RECV(buf1, count, MPI_REAL, 0, tag2, comm, status, ierr)
   CALL MPI_RECV(buf2, count, MPI_REAL, 0, tag1, comm, status, ierr)
END IF
```

==Both MPI processes invoke their first communication call. Since the first send at the MPI process with `rank = 0` uses the buffered mode, it must complete, irrespective of the state of the other MPI process(es). Since no matching receive is *started*, the message will be copied into buffer space. (If insufficient buffer space is available, then the program will fail.) The second send is then invoked. At that point, a matching pair of send and receive operation is enabled, and both operations must complete. Next, the second receive call is invoked, which will be satisfied by the buffered message. Note that the MPI process with `rank = 1` received the messages in the reverse order they were sent.==

==**Fairness.** MPI makes no guarantee of **fairness** in the handling of communication. Suppose that a send is *started*. Then it is possible that the destination MPI process repeatedly posts a receive that matches this send, yet the message is never received, because it is each time overtaken by another message, sent from another source. Similarly, suppose that a receive was *started* by a multithreaded MPI process. Then it is possible that messages that match this receive are repeatedly received, yet the receive is never satisfied, because it is overtaken by other receives *started* at this MPI process (by other executing threads). It is the programmer’s responsibility to prevent starvation in such situations.==

==**Resource limitations.** Any *pending* communication operation and *decoupled MPI activity* consumes system resources that are limited. Errors may occur when lack of resources prevent the execution of an MPI call. High-quality implementations will use a (small) fixed amount of resources for each *pending* send in the ready or synchronous mode and for each *pending* receive. However, buffer space may be consumed to store messages sent in standard mode, and must be consumed to store messages sent in buffered mode, when no matching receive is available. The amount of space available for buffering will be much smaller than program data memory on many systems. Then, it will be easy to write programs that overrun available buffer space.==

==MPI allows the user to provide buffer memory for messages sent in the buffered mode. Furthermore, MPI specifies a detailed operational model for the use of this buffer. An MPI implementation is required to do no worse than implied by this model. This allows users to avoid buffer overflows when they use buffered sends. Buffer allocation and use is described in Section [[versions/v41/sections/pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] .==

==A buffered send operation that cannot complete because of a lack of buffer space is *erroneous*. When such a situation is detected, an error is signaled that may cause the program to terminate abnormally. On the other hand, a standard send operation that cannot complete because of lack of buffer space will merely block, waiting for buffer space to become available or for a matching receive to be *started*. This behavior is preferable in many situations. Consider a situation where a producer repeatedly produces new values and sends them to a consumer. Assume that the producer produces new values faster than the consumer can consume them. If buffered sends are used, then a buffer overflow will result. Additional synchronization has to be added to the program so as to prevent this from occurring. If standard sends are used, then the producer will be automatically throttled, as its send operations will block when buffer space is unavailable.==

==In some situations, a lack of buffer space leads to deadlock situations. This is illustrated by the examples below.==

==An exchange of messages.==

==(code block added)==
``` [MPI]Fortran
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .EQ. 0) THEN
   CALL MPI_SEND(sendbuf, count, MPI_REAL, 1, tag, comm, ierr)
   CALL MPI_RECV(recvbuf, count, MPI_REAL, 1, tag, comm, status, ierr)
ELSE IF (rank .EQ. 1) THEN
   CALL MPI_RECV(recvbuf, count, MPI_REAL, 0, tag, comm, status, ierr)
   CALL MPI_SEND(sendbuf, count, MPI_REAL, 0, tag, comm, ierr)
END IF
```

==This program will succeed even if no buffer space for data is available. The standard send operation can be replaced, in this example, with a synchronous send.==

==An errant attempt to exchange messages.==

==(code block added)==
``` [MPI]Fortran
! ---------------- THIS EXAMPLE IS ERRONEOUS ---------------
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .EQ. 0) THEN
   CALL MPI_RECV(recvbuf, count, MPI_REAL, 1, tag, comm, status, ierr)
   CALL MPI_SEND(sendbuf, count, MPI_REAL, 1, tag, comm, ierr)
ELSE IF (rank .EQ. 1) THEN
   CALL MPI_RECV(recvbuf, count, MPI_REAL, 0, tag, comm, status, ierr)
   CALL MPI_SEND(sendbuf, count, MPI_REAL, 0, tag, comm, ierr)
END IF
```

==The receive operation of the MPI process with `rank = 0` must complete before its send, and can complete only if the matching send of the MPI process with `rank = 1` is executed. The receive operation of the MPI process with `rank = 1` must complete before its send and can complete only if the matching send of the MPI process with `rank = 0` is executed. This program will always deadlock. The same holds for any other send mode.==

==An unsafe exchange that relies on MPI to provide sufficient buffering.==

==(code block added)==
``` [MPI]Fortran
! ---------------- THIS EXAMPLE IS ERRONEOUS ---------------
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .EQ. 0) THEN
   CALL MPI_SEND(sendbuf, count, MPI_REAL, 1, tag, comm, ierr)
   CALL MPI_RECV(recvbuf, count, MPI_REAL, 1, tag, comm, status, ierr)
ELSE IF (rank .EQ. 1) THEN
   CALL MPI_SEND(sendbuf, count, MPI_REAL, 0, tag, comm, ierr)
   CALL MPI_RECV(recvbuf, count, MPI_REAL, 0, tag, comm, status, ierr)
END IF
```

==The message sent by each MPI process has to be copied out before the send operation completes and the receive operation starts. For the program to complete, it is necessary that at least one of the two messages sent be buffered. Thus, this program can succeed only if the communication system can buffer at least `count` words of data.==

==> [!note] Advice to users==

==> If standard mode send operations are used as in Example [[pt2pt-exI]] , then a deadlock situation may occur where both MPI processes are blocked because sufficient buffer space is not available. The same will certainly happen, if the synchronous mode is used. If the buffered mode is used, and not enough buffer space is available, then the program will not complete either. However, rather than a deadlock situation, we shall have a buffer overflow error. > > A portable program using standard mode send operations should not rely on message buffering for the program to complete without *deadlock*. All sends in such a portable program can be replaced with synchronous mode sends and the program will still run correctly. The buffered send mode can be used for programs that require buffering. > > Nonblocking message-passing operations, as described in Section [[versions/v41/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] , can be used to avoid the need for buffering outgoing messages. This can prevent unintentional *serialization* or *deadlock* due to lack of buffer space, and improves performance, by allowing *overlap* of communication with other communication or with computation, and avoiding the overheads of allocating buffers and copying messages into buffers.==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

**Fairness.** MPI makes no guarantee of **fairness** in the handling of communication. Suppose that a send is *started*. Then it is possible that the destination MPI process repeatedly posts a receive that matches this send, yet the message is never received, because it is ==overtaken== each time ~~overtaken~~ by another message, sent from another source. Similarly, suppose that a receive was *started* by a multithreaded MPI process. Then it is possible that messages that match this receive are repeatedly received, yet the receive is never satisfied, because it is overtaken by other receives *started* at this MPI process (by other executing threads). It is the programmer’s responsibility to prevent starvation in such situations.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Semantics of point-to-point communication]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Semantics of Point-to-Point Communication]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Semantics of Point-to-Point Communication]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Semantics of Point-to-Point Communication]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Semantics of Point-to-Point Communication]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Semantics of Point-to-Point Communication]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Semantics of Point-to-Point Communication]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Semantics of Point-to-Point Communication]]
