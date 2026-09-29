---
title: "Matched Receives"
chapter: pt2pt
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Matched Receives

Chapter **pt2pt** · in [[versions/v30/sections/pt2pt#Matched Receives|MPI-3.0]], [[versions/v31/sections/pt2pt#Matched Receives|MPI-3.1]], [[versions/v40/sections/pt2pt#Matched Receives|MPI-4.0]], [[versions/v41/sections/pt2pt#Matched Receives|MPI-4.1]], [[versions/v50/sections/pt2pt#Matched Receives|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~If `MPI_MRECV` is called with `MPI_MESSAGE_NO_PROC` as the message argument, the call returns immediately with the status object set to source = `MPI_PROC_NULL`, tag = `MPI_ANY_TAG`, and count = 0, as if a receive from `MPI_PROC_NULL` was issued~~

~~(see Section [[versions/v31/sections/pt2pt#Null Processes|Null Processes]] ).~~

~~A call to [[versions/v31/API/MPI_MRECV|MPI_MRECV]] with `MPI_MESSAGE_NULL` is erroneous.~~

==If [[versions/v31/API/MPI_MRECV|MPI_MRECV]] is called with `MPI_MESSAGE_NO_PROC` as the message argument, the call returns immediately with the status object set to source = `MPI_PROC_NULL`, tag = `MPI_ANY_TAG`, and count = 0, as if a receive from `MPI_PROC_NULL` was issued (see Section [[versions/v31/sections/pt2pt#Null Processes|Null Processes]] ). A call to [[versions/v31/API/MPI_MRECV|MPI_MRECV]] with `MPI_MESSAGE_NULL` is erroneous.==

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

The ~~functions~~ ==**matched receive** operation (== [[versions/v40/API/MPI_MRECV|MPI_MRECV]] and [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] ==procedures)== receive ~~messages~~ ==*messages*== that have been previously matched by a ~~matching probe~~ ==*matching probe* operation== (Section [[versions/v40/sections/pt2pt#Matching Probe|Matching Probe]] ).

This call receives a message matched by a ~~matching probe~~ ==*matching probe*== operation (Section [[versions/v40/sections/pt2pt#Matching Probe|Matching Probe]] ).

The ~~receive buffer~~ ==*receive buffer*== consists of the storage containing `count` consecutive elements of the type specified by `datatype`, starting at address `buf`. The length of the received message must be less than or equal to the length of the receive buffer. An overflow error occurs if all incoming data does not fit, without truncation, into the receive buffer.

On return from this function, the ~~message handle~~ ==*message handle*== is set to `MPI_MESSAGE_NULL`. All errors that occur during the execution of this operation are handled according to the error handler set for the communicator used in the matching probe call that produced the message handle.

If [[versions/v40/API/MPI_MRECV|MPI_MRECV]] is called with `MPI_MESSAGE_NO_PROC` as the message argument, the call returns immediately with the status object set to ~~source = `MPI_PROC_NULL`, tag = `MPI_ANY_TAG`,~~ ==`source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG`,== and ~~count = 0, as if~~ ==`count``= 0`. This is consistent with the status object produced by== a ~~receive from `MPI_PROC_NULL` was issued~~ ==call to [[versions/v40/API/MPI_RECV|MPI_RECV]] or to [[versions/v40/API/MPI_PROBE|MPI_PROBE]] with `source``=``MPI_PROC_NULL`== (see Section [[versions/v40/sections/pt2pt#Null Processes|Null Processes]] ). A call to [[versions/v40/API/MPI_MRECV|MPI_MRECV]] with `MPI_MESSAGE_NULL` is ~~erroneous.~~ ==*erroneous*.==

[[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] is the nonblocking variant of [[versions/v40/API/MPI_MRECV|MPI_MRECV]] and starts a nonblocking receive of a matched message. Completion semantics are similar to [[versions/v40/API/MPI_IRECV|MPI_IRECV]] as described in Section [[versions/v40/sections/pt2pt#Communication Initiation|Communication Initiation]] . On return from this function, the ~~message handle~~ ==*message handle*== is set to `MPI_MESSAGE_NULL`.

If [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] is called with `MPI_MESSAGE_NO_PROC` as the message argument, the call returns immediately with a request object which, when completed, will yield a status object set to ~~source = `MPI_PROC_NULL`, tag = `MPI_ANY_TAG`,~~ ==`source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG`,== and ~~count = 0,~~ ==`count``= 0`,== as if a receive from `MPI_PROC_NULL` was issued (see Section [[versions/v40/sections/pt2pt#Null Processes|Null Processes]] ). A call to [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] with `MPI_MESSAGE_NULL` is ~~erroneous.~~ ==*erroneous*.==

> If reception of a matched message is started with [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] , then it is possible to ~~cancel~~ ==*cancel*== the returned request with [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] . If [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] succeeds, the matched message must be found by a subsequent message probe ( [[versions/v40/API/MPI_PROBE|MPI_PROBE]] , [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] , [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] , or [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] ), received by a subsequent receive operation or ~~cancelled~~ ==*cancelled*== by the sender. See Section [[versions/v40/sections/pt2pt#Cancel|Cancel]] for details about [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] . The ~~cancellation~~ ==*cancellation*== of operations initiated with [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] may fail.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

If [[versions/v41/API/MPI_MRECV|MPI_MRECV]] is called with `MPI_MESSAGE_NO_PROC` as the message argument, the call returns immediately with the status object set to `source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG`, and `count``= 0`. This is consistent with the status object produced by a call to [[versions/v41/API/MPI_RECV|MPI_RECV]] or to [[versions/v41/API/MPI_PROBE|MPI_PROBE]] with `source``=``MPI_PROC_NULL` (see Section [[versions/v41/sections/pt2pt#Null ==MPI== Processes|Null ==MPI== Processes]] ). A call to [[versions/v41/API/MPI_MRECV|MPI_MRECV]] with `MPI_MESSAGE_NULL` is *erroneous*.

If [[versions/v41/API/MPI_IMRECV|MPI_IMRECV]] is called with `MPI_MESSAGE_NO_PROC` as the message argument, the call returns immediately with a request object ~~which,~~ ==that,== when completed, will yield a status object set to `source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG`, and `count``= 0`, as if a receive from `MPI_PROC_NULL` was issued (see Section [[versions/v41/sections/pt2pt#Null ==MPI== Processes|Null ==MPI== Processes]] ). A call to [[versions/v41/API/MPI_IMRECV|MPI_IMRECV]] with `MPI_MESSAGE_NULL` is *erroneous*.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Matched Receives]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Matched Receives]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Matched Receives]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Matched Receives]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Matched Receives]]
