---
title: "Introduction"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Introduction

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Introduction|MPI-1.3]], [[versions/v21/sections/pt2pt#Introduction|MPI-2.1]], [[versions/v22/sections/pt2pt#Introduction|MPI-2.2]], [[versions/v30/sections/pt2pt#Introduction|MPI-3.0]], [[versions/v31/sections/pt2pt#Introduction|MPI-3.1]], [[versions/v40/sections/pt2pt#Introduction|MPI-4.0]], [[versions/v41/sections/pt2pt#Introduction|MPI-4.1]], [[versions/v50/sections/pt2pt#Introduction|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~    #include "mpi.h"     main( argc, argv )     int argc;     char **argv;     {         char message[20];         int myrank;         MPI_Status status;         MPI_Init( &argc, &argv );         MPI_Comm_rank( MPI_COMM_WORLD, &myrank );         if (myrank == 0)    /* code for process zero */         {             strcpy(message,"Hello, there");             MPI_Send(message, strlen(message)+1, MPI_CHAR, 1, 99, MPI_COMM_WORLD);         }         else                /* code for process one */         {             MPI_Recv(message, 20, MPI_CHAR, 0, 99, MPI_COMM_WORLD, &status);             printf("received :%s:\n", message);         }         MPI_Finalize();     }~~

~~In this example, process zero (<span class="sans-serif">myrank = 0</span>) sends a message to process one using the **send** operation [[versions/v21/API/MPI_SEND|MPI_SEND]] . The operation specifies a **send buffer** in the sender memory from which the message data is taken. In the example above, the send buffer consists of the storage containing the variable <span class="sans-serif">message</span> in the memory of process zero. The location, size and type of the send buffer are specified by the first three parameters of the send operation. The message sent will contain the 13 characters of this variable. In addition, the send operation associates an **envelope** with the message. This envelope specifies the message destination and contains distinguishing information that can be used by the **receive** operation to select a particular message. The last three parameters of the send operation specify the envelope for the message sent.~~

==    #include "mpi.h"     main( argc, argv )     int argc;     char **argv;     {         char message[20];         int myrank;         MPI_Status status;         MPI_Init( &argc, &argv );         MPI_Comm_rank( MPI_COMM_WORLD, &myrank );         if (myrank == 0)    /* code for process zero */         {             strcpy(message,"Hello, there");             MPI_Send(message, strlen(message)+1, MPI_CHAR, 1, 99, MPI_COMM_WORLD);         }         else if (myrank == 1)  /* code for process one */         {             MPI_Recv(message, 20, MPI_CHAR, 0, 99, MPI_COMM_WORLD, &status);             printf("received :%s:\n", message);         }         MPI_Finalize();     }==

==In this example, process zero (<span class="sans-serif">myrank = 0</span>) sends a message to process one using the **send** operation [[versions/v21/API/MPI_SEND|MPI_SEND]] . The operation specifies a **send buffer** in the sender memory from which the message data is taken. In the example above, the send buffer consists of the storage containing the variable <span class="sans-serif">message</span> in the memory of process zero. The location, size and type of the send buffer are specified by the first three parameters of the send operation. The message sent will contain the 13 characters of this variable. In addition, the send operation associates an **envelope** with the message. This envelope specifies the message destination and contains distinguishing information that can be used by the **receive** operation to select a particular message.==

==The last three parameters of the send operation, along with the rank of the sender, specify the envelope for the message sent.==

~~The next sections describe the blocking send and receive operations. We discuss send, receive, blocking communication semantics, type matching requirements, type conversion in heterogeneous environments, and more general communication modes. Nonblocking communication is addressed next, followed by channel-like constructs and send-receive operations. We then consider general datatypes that allow one to transfer efficiently heterogeneous and noncontiguous data. We conclude with the description of calls for explicit packing and unpacking of messages.~~

==The next sections describe the blocking send and receive operations. We discuss send, receive, blocking communication semantics, type matching requirements, type conversion in heterogeneous environments, and more general communication modes. Nonblocking communication is addressed next, followed by channel-like constructs and send-receive operations, Nonblocking communication is addressed next, followed by channel-like constructs and send-receive operations,==

==ending with a description of the “dummy” process, MPI_PROC_NULL.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

#include "mpi.h" ==int== main( ==int== argc, ~~argv~~ ==char **argv== ) ~~int argc; char **argv;~~ { char message[20]; int myrank; MPI_Status status; MPI_Init( &argc, &argv ); MPI_Comm_rank( MPI_COMM_WORLD, &myrank ); if (myrank == 0) /* code for process zero */ { strcpy(message,"Hello, there"); MPI_Send(message, strlen(message)+1, MPI_CHAR, 1, 99, MPI_COMM_WORLD); } else if (myrank == 1) /* code for process one */ { MPI_Recv(message, 20, MPI_CHAR, 0, 99, MPI_COMM_WORLD, &status); printf("received :%s:\n", message); } MPI_Finalize(); }

ending with a description of the “dummy” process, ~~MPI_PROC_NULL.~~ ==`MPI_PROC_NULL`.==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~    #include "mpi.h"     int main( int argc, char **argv )     {       char message[20];       int myrank;       MPI_Status status;       MPI_Init( &argc, &argv );       MPI_Comm_rank( MPI_COMM_WORLD, &myrank );       if (myrank == 0)    /* code for process zero */       {           strcpy(message,"Hello, there");           MPI_Send(message, strlen(message)+1, MPI_CHAR, 1, 99, MPI_COMM_WORLD);       }       else if (myrank == 1)  /* code for process one */       {           MPI_Recv(message, 20, MPI_CHAR, 0, 99, MPI_COMM_WORLD, &status);           printf("received :%s:\n", message);       }       MPI_Finalize();     }~~

~~In this example, process zero (<span class="sans-serif">myrank = 0</span>) sends a message to process one using the **send** operation [[versions/v30/API/MPI_SEND|MPI_SEND]] . The operation specifies a **send buffer** in the sender memory from which the message data is taken. In the example above, the send buffer consists of the storage containing the variable <span class="sans-serif">message</span> in the memory of process zero. The location, size and type of the send buffer are specified by the first three parameters of the send operation. The message sent will contain the 13 characters of this variable. In addition, the send operation associates an **envelope** with the message. This envelope specifies the message destination and contains distinguishing information that can be used by the **receive** operation to select a particular message.~~

~~The last three parameters of the send operation, along with the rank of the sender, specify the envelope for the message sent.~~

==    #include "mpi.h"     int main( int argc, char *argv[])     {       char message[20];       int myrank;       MPI_Status status;       MPI_Init( &argc, &argv );       MPI_Comm_rank( MPI_COMM_WORLD, &myrank );       if (myrank == 0)    /* code for process zero */       {           strcpy(message,"Hello, there");           MPI_Send(message, strlen(message)+1, MPI_CHAR, 1, 99, MPI_COMM_WORLD);       }       else if (myrank == 1)  /* code for process one */       {           MPI_Recv(message, 20, MPI_CHAR, 0, 99, MPI_COMM_WORLD, &status);           printf("received :%s:\n", message);       }       MPI_Finalize();       return 0;     }==

==In this example, process zero (<span class="sans-serif">myrank = 0</span>) sends a message to process one using the **send** operation [[versions/v30/API/MPI_SEND|MPI_SEND]] . The operation specifies a **send buffer** in the sender memory from which the message data is taken. In the example above, the send buffer consists of the storage containing the variable <span class="sans-serif">message</span> in the memory of process zero. The location, size and type of the send buffer are specified by the first three parameters of the send operation. The message sent will contain the 13 characters of this variable. In addition, the send operation associates an **envelope** with the message. This envelope specifies the message destination and contains distinguishing information that can be used by the **receive** operation to select a particular message. The last three parameters of the send operation, along with the rank of the sender, specify the envelope for the message sent.==

The next sections describe the blocking send and receive operations. We discuss send, receive, blocking communication semantics, type matching requirements, type conversion in heterogeneous environments, and more general communication modes. Nonblocking communication is addressed next, followed by ==probing and canceling a message,== channel-like constructs and send-receive operations, ~~Nonblocking communication is addressed next, followed by channel-like constructs and send-receive operations,~~

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~In this example, process zero (<span class="sans-serif">myrank = 0</span>) sends a message to process one using the **send** operation [[versions/v31/API/MPI_SEND|MPI_SEND]] . The operation specifies a **send buffer** in the sender memory from which the message data is taken. In the example above, the send buffer consists of the storage containing the variable <span class="sans-serif">message</span> in the memory of process zero. The location, size and type of the send buffer are specified by the first three parameters of the send operation. The message sent will contain the 13 characters of this variable. In addition, the send operation associates an **envelope** with the message. This envelope specifies the message destination and contains distinguishing information that can be used by the **receive** operation to select a particular message. The last three parameters of the send operation, along with the rank of the sender, specify the envelope for the message sent.~~

~~Process one (<span class="sans-serif">myrank = 1</span>) receives this message with the **receive** operation [[versions/v31/API/MPI_RECV|MPI_RECV]] . The message to be received is selected according to the value of its envelope, and the message data is stored into the **receive buffer**. In the example above, the receive buffer consists of the storage containing the string <span class="sans-serif">message</span> in the memory of process one. The first three parameters of the receive operation specify the location, size and type of the receive buffer. The next three parameters are used for selecting the incoming message. The last parameter is used to return information on the message just received.~~

~~The next sections describe the blocking send and receive operations. We discuss send, receive, blocking communication semantics, type matching requirements, type conversion in heterogeneous environments, and more general communication modes. Nonblocking communication is addressed next, followed by probing and canceling a message, channel-like constructs and send-receive operations,~~

~~ending with a description of the “dummy” process, `MPI_PROC_NULL`.~~

==In this example, process zero (`myrank = 0`) sends a message to process one using the **send** operation [[versions/v31/API/MPI_SEND|MPI_SEND]] . The operation specifies a **send buffer** in the sender memory from which the message data is taken. In the example above, the send buffer consists of the storage containing the variable `message` in the memory of process zero. The location, size and type of the send buffer are specified by the first three parameters of the send operation. The message sent will contain the 13 characters of this variable. In addition, the send operation associates an **envelope** with the message. This envelope specifies the message destination and contains distinguishing information that can be used by the **receive** operation to select a particular message. The last three parameters of the send operation, along with the rank of the sender, specify the envelope for the message sent. Process one (`myrank = 1`) receives this message with the **receive** operation [[versions/v31/API/MPI_RECV|MPI_RECV]] . The message to be received is selected according to the value of its envelope, and the message data is stored into the **receive buffer**. In the example above, the receive buffer consists of the storage containing the string `message` in the memory of process one. The first three parameters of the receive operation specify the location, size and type of the receive buffer. The next three parameters are used for selecting the incoming message. The last parameter is used to return information on the message just received.==

==The next sections describe the blocking send and receive operations. We discuss send, receive, blocking communication semantics, type matching requirements, type conversion in heterogeneous environments, and more general communication modes. Nonblocking communication is addressed next, followed by probing and canceling a message, channel-like constructs and send-receive operations, ending with a description of the “dummy” process, `MPI_PROC_NULL`.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~Sending and receiving of messages by processes is the basic MPI communication mechanism. The basic point-to-point communication operations are **send** and **receive**. Their use is illustrated in the example below.~~

~~    #include "mpi.h"     int main( int argc, char *argv[])     {       char message[20];       int myrank;       MPI_Status status;       MPI_Init( &argc, &argv );       MPI_Comm_rank( MPI_COMM_WORLD, &myrank );       if (myrank == 0)    /* code for process zero */       {           strcpy(message,"Hello, there");           MPI_Send(message, strlen(message)+1, MPI_CHAR, 1, 99, MPI_COMM_WORLD);       }       else if (myrank == 1)  /* code for process one */       {           MPI_Recv(message, 20, MPI_CHAR, 0, 99, MPI_COMM_WORLD, &status);           printf("received :%s:\n", message);       }       MPI_Finalize();       return 0;     }~~

~~In this example, process zero (`myrank = 0`) sends a message to process one using the **send** operation [[versions/v40/API/MPI_SEND|MPI_SEND]] . The operation specifies a **send buffer** in the sender memory from which the message data is taken. In the example above, the send buffer consists of the storage containing the variable `message` in the memory of process zero. The location, size and type of the send buffer are specified by the first three parameters of the send operation. The message sent will contain the 13 characters of this variable. In addition, the send operation associates an **envelope** with the message. This envelope specifies the message destination and contains distinguishing information that can be used by the **receive** operation to select a particular message. The last three parameters of the send operation, along with the rank of the sender, specify the envelope for the message sent. Process one (`myrank = 1`) receives this message with the **receive** operation [[versions/v40/API/MPI_RECV|MPI_RECV]] . The message to be received is selected according to the value of its envelope, and the message data is stored into the **receive buffer**. In the example above, the receive buffer consists of the storage containing the string `message` in the memory of process one. The first three parameters of the receive operation specify the location, size and type of the receive buffer. The next three parameters are used for selecting the incoming message. The last parameter is used to return information on the message just received.~~

~~The next sections describe the blocking send and receive operations. We discuss send, receive, blocking communication semantics, type matching requirements, type conversion in heterogeneous environments, and more general communication modes. Nonblocking communication is addressed next, followed by probing and canceling a message, channel-like constructs and send-receive operations, ending with a description of the “dummy” process, `MPI_PROC_NULL`.~~

==Sending and receiving of *messages* by processes is the basic MPI communication mechanism. The basic point-to-point communication operations are *send* and *receive*. Their use is illustrated in Example [[versions/v40/sections/pt2pt#Introduction|Introduction]] .==

==A simple ‘hello world’ example usage of point-to-point communication.==

==    #include "mpi.h"     int main(int argc, char *argv[])     {       char message[20];       int myrank;       MPI_Status status;       MPI_Init(&argc, &argv);       MPI_Comm_rank(MPI_COMM_WORLD, &myrank);       if (myrank == 0)    /* code for process zero */       {           strcpy(message,"Hello, there");           MPI_Send(message, strlen(message)+1, MPI_CHAR, 1, 99, MPI_COMM_WORLD);       }       else if (myrank == 1)  /* code for process one */       {           MPI_Recv(message, 20, MPI_CHAR, 0, 99, MPI_COMM_WORLD, &status);           printf("received :%s:\n", message);       }       MPI_Finalize();       return 0;     }==

==In Example [[versions/v40/sections/pt2pt#Introduction|Introduction]] , process zero (`myrank = 0`) sends a *message* to process one using the *send* operation [[versions/v40/API/MPI_SEND|MPI_SEND]] . The operation specifies a *send buffer* in the sender memory from which the *message data* is taken. In the example above, the send buffer consists of the storage containing the variable `message` in the memory of process zero. The location, size and type of the send buffer are specified by the first three parameters of the send operation. The message sent will contain the 13 characters of this variable. In addition, the send operation associates an *envelope* with the message. This *envelope* specifies the message destination and contains distinguishing information that can be used by the *receive* operation to select a particular message. The last three parameters of the send operation, along with the rank of the sender, specify the *envelope* for the message sent. Process one (`myrank = 1`) receives this message with the *receive* operation [[versions/v40/API/MPI_RECV|MPI_RECV]] . The message to be received is selected according to the value of its *envelope*, and the *message data* is stored into the *receive buffer*. In the example above, the receive buffer consists of the storage containing the string `message` in the memory of process one. The first three parameters of the receive operation specify the location, size and type of the receive buffer. The next three parameters are used for selecting the incoming message. The last parameter is used to return information on the message just received.==

==The next sections describe the blocking send and receive operations. We discuss send, receive, blocking communication semantics, type matching requirements, type conversion in heterogeneous environments, and more general communication modes. Nonblocking communication is addressed next, followed by probing and cancelling a message, channel-like constructs and send-receive operations, ending with a description of the “dummy” process, `MPI_PROC_NULL`.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

Sending and receiving of *messages* by ==MPI== processes is the basic MPI communication mechanism. The basic point-to-point communication operations are *send* and *receive*. Their use is illustrated in Example [[versions/v41/sections/pt2pt#Introduction|Introduction]] .

~~    #include "mpi.h"     int main(int argc, char *argv[])     {       char message[20];       int myrank;       MPI_Status status;       MPI_Init(&argc, &argv);       MPI_Comm_rank(MPI_COMM_WORLD, &myrank);       if (myrank == 0)    /* code for process zero */       {           strcpy(message,"Hello, there");           MPI_Send(message, strlen(message)+1, MPI_CHAR, 1, 99, MPI_COMM_WORLD);       }       else if (myrank == 1)  /* code for process one */       {           MPI_Recv(message, 20, MPI_CHAR, 0, 99, MPI_COMM_WORLD, &status);           printf("received :%s:\n", message);       }       MPI_Finalize();       return 0;     }~~

~~In Example [[versions/v41/sections/pt2pt#Introduction|Introduction]] , process zero (`myrank = 0`) sends a *message* to process one using the *send* operation [[versions/v41/API/MPI_SEND|MPI_SEND]] . The operation specifies a *send buffer* in the sender memory from which the *message data* is taken. In the example above, the send buffer consists of the storage containing the variable `message` in the memory of process zero. The location, size and type of the send buffer are specified by the first three parameters of the send operation. The message sent will contain the 13 characters of this variable. In addition, the send operation associates an *envelope* with the message. This *envelope* specifies the message destination and contains distinguishing information that can be used by the *receive* operation to select a particular message. The last three parameters of the send operation, along with the rank of the sender, specify the *envelope* for the message sent. Process one (`myrank = 1`) receives this message with the *receive* operation [[versions/v41/API/MPI_RECV|MPI_RECV]] . The message to be received is selected according to the value of its *envelope*, and the *message data* is stored into the *receive buffer*. In the example above, the receive buffer consists of the storage containing the string `message` in the memory of process one. The first three parameters of the receive operation specify the location, size and type of the receive buffer. The next three parameters are used for selecting the incoming message. The last parameter is used to return information on the message just received.~~

~~The next sections describe the blocking send and receive operations. We discuss send, receive, blocking communication semantics, type matching requirements, type conversion in heterogeneous environments, and more general communication modes. Nonblocking communication is addressed next, followed by probing and cancelling a message, channel-like constructs and send-receive operations, ending with a description of the “dummy” process, `MPI_PROC_NULL`.~~

==(code block added)==
``` [MPI]C
#include "mpi.h"
int main(int argc, char *argv[])
{
  char message[20];
  int myrank;
  MPI_Status status;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
  if (myrank == 0)    /* code for process zero */
  {
      strcpy(message,"Hello, there");
      MPI_Send(message, strlen(message)+1, MPI_CHAR, 1, 99,
               MPI_COMM_WORLD);
  }
  else if (myrank == 1)  /* code for process one */
  {
      MPI_Recv(message, 20, MPI_CHAR, 0, 99, MPI_COMM_WORLD, &status);
      printf("received :%s:\n", message);
  }
  MPI_Finalize();
  return 0;
}
```

==In Example [[versions/v41/sections/pt2pt#Introduction|Introduction]] , process zero (`myrank = 0`, strictly ‘the MPI process with rank `0` in communicator `MPI_COMM_WORLD`’) sends a *message* to process one using the *send* operation [[versions/v41/API/MPI_SEND|MPI_SEND]] . The operation specifies a *send buffer* in the sender memory from which the *message data* is taken. In the example above, the send buffer consists of the storage containing the variable `message` in the memory of process zero. The location, size and type of the send buffer are specified by the first three parameters of the send operation. The message sent will contain the 13 characters of this variable. In addition, the send operation associates an *envelope* with the message. This *envelope* specifies the message destination and contains distinguishing information that can be used by the *receive* operation to select a particular message. The last three parameters of the send operation, along with the rank of the sender, specify the *envelope* for the message sent.==

==Process one (`myrank = 1`, strictly ‘the MPI process with rank `1` in communicator `MPI_COMM_WORLD`’) receives this message with the *receive* operation [[versions/v41/API/MPI_RECV|MPI_RECV]] . The message to be received is selected according to the value of its *envelope*, and the *message data* is stored into the *receive buffer*. In the example above, the receive buffer consists of the storage containing the string `message` in the memory of process one. The first three parameters of the receive operation specify the location, size and type of the receive buffer. The next three parameters are used for selecting the incoming message. The last parameter is used to return information on the message just received.==

==> [!note] Advice to users==

==> Colloquial usage commonly permits references to “rank 0” or “process 0”, which are strictly ambiguous and ideally should be qualified by including the relevant context, for example, the MPI communicator in the case above.==

==The next sections describe the blocking send and receive operations. We discuss send, receive, blocking communication semantics, type matching requirements, type conversion in heterogeneous environments, and more general communication modes. Nonblocking communication is addressed next, followed by probing and cancelling a message, channel-like constructs and send-receive operations, ending with a description of the “dummy” MPI process, `MPI_PROC_NULL`.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Introduction]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Introduction]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Introduction]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Introduction]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Introduction]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Introduction]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Introduction]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Introduction]]
