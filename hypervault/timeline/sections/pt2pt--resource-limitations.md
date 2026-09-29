---
title: "Resource limitations"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Resource limitations

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Resource limitations|MPI-1.3]], [[versions/v21/sections/pt2pt#Resource limitations|MPI-2.1]], [[versions/v22/sections/pt2pt#Resource limitations|MPI-2.2]], [[versions/v30/sections/pt2pt#Resource limitations|MPI-3.0]], [[versions/v31/sections/pt2pt#Resource limitations|MPI-3.1]], [[versions/v40/sections/pt2pt#Resource limitations|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (5 changed paragraphs)

MPI allows the user to provide buffer memory for messages sent in the buffered mode. Furthermore, MPI specifies a detailed operational model for the use of this buffer. An MPI implementation is required to do no worse than implied by this model. This allows users to avoid buffer overflows when they use buffered sends. Buffer allocation and use is described in Section [[versions/v21/sections/pt2pt#Buffer ~~allocation~~ ==Allocation== and ~~usage|Buffer allocation~~ ==Usage|Buffer Allocation== and ~~usage]]~~ ==Usage]]== .

CALL MPI_COMM_RANK(comm, rank, ierr) IF (rank.EQ.0) THEN CALL MPI_SEND(sendbuf, count, MPI_REAL, 1, tag, comm, ierr) CALL MPI_RECV(recvbuf, count, MPI_REAL, 1, tag, comm, status, ierr) ELSE ~~! rank.EQ.1~~ ==IF (rank.EQ.1) THEN== CALL MPI_RECV(recvbuf, count, MPI_REAL, 0, tag, comm, status, ierr) CALL MPI_SEND(sendbuf, count, MPI_REAL, 0, tag, comm, ierr) END IF

An ==errant== attempt to exchange messages.

CALL MPI_COMM_RANK(comm, rank, ierr) IF (rank.EQ.0) THEN CALL MPI_RECV(recvbuf, count, MPI_REAL, 1, tag, comm, status, ierr) CALL MPI_SEND(sendbuf, count, MPI_REAL, 1, tag, comm, ierr) ELSE ~~! rank.EQ.1~~ ==IF (rank.EQ.1) THEN== CALL MPI_RECV(recvbuf, count, MPI_REAL, 0, tag, comm, status, ierr) CALL MPI_SEND(sendbuf, count, MPI_REAL, 0, tag, comm, ierr) END IF

CALL MPI_COMM_RANK(comm, rank, ierr) IF (rank.EQ.0) THEN CALL MPI_SEND(sendbuf, count, MPI_REAL, 1, tag, comm, ierr) CALL MPI_RECV(recvbuf, count, MPI_REAL, 1, tag, comm, status, ierr) ELSE ~~! rank.EQ.1~~ ==IF (rank.EQ.1) THEN== CALL MPI_SEND(sendbuf, count, MPI_REAL, 0, tag, comm, ierr) CALL MPI_RECV(recvbuf, count, MPI_REAL, 0, tag, comm, status, ierr) END IF

> When standard send operations are used, then a deadlock situation may occur where both processes are blocked because buffer space is not available. The same will certainly happen, if the synchronous mode is used. If the buffered mode is used, and not enough buffer space is available, then the program will not complete either. However, rather than a deadlock situation, we shall have a buffer overflow error. > > A program is “safe” if no message buffering is required for the program to complete. One can replace all sends in such program with synchronous sends, and the program will still run correctly. This conservative programming style provides the best portability, since program completion does not depend on the amount of buffer space available or ~~in~~ ==> > on > >== the communication protocol used. > > Many programmers prefer to have more leeway and ~~be able~~ ==> > opt > >== to use the “unsafe” programming style shown in example [[pt2pt-exI]] . In such cases, the use of standard sends is likely to provide the best compromise between performance and robustness: quality implementations will provide sufficient buffering so that “common practice” programs will not deadlock. The buffered send mode can be used for programs that require more buffering, or in situations where the programmer wants more control. This mode might also be used for debugging purposes, as buffer overflow conditions are easier to diagnose than deadlock conditions. > > Nonblocking message-passing operations, as described in Section [[versions/v21/sections/pt2pt#Nonblocking ~~communication|Nonblocking communication]]~~ ==Communication|Nonblocking Communication]]== , can be used to avoid the need for buffering outgoing messages. This prevents deadlocks due to lack of buffer space, and improves performance, by allowing overlap of computation and communication, and avoiding the overheads of allocating buffers and copying messages into buffers.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

> When standard send operations are used, then a deadlock situation may occur where both processes are blocked because buffer space is not available. The same will certainly happen, if the synchronous mode is used. If the buffered mode is used, and not enough buffer space is available, then the program will not complete either. However, rather than a deadlock situation, we shall have a buffer overflow error. > > A program is “safe” if no message buffering is required for the program to complete. One can replace all sends in such program with synchronous sends, and the program will still run correctly. This conservative programming style provides the best portability, since program completion does not depend on the amount of buffer space available or > > on > > the communication protocol used. > > Many programmers prefer to have more leeway and > > opt > > to use the “unsafe” programming style shown in ~~example~~ ==Example== [[pt2pt-exI]] . In such cases, the use of standard sends is likely to provide the best compromise between performance and robustness: quality implementations will provide sufficient buffering so that “common practice” programs will not deadlock. The buffered send mode can be used for programs that require more buffering, or in situations where the programmer wants more control. This mode might also be used for debugging purposes, as buffer overflow conditions are easier to diagnose than deadlock conditions. > > Nonblocking message-passing operations, as described in Section [[versions/v22/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] , can be used to avoid the need for buffering outgoing messages. This prevents deadlocks due to lack of buffer space, and improves performance, by allowing overlap of computation and communication, and avoiding the overheads of allocating buffers and copying messages into buffers.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

A buffered send operation that cannot complete because of a lack of buffer space is erroneous. When such a situation is detected, an error is ~~signalled~~ ==signaled== that may cause the program to terminate abnormally. On the other hand, a standard send operation that cannot complete because of lack of buffer space will merely block, waiting for buffer space to become available or for a matching receive to be posted. This behavior is preferable in many situations. Consider a situation where a producer repeatedly produces new values and sends them to a consumer. Assume that the producer produces new values faster than the consumer can consume them. If buffered sends are used, then a buffer overflow will result. Additional synchronization has to be added to the program so as to prevent this from occurring. If standard sends are used, then the producer will be automatically throttled, as its send operations will block when buffer space is unavailable.

> When standard send operations are used, then a deadlock situation may occur where both processes are blocked because buffer space is not available. The same will certainly happen, if the synchronous mode is used. If the buffered mode is used, and not enough buffer space is available, then the program will not complete either. However, rather than a deadlock situation, we shall have a buffer overflow error. > > A program is “safe” if no message buffering is required for the program to complete. One can replace all sends in such program with synchronous sends, and the program will still run correctly. This conservative programming style provides the best portability, since program completion does not depend on the amount of buffer space available or > > on ~~> >~~ the communication protocol used. > > Many programmers prefer to have more leeway and > > opt ~~> >~~ to use the “unsafe” programming style shown in Example [[pt2pt-exI]] . In such cases, the use of standard sends is likely to provide the best compromise between performance and robustness: quality implementations will provide sufficient buffering so that “common practice” programs will not deadlock. The buffered send mode can be used for programs that require more buffering, or in situations where the programmer wants more control. This mode might also be used for debugging purposes, as buffer overflow conditions are easier to diagnose than deadlock conditions. > > Nonblocking message-passing operations, as described in Section [[versions/v30/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] , can be used to avoid the need for buffering outgoing messages. This prevents deadlocks due to lack of buffer space, and improves performance, by allowing overlap of computation and communication, and avoiding the overheads of allocating buffers and copying messages into buffers.

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

An exchange of messages.

An errant attempt to exchange messages.

An exchange that relies on buffering.

> When standard send operations are used, then a deadlock situation may occur where both processes are blocked because buffer space is not available. The same will certainly happen, if the synchronous mode is used. If the buffered mode is used, and not enough buffer space is available, then the program will not complete either. However, rather than a deadlock situation, we shall have a buffer overflow error. > > A program is “safe” if no message buffering is required for the program to complete. One can replace all sends in such program with synchronous sends, and the program will still run correctly. This conservative programming style provides the best portability, since program completion does not depend on the amount of buffer space available or ~~> >~~ on the communication protocol used. > > Many programmers prefer to have more leeway and ~~> >~~ opt to use the “unsafe” programming style shown in Example [[pt2pt-exI]] . In such cases, the use of standard sends is likely to provide the best compromise between performance and robustness: quality implementations will provide sufficient buffering so that “common practice” programs will not deadlock. The buffered send mode can be used for programs that require more buffering, or in situations where the programmer wants more control. This mode might also be used for debugging purposes, as buffer overflow conditions are easier to diagnose than deadlock conditions. > > Nonblocking message-passing operations, as described in Section [[versions/v31/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] , can be used to avoid the need for buffering outgoing messages. This prevents deadlocks due to lack of buffer space, and improves performance, by allowing overlap of computation and communication, and avoiding the overheads of allocating buffers and copying messages into buffers.

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

A buffered send operation that cannot complete because of a lack of buffer space is ~~erroneous.~~ ==*erroneous*.== When such a situation is detected, an error is signaled that may cause the program to terminate abnormally. On the other hand, a standard send operation that cannot complete because of lack of buffer space will merely block, waiting for buffer space to become available or for a matching receive to be posted. This behavior is preferable in many situations. Consider a situation where a producer repeatedly produces new values and sends them to a consumer. Assume that the producer produces new values faster than the consumer can consume them. If buffered sends are used, then a buffer overflow will result. Additional synchronization has to be added to the program so as to prevent this from occurring. If standard sends are used, then the producer will be automatically throttled, as its send operations will block when buffer space is unavailable.

CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN CALL MPI_SEND(sendbuf, count, MPI_REAL, 1, tag, comm, ierr) CALL MPI_RECV(recvbuf, count, MPI_REAL, 1, tag, comm, status, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_RECV(recvbuf, count, MPI_REAL, 0, tag, comm, status, ierr) CALL MPI_SEND(sendbuf, count, MPI_REAL, 0, tag, comm, ierr) END IF

==! ---------------- THIS EXAMPLE IS ERRONEOUS ---------------== CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN CALL MPI_RECV(recvbuf, count, MPI_REAL, 1, tag, comm, status, ierr) CALL MPI_SEND(sendbuf, count, MPI_REAL, 1, tag, comm, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_RECV(recvbuf, count, MPI_REAL, 0, tag, comm, status, ierr) CALL MPI_SEND(sendbuf, count, MPI_REAL, 0, tag, comm, ierr) END IF

==! ---------------- THIS EXAMPLE IS ERRONEOUS ---------------== CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN CALL MPI_SEND(sendbuf, count, MPI_REAL, 1, tag, comm, ierr) CALL MPI_RECV(recvbuf, count, MPI_REAL, 1, tag, comm, status, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_SEND(sendbuf, count, MPI_REAL, 0, tag, comm, ierr) CALL MPI_RECV(recvbuf, count, MPI_REAL, 0, tag, comm, status, ierr) END IF

> When standard send operations are used, then a deadlock situation may occur where both processes are blocked because buffer space is not available. The same will certainly happen, if the synchronous mode is used. If the buffered mode is used, and not enough buffer space is available, then the program will not complete either. However, rather than a deadlock situation, we shall have a buffer overflow error. > > A program is “safe” if no message buffering is required for the program to complete. One can replace all sends in such program with synchronous sends, and the program will still run correctly. This conservative programming style provides the best portability, since program completion does not depend on the amount of buffer space available or on the communication protocol used. > > Many programmers prefer to have more leeway and opt to use the “unsafe” programming style shown in Example [[pt2pt-exI]] . In such cases, the use of standard sends is likely to provide the best compromise between performance and robustness: quality implementations will provide sufficient buffering so that “common practice” programs will not ~~deadlock.~~ ==*deadlock*.== The buffered send mode can be used for programs that require more buffering, or in situations where the programmer wants more control. This mode might also be used for debugging purposes, as buffer overflow conditions are easier to diagnose than deadlock conditions. > > Nonblocking message-passing operations, as described in Section [[versions/v40/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] , can be used to avoid the need for buffering outgoing messages. This prevents deadlocks due to lack of buffer space, and improves performance, by allowing overlap of computation and communication, and avoiding the overheads of allocating buffers and copying messages into buffers.

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Resource limitations]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Resource limitations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Resource limitations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Resource limitations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Resource limitations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Resource limitations]]
