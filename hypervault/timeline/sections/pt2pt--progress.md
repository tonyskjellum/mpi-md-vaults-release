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

CALL MPI_COMM_RANK(comm, rank, ierr) IF (rank.EQ.0) THEN CALL MPI_BSEND(buf1, count, MPI_REAL, 1, tag1, comm, ierr) CALL MPI_SSEND(buf2, count, MPI_REAL, 1, tag2, comm, ierr) ELSE ~~! rank.EQ.1~~ ==IF (rank.EQ.1) THEN== CALL MPI_RECV(buf1, count, MPI_REAL, 0, tag2, comm, status, ierr) CALL MPI_RECV(buf2, count, MPI_REAL, 0, tag1, comm, status, ierr) END IF

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

An example of two, intertwined matching pairs.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN CALL MPI_BSEND(buf1, count, MPI_REAL, 1, tag1, comm, ierr) CALL MPI_SSEND(buf2, count, MPI_REAL, 1, tag2, comm, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_RECV(buf1, count, MPI_REAL, 0, tag2, comm, status, ierr) CALL MPI_RECV(buf2, count, MPI_REAL, 0, tag1, comm, status, ierr) END IF

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
