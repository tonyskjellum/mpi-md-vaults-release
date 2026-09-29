---
title: "Progress"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Progress

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Progress|MPI-1.3]], [[versions/v21/sections/pt2pt#Progress|MPI-2.1]], [[versions/v22/sections/pt2pt#Progress|MPI-2.2]], [[versions/v30/sections/pt2pt#Progress|MPI-3.0]], [[versions/v31/sections/pt2pt#Progress|MPI-3.1]], [[versions/v40/sections/pt2pt#Progress|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

CALL MPI_COMM_RANK(comm, rank, ierr) IF (RANK.EQ.0) THEN CALL MPI_SSEND(a, 1, MPI_REAL, 1, 0, comm, ierr) CALL MPI_SEND(b, 1, MPI_REAL, 1, 1, comm, ierr) ELSE ~~! rank.EQ.1~~ ==IF (rank.EQ.1) THEN== CALL MPI_IRECV(a, 1, MPI_REAL, 0, 0, comm, r, ierr) CALL MPI_RECV(b, 1, MPI_REAL, 0, 1, comm, ==status,== ierr) CALL MPI_WAIT(r, status, ierr) END IF

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

A call to ~~`MPI_WAIT`~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]]== that completes a receive will eventually terminate and return if a matching send has been started, unless the send is satisfied by another receive. In particular, if the matching send is nonblocking, then the receive should complete even if no call is executed by the sender to complete the send. Similarly, a call to ~~`MPI_WAIT`~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]]== that completes a send will eventually return if a matching receive has been started, unless the receive is satisfied by another send, and even if no call is executed to complete the receive.

An illustration of progress semantics.

If an ~~`MPI_TEST`~~ ==[[versions/v31/API/MPI_TEST|MPI_TEST]]== that completes a receive is repeatedly called with the same arguments, and a matching send has been started, then the call will eventually return `flag = true`, unless the send is satisfied by another receive. If an ~~`MPI_TEST`~~ ==[[versions/v31/API/MPI_TEST|MPI_TEST]]== that completes a send is repeatedly called with the same arguments, and a matching receive has been started, then the call will eventually return `flag = true`, unless the receive is satisfied by another send.

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

A call to [[versions/v40/API/MPI_WAIT|MPI_WAIT]] that ~~completes~~ ==*completes*== a receive will eventually terminate and return if a matching send has been ~~started,~~ ==*started*,== unless the send is satisfied by another receive. In particular, if the matching send is ~~nonblocking,~~ ==*nonblocking*,== then the receive should ~~complete~~ ==*complete*== even if no call is executed by the sender to ~~complete~~ ==*complete*== the send. Similarly, a call to [[versions/v40/API/MPI_WAIT|MPI_WAIT]] that ~~completes~~ ==*completes*== a send will eventually return if a matching receive has been ~~started,~~ ==*started*,== unless the receive is satisfied by another send, and even if no call is executed to ~~complete~~ ==*complete*== the receive.

CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(RANK.EQ.0)~~ ==(RANK .EQ. 0)== THEN CALL MPI_SSEND(a, 1, MPI_REAL, 1, 0, comm, ierr) CALL MPI_SEND(b, 1, MPI_REAL, 1, 1, comm, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_IRECV(a, 1, MPI_REAL, 0, 0, comm, r, ierr) CALL MPI_RECV(b, 1, MPI_REAL, 0, 1, comm, status, ierr) CALL MPI_WAIT(r, status, ierr) END IF

If an [[versions/v40/API/MPI_TEST|MPI_TEST]] that ~~completes~~ ==*completes*== a receive is repeatedly called with the same arguments, and a matching send has been ~~started,~~ ==*started*,== then the call will eventually return ~~`flag =~~ ==`flag``=== true`, unless the send is satisfied by another receive. If an [[versions/v40/API/MPI_TEST|MPI_TEST]] that ~~completes~~ ==*completes*== a send is repeatedly called with the same arguments, and a matching receive has been ~~started,~~ ==*started*,== then the call will eventually return ~~`flag =~~ ==`flag``=== true`, unless the receive is satisfied by another send.

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Progress]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Progress]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Progress]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Progress]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Progress]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Progress]]
