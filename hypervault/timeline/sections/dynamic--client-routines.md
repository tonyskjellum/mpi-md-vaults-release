---
title: "Client Routines"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Client Routines

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Client Routines|MPI-2.0]], [[versions/v21/sections/dynamic#Client Routines|MPI-2.1]], [[versions/v22/sections/dynamic#Client Routines|MPI-2.2]], [[versions/v30/sections/dynamic#Client Routines|MPI-3.0]], [[versions/v31/sections/dynamic#Client Routines|MPI-3.1]], [[versions/v40/sections/dynamic#Client Routines|MPI-4.0]], [[versions/v41/sections/dynamic#Client Routines|MPI-4.1]], [[versions/v50/sections/dynamic#Client Routines|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

> The time out period may be arbitrarily short or long. However, a ~~high quality~~ ==high-quality== implementation will try to queue connection attempts so that a server can handle simultaneous requests from several clients. A ~~high quality~~ ==high-quality== implementation may also provide a mechanism, through the `info` arguments to [[versions/v30/API/MPI_OPEN_PORT|MPI_OPEN_PORT]] , [[versions/v30/API/MPI_COMM_ACCEPT|MPI_COMM_ACCEPT]] ==,== and/or [[versions/v30/API/MPI_COMM_CONNECT|MPI_COMM_CONNECT]] , for the user to control timeout and queuing behavior.

`port_name` is the address of the server. It must be the same as the name returned by `MPI_OPEN_PORT` on the server. Some freedom is allowed here. If there are equivalent forms of `port_name`, an implementation may accept them as well. For instance, if `port_name` is ~~(hostname:port),~~ ==(`hostname:port`),== an implementation may accept ~~(ip_address:port)~~ ==(`ip_address:port`)== as well.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

This routine establishes communication with a server specified by `port_name`. It is collective over the calling communicator and returns an ~~intercommunicator~~ ==inter-communicator== in which the remote group participated in an [[versions/v40/API/MPI_COMM_ACCEPT|MPI_COMM_ACCEPT]] .

`port_name` is the address of the server. It must be the same as the name returned by ~~`MPI_OPEN_PORT`~~ ==[[versions/v40/API/MPI_OPEN_PORT|MPI_OPEN_PORT]]== on the server. Some freedom is allowed here. If there are equivalent forms of `port_name`, an implementation may accept them as well. For instance, if `port_name` is (`hostname:port`), an implementation may accept (`ip_address:port`) as well.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Client Routines]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Client Routines]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Client Routines]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Client Routines]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Client Routines]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Client Routines]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Client Routines]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Client Routines]]
