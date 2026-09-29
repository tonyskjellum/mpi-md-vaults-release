---
title: "Simple Client-Server Example"
chapter: dynamic
present_in: ["MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/dynamic]
---

# Simple Client-Server Example

Chapter **dynamic** · in [[versions/v30/sections/dynamic#Simple Client-Server Example|MPI-3.0]], [[versions/v31/sections/dynamic#Simple Client-Server Example|MPI-3.1]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

#include "mpi.h" int ~~main( int~~ ==main(int== argc, char ~~**argv )~~ ==*argv[])== { MPI_Comm client; MPI_Status status; char port_name[MPI_MAX_PORT_NAME]; double buf[MAX_DATA]; int size, again;

~~MPI_Init( &argc, &argv );~~ ==MPI_Init(&argc, &argv);== MPI_Comm_size(MPI_COMM_WORLD, &size); if (size != 1) error(FATAL, "Server too big"); MPI_Open_port(MPI_INFO_NULL, port_name); printf("server available at ~~%s\n",port_name);~~ ==%s\n", port_name);== while (1) { ~~MPI_Comm_accept( port_name,~~ ==MPI_Comm_accept(port_name,== MPI_INFO_NULL, 0, MPI_COMM_WORLD, ~~&client );~~ ==&client);== again = 1; while (again) { ~~MPI_Recv( buf,~~ ==MPI_Recv(buf,== MAX_DATA, MPI_DOUBLE, MPI_ANY_SOURCE, MPI_ANY_TAG, client, ~~&status );~~ ==&status);== switch (status.MPI_TAG) { case 0: ~~MPI_Comm_free( &client );~~ ==MPI_Comm_free(&client);== MPI_Close_port(port_name); MPI_Finalize(); return 0; case 1: ~~MPI_Comm_disconnect( &client );~~ ==MPI_Comm_disconnect(&client);== again = 0; break; case 2: /* do something */ ... default: /* Unexpected message type */ ~~MPI_Abort( MPI_COMM_WORLD, 1 );~~ ==MPI_Abort(MPI_COMM_WORLD, 1);== } } } }

MPI_Init( &argc, &argv ); ~~strcpy(port_name,~~ ==strcpy( port_name,== argv[1] );/* assume server's name is cmd-line arg */

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Simple Client-Server Example]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Simple Client-Server Example]]
