---
title: "All-to-All Scatter/Gather"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# All-to-All Scatter/Gather

Chapter **coll** · in [[versions/v13/sections/coll#All-to-All Scatter/Gather|MPI-1.3]], [[versions/v21/sections/coll#All-to-All Scatter/Gather|MPI-2.1]], [[versions/v22/sections/coll#All-to-All Scatter/Gather|MPI-2.2]], [[versions/v30/sections/coll#All-to-All Scatter/Gather|MPI-3.0]], [[versions/v31/sections/coll#All-to-All Scatter/Gather|MPI-3.1]], [[versions/v40/sections/coll#All-to-All Scatter/Gather|MPI-4.0]], [[versions/v41/sections/coll#All-to-All Scatter/Gather|MPI-4.1]], [[versions/v50/sections/coll#All-to-All Scatter/Gather|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (6 changed paragraphs)

~~`MPI_ALLTOALL` is an extension of `MPI_ALLGATHER` to the case where each process sends distinct data to each of the receivers. The `j`th block sent from process `i` is received by process `j` and is placed in the `i`th block of `recvbuf`.~~

==`MPI_ALLTOALL` is an extension of `MPI_ALLGATHER` to the case where each process sends distinct data to each of the receivers. The==

==`j`-th==

==block sent from process `i` is received by process `j` and is placed in the==

==`i`-th==

==block of `recvbuf`.==

~~The outcome is as if each process executed a send to each process (itself included) with a call to, ``` math MPI_Send(sendbuf+i\cdot sendcount\cdot extent(sendtype),sendcount,sendtype,i, ...), ```~~

~~and a receive from every other process with a call to, ``` math MPI_Recv(recvbuf+i\cdot recvcount\cdot extent(recvtype),recvcount,i,...). ```~~

==If `comm` is an intracommunicator,==

==the outcome is as if each process executed a send to each process (itself included) with a call to, ``` math MPI_Send(sendbuf+i\cdot sendcount\cdot extent(sendtype),sendcount,sendtype,i, ...), ```==

==and a receive from every other process with a call to, ``` math MPI_Recv(recvbuf+i\cdot recvcount\cdot extent(recvtype),recvcount,recvtype,i,...). ```==

==No “in place” option is supported.==

==If `comm` is an intercommunicator, then the outcome is as if each process in group A sends a message to each process in group B, and vice versa. The `j`-th send buffer of process `i` in group A should be consistent with the `i`-th receive buffer of process `j` in group B, and vice versa.==

==> [!note] Advice to users==

==> When all-to-all is executed on an intercommunication domain, then the number of data items sent from processes in group A to processes in group B need not equal the number of items sent in the reverse direction. In particular, one can have unidirectional communication by specifying `sendcount = 0` in the reverse direction.==

~~The `j`th block sent from process `i` is received by process `j` and is placed in the `i`th block of `recvbuf`. These blocks need not all have the same size.~~

==If `comm` is an intracommunicator, then==

==the==

==`j`-th==

==block sent from process `i` is received by process `j` and is placed in the==

==`i`-th==

==block of `recvbuf`. These blocks need not all have the same size.==

==No “in place” option is supported.==

==If `comm` is an intercommunicator, then the outcome is as if each process in group A sends a message to each process in group B, and vice versa. The `j`-th send buffer of process `i` in group A should be consistent with the `i`-th receive buffer of process `j` in group B, and vice versa.==

==![[versions/v21/API/MPI_ALLTOALLW]]==

==[[versions/v21/API/MPI_ALLTOALLW|MPI_ALLTOALLW]]==

==is the most general form of `All-to-all`. Like [[versions/v21/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , the most general type constructor, [[versions/v21/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] allows separate specification of count, displacement and datatype. In addition, to allow maximum flexibility, the displacement of blocks within the send and receive buffers is specified in bytes.==

==If `comm` is an intracommunicator, then==

==the `j`-th block sent from process `i` is received by process `j` and is placed in the `i`-th block of `recvbuf`. These blocks need not all have the same size.==

==The type signature associated with `sendcounts[j], sendtypes[j]` at process `i` must be equal to the type signature associated with `recvcounts[i], recvtypes[i]` at process `j`. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of processes. Distinct type maps between sender and receiver are still allowed.==

==The outcome is as if each process sent a message to every other process with ``` math MPI_Send(sendbuf+sdispls[i],sendcounts[i],sendtypes[i] ,i,...), ```==

==and received a message from every other process with a call to ``` math MPI_Recv(recvbuf+rdispls[i],recvcounts[i],recvtypes[i] ,i,...). ```==

==All arguments on all processes are significant. The argument `comm` must describe the same communicator on all processes.==

==No “in place” option is supported.==

==If `comm` is an intercommunicator, then the outcome is as if each process in group A sends a message to each process in group B, and vice versa. The `j`-th send buffer of process `i` in group A should be consistent with the `i`-th receive buffer of process `j` in group B, and vice versa.==

==> [!tip] Rationale==

==> The [[versions/v21/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] function generalizes several MPI functions by carefully selecting the input arguments. For example, by making all but one process have `sendcounts[i] = 0`, this achieves an `MPI_SCATTERW` function.==

### MPI-2.1 → MPI-2.2  (6 changed paragraphs)

~~No “in place” option is supported.~~

==The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` to the argument `sendbuf` at *all* processes. In such a case, `sendcount` and `sendtype` are ignored. The data to be sent is taken from the `recvbuf` and replaced by the received data. Data sent and received must have the same type map as specified by `recvcount` and `recvtype`.==

==> [!tip] Rationale==

==> For large [[versions/v22/API/MPI_ALLTOALL|MPI_ALLTOALL]] instances, allocating both send and receive buffers may consume too much memory. The “in place” option effectively halves the application memory consumption and is useful in situations where the data to be sent will not be used by the sending process after the [[versions/v22/API/MPI_ALLTOALL|MPI_ALLTOALL]] exchange (e.g., in parallel Fast Fourier Transforms).==

==> [!warning] Advice to implementors==

==> Users may opt to use the “in place” option in order to conserve memory. Quality MPI implementations should thus strive to minimize system buffering.==

> When ~~all-to-all~~ ==a complete exchange== is executed on an intercommunication domain, then the number of data items sent from processes in group A to processes in group B need not equal the number of items sent in the reverse direction. In particular, one can have unidirectional communication by specifying `sendcount = 0` in the reverse direction.

The type signature associated with ~~`sendcount[j],~~ ==`sendcounts[j],== sendtype` at process `i` must be equal to the type signature associated with ~~`recvcount[i],~~ ==`recvcounts[i],== recvtype` at process `j`. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of processes. Distinct type maps between sender and receiver are still allowed.

The outcome is as if each process sent a message to every other process with, ``` math ~~MPI_Send(sendbuf+displs[i]\cdot~~ ==MPI_Send(sendbuf+sdispls[i]\cdot== extent(sendtype),sendcounts[i],sendtype,i,...), ```

and received a message from every other process with a call to ``` math ~~MPI_Recv(recvbuf+displs[i]\cdot~~ ==MPI_Recv(recvbuf+rdispls[i]\cdot== extent(recvtype),recvcounts[i],recvtype,i,...). ```

~~No “in place” option is supported.~~

==The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` to the argument `sendbuf` at *all* processes. In such a case, `sendcounts`, `sdispls` and `sendtype` are ignored. The data to be sent is taken from the `recvbuf` and replaced by the received data. Data sent and received must have the same type map as specified by the `recvcounts` array and the `recvtype`, and is taken from the locations of the receive buffer specified by `rdispls`.==

==> [!note] Advice to users==

==> Specifying the “in place” option (which must be given on all processes) implies that the same amount and type of data is sent and received between any two processes in the group of the communicator. Different pairs of processes can exchange different amounts of data. Users must ensure that `recvcounts[j]` and `recvtype` on process `i` match `recvcounts[i]` and `recvtype` on process `j`. This symmetric exchange can be useful in applications where the data to be sent will not be used by the sending process after the [[versions/v22/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] exchange.==

is the most general form of ~~`All-to-all`.~~ ==complete exchange.== Like [[versions/v22/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , the most general type constructor, [[versions/v22/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] allows separate specification of count, displacement and datatype. In addition, to allow maximum flexibility, the displacement of blocks within the send and receive buffers is specified in bytes.

~~No~~ ==Like for [[versions/v22/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , the== “in place” option ==for intracommunicators== is ~~supported.~~ ==specified by passing `MPI_IN_PLACE` to the argument `sendbuf` at *all* processes. In such a case, `sendcounts`, `sdispls` and `sendtypes` are ignored. The data to be sent is taken from the `recvbuf` and replaced by the received data. Data sent and received must have the same type map as specified by the `recvcounts` and `recvtypes` arrays, and is taken from the locations of the receive buffer specified by `rdispls`.==

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~`j`-th~~

~~block sent from process `i` is received by process `j` and is placed in the~~

~~`i`-th~~

~~block of `recvbuf`.~~

==`j`-th block sent from process `i` is received by process `j` and is placed in the==

==`i`-th block of `recvbuf`.==

~~If `comm` is an intracommunicator,~~

~~the outcome is as if each process executed a send to each process (itself included) with a call to, ``` math MPI_Send(sendbuf+i\cdot sendcount\cdot extent(sendtype),sendcount,sendtype,i, ...), ```~~

==If `comm` is an intracommunicator, the outcome is as if each process executed a send to each process (itself included) with a call to, ``` math MPI_Send(sendbuf+i\cdot sendcount\cdot extent(sendtype),sendcount,sendtype,i, ...), ```==

~~If `comm` is an intracommunicator, then~~

~~the~~

~~`j`-th~~

~~block sent from process `i` is received by process `j` and is placed in the~~

~~`i`-th~~

~~block of `recvbuf`. These blocks need not all have the same size.~~

==If `comm` is an intracommunicator, then the==

==`j`-th block sent from process `i` is received by process `j` and is placed in the==

==`i`-th block of `recvbuf`. These blocks need not all have the same size.==

~~[[versions/v30/API/MPI_ALLTOALLW|MPI_ALLTOALLW]]~~

~~is the most general form of complete exchange. Like [[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , the most general type constructor, [[versions/v30/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] allows separate specification of count, displacement and datatype. In addition, to allow maximum flexibility, the displacement of blocks within the send and receive buffers is specified in bytes.~~

~~If `comm` is an intracommunicator, then~~

~~the `j`-th block sent from process `i` is received by process `j` and is placed in the `i`-th block of `recvbuf`. These blocks need not all have the same size.~~

==[[versions/v30/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] is the most general form of complete exchange. Like [[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , the most general type constructor, [[versions/v30/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] allows separate specification of count, displacement and datatype. In addition, to allow maximum flexibility, the displacement of blocks within the send and receive buffers is specified in bytes.==

==If `comm` is an intracommunicator, then the `j`-th block sent from process `i` is received by process `j` and is placed in the `i`-th block of `recvbuf`. These blocks need not all have the same size.==

### MPI-3.0 → MPI-3.1  (6 changed paragraphs)

~~`MPI_ALLTOALL` is an extension of `MPI_ALLGATHER` to the case where each process sends distinct data to each of the receivers. The~~

~~`j`-th block sent from process `i` is received by process `j` and is placed in the~~

~~`i`-th block of `recvbuf`.~~

==[[versions/v31/API/MPI_ALLTOALL|MPI_ALLTOALL]] is an extension of [[versions/v31/API/MPI_ALLGATHER|MPI_ALLGATHER]] to the case where each process sends distinct data to each of the receivers. The `j`-th block sent from process `i` is received by process `j` and is placed in the `i`-th block of `recvbuf`.==

~~If `comm` is an intracommunicator, the outcome is as if each process executed a send to each process (itself included) with a call to, ``` math MPI_Send(sendbuf+i\cdot sendcount\cdot extent(sendtype),sendcount,sendtype,i, ...), ```~~

~~and a receive from every other process with a call to, ``` math MPI_Recv(recvbuf+i\cdot recvcount\cdot extent(recvtype),recvcount,recvtype,i,...). ```~~

==If `comm` is an intracommunicator, the outcome is as if each process executed a send to each process (itself included) with a call to,==

==MPI_Send(sendbuf+i$`\cdot`$ sendcount$`\cdot`$ extent(sendtype),sendcount,sendtype,i, ...),==

==and a receive from every other process with a call to,==

==MPI_Recv(recvbuf+i $`\cdot`$ recvcount $`\cdot`$ extent(recvtype),recvcount,recvtype,i,...).==

~~`MPI_ALLTOALLV` adds flexibility to `MPI_ALLTOALL` in that the location of data for the send is specified by `sdispls` and the location of the placement of the data on the receive side is specified by `rdispls`.~~

~~If `comm` is an intracommunicator, then the~~

~~`j`-th block sent from process `i` is received by process `j` and is placed in the~~

~~`i`-th block of `recvbuf`. These blocks need not all have the same size.~~

==[[versions/v31/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] adds flexibility to [[versions/v31/API/MPI_ALLTOALL|MPI_ALLTOALL]] in that the location of data for the send is specified by `sdispls` and the location of the placement of the data on the receive side is specified by `rdispls`.==

==If `comm` is an intracommunicator, then the `j`-th block sent from process `i` is received by process `j` and is placed in the `i`-th block of `recvbuf`. These blocks need not all have the same size.==

~~The outcome is as if each process sent a message to every other process with, ``` math MPI_Send(sendbuf+sdispls[i]\cdot extent(sendtype),sendcounts[i],sendtype,i,...), ```~~

~~and received a message from every other process with a call to ``` math MPI_Recv(recvbuf+rdispls[i]\cdot extent(recvtype),recvcounts[i],recvtype,i,...). ```~~

==The outcome is as if each process sent a message to every other process with,==

==MPI_Send(sendbuf+sdispls\[i\]$`\cdot`$ extent(sendtype),sendcounts\[i\],sendtype,i,...),==

==and received a message from every other process with a call to==

==MPI_Recv(recvbuf+rdispls\[i\]$`\cdot`$ extent(recvtype),recvcounts\[i\],recvtype,i,...).==

> The definitions of ~~`MPI_ALLTOALL`~~ ==[[versions/v31/API/MPI_ALLTOALL|MPI_ALLTOALL]]== and ~~`MPI_ALLTOALLV`~~ ==[[versions/v31/API/MPI_ALLTOALLV|MPI_ALLTOALLV]]== give as much flexibility as one would achieve by specifying `n` independent, point-to-point communications, with two exceptions: all messages use the same datatype, and messages are scattered from (or gathered to) sequential storage.

~~The outcome is as if each process sent a message to every other process with ``` math MPI_Send(sendbuf+sdispls[i],sendcounts[i],sendtypes[i] ,i,...), ```~~

~~and received a message from every other process with a call to ``` math MPI_Recv(recvbuf+rdispls[i],recvcounts[i],recvtypes[i] ,i,...). ```~~

==The outcome is as if each process sent a message to every other process with==

==MPI_Send(sendbuf+sdispls\[i\],sendcounts\[i\],sendtypes\[i\] ,i,...),==

==and received a message from every other process with a call to==

==MPI_Recv(recvbuf+rdispls\[i\],recvcounts\[i\],recvtypes\[i\] ,i,...).==

### MPI-3.1 → MPI-4.0  (10 changed paragraphs)

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== the outcome is as if each process executed a send to each process (itself included) with a call to,

~~MPI_Recv(recvbuf+i $`\cdot`$ recvcount $`\cdot`$~~ ==MPI_Recv(recvbuf+i$`\cdot`$ recvcount$`\cdot`$== extent(recvtype),recvcount,recvtype,i,...).

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing `MPI_IN_PLACE` to the argument `sendbuf` at *all* processes. In such a case, `sendcount` and `sendtype` are ignored. The data to be sent is taken from the `recvbuf` and replaced by the received data. Data sent and received must have the same type map as specified by `recvcount` and `recvtype`.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the outcome is as if each process in group A sends a message to each process in group B, and vice versa. The `j`-th send buffer of process `i` in group A should be consistent with the `i`-th receive buffer of process `j` in group B, and vice versa.

> When a complete exchange is executed on an intercommunication domain, then the number of data items sent from processes in group A to processes in group B need not equal the number of items sent in the reverse direction. In particular, one can have unidirectional communication by specifying ~~`sendcount =~~ ==`sendcount``=== 0` in the reverse direction.

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== then the `j`-th block sent from process `i` is received by process `j` and is placed in the `i`-th block of `recvbuf`. These blocks need not all have the same size.

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing `MPI_IN_PLACE` to the argument `sendbuf` at *all* processes. In such a case, `sendcounts`, `sdispls` and `sendtype` are ignored. The data to be sent is taken from the `recvbuf` and replaced by the received data. Data sent and received must have the same type map as specified by the `recvcounts` array and the `recvtype`, and is taken from the locations of the receive buffer specified by `rdispls`.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the outcome is as if each process in group A sends a message to each process in group B, and vice versa. The `j`-th send buffer of process `i` in group A should be consistent with the `i`-th receive buffer of process `j` in group B, and vice versa.

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== then the `j`-th block sent from process `i` is received by process `j` and is placed in the `i`-th block of `recvbuf`. These blocks need not all have the same size.

Like for [[versions/v40/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , the “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing `MPI_IN_PLACE` to the argument `sendbuf` at *all* processes. In such a case, `sendcounts`, `sdispls` and `sendtypes` are ignored. The data to be sent is taken from the `recvbuf` and replaced by the received data. Data sent and received must have the same type map as specified by the `recvcounts` and `recvtypes` arrays, and is taken from the locations of the receive buffer specified by `rdispls`.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the outcome is as if each process in group A sends a message to each process in group B, and vice versa. The `j`-th send buffer of process `i` in group A should be consistent with the `i`-th receive buffer of process `j` in group B, and vice versa.

### MPI-4.0 → MPI-4.1  (14 changed paragraphs)

[[versions/v41/API/MPI_ALLTOALL|MPI_ALLTOALL]] is an extension of [[versions/v41/API/MPI_ALLGATHER|MPI_ALLGATHER]] to the case where each ==MPI== process sends distinct data to each of the receivers. The `j`-th block sent from ==MPI== process `i` is received by ==MPI== process `j` and is placed in the `i`-th block of `recvbuf`.

The type signature associated with `sendcount, sendtype`, at ~~a~~ ==an MPI== process must be equal to the type signature associated with `recvcount, recvtype` at any other ==MPI== process. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of ==MPI== processes. As usual, however, the type maps may be different.

If `comm` is an intra-communicator, the outcome is as if each ==MPI== process executed a send to each ==MPI== process (itself included) with a call to,

and a receive from every other ==MPI== process with a call to,

All arguments on all ==MPI== processes are significant. The argument `comm` must have identical values on all ==MPI== processes.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` to the argument `sendbuf` at *all* ==MPI== processes. In such a case, `sendcount` and `sendtype` are ignored. The data to be sent is taken from the `recvbuf` and replaced by the received data. Data sent and received must have the same type map as specified by `recvcount` and `recvtype`.

> For large [[versions/v41/API/MPI_ALLTOALL|MPI_ALLTOALL]] instances, allocating both send and receive buffers may consume too much memory. The “in place” option effectively halves the application memory consumption and is useful in situations where the data to be sent will not be used by the sending ==MPI== process after the [[versions/v41/API/MPI_ALLTOALL|MPI_ALLTOALL]] exchange (e.g., in parallel Fast Fourier Transforms).

If `comm` is an inter-communicator, then the outcome is as if each ==MPI== process in group A sends a message to each ==MPI== process in group B, and vice versa. The `j`-th send buffer of ==MPI== process `i` in group A should be consistent with the `i`-th receive buffer of ==MPI== process `j` in group B, and vice versa.

> When a complete exchange is executed ~~on an intercommunication domain,~~ ==in the inter-communicator case,== then the number of data items sent from ==MPI== processes in group A to ==MPI== processes in group B need not equal the number of items sent in the reverse direction. In particular, one can have unidirectional communication by specifying `sendcount``= 0` in the reverse direction.

If `comm` is an intra-communicator, then the `j`-th block sent from ==MPI== process `i` is received by ==MPI== process `j` and is placed in the `i`-th block of `recvbuf`. These blocks need not all have the same size.

The type signature associated with `sendcounts[j], sendtype` at ==MPI== process `i` must be equal to the type signature associated with `recvcounts[i], recvtype` at ==MPI== process `j`. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of ==MPI== processes. Distinct type maps between sender and receiver are still allowed.

The outcome is as if each ==MPI== process sent a message to every other ==MPI== process with,

and received a message from every other ==MPI== process with a call to

All arguments on all ==MPI== processes are significant. The argument `comm` must have identical values on all ==MPI== processes.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` to the argument `sendbuf` at *all* ==MPI== processes. In such a case, `sendcounts`, `sdispls` and `sendtype` are ignored. The data to be sent is taken from the `recvbuf` and replaced by the received data. Data sent and received must have the same type map as specified by the `recvcounts` array and the `recvtype`, and is taken from the locations of the receive buffer specified by `rdispls`.

> Specifying the “in place” option (which must be given on all ==MPI== processes) implies that the same amount and type of data is sent and received between any two ==MPI== processes in the group of the communicator. Different pairs of ==MPI== processes can exchange different amounts of data. Users must ensure that `recvcounts[j]` and `recvtype` on ==MPI== process `i` match `recvcounts[i]` and `recvtype` on ==MPI== process `j`. This symmetric exchange can be useful in applications where the data to be sent will not be used by the sending ==MPI== process after the [[versions/v41/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] exchange.

If `comm` is an inter-communicator, then the outcome is as if each ==MPI== process in group A sends a message to each ==MPI== process in group B, and vice versa. The `j`-th send buffer of ==MPI== process `i` in group A should be consistent with the `i`-th receive buffer of ==MPI== process `j` in group B, and vice versa.

If `comm` is an intra-communicator, then the `j`-th block sent from ==MPI== process `i` is received by ==MPI== process `j` and is placed in the `i`-th block of `recvbuf`. These blocks need not all have the same size.

The type signature associated with `sendcounts[j], sendtypes[j]` at ==MPI== process `i` must be equal to the type signature associated with `recvcounts[i], recvtypes[i]` at ==MPI== process `j`. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of ==MPI== processes. Distinct type maps between sender and receiver are still allowed.

The outcome is as if each ==MPI== process sent a message to every other ==MPI== process with

and received a message from every other ==MPI== process with a call to

All arguments on all ==MPI== processes are significant. The argument `comm` must describe the same communicator on all ==MPI== processes.

Like for [[versions/v41/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , the “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` to the argument `sendbuf` at *all* ==MPI== processes. In such a case, `sendcounts`, `sdispls` and `sendtypes` are ignored. The data to be sent is taken from the `recvbuf` and replaced by the received data. Data sent and received must have the same type map as specified by the `recvcounts` and `recvtypes` arrays, and is taken from the locations of the receive buffer specified by `rdispls`.

If `comm` is an inter-communicator, then the outcome is as if each ==MPI== process in group A sends a message to each ==MPI== process in group B, and vice versa. The `j`-th send buffer of ==MPI== process `i` in group A should be consistent with the `i`-th receive buffer of ==MPI== process `j` in group B, and vice versa.

> The [[versions/v41/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] function generalizes several MPI functions by carefully selecting the input arguments. For example, by making all but one ==MPI== process have `sendcounts[i] = 0`, this achieves an `MPI_SCATTERW` function.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

> The [[versions/v50/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] function generalizes several MPI functions by carefully selecting the input arguments. For example, by making all but one MPI process have `sendcounts[i] = 0`, this achieves ==what one would expect from== an ~~`MPI_SCATTERW` function.~~ ==[[MPI_SCATTERW]] , if such a function existed, which is equivalent to an [[versions/v50/API/MPI_SCATTERV|MPI_SCATTERV]] with the blocks not all needing to have the same datatypes.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#All-to-All Scatter/Gather]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#All-to-All Scatter/Gather]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#All-to-All Scatter/Gather]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#All-to-All Scatter/Gather]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#All-to-All Scatter/Gather]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#All-to-All Scatter/Gather]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#All-to-All Scatter/Gather]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#All-to-All Scatter/Gather]]
