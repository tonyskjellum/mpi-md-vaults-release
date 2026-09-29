---
title: "Gather"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Gather

Chapter **coll** · in [[versions/v13/sections/coll#Gather|MPI-1.3]], [[versions/v20/sections/collective#Gather|MPI-2.0]], [[versions/v21/sections/coll#Gather|MPI-2.1]], [[versions/v22/sections/coll#Gather|MPI-2.2]], [[versions/v30/sections/coll#Gather|MPI-3.0]], [[versions/v31/sections/coll#Gather|MPI-3.1]], [[versions/v40/sections/coll#Gather|MPI-4.0]], [[versions/v41/sections/coll#Gather|MPI-4.1]], [[versions/v50/sections/coll#Gather|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (7 changed paragraphs)

~~Each process (root process included) sends the contents of its send buffer to the root process. The root process receives the messages and stores them in rank order. The outcome is *as if* each of the `n` processes in the group (including the root process) had executed a call to ``` math MPI_Send(sendbuf, sendcount, sendtype, root , ...), ```~~

==If `comm` is an intracommunicator,==

==each process (root process included) sends the contents of its send buffer to the root process. The root process receives the messages and stores them in rank order. The outcome is *as if* each of the `n` processes in the group (including the root process) had executed a call to ``` math MPI_Send(sendbuf, sendcount, sendtype, root , ...), ```==

~~General, derived datatypes are allowed for both `sendtype` and `recvtype`. The type signature of `sendcount, sendtype` on process `i` must be equal to the type signature of `recvcount, recvtype` at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.~~

~~All arguments to the function are significant on process `root`, while on other processes, only arguments `sendbuf, sendcount, sendtype, root, comm` are significant. The arguments `root` and `comm` must have identical values on all processes.~~

==General, derived datatypes are allowed for both `sendtype` and `recvtype`. The type signature of `sendcount, sendtype` on==

==each process==

==must be equal to the type signature of `recvcount, recvtype` at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.==

==All arguments to the function are significant on process `root`, while on other processes, only arguments `sendbuf, sendcount, sendtype, root`,==

==and==

==`comm` are significant. The arguments `root` and `comm` must have identical values on all processes.==

==The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `sendbuf` at the root. In such a case, `sendcount` and `sendtype` are ignored, and the contribution of the root to the gathered vector is assumed to be already in the correct place in the receive buffer.==

==If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is gathered from all processes in group B to the root. The send buffer arguments of the processes in group B must be consistent with the receive buffer argument of the root.==

~~The outcome is *as if* each process, including the root process, sends a message to the root, ``` math MPI_Send(sendbuf, sendcount, sendtype, root, ...), ```~~

==If `comm` is an intracommunicator,==

==the outcome is *as if* each process, including the root process, sends a message to the root, ``` math MPI_Send(sendbuf, sendcount, sendtype, root, ...), ```==

~~(code block removed)~~
``` math
MPI_Recv(recvbuf+displs[i]\cdot extent(recvtype), recvcounts[i],
recvtype, i, ...).
```

~~Messages are placed in the receive buffer of the root process in rank order, that is, the data sent from process `j` is placed in the `j`th portion of the receive buffer `recvbuf` on process `root`. The `j`th portion of `recvbuf` begins at offset `displs[j]` elements (in terms of `recvtype`) into `recvbuf`.~~

==(code block added)==
``` math
MPI_Recv(recvbuf+displs[j]\cdot extent(recvtype), recvcounts[j],

recvtype, i, ...).
```

==The==

==data received from process `j` is placed into `recvbuf` of the `root` process beginning at offset `displs[j]` elements (in terms of the `recvtype`).==

~~All arguments to the function are significant on process `root`, while on other processes, only arguments `sendbuf, sendcount, sendtype, root, comm` are significant. The arguments `root` and `comm` must have identical values on all processes.~~

==All arguments to the function are significant on process `root`, while on other processes, only arguments `sendbuf, sendcount, sendtype, root`,==

==and==

==`comm` are significant. The arguments `root` and `comm` must have identical values on all processes.==

==The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `sendbuf` at the root. In such a case, `sendcount` and `sendtype` are ignored, and the contribution of the root to the gathered vector is assumed to be already in the correct place in the receive buffer==

==If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is gathered from all processes in group B to the root. The send buffer arguments of the processes in group B must be consistent with the receive buffer argument of the root.==

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

==If `comm` is an intracommunicator,==

==each process (root process included) sends the contents of its send buffer to the root process. The root process receives the messages and stores them in rank order. The outcome is *as if* each of the `n` processes in the group (including the root process) had executed a call to ``` math MPI_Send(sendbuf, sendcount, sendtype, root , ...), ```==

==and the root had executed `n` calls to ``` math MPI_Recv(recvbuf+i\cdot recvcount\cdot extent(recvtype), recvcount, recvtype, i ,...), ```==

==where `extent(recvtype)` is the type extent obtained from a call to `MPI_Type_extent()`.==

==An alternative description is that the `n` messages sent by the processes in the group are concatenated in rank order, and the resulting message is received by the root as if by a call to [[versions/v21/API/MPI_RECV|MPI_RECV]] .==

==The receive buffer is ignored for all non-root processes.==

==General, derived datatypes are allowed for both `sendtype` and `recvtype`. The type signature of `sendcount, sendtype` on==

==each process==

==must be equal to the type signature of `recvcount, recvtype` at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.==

==All arguments to the function are significant on process `root`, while on other processes, only arguments `sendbuf, sendcount, sendtype, root`,==

==and==

==`comm` are significant. The arguments `root` and `comm` must have identical values on all processes.==

==The specification of counts and types should not cause any location on the root to be written more than once. Such a call is erroneous.==

==Note that the `recvcount` argument at the root indicates the number of items it receives from *each* process, not the total number of items it receives.==

==The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `sendbuf` at the root. In such a case, `sendcount` and `sendtype` are ignored, and the contribution of the root to the gathered vector is assumed to be already in the correct place in the receive buffer.==

==If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is gathered from all processes in group B to the root. The send buffer arguments of the processes in group B must be consistent with the receive buffer argument of the root.==

==![[versions/v21/API/MPI_GATHERV]]==

==`MPI_GATHERV` extends the functionality of `MPI_GATHER` by allowing a varying count of data from each process, since `recvcounts` is now an array. It also allows more flexibility as to where the data is placed on the root, by providing the new argument, `displs`.==

==If `comm` is an intracommunicator,==

==the outcome is *as if* each process, including the root process, sends a message to the root, ``` math MPI_Send(sendbuf, sendcount, sendtype, root, ...), ```==

==and the root executes `n` receives,==

==(code block added)==
``` math
MPI_Recv(recvbuf+displs[j]\cdot extent(recvtype), recvcounts[j],

recvtype, i, ...).
```

==The==

==data received from process `j` is placed into `recvbuf` of the `root` process beginning at offset `displs[j]` elements (in terms of the `recvtype`).==

==The receive buffer is ignored for all non-root processes.==

==The type signature implied by `sendcount, sendtype` on process `i` must be equal to the type signature implied by `recvcounts[i], recvtype` at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed, as illustrated in Example [[coll-exD]] .==

==All arguments to the function are significant on process `root`, while on other processes, only arguments `sendbuf, sendcount, sendtype, root`,==

==and==

==`comm` are significant. The arguments `root` and `comm` must have identical values on all processes.==

==The specification of counts, types, and displacements should not cause any location on the root to be written more than once. Such a call is erroneous.==

~~![[versions/v21/API/MPI_GATHERV]]~~

~~The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `sendbuf` at the root. In such a case, `sendcount` and `sendtype` are ignored, and the contribution of the root to the gathered vector is assumed to be already in the correct place in the receive buffer~~

~~If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is gathered from all processes in group B to the root. The send buffer arguments of the processes in group B must be consistent with the receive buffer argument of the root.~~

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

and the root had executed `n` calls to ``` math MPI_Recv(recvbuf+i\cdot recvcount\cdot extent(recvtype), recvcount, recvtype, ~~i ,...),~~ ==i,...),== ```

where `extent(recvtype)` is the type extent obtained from a call to ~~`MPI_Type_extent()`.~~ ==`MPI_Type_get_extent()`.==

If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== in `root`. Data is gathered from all processes in group B to the root. The send buffer arguments of the processes in group B must be consistent with the receive buffer argument of the root.

If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== in `root`. Data is gathered from all processes in group B to the root. The send buffer arguments of the processes in group B must be consistent with the receive buffer argument of the root.

### MPI-2.2 → MPI-3.0  (6 changed paragraphs)

~~If `comm` is an intracommunicator,~~

~~each process (root process included) sends the contents of its send buffer to the root process. The root process receives the messages and stores them in rank order. The outcome is *as if* each of the `n` processes in the group (including the root process) had executed a call to ``` math MPI_Send(sendbuf, sendcount, sendtype, root , ...), ```~~

==If `comm` is an intracommunicator, each process (root process included) sends the contents of its send buffer to the root process. The root process receives the messages and stores them in rank order. The outcome is *as if* each of the `n` processes in the group (including the root process) had executed a call to ``` math MPI_Send(sendbuf, sendcount, sendtype, root , ...), ```==

where `extent(recvtype)` is the type extent obtained from a call to ~~`MPI_Type_get_extent()`.~~ ==`MPI_Type_get_extent`.==

~~each process~~

~~must be equal to the type signature of `recvcount, recvtype` at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.~~

~~All arguments to the function are significant on process `root`, while on other processes, only arguments `sendbuf, sendcount, sendtype, root`,~~

~~and~~

~~`comm` are significant. The arguments `root` and `comm` must have identical values on all processes.~~

==each process must be equal to the type signature of `recvcount, recvtype` at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.==

==All arguments to the function are significant on process `root`, while on other processes, only arguments `sendbuf, sendcount, sendtype, root`, and `comm` are significant. The arguments `root` and `comm` must have identical values on all processes.==

~~If `comm` is an intracommunicator,~~

~~the outcome is *as if* each process, including the root process, sends a message to the root, ``` math MPI_Send(sendbuf, sendcount, sendtype, root, ...), ```~~

~~and the root executes `n` receives,~~

~~(code block removed)~~
``` math
MPI_Recv(recvbuf+displs[j]\cdot extent(recvtype), recvcounts[j],

recvtype, i, ...).
```

~~The~~

~~data received from process `j` is placed into `recvbuf` of the `root` process beginning at offset `displs[j]` elements (in terms of the `recvtype`).~~

==If `comm` is an intracommunicator, the outcome is *as if* each process, including the root process, sends a message to the root, ``` math MPI_Send(sendbuf, sendcount, sendtype, root, ...), ```==

==and the root executes `n` receives, ``` math MPI_Recv(recvbuf+displs[j]\cdot extent(recvtype), recvcounts[j], recvtype, i, ...). ```==

==The data received from process `j` is placed into `recvbuf` of the `root` process beginning at offset `displs[j]` elements (in terms of the `recvtype`).==

~~All arguments to the function are significant on process `root`, while on other processes, only arguments `sendbuf, sendcount, sendtype, root`,~~

~~and~~

~~`comm` are significant. The arguments `root` and `comm` must have identical values on all processes.~~

==All arguments to the function are significant on process `root`, while on other processes, only arguments `sendbuf, sendcount, sendtype, root`, and `comm` are significant. The arguments `root` and `comm` must have identical values on all processes.==

The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `sendbuf` at the root. In such a case, `sendcount` and `sendtype` are ignored, and the contribution of the root to the gathered vector is assumed to be already in the correct place in the receive ~~buffer~~ ==buffer.==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~If `comm` is an intracommunicator, each process (root process included) sends the contents of its send buffer to the root process. The root process receives the messages and stores them in rank order. The outcome is *as if* each of the `n` processes in the group (including the root process) had executed a call to ``` math MPI_Send(sendbuf, sendcount, sendtype, root , ...), ```~~

~~and the root had executed `n` calls to ``` math MPI_Recv(recvbuf+i\cdot recvcount\cdot extent(recvtype), recvcount, recvtype, i,...), ```~~

==If `comm` is an intracommunicator, each process (root process included) sends the contents of its send buffer to the root process. The root process receives the messages and stores them in rank order. The outcome is *as if* each of the `n` processes in the group (including the root process) had executed a call to==

==MPI_Send(sendbuf, sendcount, sendtype, root , ...),==

==and the root had executed `n` calls to==

==MPI_Recv(recvbuf+i$`\cdot`$ recvcount$`\cdot`$ extent(recvtype), recvcount, recvtype, i,...),==

~~General, derived datatypes are allowed for both `sendtype` and `recvtype`. The type signature of `sendcount, sendtype` on~~

~~each process must be equal to the type signature of `recvcount, recvtype` at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.~~

==General, derived datatypes are allowed for both `sendtype` and `recvtype`. The type signature of `sendcount, sendtype` on each process must be equal to the type signature of `recvcount, recvtype` at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.==

~~`MPI_GATHERV` extends the functionality of `MPI_GATHER` by allowing a varying count of data from each process, since `recvcounts` is now an array. It also allows more flexibility as to where the data is placed on the root, by providing the new argument, `displs`.~~

~~If `comm` is an intracommunicator, the outcome is *as if* each process, including the root process, sends a message to the root, ``` math MPI_Send(sendbuf, sendcount, sendtype, root, ...), ```~~

~~and the root executes `n` receives, ``` math MPI_Recv(recvbuf+displs[j]\cdot extent(recvtype), recvcounts[j], recvtype, i, ...). ```~~

==[[versions/v31/API/MPI_GATHERV|MPI_GATHERV]] extends the functionality of [[versions/v31/API/MPI_GATHER|MPI_GATHER]] by allowing a varying count of data from each process, since `recvcounts` is now an array. It also allows more flexibility as to where the data is placed on the root, by providing the new argument, `displs`.==

==If `comm` is an intracommunicator, the outcome is *as if* each process, including the root process, sends a message to the root,==

==MPI_Send(sendbuf, sendcount, sendtype, root, ...),==

==and the root executes `n` receives,==

==MPI_Recv(recvbuf+displs\[j\]$`\cdot`$ extent(recvtype), recvcounts\[j\], recvtype, i, ...).==

### MPI-3.1 → MPI-4.0  (6 changed paragraphs)

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== each process (root process included) sends the contents of its send buffer to the root process. The root process receives the messages and stores them in rank order. The outcome is *as if* each of the `n` processes in the group (including the root process) had executed a call to

General, derived datatypes are allowed for both `sendtype` and `recvtype`. The type signature of ~~`sendcount, sendtype`~~ ==`sendcount`, `sendtype`== on each process must be equal to the type signature of ~~`recvcount, recvtype`~~ ==`recvcount`, `recvtype`== at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.

All arguments to the function are significant on process `root`, while on other processes, only arguments ~~`sendbuf, sendcount, sendtype, root`,~~ ==`sendbuf`, `sendcount`, `sendtype`, `root`,== and `comm` are significant. The arguments `root` and `comm` must have identical values on all processes.

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing `MPI_IN_PLACE` as the value of `sendbuf` at the root. In such a case, `sendcount` and `sendtype` are ignored, and the contribution of the root to the gathered vector is assumed to be already in the correct place in the receive buffer.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the call involves all processes in the ~~intercommunicator,~~ ==inter-communicator,== but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is gathered from all processes in group B to the root. The send buffer arguments of the processes in group B must be consistent with the receive buffer argument of the root.

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== the outcome is *as if* each process, including the root process, sends a message to the root,

The type signature implied by ~~`sendcount, sendtype`~~ ==`sendcount`, `sendtype`== on process `i` must be equal to the type signature implied by ~~`recvcounts[i], recvtype`~~ ==`recvcounts[i]`, `recvtype`== at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed, as illustrated in Example [[coll-exD]] .

All arguments to the function are significant on process `root`, while on other processes, only arguments ~~`sendbuf, sendcount, sendtype, root`,~~ ==`sendbuf`, `sendcount`, `sendtype`, `root`,== and `comm` are significant. The arguments `root` and `comm` must have identical values on all processes.

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing `MPI_IN_PLACE` as the value of `sendbuf` at the root. In such a case, `sendcount` and `sendtype` are ignored, and the contribution of the root to the gathered vector is assumed to be already in the correct place in the receive buffer.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the call involves all processes in the ~~intercommunicator,~~ ==inter-communicator,== but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is gathered from all processes in group B to the root. The send buffer arguments of the processes in group B must be consistent with the receive buffer argument of the root.

### MPI-4.0 → MPI-4.1  (7 changed paragraphs)

If `comm` is an intra-communicator, each ==MPI== process ~~(root process~~ ==(the root== included) sends the contents of its send buffer to the ~~root process.~~ ==root.== The root ~~process~~ receives the messages and stores them in rank order. The outcome is *as if* each of the `n` ==MPI== processes in the group (including the ~~root process)~~ ==root)== had executed a call to

The receive buffer is ignored for all ~~non-root~~ ==nonroot MPI== processes.

General, derived datatypes are allowed for both `sendtype` and `recvtype`. The type signature of `sendcount`, `sendtype` on each ==MPI== process must be equal to the type signature of `recvcount`, `recvtype` at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each ==MPI== process and the root. Distinct type maps between sender and receiver ==MPI processes== are still allowed.

All arguments to the function are significant on ~~process `root`,~~ ==the root,== while on other ==MPI== processes, only ==the== arguments `sendbuf`, `sendcount`, `sendtype`, `root`, and `comm` are significant. The arguments `root` and `comm` must have identical values on all ==MPI== processes.

Note that the `recvcount` argument at the root indicates the number of items it receives from *each* ==MPI== process, not the total number of items it receives.

If `comm` is an inter-communicator, then the call involves all ==MPI== processes in the inter-communicator, but with one group (group A) defining the ~~root process.~~ ==root.== All ==MPI== processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other ==MPI== processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is gathered from all ==MPI== processes in group B to the root. The send buffer arguments of the ==MPI== processes in group B must be consistent with the receive buffer argument of the root.

[[versions/v41/API/MPI_GATHERV|MPI_GATHERV]] extends the functionality of [[versions/v41/API/MPI_GATHER|MPI_GATHER]] by allowing a varying count of data from each ==MPI== process, since `recvcounts` is now an array. It also allows more flexibility as to where the data is placed on the root, by providing the new argument, `displs`.

If `comm` is an intra-communicator, the outcome is *as if* each ==MPI== process, including the ~~root process,~~ ==root,== sends a message to the root,

The data received from ==MPI== process `j` is placed into `recvbuf` of the ~~`root` process~~ ==root== beginning at offset `displs[j]` elements (in terms of the `recvtype`).

The receive buffer is ignored for all ~~non-root~~ ==nonroot MPI== processes.

The type signature implied by `sendcount`, `sendtype` on ==MPI== process `i` must be equal to the type signature implied by `recvcounts[i]`, `recvtype` at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each ==MPI== process and the root. Distinct type maps between sender and receiver are still allowed, as illustrated in Example [[coll-exD]] .

All arguments to the function are significant on ~~process `root`,~~ ==the root,== while on other ==MPI== processes, only arguments `sendbuf`, `sendcount`, `sendtype`, `root`, and `comm` are significant. The arguments `root` and `comm` must have identical values on all ==MPI== processes.

If `comm` is an inter-communicator, then the call involves all ==MPI== processes in the inter-communicator, but with one group (group A) defining the ~~root process.~~ ==root.== All ==MPI== processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other ==MPI== processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is gathered from all ==MPI== processes in group B to the root. The send buffer arguments of the ==MPI== processes in group B must be consistent with the receive buffer argument of the root.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

An alternative description is that the `n` messages sent by the processes in the group are concatenated in rank order, and the resulting message is received by the root as if by a call to [[versions/v50/API/MPI_RECV|MPI_RECV]] ~~.~~ ==`(recvbuf, recvcount`$`\cdot`$`n, recvtype, ...)`.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Gather]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/collective#Gather]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Gather]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Gather]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Gather]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Gather]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Gather]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Gather]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Gather]]
