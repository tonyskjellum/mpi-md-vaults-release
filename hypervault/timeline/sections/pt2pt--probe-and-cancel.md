---
title: "Probe and Cancel"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Probe and Cancel

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Probe and Cancel|MPI-1.3]], [[versions/v21/sections/pt2pt#Probe and Cancel|MPI-2.1]], [[versions/v22/sections/pt2pt#Probe and Cancel|MPI-2.2]], [[versions/v30/sections/pt2pt#Probe and Cancel|MPI-3.0]], [[versions/v31/sections/pt2pt#Probe and Cancel|MPI-3.1]], [[versions/v40/sections/pt2pt#Probe and Cancel|MPI-4.0]], [[versions/v41/sections/pt2pt#Probe and Cancel|MPI-4.1]], [[versions/v50/sections/pt2pt#Probe and Cancel|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (4 changed paragraphs)

If `MPI_IPROBE` returns `flag = true`, then the content of the status object can be subsequently accessed as described in ~~section~~ ==Section== [[versions/v21/sections/pt2pt#Return ~~status|Return status]]~~ ==Status|Return Status]]== to find the source, tag and length of the probed message.

CALL MPI_COMM_RANK(comm, rank, ierr) IF (rank.EQ.0) THEN CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr) ELSE ~~IF(rank.EQ.1)~~ ==IF (rank.EQ.1)== THEN CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr) ELSE ~~! rank.EQ.2~~ ==IF (rank.EQ.2) THEN== DO i=1, 2 CALL MPI_PROBE(MPI_ANY_SOURCE, 0, comm, status, ierr) IF (status(MPI_SOURCE) .EQ. 0) THEN 100 CALL MPI_RECV(i, 1, MPI_INTEGER, 0, 0, comm, status, ierr) ELSE 200 CALL MPI_RECV(x, 1, MPI_REAL, 1, 0, comm, status, ierr) END IF END DO END IF

CALL MPI_COMM_RANK(comm, rank, ierr) IF (rank.EQ.0) THEN CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr) ELSE ~~IF(rank.EQ.1)~~ ==IF (rank.EQ.1)== THEN CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr) ELSE ==IF (rank.EQ.2) THEN== DO i=1, 2 CALL MPI_PROBE(MPI_ANY_SOURCE, 0, comm, status, ierr) IF (status(MPI_SOURCE) .EQ. 0) THEN 100 CALL MPI_RECV(i, 1, MPI_INTEGER, MPI_ANY_SOURCE, 0, comm, status, ierr) ELSE 200 CALL MPI_RECV(x, 1, MPI_REAL, MPI_ANY_SOURCE, 0, comm, status, ierr) END IF END DO END IF

[[versions/v21/API/MPI_CANCEL|MPI_CANCEL]] can be used to cancel a communication that uses a persistent request (see ~~Sec.~~ ==Section== [[versions/v21/sections/pt2pt#Persistent ~~communication requests|Persistent communication requests]]~~ ==Communication Requests|Persistent Communication Requests]]== ), in the same way it is used for nonpersistent requests. A successful cancellation cancels the active communication, but not the request itself. After the call to [[versions/v21/API/MPI_CANCEL|MPI_CANCEL]] and the subsequent call to [[versions/v21/API/MPI_WAIT|MPI_WAIT]] or [[versions/v21/API/MPI_TEST|MPI_TEST]] , the request becomes inactive and can be activated for a new communication.

### MPI-2.1 → MPI-2.2  (5 changed paragraphs)

The `source` argument of [[versions/v22/API/MPI_PROBE|MPI_PROBE]] can be ~~MPI_ANY_SOURCE,~~ ==`MPI_ANY_SOURCE`,== and the `tag` argument can be ~~MPI_ANY_TAG,~~ ==`MPI_ANY_TAG`,== so that one can probe for messages from an arbitrary source and/or with an arbitrary tag. However, a specific communication context must be provided with the `comm` argument.

CALL MPI_COMM_RANK(comm, rank, ierr) IF (rank.EQ.0) THEN CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr) ELSE IF (rank.EQ.1) THEN CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr) ELSE IF (rank.EQ.2) THEN DO i=1, 2 CALL MPI_PROBE(MPI_ANY_SOURCE, 0, comm, status, ierr) IF (status(MPI_SOURCE) .EQ. 0) THEN 100 CALL MPI_RECV(i, 1, MPI_INTEGER, 0, 0, comm, status, ierr) ELSE 200 CALL MPI_RECV(x, 1, MPI_REAL, 1, 0, comm, status, ierr) END IF END DO END IF

We slightly modified ~~example~~ ==Example== [[pt2pt-exP]] , using ~~MPI_ANY_SOURCE~~ ==`MPI_ANY_SOURCE`== as the `source` argument in the two receive calls in statements labeled 100 and 200. The program is now incorrect: the receive operation may receive a message that is distinct from the message probed by the preceding call to [[versions/v22/API/MPI_PROBE|MPI_PROBE]] .

> A call to [[versions/v22/API/MPI_PROBE|MPI_PROBE]] will match the message that would have been received by a call to [[versions/v22/API/MPI_RECV|MPI_RECV]] executed at the same point. Suppose that this message has source <span class="sans-serif">s</span>, tag <span class="sans-serif">t</span> and communicator <span class="sans-serif">c</span>. If the tag argument in the probe call has value ~~MPI_ANY_TAG~~ ==`MPI_ANY_TAG`== then the message probed will be the earliest pending message from source <span class="sans-serif">s</span> with communicator <span class="sans-serif">c</span> and any tag; in any case, the message probed will be the earliest pending message from source <span class="sans-serif">s</span> with tag <span class="sans-serif">t</span> and communicator <span class="sans-serif">c</span> (this is the message that would have been received, so as to preserve message order). This message continues as the earliest pending message from source <span class="sans-serif">s</span> with tag <span class="sans-serif">t</span> and communicator <span class="sans-serif">c</span>, until it is received. A receive operation subsequent to the probe that uses the same communicator as the probe and uses the tag and source values returned by the probe, must receive this message, unless it has already been received by another receive operation.

==> [!tip] Rationale==

==> Although the IN request handle parameter should not need to be passed by reference, the C binding has listed the argument type as `MPI_Request*` since MPI-1/. This function signature therefore cannot be changed without breaking existing MPI applications.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The `MPI_PROBE` and `MPI_IPROBE` operations allow incoming messages to be checked for, without actually receiving them. The user can then decide how to receive them, based on the information returned by the probe (basically, the information returned by `status`). In particular, the user may allocate memory for the receive buffer, according to the length of the probed message.~~

~~The `MPI_CANCEL` operation allows pending communications to be canceled. This is required for cleanup. Posting a send or a receive ties up user resources (send or receive buffers), and a cancel may be needed to free these resources gracefully.~~

~~![[versions/v30/API/MPI_IPROBE]]~~

~~`MPI_IPROBE(source, tag, comm, flag, status)` returns `flag = true` if there is a message that can be received and that matches the pattern specified by the arguments `source`, `tag`, and `comm`. The call matches the same message that would have been received by a call to [[versions/v30/API/MPI_RECV|MPI_RECV]] executed at the same point in the program, and returns in `status` the same value that would have been returned by `MPI_RECV()`. Otherwise, the call returns `flag = false`, and leaves `status` undefined.~~

~~If `MPI_IPROBE` returns `flag = true`, then the content of the status object can be subsequently accessed as described in Section [[versions/v30/sections/pt2pt#Return Status|Return Status]] to find the source, tag and length of the probed message.~~

~~A subsequent receive executed with the same communicator, and the source and tag returned in status by [[versions/v30/API/MPI_IPROBE|MPI_IPROBE]] will receive the message that was matched by the probe, if no other intervening receive occurs after the probe, and the send is not successfully cancelled before the receive.~~

~~If the receiving process is multi-threaded, it is the user’s responsibility to ensure that the last condition holds.~~

~~The `source` argument of [[versions/v30/API/MPI_PROBE|MPI_PROBE]] can be `MPI_ANY_SOURCE`, and the `tag` argument can be `MPI_ANY_TAG`, so that one can probe for messages from an arbitrary source and/or with an arbitrary tag. However, a specific communication context must be provided with the `comm` argument.~~

~~It is not necessary to receive a message immediately after it has been probed for, and the same message may be probed for several times before it is received.~~

~~![[versions/v30/API/MPI_PROBE]]~~

~~`MPI_PROBE` behaves like `MPI_IPROBE` except that it is a blocking call that returns only after a matching message has been found.~~

~~The MPI implementation of [[versions/v30/API/MPI_PROBE|MPI_PROBE]] and [[versions/v30/API/MPI_IPROBE|MPI_IPROBE]] needs to guarantee progress: if a call to [[versions/v30/API/MPI_PROBE|MPI_PROBE]] has been issued by a process, and a send that matches the probe has been initiated by some process, then the call to [[versions/v30/API/MPI_PROBE|MPI_PROBE]] will return, unless the message is received by another concurrent receive operation (that is executed by another thread at the probing process). Similarly, if a process busy waits with [[versions/v30/API/MPI_IPROBE|MPI_IPROBE]] and a matching message has been issued, then the call to [[versions/v30/API/MPI_IPROBE|MPI_IPROBE]] will eventually return <span class="sans-serif">flag = true</span> unless the message is received by another concurrent receive operation.~~

~~ Use blocking probe to wait for an incoming message.~~

~~           CALL MPI_COMM_RANK(comm, rank, ierr)            IF (rank.EQ.0) THEN                CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr)            ELSE IF (rank.EQ.1) THEN                CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr)            ELSE IF (rank.EQ.2) THEN                DO i=1, 2                   CALL MPI_PROBE(MPI_ANY_SOURCE, 0,                                  comm, status, ierr)                   IF (status(MPI_SOURCE) .EQ. 0) THEN     100               CALL MPI_RECV(i, 1, MPI_INTEGER, 0, 0, comm, status, ierr)                   ELSE     200               CALL MPI_RECV(x, 1, MPI_REAL, 1, 0, comm, status, ierr)                   END IF                END DO            END IF~~

~~Each message is received with the right type.~~

~~ A similar program to the previous example, but now it has a problem.~~

~~           CALL MPI_COMM_RANK(comm, rank, ierr)            IF (rank.EQ.0) THEN                 CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr)            ELSE IF (rank.EQ.1) THEN                 CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr)            ELSE IF (rank.EQ.2) THEN                DO i=1, 2                   CALL MPI_PROBE(MPI_ANY_SOURCE, 0,                                   comm, status, ierr)                   IF (status(MPI_SOURCE) .EQ. 0) THEN     100                CALL MPI_RECV(i, 1, MPI_INTEGER, MPI_ANY_SOURCE,                                      0, comm, status, ierr)                   ELSE     200                CALL MPI_RECV(x, 1, MPI_REAL, MPI_ANY_SOURCE,                                      0, comm, status, ierr)                   END IF                END DO            END IF~~

~~We slightly modified Example [[pt2pt-exP]] , using `MPI_ANY_SOURCE` as the `source` argument in the two receive calls in statements labeled 100 and 200. The program is now incorrect: the receive operation may receive a message that is distinct from the message probed by the preceding call to [[versions/v30/API/MPI_PROBE|MPI_PROBE]] .~~

~~> [!warning] Advice to implementors~~

~~> A call to [[versions/v30/API/MPI_PROBE|MPI_PROBE]] will match the message that would have been received by a call to [[versions/v30/API/MPI_RECV|MPI_RECV]] executed at the same point. Suppose that this message has source <span class="sans-serif">s</span>, tag <span class="sans-serif">t</span> and communicator <span class="sans-serif">c</span>. If the tag argument in the probe call has value `MPI_ANY_TAG` then the message probed will be the earliest pending message from source <span class="sans-serif">s</span> with communicator <span class="sans-serif">c</span> and any tag; in any case, the message probed will be the earliest pending message from source <span class="sans-serif">s</span> with tag <span class="sans-serif">t</span> and communicator <span class="sans-serif">c</span> (this is the message that would have been received, so as to preserve message order). This message continues as the earliest pending message from source <span class="sans-serif">s</span> with tag <span class="sans-serif">t</span> and communicator <span class="sans-serif">c</span>, until it is received. A receive operation subsequent to the probe that uses the same communicator as the probe and uses the tag and source values returned by the probe, must receive this message, unless it has already been received by another receive operation.~~

~~![[versions/v30/API/MPI_CANCEL]]~~

~~A call to `MPI_CANCEL` marks for cancellation a pending, nonblocking communication operation (send or receive). The cancel call is local. It returns immediately, possibly before the communication is actually canceled. It is still necessary to complete a communication that has been marked for cancellation, using a call to `MPI_REQUEST_FREE`, `MPI_WAIT` or `MPI_TEST` (or any of the derived operations).~~

~~If a communication is marked for cancellation, then a `MPI_WAIT` call for that communication is guaranteed to return, irrespective of the activities of other processes (i.e., `MPI_WAIT` behaves as a local function); similarly if `MPI_TEST` is repeatedly called in a busy wait loop for a canceled communication, then [[versions/v30/API/MPI_TEST|MPI_TEST]] will eventually be successful.~~

~~[[versions/v30/API/MPI_CANCEL|MPI_CANCEL]] can be used to cancel a communication that uses a persistent request (see Section [[versions/v30/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] ), in the same way it is used for nonpersistent requests. A successful cancellation cancels the active communication, but not the request itself. After the call to [[versions/v30/API/MPI_CANCEL|MPI_CANCEL]] and the subsequent call to [[versions/v30/API/MPI_WAIT|MPI_WAIT]] or [[versions/v30/API/MPI_TEST|MPI_TEST]] , the request becomes inactive and can be activated for a new communication.~~

~~The successful cancellation of a buffered send frees the buffer space occupied by the pending message.~~

~~Either the cancellation succeeds, or the communication succeeds, but not both. If a send is marked for cancellation, then it must be the case that either the send completes normally, in which case the message sent was received at the destination process, or that the send is successfully canceled, in which case no part of the message was received at the destination. Then, any matching receive has to be satisfied by another send. If a receive is marked for cancellation, then it must be the case that either the receive completes normally, or that the receive is successfully canceled, in which case no part of the receive buffer is altered. Then, any matching send has to be satisfied by another receive.~~

~~If the operation has been canceled, then information to that effect will be returned in the status argument of the operation that completes the communication.~~

~~> [!tip] Rationale~~

~~> Although the IN request handle parameter should not need to be passed by reference, the C binding has listed the argument type as `MPI_Request*` since MPI-1/. This function signature therefore cannot be changed without breaking existing MPI applications.~~

~~![[versions/v30/API/MPI_TEST_CANCELLED]]~~

~~Returns `flag = true` if the communication associated with the status object was canceled successfully. In such a case, all other fields of `status` (such as `count` or `tag`) are undefined. Returns `flag = false`, otherwise. If a receive operation might be canceled then one should call `MPI_TEST_CANCELLED` first, to check whether the operation was canceled, before checking on the other fields of the return status.~~

~~> [!note] Advice to users~~

~~> Cancel can be an expensive operation that should be used only exceptionally.~~

~~> [!warning] Advice to implementors~~

~~> If a send operation uses an “eager” protocol (data is transferred to the receiver before a matching receive is posted), then the cancellation of this send may require communication with the intended receiver in order to free allocated buffers. On some systems this may require an interrupt to the intended receiver. Note that, while communication may be needed to implement [[versions/v30/API/MPI_CANCEL|MPI_CANCEL]] , this is still a local operation, since its completion does not depend on the code executed by other processes. If processing is required on another process, this should be transparent to the application (hence the need for an interrupt and an interrupt handler).~~

==The `MPI_PROBE`, `MPI_IPROBE`, `MPI_MPROBE`, and `MPI_IMPROBE` operations allow incoming messages to be checked for, without actually receiving them. The user can then decide how to receive them, based on the information returned by the probe (basically, the information returned by `status`). In particular, the user may allocate memory for the receive buffer, according to the length of the probed message.==

==The `MPI_CANCEL` operation allows pending communications to be cancelled. This is required for cleanup. Posting a send or a receive ties up user resources (send or receive buffers), and a cancel may be needed to free these resources gracefully.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

The ~~`MPI_PROBE`, `MPI_IPROBE`, `MPI_MPROBE`,~~ ==[[versions/v31/API/MPI_PROBE|MPI_PROBE]] , [[versions/v31/API/MPI_IPROBE|MPI_IPROBE]] , [[versions/v31/API/MPI_MPROBE|MPI_MPROBE]] ,== and ~~`MPI_IMPROBE`~~ ==[[versions/v31/API/MPI_IMPROBE|MPI_IMPROBE]]== operations allow incoming messages to be checked for, without actually receiving them. The user can then decide how to receive them, based on the information returned by the probe (basically, the information returned by `status`). In particular, the user may allocate memory for the receive buffer, according to the length of the probed message.

The ~~`MPI_CANCEL`~~ ==[[versions/v31/API/MPI_CANCEL|MPI_CANCEL]]== operation allows pending communications to be cancelled. This is required for cleanup. Posting a send or a receive ties up user resources (send or receive buffers), and a cancel may be needed to free these resources gracefully.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~The [[versions/v40/API/MPI_PROBE|MPI_PROBE]] , [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] , [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] , and [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] operations allow incoming messages to be checked for, without actually receiving them. The user can then decide how to receive them, based on the information returned by the probe (basically, the information returned by `status`). In particular, the user may allocate memory for the receive buffer, according to the length of the probed message.~~

~~The [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] operation allows pending communications to be cancelled. This is required for cleanup. Posting a send or a receive ties up user resources (send or receive buffers), and a cancel may be needed to free these resources gracefully.~~

==The [[versions/v40/API/MPI_PROBE|MPI_PROBE]] , [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] , [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] , and [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] procedures allow incoming messages to be checked for, without actually receiving them. The user can then decide how to receive them, based on the information returned by the **probe** (basically, the information returned by `status`). In particular, the user may allocate memory for the receive buffer, according to the length of the probed message.==

==The [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] procedure allows pending communications to be **cancelled**. This is required for cleanup. Posting a send or a receive ties up user resources (send or receive buffers), and a *cancel* may be needed to free these resources gracefully.==

==*Cancelling* a send request by calling [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] is deprecated. *Cancelling* a send-recv request by calling [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] is not allowed.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] procedure allows ~~pending communications~~ ==*pending* communication operations== to be **cancelled**. This is required for cleanup. Posting a send or a receive ties up user resources (send or receive buffers), and a *cancel* may be needed to free these resources gracefully.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Probe and Cancel]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Probe and Cancel]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Probe and Cancel]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Probe and Cancel]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Probe and Cancel]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Probe and Cancel]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Probe and Cancel]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Probe and Cancel]]
