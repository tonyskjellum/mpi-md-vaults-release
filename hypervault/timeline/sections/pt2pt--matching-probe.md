---
title: "Matching Probe"
chapter: pt2pt
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Matching Probe

Chapter **pt2pt** · in [[versions/v30/sections/pt2pt#Matching Probe|MPI-3.0]], [[versions/v31/sections/pt2pt#Matching Probe|MPI-3.1]], [[versions/v40/sections/pt2pt#Matching Probe|MPI-4.0]], [[versions/v41/sections/pt2pt#Matching Probe|MPI-4.1]], [[versions/v50/sections/pt2pt#Matching Probe|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

The function ~~`MPI_PROBE`~~ ==[[versions/v31/API/MPI_PROBE|MPI_PROBE]]== checks for incoming messages without receiving them. Since the list of incoming messages is global among the threads of each MPI process, it can be hard to use this functionality in threaded environments .

Like ~~`MPI_PROBE`~~ ==[[versions/v31/API/MPI_PROBE|MPI_PROBE]]== and ~~`MPI_IPROBE`,~~ ==[[versions/v31/API/MPI_IPROBE|MPI_IPROBE]] ,== the ~~`MPI_MPROBE`~~ ==[[versions/v31/API/MPI_MPROBE|MPI_MPROBE]]== and ~~`MPI_IMPROBE`~~ ==[[versions/v31/API/MPI_IMPROBE|MPI_IMPROBE]]== operations allow incoming messages to be queried without actually receiving them, except that ~~`MPI_MPROBE`~~ ==[[versions/v31/API/MPI_MPROBE|MPI_MPROBE]]== and ~~`MPI_IMPROBE`~~ ==[[versions/v31/API/MPI_IMPROBE|MPI_IMPROBE]]== provide a mechanism to receive the specific message that was matched regardless of other intervening probe or receive operations. This gives the application an opportunity to decide how to receive the message, based on the information returned by the probe. In particular, the user may allocate memory for the receive buffer, according to the length of the probed message.

A matched receive ~~(`MPI_MRECV`~~ ==( [[versions/v31/API/MPI_MRECV|MPI_MRECV]]== or ~~`MPI_IMRECV`)~~ ==[[versions/v31/API/MPI_IMRECV|MPI_IMRECV]] )== executed with the message handle will receive the message that was matched by the probe. Unlike [[versions/v31/API/MPI_IPROBE|MPI_IPROBE]] , no other probe or receive operation may match the message returned by [[versions/v31/API/MPI_IMPROBE|MPI_IMPROBE]] . Each message returned by [[versions/v31/API/MPI_IMPROBE|MPI_IMPROBE]] must be received with either [[versions/v31/API/MPI_MRECV|MPI_MRECV]] or [[versions/v31/API/MPI_IMRECV|MPI_IMRECV]] .

~~A matching probe with `MPI_PROC_NULL` as source returns `flag = true`,~~

~~`message = MPI_MESSAGE_NO_PROC`~~

~~, and the status object returns `source = MPI_PROC_NULL`, `tag = MPI_ANY_TAG`, and `count = 0`; see Section [[versions/v31/sections/pt2pt#Null Processes|Null Processes]] .~~

~~It is not necessary to call `MPI_MRECV` or `MPI_IMRECV` with `MPI_MESSAGE_NO_PROC`, but it is not erroneous to do so.~~

==A matching probe with `MPI_PROC_NULL` as source returns `flag = true`, `message = MPI_MESSAGE_NO_PROC`, and the status object returns `source = MPI_PROC_NULL`, `tag = MPI_ANY_TAG`, and `count = 0`; see Section [[versions/v31/sections/pt2pt#Null Processes|Null Processes]] . It is not necessary to call `MPI_MRECV` or `MPI_IMRECV` with `MPI_MESSAGE_NO_PROC`, but it is not erroneous to do so.==

The implementation of ~~`MPI_MPROBE`~~ ==[[versions/v31/API/MPI_MPROBE|MPI_MPROBE]]== and ~~`MPI_IMPROBE`~~ ==[[versions/v31/API/MPI_IMPROBE|MPI_IMPROBE]]== needs to guarantee progress in the same way as in the case of ~~`MPI_PROBE`~~ ==[[versions/v31/API/MPI_PROBE|MPI_PROBE]]== and ~~`MPI_IPROBE`.~~ ==[[versions/v31/API/MPI_IPROBE|MPI_IPROBE]] .==

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

The function [[versions/v40/API/MPI_PROBE|MPI_PROBE]] checks for incoming ~~messages~~ ==*messages*== without receiving them. Since the list of incoming ~~messages~~ ==*messages*== is global among the threads of each MPI process, it can be hard to use this functionality in threaded environments .

Like [[versions/v40/API/MPI_PROBE|MPI_PROBE]] and [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] , the ==**matching probe** operation (== [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] and [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] ~~operations~~ ==procedures)== allow incoming ~~messages~~ ==*messages*== to be queried without actually receiving them, except that [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] and [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] provide a mechanism to receive the specific ~~message~~ ==*message*== that was matched regardless of other intervening probe or receive operations. This gives the application an opportunity to decide how to receive the message, based on the information returned by the probe. In particular, the user may allocate memory for the receive buffer, according to the length of the probed message.

~~[[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] returns `flag = true` if there is a message that can be received and that matches the pattern specified by the arguments `source`, `tag`, and `comm`. The call matches the same message that would have been received by a call to [[versions/v40/API/MPI_RECV|MPI_RECV]] executed at the same point in the program and returns in `status` the same value that would have been returned by [[versions/v40/API/MPI_RECV|MPI_RECV]] . In addition, it returns in `message` a handle to the matched message. Otherwise, the call returns `flag = false`, and leaves `status` and `message` undefined.~~

~~A matched receive ( [[versions/v40/API/MPI_MRECV|MPI_MRECV]] or [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] ) executed with the message handle will receive the message that was matched by the probe. Unlike [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] , no other probe or receive operation may match the message returned by [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] . Each message returned by [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] must be received with either [[versions/v40/API/MPI_MRECV|MPI_MRECV]] or [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] .~~

~~The source argument of [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] can be `MPI_ANY_SOURCE`, and the tag argument can be `MPI_ANY_TAG`, so that one can probe for messages from an arbitrary source and/or with an arbitrary tag. However, a specific communication context must be provided with the `comm` argument.~~

~~A synchronous send operation that is matched with [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] or [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] will complete successfully only if both a matching receive is posted with [[versions/v40/API/MPI_MRECV|MPI_MRECV]] or [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] , and the receive operation has started to receive the message sent by the synchronous send.~~

~~There is a special predefined message: `MPI_MESSAGE_NO_PROC`, which is a message which has `MPI_PROC_NULL` as its source process. The predefined constant `MPI_MESSAGE_NULL` is the value used for invalid message handles.~~

~~A matching probe with `MPI_PROC_NULL` as source returns `flag = true`, `message = MPI_MESSAGE_NO_PROC`, and the status object returns `source = MPI_PROC_NULL`, `tag = MPI_ANY_TAG`, and `count = 0`; see Section [[versions/v40/sections/pt2pt#Null Processes|Null Processes]] . It is not necessary to call `MPI_MRECV` or `MPI_IMRECV` with `MPI_MESSAGE_NO_PROC`, but it is not erroneous to do so.~~

==[[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] returns `flag``= true` if there is a message that can be received and that matches the pattern specified by the arguments `source`, `tag`, and `comm`. The call matches the same message that would have been received by a call to [[versions/v40/API/MPI_RECV|MPI_RECV]] with the same argument values for `source`, `tag`, `comm`, and `status` executed at the same point in the program and returns in `status` the same value that would have been returned by [[versions/v40/API/MPI_RECV|MPI_RECV]] . In addition, it returns in `message` a **message handle** to the matched message. Otherwise, the call returns `flag``= false`, and leaves `status` and `message` undefined.==

==[[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] is a *local* procedure. According to the definitions in Section [[versions/v40/sections/terms#MPI Procedures|MPI Procedures]] and in contrast to [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] , it is a *nonblocking* procedure because it is the *initialization* of a *matched receive* operation.==

==A *matched receive* ( [[versions/v40/API/MPI_MRECV|MPI_MRECV]] or [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] ) executed with the *message handle* will receive the message that was matched by the *matching probe*. Unlike [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] , no other probe or receive operation may match the message returned by [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] . Each *message handle* returned by [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] must be received with either [[versions/v40/API/MPI_MRECV|MPI_MRECV]] or [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] .==

==The `source` argument of [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] can be `MPI_ANY_SOURCE`, and the `tag` argument can be `MPI_ANY_TAG`, so that one can *probe* for *messages* from an arbitrary source and/or with an arbitrary tag. However, a specific communication context must be provided with the `comm` argument.==

==A *synchronous mode send* operation that is matched with [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] or [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] will *complete* successfully only if both a *matching receive* is posted with [[versions/v40/API/MPI_MRECV|MPI_MRECV]] or [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] , and the *matching receive* operation has *started* to receive the message sent by the *synchronous mode send*.==

==There is a special **predefined message handle**: `MPI_MESSAGE_NO_PROC`, which is a message which has `MPI_PROC_NULL` as its source process. The predefined constant `MPI_MESSAGE_NULL` is the value used for **invalid message handles**.==

==A *matching probe* with `source``=``MPI_PROC_NULL` returns `flag``= true`, `message``=``MPI_MESSAGE_NO_PROC`, and the status object returns `source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG`, and `count``= 0`; see Section [[versions/v40/sections/pt2pt#Null Processes|Null Processes]] . It is not necessary to call [[versions/v40/API/MPI_MRECV|MPI_MRECV]] or [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] with `MPI_MESSAGE_NO_PROC`, but it is not *erroneous* to do so.==

~~[[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] behaves like [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] except that it is a blocking call that returns only after a matching message has been found.~~

~~The implementation of [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] and [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] needs to guarantee progress in the same way as in the case of [[versions/v40/API/MPI_PROBE|MPI_PROBE]] and [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] .~~

==[[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] behaves like [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] except that it is a *blocking* call that returns only after a matching message has been found.==

==The implementation of [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] and [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] needs to guarantee *progress* in the same way as in the case of [[versions/v40/API/MPI_PROBE|MPI_PROBE]] and [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] .==

==According to the definitions in Section [[versions/v40/sections/terms#MPI Procedures|MPI Procedures]] , [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] is *incomplete*. It is also a *non-local* procedure.==

==> [!note] Advice to users==

==> This is one of the exceptions in which *incomplete* procedures are *non-local*.==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

A *synchronous mode send* operation that is matched with [[versions/v41/API/MPI_IMPROBE|MPI_IMPROBE]] or [[versions/v41/API/MPI_MPROBE|MPI_MPROBE]] will *complete* successfully only if both a *matching receive* is ~~posted~~ ==*started*== with [[versions/v41/API/MPI_MRECV|MPI_MRECV]] or [[versions/v41/API/MPI_IMRECV|MPI_IMRECV]] , and the *matching receive* operation has *started* to receive the message sent by the *synchronous mode send*.

There is a special **predefined message handle**: `MPI_MESSAGE_NO_PROC`, which is a message ~~which~~ ==that== has `MPI_PROC_NULL` as its ~~source process.~~ ==source.== The predefined constant `MPI_MESSAGE_NULL` is the value used for **invalid message handles**.

A *matching probe* with `source``=``MPI_PROC_NULL` returns `flag``= true`, `message``=``MPI_MESSAGE_NO_PROC`, and the status object returns `source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG`, and `count``= 0`; see Section [[versions/v41/sections/pt2pt#Null ==MPI== Processes|Null ==MPI== Processes]] . It is not necessary to call [[versions/v41/API/MPI_MRECV|MPI_MRECV]] or [[versions/v41/API/MPI_IMRECV|MPI_IMRECV]] with `MPI_MESSAGE_NO_PROC`, but it is not *erroneous* to do so.

The implementation of [[versions/v41/API/MPI_MPROBE|MPI_MPROBE]] and [[versions/v41/API/MPI_IMPROBE|MPI_IMPROBE]] needs to guarantee *progress* in the same way as in the case of [[versions/v41/API/MPI_PROBE|MPI_PROBE]] and [[versions/v41/API/MPI_IPROBE|MPI_IPROBE]] . ==See also [[versions/v41/sections/terms#Progress|Progress]] on *progress*.==

According to the definitions in Section [[versions/v41/sections/terms#MPI Procedures|MPI Procedures]] , [[versions/v41/API/MPI_MPROBE|MPI_MPROBE]] is *incomplete*. It is also a ~~*non-local*~~ ==*nonlocal*== procedure.

> This is one of the exceptions in which *incomplete* procedures are ~~*non-local*.~~ ==*nonlocal*.==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Matching Probe]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Matching Probe]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Matching Probe]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Matching Probe]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Matching Probe]]
