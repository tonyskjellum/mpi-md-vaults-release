---
title: "General"
chapter: ei
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/ei]
---

# General

Chapter **ei** · in [[versions/v20/sections/ei#General|MPI-2.0]], [[versions/v21/sections/ei#General|MPI-2.1]], [[versions/v22/sections/ei#General|MPI-2.2]], [[versions/v30/sections/ei#General|MPI-3.0]], [[versions/v31/sections/ei#General|MPI-3.1]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

~~1.  All MPI calls are *thread-safe*. I.e., two concurrently running threads may make MPI calls and the outcome will be as if the calls executed in some order, even if their execution is interleaved.~~

==1.  All MPI calls are *thread-safe*,==

==    i.e.,==

==    two concurrently running threads may make MPI calls and the outcome will be as if the calls executed in some order, even if their execution is interleaved.==

Process 0 consists of two threads. The first thread executes a blocking send call ~~[[versions/v21/API/MPI_SEND|MPI_Send]] ,~~ ==`MPI_Send(buff1, count, type, 0, 0, comm)`,== whereas the second thread executes a blocking receive call ~~[[versions/v21/API/MPI_RECV|MPI_Recv]] . I.e.,~~ ==`MPI_Recv(buff2, count, type, 0, 0, comm, &status)`, i.e.,== the first thread sends a message that is received by the second thread. This communication should always succeed. According to the first requirement, the execution will correspond to some interleaving of the two calls. According to the second requirement, a call can only block the calling thread and cannot prevent progress of the other thread. If the send call went ahead of the receive call, then the sending thread may block, but this will not prevent the receiving thread from executing. Thus, the receive call will occur. Once both calls occur, the communication is enabled and both calls will complete. On the other hand, a single-threaded process that posts a send, followed by a matching receive, may deadlock. The progress requirement for multithreaded implementations is stronger, as a blocked call cannot prevent progress in other threads.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

> This model corresponds to the POSIX model of interprocess communication: the fact that a process is multi-threaded, rather than single-threaded, does not affect the external interface of this process. ~~> >~~ MPI implementations ~~where~~ ==in which== MPI ‘processes’ are POSIX threads inside a single POSIX process are not thread-compliant by this definition (indeed, their “processes” are single-threaded).

~~    i.e.,~~

~~    two concurrently running threads may make MPI calls and the outcome will be as if the calls executed in some order, even if their execution is interleaved.~~

==    i.e., two concurrently running threads may make MPI calls and the outcome will be as if the calls executed in some order, even if their execution is interleaved.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~1.  All MPI calls are *thread-safe*,~~

~~    i.e., two concurrently running threads may make MPI calls and the outcome will be as if the calls executed in some order, even if their execution is interleaved.~~

==1.  All MPI calls are *thread-safe*, i.e., two concurrently running threads may make MPI calls and the outcome will be as if the calls executed in some order, even if their execution is interleaved.==

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/ei#General]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/ei#General]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/ei#General]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/ei#General]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/ei#General]]
