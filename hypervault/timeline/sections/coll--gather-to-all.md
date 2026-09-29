---
title: "Gather-to-all"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1"]
tags: [mpi/section, mpi/coll]
---

# Gather-to-all

Chapter **coll** · in [[versions/v13/sections/coll#Gather-to-all|MPI-1.3]], [[versions/v21/sections/coll#Gather-to-all|MPI-2.1]], [[versions/v22/sections/coll#Gather-to-all|MPI-2.2]], [[versions/v30/sections/coll#Gather-to-all|MPI-3.0]], [[versions/v31/sections/coll#Gather-to-all|MPI-3.1]], [[versions/v40/sections/coll#Gather-to-all|MPI-4.0]], [[versions/v41/sections/coll#Gather-to-all|MPI-4.1]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (6 changed paragraphs)

~~The block of data sent from the `j`th process is received by every process and placed in the `j`th block of the buffer `recvbuf`.~~

==The block of data sent from the==

==`j`-th==

==process is received by every process and placed in the==

==`j`-th==

==block of the buffer `recvbuf`.==

~~The outcome of a call to [[versions/v21/API/MPI_ALLGATHER|MPI_ALLGATHER]] is as if all processes executed `n` calls to~~

==If `comm` is an intracommunicator,==

==the outcome of a call to [[versions/v21/API/MPI_ALLGATHER|MPI_ALLGATHER]] is as if all processes executed `n` calls to==

==The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. `sendcount` and `sendtype` are ignored. Then the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive==

==buffer.==

==If `comm` is an intercommunicator, then each process in group A contributes a data item; these items are concatenated and the result is stored at each process in group B. Conversely the concatenation of the contributions of the processes in group B is stored at each process in group A. The send buffer arguments in group A must be consistent with the receive buffer arguments in group B, and vice versa.==

==> [!note] Advice to users==

==> The communication pattern of [[versions/v21/API/MPI_ALLGATHER|MPI_ALLGATHER]] executed on an intercommunication domain need not be symmetric. The number of items sent by processes in group A (as specified by the arguments `sendcount, sendtype` in group A and the arguments `recvcount, recvtype` in group B), need not equal the number of items sent by processes in group B (as specified by the arguments `sendcount, sendtype` in group B and the arguments `recvcount, recvtype` in group A). In particular, one can move data in only one direction by specifying `sendcount = 0` for the communication in the reverse direction.==

~~The block of data sent from the `j`th process is received by every process and placed in the `j`th block of the buffer `recvbuf`.~~

==The block of data sent from the==

==`j`-th==

==process is received by every process and placed in the==

==`j`-th==

==block of the buffer `recvbuf`.==

~~The outcome is as if all processes executed calls to~~

==If `comm` is an intracommunicator,==

==the outcome is as if all processes executed calls to==

==The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. `sendcount` and `sendtype` are ignored. Then the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive==

==buffer.==

==If `comm` is an intercommunicator, then each process in group A contributes a data item; these items are concatenated and the result is stored at each process in group B. Conversely the concatenation of the contributions of the processes in group B is stored at each process in group A. The send buffer arguments in group A must be consistent with the receive buffer arguments in group B, and vice versa.==

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

~~MPI_GATHER(sendbuf,sendcount,sendtype,recvbuf,recvcount, recvtype,root,comm),~~ ==MPI_Gather(sendbuf,sendcount,sendtype,recvbuf,recvcount, recvtype,root,comm)==

If `comm` is an intercommunicator, then each process ~~in~~ ==of one== group ~~A~~ ==(group A)== contributes ~~a~~ ==`sendcount`== data ~~item;~~ ==items;== these ~~items~~ ==data== are concatenated and the result is stored at each process in ==the other== group ~~B.~~ ==(group B).== Conversely the concatenation of the contributions of the processes in group B is stored at each process in group A. The send buffer arguments in group A must be consistent with the receive buffer arguments in group B, and vice versa.

The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. ==In such a case,== `sendcount` and `sendtype` are ~~ignored. Then~~ ==ignored, and== the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive

If `comm` is an intercommunicator, then each process ~~in~~ ==of one== group ~~A~~ ==(group A)== contributes ~~a~~ ==`sendcount`== data ~~item;~~ ==items;== these ~~items~~ ==data== are concatenated and the result is stored at each process in ==the other== group ~~B.~~ ==(group B).== Conversely the concatenation of the contributions of the processes in group B is stored at each process in group A. The send buffer arguments in group A must be consistent with the receive buffer arguments in group B, and vice versa.

### MPI-2.2 → MPI-3.0  (6 changed paragraphs)

~~`MPI_ALLGATHER` can be thought of as `MPI_GATHER`, but where all processes receive the result, instead of just the root.~~

~~The block of data sent from the~~

~~`j`-th~~

~~process is received by every process and placed in the~~

~~`j`-th~~

~~block of the buffer `recvbuf`.~~

==`MPI_ALLGATHER` can be thought of as `MPI_GATHER`, but where all processes receive the result, instead of just the root. The block of data sent from the `j`-th process is received by every process and placed in the `j`-th block of the buffer `recvbuf`.==

~~If `comm` is an intracommunicator,~~

~~the outcome of a call to [[versions/v30/API/MPI_ALLGATHER|MPI_ALLGATHER]] is as if all processes executed `n` calls to~~

==If `comm` is an intracommunicator, the outcome of a call to [[versions/v30/API/MPI_ALLGATHER|MPI_ALLGATHER]] is as if all processes executed `n` calls to==

~~The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. `sendcount` and `sendtype` are ignored. Then the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive~~

~~buffer.~~

==The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. `sendcount` and `sendtype` are ignored. Then the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive buffer.==

~~`MPI_ALLGATHERV` can be thought of as `MPI_GATHERV`, but where all processes receive the result, instead of just the root.~~

~~The block of data sent from the~~

~~`j`-th~~

~~process is received by every process and placed in the~~

~~`j`-th~~

~~block of the buffer `recvbuf`.~~

~~These blocks need not all be the same size.~~

==`MPI_ALLGATHERV` can be thought of as `MPI_GATHERV`, but where all processes receive the result, instead of just the root. The block of data sent from the `j`-th process is received by every process and placed in the `j`-th block of the buffer `recvbuf`. These blocks need not all be the same size.==

~~If `comm` is an intracommunicator,~~

~~the outcome is as if all processes executed calls to~~

~~        MPI_GATHERV(sendbuf,sendcount,sendtype,recvbuf,recvcounts,displs,                                                        recvtype,root,comm),~~

==If `comm` is an intracommunicator, the outcome is as if all processes executed calls to==

==        MPI_Gatherv(sendbuf,sendcount,sendtype,recvbuf,recvcounts,displs,                                                        recvtype,root,comm),==

~~The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. In such a case, `sendcount` and `sendtype` are ignored, and the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive~~

~~buffer.~~

==The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. In such a case, `sendcount` and `sendtype` are ignored, and the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive buffer.==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~`MPI_ALLGATHER`~~ ==[[versions/v31/API/MPI_ALLGATHER|MPI_ALLGATHER]]== can be thought of as ~~`MPI_GATHER`,~~ ==[[versions/v31/API/MPI_GATHER|MPI_GATHER]] ,== but where all processes receive the result, instead of just the root. The block of data sent from the `j`-th process is received by every process and placed in the `j`-th block of the buffer `recvbuf`.

for `root = 0 , ..., n-1`. The rules for correct usage of ~~`MPI_ALLGATHER`~~ ==[[versions/v31/API/MPI_ALLGATHER|MPI_ALLGATHER]]== are easily found from the corresponding rules for ~~`MPI_GATHER`.~~ ==[[versions/v31/API/MPI_GATHER|MPI_GATHER]] .==

~~`MPI_ALLGATHERV`~~ ==[[versions/v31/API/MPI_ALLGATHERV|MPI_ALLGATHERV]]== can be thought of as ~~`MPI_GATHERV`,~~ ==[[versions/v31/API/MPI_GATHERV|MPI_GATHERV]] ,== but where all processes receive the result, instead of just the root. The block of data sent from the `j`-th process is received by every process and placed in the `j`-th block of the buffer `recvbuf`. These blocks need not all be the same size.

for `root = 0 , ..., n-1`. The rules for correct usage of ~~`MPI_ALLGATHERV`~~ ==[[versions/v31/API/MPI_ALLGATHERV|MPI_ALLGATHERV]]== are easily found from the corresponding rules for ~~`MPI_GATHERV`.~~ ==[[versions/v31/API/MPI_GATHERV|MPI_GATHERV]] .==

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== the outcome of a call to [[versions/v40/API/MPI_ALLGATHER|MPI_ALLGATHER]] is as if all processes executed `n` calls to

for `root = ~~0 ,~~ ==0,== ..., n-1`. The rules for correct usage of [[versions/v40/API/MPI_ALLGATHER|MPI_ALLGATHER]] are easily found from the corresponding rules for [[versions/v40/API/MPI_GATHER|MPI_GATHER]] .

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. `sendcount` and `sendtype` are ignored. Then the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive buffer.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then each process of one group (group A) contributes `sendcount` data items; these data are concatenated and the result is stored at each process in the other group (group B). Conversely the concatenation of the contributions of the processes in group B is stored at each process in group A. The send buffer arguments in group A must be consistent with the receive buffer arguments in group B, and vice versa.

> The communication pattern of [[versions/v40/API/MPI_ALLGATHER|MPI_ALLGATHER]] executed on an intercommunication domain need not be symmetric. The number of items sent by processes in group A (as specified by the arguments `sendcount, sendtype` in group A and the arguments `recvcount, recvtype` in group B), need not equal the number of items sent by processes in group B (as specified by the arguments `sendcount, sendtype` in group B and the arguments `recvcount, recvtype` in group A). In particular, one can move data in only one direction by specifying ~~`sendcount =~~ ==`sendcount``=== 0` for the communication in the reverse direction.

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== the outcome is as if all processes executed calls to

for `root = ~~0 ,~~ ==0,== ..., n-1`. The rules for correct usage of [[versions/v40/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] are easily found from the corresponding rules for [[versions/v40/API/MPI_GATHERV|MPI_GATHERV]] .

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. In such a case, `sendcount` and `sendtype` are ignored, and the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive buffer.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then each process of one group (group A) contributes `sendcount` data items; these data are concatenated and the result is stored at each process in the other group (group B). Conversely the concatenation of the contributions of the processes in group B is stored at each process in group A. The send buffer arguments in group A must be consistent with the receive buffer arguments in group B, and vice versa.

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

[[versions/v41/API/MPI_ALLGATHER|MPI_ALLGATHER]] can be thought of as [[versions/v41/API/MPI_GATHER|MPI_GATHER]] , but where all ==MPI== processes receive the result, instead of just the root. The block of data sent from the `j`-th ==MPI== process is received by every ==MPI== process and placed in the `j`-th block of the buffer `recvbuf`.

The type signature associated with `sendcount, sendtype`, at ~~a~~ ==an MPI== process must be equal to the type signature associated with `recvcount, recvtype` at any other ==MPI== process.

If `comm` is an intra-communicator, the outcome of a call to [[versions/v41/API/MPI_ALLGATHER|MPI_ALLGATHER]] is as if all ==MPI== processes executed `n` calls to

for `root = 0, ..., n-1`. The rules for correct usage of [[versions/v41/API/MPI_ALLGATHER|MPI_ALLGATHER]] ~~are easily~~ ==can be== found ~~from~~ ==in== the corresponding rules for [[versions/v41/API/MPI_GATHER|MPI_GATHER]] ~~.~~ ==(see Section [[versions/v41/sections/coll#Gather|Gather]] ).==

The “in place” option for intra-communicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all ==MPI== processes. `sendcount` and `sendtype` are ignored. Then the input data of each ==MPI== process is assumed to be in the area where that ==MPI== process would receive its own contribution to the receive buffer.

If `comm` is an inter-communicator, then each ==MPI== process of one group (group A) contributes `sendcount` data items; these data are concatenated and the result is stored at each ==MPI== process in the other group (group B). Conversely the concatenation of the contributions of the ==MPI== processes in group B is stored at each ==MPI== process in group A. The send buffer arguments in group A must be consistent with the receive buffer arguments in group B, and vice versa.

> ~~The~~ ==In the inter-communicator case, the== communication pattern of [[versions/v41/API/MPI_ALLGATHER|MPI_ALLGATHER]] ~~executed on an intercommunication domain~~ need not be symmetric. The number of items sent by ==MPI== processes in group A (as specified by the arguments `sendcount, sendtype` in group A and the arguments `recvcount, recvtype` in group B), need not equal the number of items sent by ==MPI== processes in group B (as specified by the arguments `sendcount, sendtype` in group B and the arguments `recvcount, recvtype` in group A). In particular, one can move data in only one direction by specifying `sendcount``= 0` for the communication in the reverse direction.

[[versions/v41/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] can be thought of as [[versions/v41/API/MPI_GATHERV|MPI_GATHERV]] , but where all processes receive the result, instead of just the root. The block of data sent from the `j`-th ==MPI== process is received by every ==MPI== process and placed in the `j`-th block of the buffer `recvbuf`. These blocks need not all be the same size.

The type signature associated with `sendcount, sendtype`, at ==MPI== process `j` must be equal to the type signature associated with `recvcounts[j], recvtype` at any other ==MPI== process.

If `comm` is an intra-communicator, the outcome is as if all ==MPI== processes executed calls to

for `root = 0, ..., n-1`. The rules for correct usage of [[versions/v41/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] ~~are easily~~ ==can be== found ~~from~~ ==in== the corresponding rules for [[versions/v41/API/MPI_GATHERV|MPI_GATHERV]] ~~.~~ ==(see Section [[versions/v41/sections/coll#Gather|Gather]] ).==

The “in place” option for intra-communicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all ==MPI== processes. In such a case, `sendcount` and `sendtype` are ignored, and the input data of each ==MPI== process is assumed to be in the area where that ==MPI== process would receive its own contribution to the receive buffer.

If `comm` is an inter-communicator, then each ==MPI== process of one group (group A) contributes `sendcount` data items; these data are concatenated and the result is stored at each ==MPI== process in the other group (group B). Conversely the concatenation of the contributions of the ==MPI== processes in group B is stored at each ==MPI== process in group A. The send buffer arguments in group A must be consistent with the receive buffer arguments in group B, and vice versa.

### MPI-4.1 → MPI-5.0

_Section absent from MPI-5.0._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Gather-to-all]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Gather-to-all]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Gather-to-all]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Gather-to-all]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Gather-to-all]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Gather-to-all]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Gather-to-all]]
