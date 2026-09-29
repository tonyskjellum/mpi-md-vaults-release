---
title: "Semantics of Nonblocking Communication Operations"
chapter: pt2pt
present_in: ["MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Semantics of Nonblocking Communication Operations

Chapter **pt2pt** · in [[versions/v41/sections/pt2pt#Semantics of Nonblocking Communication Operations|MPI-4.1]], [[versions/v50/sections/pt2pt#Semantics of Nonblocking Communication Operations|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

The semantics of nonblocking communication is defined by suitably extending the definitions in Section [[versions/v21/sections/pt2pt#Semantics of ~~point-to-point communication|Semantics~~ ==Point-to-Point Communication|Semantics== of ~~point-to-point communication]]~~ ==Point-to-Point Communication]]== .

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~The semantics of nonblocking communication is defined by suitably extending the definitions in Section [[versions/v41/sections/pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] .~~

==The semantics of nonblocking communication operations are defined by suitably extending the definitions in Section [[versions/v41/sections/pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] .==

==**Order.** Nonblocking communication operations are **ordered** according to the execution order of the calls that *initiate* the communication. The **nonovertaking** requirement of Section [[versions/v41/sections/pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] is extended to nonblocking communication, with this definition of order being used.==

==Message ordering for nonblocking operations.==

==(code block added)==
``` [MPI]Fortran
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .EQ. 0) THEN
   CALL MPI_ISEND(a, 1, MPI_REAL, 1, 0, comm, r1, ierr)
   CALL MPI_ISEND(b, 1, MPI_REAL, 1, 0, comm, r2, ierr)
ELSE IF (rank .EQ. 1) THEN
   CALL MPI_IRECV(a, 1, MPI_REAL, 0, MPI_ANY_TAG, comm, r1, ierr)
   CALL MPI_IRECV(b, 1, MPI_REAL, 0, 0, comm, r2, ierr)
END IF
CALL MPI_WAIT(r1, status, ierr)
CALL MPI_WAIT(r2, status, ierr)
```

==The first send will match the first receive, even if both messages are sent before either receive is executed.==

==**Progress.** A call to [[versions/v41/API/MPI_WAIT|MPI_WAIT]] that *completes* a receive will eventually terminate and return if a matching send has been *started*, unless the send is satisfied by another receive. In particular, if the matching send is *nonblocking*, then the receive should *complete* even if no call is executed by the sender to *complete* the send. Similarly, a call to [[versions/v41/API/MPI_WAIT|MPI_WAIT]] that *completes* a send will eventually return if a matching receive has been *started*, unless the receive is satisfied by another send, and even if no call is executed to *complete* the receive.==

==An illustration of progress semantics.==

==(code block added)==
``` [MPI]Fortran
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .EQ. 0) THEN
   CALL MPI_SSEND(a, 1, MPI_REAL, 1, 0, comm, ierr)
   CALL MPI_SEND(b, 1, MPI_REAL, 1, 1, comm, ierr)
ELSE IF (rank .EQ. 1) THEN
   CALL MPI_IRECV(a, 1, MPI_REAL, 0, 0, comm, r, ierr)
   CALL MPI_RECV(b, 1, MPI_REAL, 0, 1, comm, status, ierr)
   CALL MPI_WAIT(r, status, ierr)
END IF
```

==This code should not deadlock in a correct MPI implementation. The first synchronous send must complete once the matching (nonblocking) receive is *started*, even though the completing wait call has not yet been reached. Thus, the sending MPI process will continue and execute the second send procedure, allowing the receiving MPI process to complete execution.==

==If an [[versions/v41/API/MPI_TEST|MPI_TEST]] that *completes* a receive is repeatedly called with the same arguments, and a matching send has been *started*, then the call will eventually return `flag``= true`, unless the send is satisfied by another receive. If an [[versions/v41/API/MPI_TEST|MPI_TEST]] that *completes* a send is repeatedly called with the same arguments, and a matching receive has been *started*, then the call will eventually return `flag``= true`, unless the receive is satisfied by another send. See also [[versions/v41/sections/terms#Progress|Progress]] on *progress*.==

## Text by release

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Semantics of Nonblocking Communication Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Semantics of Nonblocking Communication Operations]]
