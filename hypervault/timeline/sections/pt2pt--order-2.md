---
title: "Order"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Order

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Order|MPI-1.3]], [[versions/v21/sections/pt2pt#Order|MPI-2.1]], [[versions/v22/sections/pt2pt#Order|MPI-2.2]], [[versions/v30/sections/pt2pt#Order|MPI-3.0]], [[versions/v31/sections/pt2pt#Order|MPI-3.1]], [[versions/v40/sections/pt2pt#Order|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

Nonblocking communication operations are ordered according to the execution order of the calls that initiate the communication. The non-overtaking requirement of Section [[versions/v21/sections/pt2pt#Semantics of ~~point-to-point communication|Semantics~~ ==Point-to-Point Communication|Semantics== of ~~point-to-point communication]]~~ ==Point-to-Point Communication]]== is extended to nonblocking communication, with this definition of order being used.

CALL MPI_COMM_RANK(comm, rank, ierr) IF (RANK.EQ.0) THEN CALL MPI_ISEND(a, 1, MPI_REAL, 1, 0, comm, r1, ierr) CALL MPI_ISEND(b, 1, MPI_REAL, 1, 0, comm, r2, ierr) ELSE ~~! rank.EQ.1~~ ==IF (rank.EQ.1) THEN== CALL MPI_IRECV(a, 1, MPI_REAL, 0, MPI_ANY_TAG, comm, r1, ierr) CALL MPI_IRECV(b, 1, MPI_REAL, 0, 0, comm, r2, ierr) END IF CALL MPI_WAIT(r1, status, ierr) CALL MPI_WAIT(r2, status, ierr)

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

Message ordering for nonblocking operations.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

Nonblocking communication operations are ~~ordered~~ ==**ordered**== according to the execution order of the calls that ~~initiate~~ ==*initiate*== the communication. The ~~non-overtaking~~ ==**non-overtaking**== requirement of Section [[versions/v40/sections/pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] is extended to nonblocking communication, with this definition of order being used.

CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(RANK.EQ.0)~~ ==(RANK .EQ. 0)== THEN CALL MPI_ISEND(a, 1, MPI_REAL, 1, 0, comm, r1, ierr) CALL MPI_ISEND(b, 1, MPI_REAL, 1, 0, comm, r2, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_IRECV(a, 1, MPI_REAL, 0, MPI_ANY_TAG, comm, r1, ierr) CALL MPI_IRECV(b, 1, MPI_REAL, 0, 0, comm, r2, ierr) END IF CALL MPI_WAIT(r1, status, ierr) CALL MPI_WAIT(r2, status, ierr)

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
