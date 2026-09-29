---
title: "Example 3: Building Name Service for Intercommunication"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1"]
tags: [mpi/section, mpi/context]
---

# Example 3: Building Name Service for Intercommunication

Chapter **context** · in [[versions/v13/sections/context#Example 3: Building Name Service for Intercommunication|MPI-1.3]], [[versions/v21/sections/context#Example 3: Building Name Service for Intercommunication|MPI-2.1]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (4 changed paragraphs)

After all MPI processes execute `MPI_INIT`, every process calls the example function, ~~`Init_server()`,~~ ==[[Init_server]] ,== defined below. Then, if the `new_world` returned is NULL, the process getting NULL is required to implement a server function, in a reactive loop, ~~`Do_server()`.~~ ==[[Do_server]] .== Everyone else just does their prescribed computation, using `new_world` as the new effective “global" communicator. One designated process calls ~~`Undo_Server()`~~ ==[[Undo_Server]]== to get rid of the server when it is not needed any longer.

#define INIT_SERVER_TAG_1 666 #define UNDO_SERVER_TAG_1 777

~~MPI_Intercomm_free(&server_comm);~~ ==MPI_Comm_free(&server_comm);== break; }

A particular process would be responsible for ending the server when it is no longer needed. Its call to ~~`Undo_server`~~ ==[[Undo_server]]== would terminate server function.

int Undo_server(server_comm) /* example client that ends server */ MPI_Comm *server_comm; { int buffer = 0; MPI_Send(&buffer, 1, MPI_INT, 0, UNDO_SERVER_TAG_1, *server_comm); ~~MPI_Intercomm_free(server_comm);~~ ==MPI_Comm_free(server_comm);== }

### MPI-2.1 → MPI-2.2

_Section absent from MPI-2.2._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Example 3: Building Name Service for Intercommunication]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Example 3: Building Name Service for Intercommunication]]
