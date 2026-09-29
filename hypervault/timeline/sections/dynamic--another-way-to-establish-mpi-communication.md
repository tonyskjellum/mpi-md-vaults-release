---
title: "Another Way to Establish MPI Communication"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Another Way to Establish MPI Communication

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Another Way to Establish MPI Communication|MPI-2.0]], [[versions/v21/sections/dynamic#Another Way to Establish MPI Communication|MPI-2.1]], [[versions/v22/sections/dynamic#Another Way to Establish MPI Communication|MPI-2.2]], [[versions/v30/sections/dynamic#Another Way to Establish MPI Communication|MPI-3.0]], [[versions/v31/sections/dynamic#Another Way to Establish MPI Communication|MPI-3.1]], [[versions/v40/sections/dynamic#Another Way to Establish MPI Communication|MPI-4.0]], [[versions/v41/sections/dynamic#Another Way to Establish MPI Communication|MPI-4.1]], [[versions/v50/sections/dynamic#Another Way to Establish MPI Communication|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

> A ~~high quality~~ ==high-quality== implementation will attempt to establish communication over a slow medium if its preferred one is not available. If implementations do not do this, they must document why they cannot do MPI communication over the medium used by the socket (especially if the socket is a TCP connection).

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

Implementations that exist in an environment not supporting Berkeley Sockets should provide the entry point for [[versions/v22/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] and should return ~~MPI_COMM_NULL.~~ ==`MPI_COMM_NULL`.==

`fd` is a file descriptor representing a socket of type `SOCK_STREAM` (a two-way reliable byte-stream connection). ~~Non-blocking~~ ==Nonblocking== I/O and asynchronous notification via `SIGIO` must not be enabled for the socket. The socket must be in a connected state. The socket must be quiescent when [[versions/v22/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] is called (see below). It is the responsibility of the application to create the socket using standard socket API calls.

pending communication, it succeeds and sets `intercomm` to ~~MPI_COMM_NULL.~~ ==`MPI_COMM_NULL`.==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~[[versions/v30/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] is intended for MPI implementations that exist in an environment supporting the Berkeley Socket interface .~~

~~Implementations that exist in an environment not supporting Berkeley Sockets should provide the entry point for [[versions/v30/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] and should return `MPI_COMM_NULL`.~~

==[[versions/v30/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] is intended for MPI implementations that exist in an environment supporting the Berkeley Socket interface . Implementations that exist in an environment not supporting Berkeley Sockets should provide the entry point for [[versions/v30/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] and should return `MPI_COMM_NULL`.==

~~If MPI is unable to create an intercommunicator, but is able to leave the socket in its original state, with no~~

~~pending communication, it succeeds and sets `intercomm` to `MPI_COMM_NULL`.~~

==If MPI is unable to create an intercommunicator, but is able to leave the socket in its original state, with no pending communication, it succeeds and sets `intercomm` to `MPI_COMM_NULL`.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~This call creates an intercommunicator from the union of two MPI processes which are connected by a socket.~~

~~[[versions/v31/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] should normally succeed if the local and remote processes have access to the same implementation-defined MPI communication universe.~~

==This call creates an intercommunicator from the union of two MPI processes which are connected by a socket. [[versions/v31/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] should normally succeed if the local and remote processes have access to the same implementation-defined MPI communication universe.==

[[versions/v31/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] uses non-MPI communication to do its work. The interaction of non-MPI communication with pending MPI communication is not defined. Therefore, the result of calling [[versions/v31/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] on two connected processes (see ~~Section [[versions/v31/sections/dynamic#Releasing Connections|Releasing Connections]] on page~~ [[versions/v31/sections/dynamic#Releasing Connections|Releasing Connections]] for the definition of connected) is undefined.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

This call creates an ~~intercommunicator~~ ==inter-communicator== from the union of two MPI processes which are connected by a socket. [[versions/v40/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] should normally succeed if the local and remote processes have access to the same implementation-defined MPI communication universe.

MPI uses the socket to bootstrap creation of the ~~intercommunicator,~~ ==inter-communicator,== and for nothing else. Upon return from [[versions/v40/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] , the file descriptor will be open and quiescent (see below).

If MPI is unable to create an ~~intercommunicator,~~ ==inter-communicator,== but is able to leave the socket in its original state, with no pending communication, it succeeds and sets `intercomm` to `MPI_COMM_NULL`.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

This call creates an inter-communicator from the union of two MPI processes ~~which~~ ==that== are connected by a socket. [[versions/v41/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] should normally succeed if the local and remote processes have access to the same implementation-defined MPI communication universe.

MPI ==only== uses the socket to bootstrap ==the== creation of the ~~inter-communicator, and for nothing else.~~ ==inter-communicator.== Upon return from [[versions/v41/API/MPI_COMM_JOIN|MPI_COMM_JOIN]] , the file descriptor will be open and quiescent (see below).

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Another Way to Establish MPI Communication]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Another Way to Establish MPI Communication]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Another Way to Establish MPI Communication]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Another Way to Establish MPI Communication]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Another Way to Establish MPI Communication]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Another Way to Establish MPI Communication]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Another Way to Establish MPI Communication]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Another Way to Establish MPI Communication]]
