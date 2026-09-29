---
title: "Server Routines"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Server Routines

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Server Routines|MPI-2.0]], [[versions/v21/sections/dynamic#Server Routines|MPI-2.1]], [[versions/v22/sections/dynamic#Server Routines|MPI-2.2]], [[versions/v30/sections/dynamic#Server Routines|MPI-3.0]], [[versions/v31/sections/dynamic#Server Routines|MPI-3.1]], [[versions/v40/sections/dynamic#Server Routines|MPI-4.0]], [[versions/v41/sections/dynamic#Server Routines|MPI-4.1]], [[versions/v50/sections/dynamic#Server Routines|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

~~MPI_MAX_PORT_NAME.~~ ==`MPI_MAX_PORT_NAME`.==

`info` may be used to tell the implementation how to establish the address. It may, and usually will, be ~~MPI_INFO_NULL~~ ==`MPI_INFO_NULL`== in order to get the implementation defaults.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~MPI copies a system-supplied port name into `port_name`. `port_name` identifies the newly opened port and can be used by a client to contact the server. The maximum size string that may be supplied by the system is~~

~~`MPI_MAX_PORT_NAME`.~~

==MPI copies a system-supplied port name into `port_name`. `port_name` identifies the newly opened port and can be used by a client to contact the server. The maximum size string that may be supplied by the system is `MPI_MAX_PORT_NAME`.==

`info` ~~is a implementation-defined string~~ ==can be used to provide directives== that may ~~allow fine control over~~ ==influence the behavior of== the [[ACCEPT]] call.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

[[versions/v40/API/MPI_COMM_ACCEPT|MPI_COMM_ACCEPT]] establishes communication with a client. It is collective over the calling communicator. It returns an ~~intercommunicator~~ ==inter-communicator== that allows communication with the client.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

MPI copies a system-supplied port name into `port_name`. `port_name` identifies the newly opened port and can be used by a client to contact the server. The maximum size ==of the== string that may be supplied by the system is `MPI_MAX_PORT_NAME`.

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

The precise form of the address is ~~implementation-defined.~~ ==implementation defined.== For instance, an internet address may be a host name or IP address, or anything that the implementation can decode into an IP address. A port name may be reused after it is freed with [[versions/v50/API/MPI_CLOSE_PORT|MPI_CLOSE_PORT]] and released by the system.

`info` can be used to provide directives that may influence the behavior of the ~~[[ACCEPT]] call.~~ ==call to [[versions/v50/API/MPI_COMM_ACCEPT|MPI_COMM_ACCEPT]] .==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Server Routines]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Server Routines]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Server Routines]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Server Routines]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Server Routines]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Server Routines]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Server Routines]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Server Routines]]
