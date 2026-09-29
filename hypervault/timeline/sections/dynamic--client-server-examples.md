---
title: "Client/Server Examples"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Client/Server Examples

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Client/Server Examples|MPI-2.0]], [[versions/v21/sections/dynamic#Client/Server Examples|MPI-2.1]], [[versions/v22/sections/dynamic#Client/Server Examples|MPI-2.2]], [[versions/v30/sections/dynamic#Client/Server Examples|MPI-3.0]], [[versions/v31/sections/dynamic#Client/Server Examples|MPI-3.1]], [[versions/v40/sections/dynamic#Client/Server Examples|MPI-4.0]], [[versions/v41/sections/dynamic#Client/Server Examples|MPI-4.1]], [[versions/v50/sections/dynamic#Client/Server Examples|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

==Simplest Example—Completely Portable.==

==The following example shows the simplest way to use the client/server interface. It does not use service names at all.==

==On the server side:==

==        char myport[MPI_MAX_PORT_NAME];         MPI_Comm intercomm;         /* ... */         MPI_Open_port(MPI_INFO_NULL, myport);         printf("port name is: %s\n", myport);==

==        MPI_Comm_accept(myport, MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);         /* do something with intercomm */==

==The server prints out the port name to the terminal and the user must type it in when starting up the client (assuming the MPI implementation supports `stdin` such that this works). On the client side:==

==        MPI_Comm intercomm;         char name[MPI_MAX_PORT_NAME];         printf("enter port name: ");          gets(name);         MPI_Comm_connect(name, MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);==

==Ocean/Atmosphere—Relies on Name Publishing==

==In this example, the “ocean” application is the “server” side of a coupled ocean-atmosphere climate model. It assumes that the MPI implementation publishes names.==

==        MPI_Open_port(MPI_INFO_NULL, port_name);         MPI_Publish_name("ocean", MPI_INFO_NULL, port_name);==

==        MPI_Comm_accept(port_name, MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);         /* do something with intercomm */         MPI_Unpublish_name("ocean", MPI_INFO_NULL, port_name);==

==On the client side:==

==        MPI_Lookup_name("ocean", MPI_INFO_NULL, port_name);         MPI_Comm_connect(port_name, MPI_INFO_NULL, 0, MPI_COMM_SELF,                            &intercomm);==

==Simple Client-Server Example==

==This is a simple example; the server accepts only a single connection at a time and serves that connection until the client requests to be disconnected. The server is a single process.==

==Here is the server. It accepts a single connection and then processes data until it receives a message with tag `1`. A message with tag `0` tells the server to exit.==

==    #include "mpi.h"     int main(int argc, char *argv[])     {         MPI_Comm client;         MPI_Status status;         char port_name[MPI_MAX_PORT_NAME];         double buf[MAX_DATA];         int    size, again;==

==        MPI_Init(&argc, &argv);         MPI_Comm_size(MPI_COMM_WORLD, &size);         if (size != 1) error(FATAL, "Server too big");         MPI_Open_port(MPI_INFO_NULL, port_name);         printf("server available at %s\n", port_name);         while (1) {             MPI_Comm_accept(port_name, MPI_INFO_NULL, 0, MPI_COMM_WORLD,                              &client);             again = 1;             while (again) {                 MPI_Recv(buf, MAX_DATA, MPI_DOUBLE,                           MPI_ANY_SOURCE, MPI_ANY_TAG, client, &status);                 switch (status.MPI_TAG) {                     case 0: MPI_Comm_free(&client);                             MPI_Close_port(port_name);                             MPI_Finalize();                             return 0;                     case 1: MPI_Comm_disconnect(&client);                             again = 0;                             break;                     case 2: /* do something */                     ...                     default:                             /* Unexpected message type */                             MPI_Abort(MPI_COMM_WORLD, 1);                     }                 }             }     }==

==Here is the client.==

==    #include "mpi.h"     int main(int argc, char *argv[])     {         MPI_Comm server;         int done = 0;         double buf[MAX_DATA];         char port_name[MPI_MAX_PORT_NAME];==

==        MPI_Init(&argc, &argv);         strcpy(port_name, argv[1]);/* assume server's name is cmd-line arg */==

==        MPI_Comm_connect(port_name, MPI_INFO_NULL, 0, MPI_COMM_WORLD,                           &server);==

==        while (!done) {             tag = 2; /* Action to perform */             MPI_Send(buf, n, MPI_DOUBLE, 0, tag, server);             /* etc */             }         MPI_Send(buf, 0, MPI_DOUBLE, 0, 1, server);         MPI_Comm_disconnect(&server);         MPI_Finalize();         return 0;     }==

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

~~        char myport[MPI_MAX_PORT_NAME];         MPI_Comm intercomm;         /* ... */         MPI_Open_port(MPI_INFO_NULL, myport);         printf("port name is: %s\n", myport);~~

~~        MPI_Comm_accept(myport, MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);         /* do something with intercomm */~~

==(code block added)==
``` [MPI]C
char myport[MPI_MAX_PORT_NAME];
MPI_Comm intercomm;
/* ... */
MPI_Open_port(MPI_INFO_NULL, myport);
printf("port name is: %s\n", myport);

MPI_Comm_accept(myport, MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);
/* do something with intercomm */
```

~~        MPI_Comm intercomm;         char name[MPI_MAX_PORT_NAME];         printf("enter port name: ");          gets(name);         MPI_Comm_connect(name, MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);~~

==(code block added)==
``` [MPI]C
MPI_Comm intercomm;
char name[MPI_MAX_PORT_NAME];
printf("enter port name: ");
gets(name);
MPI_Comm_connect(name, MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);
```

~~        MPI_Open_port(MPI_INFO_NULL, port_name);         MPI_Publish_name("ocean", MPI_INFO_NULL, port_name);~~

~~        MPI_Comm_accept(port_name, MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);         /* do something with intercomm */         MPI_Unpublish_name("ocean", MPI_INFO_NULL, port_name);~~

==(code block added)==
``` [MPI]C
char port_name[MPI_MAX_PORT_NAME];
MPI_Comm intercomm;
/* ... */
MPI_Open_port(MPI_INFO_NULL, port_name);
MPI_Publish_name("ocean", MPI_INFO_NULL, port_name);

MPI_Comm_accept(port_name, MPI_INFO_NULL, 0, MPI_COMM_SELF,
                &intercomm);
/* do something with intercomm */
MPI_Unpublish_name("ocean", MPI_INFO_NULL, port_name);
```

~~        MPI_Lookup_name("ocean", MPI_INFO_NULL, port_name);         MPI_Comm_connect(port_name, MPI_INFO_NULL, 0, MPI_COMM_SELF,                            &intercomm);~~

==(code block added)==
``` [MPI]C
MPI_Lookup_name("ocean", MPI_INFO_NULL, port_name);
MPI_Comm_connect(port_name, MPI_INFO_NULL, 0, MPI_COMM_SELF,
                 &intercomm);
```

~~    #include "mpi.h"     int main(int argc, char *argv[])     {         MPI_Comm client;         MPI_Status status;         char port_name[MPI_MAX_PORT_NAME];         double buf[MAX_DATA];         int    size, again;~~

~~        MPI_Init(&argc, &argv);         MPI_Comm_size(MPI_COMM_WORLD, &size);         if (size != 1) error(FATAL, "Server too big");         MPI_Open_port(MPI_INFO_NULL, port_name);         printf("server available at %s\n", port_name);         while (1) {             MPI_Comm_accept(port_name, MPI_INFO_NULL, 0, MPI_COMM_WORLD,                              &client);             again = 1;             while (again) {                 MPI_Recv(buf, MAX_DATA, MPI_DOUBLE,                           MPI_ANY_SOURCE, MPI_ANY_TAG, client, &status);                 switch (status.MPI_TAG) {                     case 0: MPI_Comm_free(&client);                             MPI_Close_port(port_name);                             MPI_Finalize();                             return 0;                     case 1: MPI_Comm_disconnect(&client);                             again = 0;                             break;                     case 2: /* do something */                     ...                     default:                             /* Unexpected message type */                             MPI_Abort(MPI_COMM_WORLD, 1);                     }                 }             }     }~~

==(code block added)==
``` [MPI]C
#include "mpi.h"
int main(int argc, char *argv[])
{
    MPI_Comm client;
    MPI_Status status;
    char port_name[MPI_MAX_PORT_NAME];
    double buf[MAX_DATA];
    int    size, again;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    if (size != 1) error(FATAL, "Server too big");
    MPI_Open_port(MPI_INFO_NULL, port_name);
    printf("server available at %s\n", port_name);
    while (1) {
        MPI_Comm_accept(port_name, MPI_INFO_NULL, 0, MPI_COMM_WORLD,
                        &client);
        again = 1;
        while (again) {
            MPI_Recv(buf, MAX_DATA, MPI_DOUBLE,
                     MPI_ANY_SOURCE, MPI_ANY_TAG, client, &status);
            switch (status.MPI_TAG) {
                case 0: MPI_Comm_free(&client);
                        MPI_Close_port(port_name);
                        MPI_Finalize();
                        return 0;
                case 1: MPI_Comm_disconnect(&client);
                        again = 0;
                        break;
                case 2: /* do something */
                ...
                default:
                        /* Unexpected message type */
                        MPI_Abort(MPI_COMM_WORLD, 1);
            }
        }
    }
}
```

~~    #include "mpi.h"     int main(int argc, char *argv[])     {         MPI_Comm server;         int done = 0;         double buf[MAX_DATA];         char port_name[MPI_MAX_PORT_NAME];~~

~~        MPI_Init(&argc, &argv);         strcpy(port_name, argv[1]);/* assume server's name is cmd-line arg */~~

~~        MPI_Comm_connect(port_name, MPI_INFO_NULL, 0, MPI_COMM_WORLD,                           &server);~~

~~        while (!done) {             tag = 2; /* Action to perform */             MPI_Send(buf, n, MPI_DOUBLE, 0, tag, server);             /* etc */             }         MPI_Send(buf, 0, MPI_DOUBLE, 0, 1, server);         MPI_Comm_disconnect(&server);         MPI_Finalize();         return 0;     }~~

==(code block added)==
``` [MPI]C
#include "mpi.h"
int main(int argc, char *argv[])
{
   MPI_Comm server;
   int done = 0;
   double buf[MAX_DATA];
   char port_name[MPI_MAX_PORT_NAME];

   MPI_Init(&argc, &argv);
   strcpy(port_name, argv[1]);/* assume server's name is cmd-line arg */

   MPI_Comm_connect(port_name, MPI_INFO_NULL, 0, MPI_COMM_WORLD,
                    &server);

   while (!done) {
       tag = 2; /* Action to perform */
       MPI_Send(buf, n, MPI_DOUBLE, 0, tag, server);
       /* etc */
   }
   MPI_Send(buf, 0, MPI_DOUBLE, 0, 1, server);
   MPI_Comm_disconnect(&server);
   MPI_Finalize();
   return 0;
}
```

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~Simplest~~ ==Printing Port Name== Example—Completely Portable.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Client/Server Examples]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Client/Server Examples]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Client/Server Examples]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Client/Server Examples]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Client/Server Examples]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Client/Server Examples]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Client/Server Examples]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Client/Server Examples]]
