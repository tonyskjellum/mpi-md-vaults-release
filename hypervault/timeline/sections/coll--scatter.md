---
title: "Scatter"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Scatter

Chapter **coll** · in [[versions/v13/sections/coll#Scatter|MPI-1.3]], [[versions/v20/sections/collective#Scatter|MPI-2.0]], [[versions/v21/sections/coll#Scatter|MPI-2.1]], [[versions/v22/sections/coll#Scatter|MPI-2.2]], [[versions/v30/sections/coll#Scatter|MPI-3.0]], [[versions/v31/sections/coll#Scatter|MPI-3.1]], [[versions/v40/sections/coll#Scatter|MPI-4.0]], [[versions/v41/sections/coll#Scatter|MPI-4.1]], [[versions/v50/sections/coll#Scatter|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (7 changed paragraphs)

~~The outcome is *as if* the root executed `n` send operations, ``` math MPI_Send(sendbuf+i\cdot sendcount\cdot extent(sendtype), sendcount, sendtype, i,...), ```~~

==If `comm` is an intracommunicator,==

==the outcome is *as if* the root executed `n` send operations, ``` math MPI_Send(sendbuf+i\cdot sendcount\cdot extent(sendtype), sendcount, sendtype, i,...), ```==

~~An alternative description is that the root sends a message with [[versions/v21/API/MPI_SEND|MPI_Send]] . This message is split into `n` equal segments, the $`i`$th segment is sent to the $`i`$th process in the group, and each process receives this message as above.~~

==An alternative description is that the root sends a message with `MPI_Send(sendbuf, sendcount`$`\cdot`$`n, sendtype, ...)`. This message is split into `n` equal segments, the==

==$`i`$-th==

==segment is sent to the==

==$`i`$-th==

==process in the group, and each process receives this message as above.==

~~All arguments to the function are significant on process `root`, while on other processes, only arguments `recvbuf, recvcount, recvtype, root, comm` are significant. The arguments `root` and `comm` must have identical values on all processes.~~

==All arguments to the function are significant on process `root`, while on other processes, only arguments `recvbuf, recvcount, recvtype, root`,==

==and==

==`comm` are significant. The arguments `root` and `comm` must have identical values on all processes.==

==The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `recvbuf` at the root. In such case, `recvcount` and `recvtype` are ignored, and root “sends” no data to itself. The scattered vector is still assumed to contain $`n`$ segments, where $`n`$ is the group size; the *root*-th segment, which root should “send to itself,” is not moved.==

==If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is scattered from the root to all processes in group B. The receive buffer arguments of the processes in group B must be consistent with the send buffer argument of the root.==

~~`MPI_SCATTERV` extends the functionality of `MPI_SCATTER` by allowing a varying count of data to be sent to each process, since `sendcounts` is now an array. It also allows more flexibility as to where the data is taken from on the root, by providing the new argument, `displs`.~~

~~The outcome is as if the root executed `n` send operations, ``` math MPI_Send(sendbuf+displs[i]\cdot extent(sendtype), sendcounts[i], sendtype, i,...), ```~~

==`MPI_SCATTERV` extends the functionality of `MPI_SCATTER` by allowing a varying count of data to be sent to each process, since `sendcounts` is now an array. It also allows more flexibility as to where the data is taken from on the root, by providing==

==an additional==

==argument, `displs`.==

==If `comm` is an intracommunicator,==

==the outcome is as if the root executed `n` send operations, ``` math MPI_Send(sendbuf+displs[i]\cdot extent(sendtype), sendcounts[i], sendtype, i,...), ```==

~~All arguments to the function are significant on process `root`, while on other processes, only arguments `recvbuf, recvcount, recvtype, root, comm` are significant. The arguments `root` and `comm` must have identical values on all processes.~~

==All arguments to the function are significant on process `root`, while on other processes, only arguments `recvbuf, recvcount, recvtype, root`,==

==and==

==`comm` are significant. The arguments `root` and `comm` must have identical values on all processes.==

==The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `recvbuf` at the root. In such case, `recvcount` and `recvtype` are ignored, and root “sends” no data to itself. The scattered vector is still assumed to contain $`n`$ segments, where $`n`$ is the group size; the *root*-th segment, which root should “send to itself,” is not moved.==

==If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is scattered from the root to all processes in group B. The receive buffer arguments of the processes in group B must be consistent with the send buffer argument of the root.==

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

==`MPI_SCATTER` is the inverse operation to `MPI_GATHER`.==

==If `comm` is an intracommunicator,==

==the outcome is *as if* the root executed `n` send operations, ``` math MPI_Send(sendbuf+i\cdot sendcount\cdot extent(sendtype), sendcount, sendtype, i,...), ```==

==and each process executed a receive, ``` math MPI_Recv(recvbuf, recvcount, recvtype, i,...). ```==

==An alternative description is that the root sends a message with `MPI_Send(sendbuf, sendcount`$`\cdot`$`n, sendtype, ...)`. This message is split into `n` equal segments, the==

==$`i`$-th==

==segment is sent to the==

==$`i`$-th==

==process in the group, and each process receives this message as above.==

==The send buffer is ignored for all non-root processes.==

==The type signature associated with `sendcount, sendtype` at the root must be equal to the type signature associated with `recvcount, recvtype` at all processes (however, the type maps may be different). This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.==

==All arguments to the function are significant on process `root`, while on other processes, only arguments `recvbuf, recvcount, recvtype, root`,==

==and==

==`comm` are significant. The arguments `root` and `comm` must have identical values on all processes.==

==The specification of counts and types should not cause any location on the root to be read more than once.==

==> [!tip] Rationale==

==> Though not needed, the last restriction is imposed so as to achieve symmetry with `MPI_GATHER`, where the corresponding restriction (a multiple-write restriction) is necessary.==

==`MPI_SCATTERV` is the inverse operation to `MPI_GATHERV`.==

==`MPI_SCATTERV` extends the functionality of `MPI_SCATTER` by allowing a varying count of data to be sent to each process, since `sendcounts` is now an array. It also allows more flexibility as to where the data is taken from on the root, by providing==

==an additional==

==argument, `displs`.==

==If `comm` is an intracommunicator,==

==the outcome is as if the root executed `n` send operations, ``` math MPI_Send(sendbuf+displs[i]\cdot extent(sendtype), sendcounts[i], sendtype, i,...), ```==

==and each process executed a receive, ``` math MPI_Recv(recvbuf, recvcount, recvtype, i,...). ```==

==The send buffer is ignored for all non-root processes.==

==The type signature implied by `sendcount[i], sendtype` at the root must be equal to the type signature implied by `recvcount, recvtype` at process `i` (however, the type maps may be different). This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.==

==All arguments to the function are significant on process `root`, while on other processes, only arguments `recvbuf, recvcount, recvtype, root`,==

==and==

==`comm` are significant. The arguments `root` and `comm` must have identical values on all processes.==

==The specification of counts, types, and displacements should not cause any location on the root to be read more than once.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `recvbuf` at the root. In such ==a== case, `recvcount` and `recvtype` are ignored, and root “sends” no data to itself. The scattered vector is still assumed to contain $`n`$ segments, where $`n`$ is the group size; the *root*-th segment, which root should “send to itself,” is not moved.

If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== in `root`. Data is scattered from the root to all processes in group B. The receive buffer arguments of the processes in group B must be consistent with the send buffer argument of the root.

The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `recvbuf` at the root. In such ==a== case, `recvcount` and `recvtype` are ignored, and root “sends” no data to itself. The scattered vector is still assumed to contain $`n`$ segments, where $`n`$ is the group size; the *root*-th segment, which root should “send to itself,” is not moved.

If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== in `root`. Data is scattered from the root to all processes in group B. The receive buffer arguments of the processes in group B must be consistent with the send buffer argument of the root.

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

~~If `comm` is an intracommunicator,~~

~~the outcome is *as if* the root executed `n` send operations, ``` math MPI_Send(sendbuf+i\cdot sendcount\cdot extent(sendtype), sendcount, sendtype, i,...), ```~~

==If `comm` is an intracommunicator, the outcome is *as if* the root executed `n` send operations, ``` math MPI_Send(sendbuf+i\cdot sendcount\cdot extent(sendtype), sendcount, sendtype, i,...), ```==

~~$`i`$-th~~

~~segment is sent to the~~

~~$`i`$-th~~

~~process in the group, and each process receives this message as above.~~

==$`i`$-th segment is sent to the==

==$`i`$-th process in the group, and each process receives this message as above.==

~~All arguments to the function are significant on process `root`, while on other processes, only arguments `recvbuf, recvcount, recvtype, root`,~~

~~and~~

~~`comm` are significant. The arguments `root` and `comm` must have identical values on all processes.~~

==All arguments to the function are significant on process `root`, while on other processes, only arguments `recvbuf, recvcount, recvtype, root`, and `comm` are significant. The arguments `root` and `comm` must have identical values on all processes.==

~~an additional~~

~~argument, `displs`.~~

~~If `comm` is an intracommunicator,~~

~~the outcome is as if the root executed `n` send operations, ``` math MPI_Send(sendbuf+displs[i]\cdot extent(sendtype), sendcounts[i], sendtype, i,...), ```~~

==an additional argument, `displs`.==

==If `comm` is an intracommunicator, the outcome is as if the root executed `n` send operations, ``` math MPI_Send(sendbuf+displs[i]\cdot extent(sendtype), sendcounts[i], sendtype, i,...), ```==

~~All arguments to the function are significant on process `root`, while on other processes, only arguments `recvbuf, recvcount, recvtype, root`,~~

~~and~~

~~`comm` are significant. The arguments `root` and `comm` must have identical values on all processes.~~

==All arguments to the function are significant on process `root`, while on other processes, only arguments `recvbuf, recvcount, recvtype, root`, and `comm` are significant. The arguments `root` and `comm` must have identical values on all processes.==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~`MPI_SCATTER`~~ ==[[versions/v31/API/MPI_SCATTER|MPI_SCATTER]]== is the inverse operation to ~~`MPI_GATHER`.~~ ==[[versions/v31/API/MPI_GATHER|MPI_GATHER]] .==

If `comm` is an intracommunicator, the outcome is *as if* the root executed `n` send operations, ~~``` math MPI_Send(sendbuf+i\cdot sendcount\cdot extent(sendtype), sendcount, sendtype, i,...), ```~~

~~and each process executed a receive, ``` math MPI_Recv(recvbuf, recvcount, recvtype, i,...). ```~~ ==MPI_Send(sendbuf+i$`\cdot`$ sendcount$`\cdot`$ extent(sendtype), sendcount, sendtype, i,...),==

~~An alternative description is that the root sends~~ ==and each process executed== a ~~message with `MPI_Send(sendbuf, sendcount`$`\cdot`$`n, sendtype, ...)`. This message is split into `n` equal segments, the~~ ==receive,==

~~$`i`$-th segment is sent to the~~ ==MPI_Recv(recvbuf, recvcount, recvtype, i,...).==

==An alternative description is that the root sends a message with `MPI_Send(sendbuf, sendcount`$`\cdot`$`n, sendtype, `$`...`$`)`. This message is split into `n` equal segments, the $`i`$-th segment is sent to the== $`i`$-th process in the group, and each process receives this message as above.

> Though not needed, the last restriction is imposed so as to achieve symmetry with ~~`MPI_GATHER`,~~ ==[[versions/v31/API/MPI_GATHER|MPI_GATHER]] ,== where the corresponding restriction (a multiple-write restriction) is necessary.

~~`MPI_SCATTERV` is the inverse operation to `MPI_GATHERV`.~~

~~`MPI_SCATTERV` extends the functionality of `MPI_SCATTER` by allowing a varying count of data to be sent to each process, since `sendcounts` is now an array. It also allows more flexibility as to where the data is taken from on the root, by providing~~

~~an additional argument, `displs`.~~

~~If `comm` is an intracommunicator, the outcome is as if the root executed `n` send operations, ``` math MPI_Send(sendbuf+displs[i]\cdot extent(sendtype), sendcounts[i], sendtype, i,...), ```~~

~~and each process executed a receive, ``` math MPI_Recv(recvbuf, recvcount, recvtype, i,...). ```~~

==[[versions/v31/API/MPI_SCATTERV|MPI_SCATTERV]] is the inverse operation to [[versions/v31/API/MPI_GATHERV|MPI_GATHERV]] .==

==[[versions/v31/API/MPI_SCATTERV|MPI_SCATTERV]] extends the functionality of [[versions/v31/API/MPI_SCATTER|MPI_SCATTER]] by allowing a varying count of data to be sent to each process, since `sendcounts` is now an array. It also allows more flexibility as to where the data is taken from on the root, by providing an additional argument, `displs`.==

==If `comm` is an intracommunicator, the outcome is as if the root executed `n` send operations,==

==MPI_Send(sendbuf+displs\[i\]$`\cdot`$ extent(sendtype), sendcounts\[i\], sendtype, i,...),==

==and each process executed a receive,==

==MPI_Recv(recvbuf, recvcount, recvtype, i,...).==

### MPI-3.1 → MPI-4.0  (6 changed paragraphs)

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== the outcome is *as if* the root executed `n` send operations,

The type signature associated with ~~`sendcount, sendtype`~~ ==`sendcount`, `sendtype`== at the root must be equal to the type signature associated with ~~`recvcount, recvtype`~~ ==`recvcount`, `recvtype`== at all processes (however, the type maps may be different). This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.

All arguments to the function are significant on process `root`, while on other processes, only arguments ~~`recvbuf, recvcount, recvtype, root`,~~ ==`recvbuf`, `recvcount`, `recvtype`, `root`,== and `comm` are significant. The arguments `root` and `comm` must have identical values on all processes.

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing `MPI_IN_PLACE` as the value of `recvbuf` at the root. In such a case, `recvcount` and `recvtype` are ignored, and root “sends” no data to itself. The scattered vector is still assumed to contain $`n`$ segments, where $`n`$ is the group size; the *root*-th segment, which root should “send to itself,” is not moved.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the call involves all processes in the ~~intercommunicator,~~ ==inter-communicator,== but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is scattered from the root to all processes in group B. The receive buffer arguments of the processes in group B must be consistent with the send buffer argument of the root.

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== the outcome is as if the root executed `n` send operations,

The type signature implied by ~~`sendcount[i], sendtype`~~ ==`sendcount``[i]`, `sendtype`== at the root must be equal to the type signature implied by ~~`recvcount, recvtype`~~ ==`recvcount`, `recvtype`== at process `i` (however, the type maps may be different). This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.

All arguments to the function are significant on process `root`, while on other processes, only arguments ~~`recvbuf, recvcount, recvtype, root`,~~ ==`recvbuf`, `recvcount`, `recvtype`, `root`,== and `comm` are significant. The arguments `root` and `comm` must have identical values on all processes.

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing `MPI_IN_PLACE` as the value of `recvbuf` at the root. In such a case, `recvcount` and `recvtype` are ignored, and root “sends” no data to itself. The scattered vector is still assumed to contain $`n`$ segments, where $`n`$ is the group size; the *root*-th segment, which root should “send to itself,” is not moved.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the call involves all processes in the ~~intercommunicator,~~ ==inter-communicator,== but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is scattered from the root to all processes in group B. The receive buffer arguments of the processes in group B must be consistent with the send buffer argument of the root.

### MPI-4.0 → MPI-4.1  (7 changed paragraphs)

and each ==MPI== process executed a receive,

An alternative description is that the root sends a message with `MPI_Send(sendbuf, sendcount`$`\cdot`$`n, sendtype, `$`...`$`)`. This message is split into `n` equal segments, the $`i`$-th segment is sent to the $`i`$-th ==MPI== process in the group, and each ==MPI== process receives this message as above.

The send buffer is ignored for all ~~non-root~~ ==nonroot MPI== processes.

The type signature associated with `sendcount`, `sendtype` at the root must be equal to the type signature associated with `recvcount`, `recvtype` at all ==MPI== processes (however, the type maps may be different). This implies that the amount of data sent must be equal to the amount of data received, pairwise between each ==MPI== process and the root. Distinct type maps between sender and receiver are still allowed.

All arguments to the function are significant on ~~process `root`,~~ ==the root,== while on other ==MPI== processes, only arguments `recvbuf`, `recvcount`, `recvtype`, `root`, and `comm` are significant. The arguments `root` and `comm` must have identical values on all ==MPI== processes.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` as the value of `recvbuf` at the root. In such a case, `recvcount` and `recvtype` are ignored, and ==the== root “sends” no data to itself. The scattered vector is still assumed to contain $`n`$ segments, where $`n`$ is the group size; the ~~*root*-th~~ ==`root`-th== segment, which root should “send to itself,” is not moved.

If `comm` is an inter-communicator, then the call involves all ==MPI== processes in the inter-communicator, but with one group (group A) defining the ~~root process.~~ ==root.== All ==MPI== processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other ==MPI== processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is scattered from the root to all ==MPI== processes in group B. The receive buffer arguments of the ==MPI== processes in group B must be consistent with the send buffer argument of the root.

[[versions/v41/API/MPI_SCATTERV|MPI_SCATTERV]] extends the functionality of [[versions/v41/API/MPI_SCATTER|MPI_SCATTER]] by allowing a varying count of data to be sent to each ==MPI== process, since `sendcounts` is now an array. It also allows more flexibility as to where the data is taken from on the root, by providing an additional argument, `displs`.

and each ==MPI== process executed a receive,

The send buffer is ignored for all ~~non-root~~ ==nonroot MPI== processes.

The type signature implied by `sendcount``[i]`, `sendtype` at the root must be equal to the type signature implied by `recvcount`, `recvtype` at ==MPI== process `i` (however, the type maps may be different). This implies that the amount of data sent must be equal to the amount of data received, pairwise between each ==MPI== process and the root. Distinct type maps between sender and receiver are still allowed.

All arguments to the function are significant on ~~process `root`,~~ ==the root,== while on other ==MPI== processes, only arguments `recvbuf`, `recvcount`, `recvtype`, `root`, and `comm` are significant. The arguments `root` and `comm` must have identical values on all ==MPI== processes.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` as the value of `recvbuf` at the root. In such a case, `recvcount` and `recvtype` are ignored, and root “sends” no data to itself. The scattered vector is still assumed to contain $`n`$ segments, where $`n`$ is the group size; the ~~*root*-th~~ ==`root`-th== segment, which root should “send to itself,” is not moved.

If `comm` is an inter-communicator, then the call involves all ==MPI== processes in the inter-communicator, but with one group (group A) defining the ~~root process.~~ ==root.== All ==MPI== processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root ==MPI process== passes the value `MPI_ROOT` in `root`. All other ==MPI== processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is scattered from the root to all ==MPI== processes in group B. The receive buffer arguments of the ==MPI== processes in group B must be consistent with the send buffer argument of the root.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Scatter]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/collective#Scatter]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Scatter]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Scatter]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Scatter]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Scatter]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Scatter]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Scatter]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Scatter]]
