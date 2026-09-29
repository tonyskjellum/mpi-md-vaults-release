---
title: "MPI Procedures"
chapter: terms
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# MPI Procedures

Chapter **terms** · in [[versions/v40/sections/terms#MPI Procedures|MPI-4.0]], [[versions/v41/sections/terms#MPI Procedures|MPI-4.1]], [[versions/v50/sections/terms#MPI Procedures|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

All MPI procedures can either be *local* or ~~*non-local*—defined~~ ==*nonlocal*—defined== as follows:

~~**Non-local procedure**~~ ==**Nonlocal procedure**:== An MPI procedure is ~~**non-local**~~ ==**nonlocal**== if returning may require, during its execution, some specific semantically-related MPI procedure to be called on another MPI process.

**Local ~~procedure**~~ ==procedure**:== An MPI procedure is **local** if it is not ~~*non-local*.~~ ==*nonlocal*.==

**Initialization ~~procedure**~~ ==procedure**:== An MPI procedure is an **initialization procedure** if return from the procedure indicates that the associated operation has completed its initialization stage, which implies that the user has handed over control of the argument list (but not contents of the data buffers) to MPI. The user is still allowed to read or modify the contents of the data buffers. If an initializing procedure is not also the freeing procedure of the associated operation (see below) then the user is not permitted to deallocate the data buffers or to modify the array arguments.

**Starting ~~procedure**~~ ==procedure**:== An MPI procedure is a **starting procedure** if return from the procedure indicates that the associated operation has completed its starting stage, which implies that the user has handed over control of the data buffers to MPI. If a starting procedure is not also a completing procedure of the associated operation (see below) then the user is not permitted to modify input data buffers or to read output data buffers.

**Initiation ~~procedure**~~ ==procedure**:== An MPI procedure is an **initiation procedure** if return from the procedure indicates that both the initialization and the starting stage have completed, which implies control of the entire argument list is handed over to MPI.

**Completing ~~procedure**~~ ==procedure**:== An MPI procedure is called **completing** if return from the procedure indicates that at least one associated operation has finished its completion stage, which implies that the user can rely on the content of the output data buffers and modify the content of input and output data buffers of such operation(s). If a completing procedure is not also a freeing procedure (see below) then the user is not permitted to deallocate the data buffers or to modify the array arguments.

**Incomplete ~~procedure**~~ ==procedure**:== An MPI procedure is called **incomplete** if it is not a completing procedure.

**Freeing ~~procedure**~~ ==procedure**:== An MPI procedure is **freeing** if return from the procedure indicates that at least one associated operation has finished its freeing stage, which implies that the user can reuse all parameters specified when initializing such associated operation(s).

**Nonblocking ~~procedure**~~ ==procedure**:== An MPI procedure is **nonblocking** if it is incomplete and local.

**Blocking ~~procedure**~~ ==procedure**:== An MPI procedure is **blocking** if it is not nonblocking.

> Note that for operation-related MPI procedures, in most cases incomplete procedures are local and completing procedures are ~~non-local.~~ ==nonlocal.== Exceptions are noted where such procedures are defined. In many cases an additional prefix letter `I` as an abbreviation of the words **incomplete** and **immediate** marks nonblocking procedures in the procedure name. > > Some categorization examples are listed below. > > Nonblocking procedures: > > - incomplete and local: [[versions/v41/API/MPI_ISEND|MPI_ISEND]] , [[versions/v41/API/MPI_IRECV|MPI_IRECV]] , [[versions/v41/API/MPI_IBCAST|MPI_IBCAST]] , [[versions/v41/API/MPI_IMPROBE|MPI_IMPROBE]] , [[versions/v41/API/MPI_SEND_INIT|MPI_SEND_INIT]] , [[versions/v41/API/MPI_RECV_INIT|MPI_RECV_INIT]] , ... > > Blocking procedures: > > - completing and ~~non-local:~~ ==nonlocal:== [[versions/v41/API/MPI_SEND|MPI_SEND]] , [[versions/v41/API/MPI_RECV|MPI_RECV]] , [[versions/v41/API/MPI_BCAST|MPI_BCAST]] , ... > > - incomplete and ~~non-local:~~ ==nonlocal:== [[versions/v41/API/MPI_MPROBE|MPI_MPROBE]] , [[versions/v41/API/MPI_BCAST_INIT|MPI_BCAST_INIT]] , ..., > > ~~`MPI_FILE\_<span class="roman">{</span>READ$`|`$WRITE<span class="roman">}</span>\_<span class="roman">{</span>AT_ALL$`|`$ALL$`|`$ORDERED<span class="roman">}</span>\_BEGIN`~~ ==`MPI_FILE\_{READ$`|`$WRITE}\_{AT_ALL$`|`$ALL$`|`$ORDERED}\_BEGIN`== . > > - completing and local: [[versions/v41/API/MPI_BSEND|MPI_BSEND]] , [[versions/v41/API/MPI_RSEND|MPI_RSEND]] , [[versions/v41/API/MPI_MRECV|MPI_MRECV]] . > > MPI procedures that are not MPI operation-related: > > - [[versions/v41/API/MPI_COMM_RANK|MPI_COMM_RANK]] , [[versions/v41/API/MPI_WTIME|MPI_WTIME]] , [[versions/v41/API/MPI_PROBE|MPI_PROBE]] , [[versions/v41/API/MPI_IPROBE|MPI_IPROBE]] , ...

**Collective ~~procedure**~~ ==procedure**:== An MPI procedure is **collective** if all processes in a group or groups of MPI processes need to invoke the procedure.

==**Noncollective procedure**:   Noncollective procedures are defined as procedures that are not collective.==

==The definition of **local** and **nonlocal** MPI procedures can also be applied to a specific procedure invocation or to procedure calls **under certain constraints**. For example, a call to a completing receive procedure that happens after the related send operation was already started may be described as local, even though the completing receive procedure without the constraint is nonlocal. More generally, a call to any completing procedure that happens after the operation was already *enabled* is local, even if the completing procedure without the constraint is nonlocal. Another example, a call to a blocking collective procedure using a process group of size one is local, even if the blocking collective procedure without the constraint is nonlocal.==

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#MPI Procedures]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#MPI Procedures]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#MPI Procedures]]
