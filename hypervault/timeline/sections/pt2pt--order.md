---
title: "Order"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Order

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Order|MPI-1.3]], [[versions/v21/sections/pt2pt#Order|MPI-2.1]], [[versions/v22/sections/pt2pt#Order|MPI-2.2]], [[versions/v30/sections/pt2pt#Order|MPI-3.0]], [[versions/v31/sections/pt2pt#Order|MPI-3.1]], [[versions/v40/sections/pt2pt#Order|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

CALL MPI_COMM_RANK(comm, rank, ierr) IF (rank.EQ.0) THEN CALL MPI_BSEND(buf1, count, MPI_REAL, 1, tag, comm, ierr) CALL MPI_BSEND(buf2, count, MPI_REAL, 1, tag, comm, ierr) ELSE ~~! rank.EQ.1~~ ==IF (rank.EQ.1) THEN== CALL MPI_RECV(buf1, count, MPI_REAL, 0, MPI_ANY_TAG, comm, status, ierr) CALL MPI_RECV(buf2, count, MPI_REAL, 0, tag, comm, status, ierr) END IF

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

Messages are *non-overtaking*: If a sender sends two messages in succession to the same destination, and both match the same receive, then this operation cannot receive the second message if the first one is still pending. If a receiver posts two receives in succession, and both match the same message, then the second receive operation cannot be satisfied by this message, if the first one is still pending. This requirement facilitates matching of sends to receives. It guarantees that message-passing code is deterministic, if processes are single-threaded and the wildcard ~~MPI_ANY_SOURCE~~ ==`MPI_ANY_SOURCE`== is not used in receives. (Some of the calls described later, such as [[versions/v22/API/MPI_CANCEL|MPI_CANCEL]] or [[versions/v22/API/MPI_WAITANY|MPI_WAITANY]] , are additional sources of nondeterminism.)

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

If a process has a single thread of execution, then any two communications executed by this process are ordered. On the other hand, if the process is ~~multi-threaded,~~ ==multithreaded,== then the semantics of thread execution may not define a relative order between two send operations executed by two distinct threads. The operations are logically concurrent, even if one physically precedes the other. In such a case, the two messages sent can be received in any order. Similarly, if two receive operations that are logically concurrent receive two successively sent messages, then the two messages can match the two receives in either order.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

An example of non-overtaking messages.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

Messages are ~~*non-overtaking*:~~ ==**non-overtaking**:== If a sender sends two messages in succession to the same destination, and both match the same receive, then this operation cannot receive the second message if the first one is still pending. If a receiver posts two receives in succession, and both match the same message, then the second receive operation cannot be satisfied by this message, if the first one is still pending. This requirement facilitates matching of sends to receives. It guarantees that message-passing code is deterministic, if processes are single-threaded and the wildcard `MPI_ANY_SOURCE` is not used in receives. (Some of the calls described later, such as [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] or [[versions/v40/API/MPI_WAITANY|MPI_WAITANY]] , are additional sources of nondeterminism.)

If a process has a single thread of execution, then any two communications executed by this process are ~~ordered.~~ ==**ordered**.== On the other hand, if the process is multithreaded, then the semantics of thread execution may not define a relative order between two send operations executed by two distinct threads. The operations are ~~logically concurrent,~~ ==**logically concurrent**,== even if one physically precedes the other. In such a case, the two messages sent can be received in any order. Similarly, if two receive operations that are ~~logically concurrent~~ ==**logically concurrent**== receive two successively sent messages, then the two messages can match the two receives in either order.

CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN CALL MPI_BSEND(buf1, count, MPI_REAL, 1, tag, comm, ierr) CALL MPI_BSEND(buf2, count, MPI_REAL, 1, tag, comm, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_RECV(buf1, count, MPI_REAL, 0, MPI_ANY_TAG, comm, status, ierr) CALL MPI_RECV(buf2, count, MPI_REAL, 0, tag, comm, status, ierr) END IF

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Order]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Order]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Order]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Order]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Order]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Order]]
