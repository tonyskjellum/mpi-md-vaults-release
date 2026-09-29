---
title: "Nonblocking Communication"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Nonblocking Communication

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Nonblocking communication|MPI-1.3]], [[versions/v21/sections/pt2pt#Nonblocking Communication|MPI-2.1]], [[versions/v22/sections/pt2pt#Nonblocking Communication|MPI-2.2]], [[versions/v30/sections/pt2pt#Nonblocking Communication|MPI-3.0]], [[versions/v31/sections/pt2pt#Nonblocking Communication|MPI-3.1]], [[versions/v40/sections/pt2pt#Nonblocking Communication|MPI-4.0]], [[versions/v41/sections/pt2pt#Nonblocking Communication|MPI-4.1]], [[versions/v50/sections/pt2pt#Nonblocking Communication|MPI-5.0]]

Heading by release: MPI-1.3: “Nonblocking communication”; MPI-2.1: “Nonblocking Communication”; MPI-2.2: “Nonblocking Communication”; MPI-3.0: “Nonblocking Communication”; MPI-3.1: “Nonblocking Communication”; MPI-4.0: “Nonblocking Communication”; MPI-4.1: “Nonblocking Communication”; MPI-5.0: “Nonblocking Communication”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~One can improve performance on many systems by overlapping communication and computation. This is especially true on systems where communication can be executed autonomously by an intelligent communication controller. Light-weight threads are one mechanism for achieving such overlap. An alternative mechanism that often leads to better performance is to use **nonblocking communication**. A nonblocking **send start** call initiates the send operation, but does not complete it. The send start call will return before the message was copied out of the send buffer. A separate **send complete** call is needed to complete the communication, i.e., to verify that the data has been copied out of the send buffer. With suitable hardware, the transfer of data out of the sender memory may proceed concurrently with computations done at the sender after the send was initiated and before it completed. Similarly, a nonblocking **receive start call** initiates the receive operation, but does not complete it. The call will return before a message is stored into the receive buffer. A separate **receive complete** call is needed to complete the receive operation and verify that the data has been received into the receive buffer. With suitable hardware, the transfer of data into the receiver memory may proceed concurrently with computations done after the receive was initiated and before it completed. The use of nonblocking receives may also avoid system buffering and memory-to-memory copying, as information is provided early on the location of the receive buffer.~~

==One can improve performance on many systems by overlapping communication and computation. This is especially true on systems where communication can be executed autonomously by an intelligent communication controller. Light-weight threads are one mechanism for achieving such overlap. An alternative mechanism that often leads to better performance is to use **nonblocking communication**. A nonblocking **send start** call initiates the send operation, but does not complete it. The send start call==

==can==

==return before the message was copied out of the send buffer. A separate **send complete** call is needed to complete the communication, i.e., to verify that the data has been copied out of the send buffer. With suitable hardware, the transfer of data out of the sender memory may proceed concurrently with computations done at the sender after the send was initiated and before it completed. Similarly, a nonblocking **receive start call** initiates the receive operation, but does not complete it. The call==

==can==

==return before a message is stored into the receive buffer. A separate **receive complete** call is needed to complete the receive operation and verify that the data has been received into the receive buffer. With suitable hardware, the transfer of data into the receiver memory may proceed concurrently with computations done after the receive was initiated and before it completed. The use of nonblocking receives may also avoid system buffering and memory-to-memory copying, as information is provided early on the location of the receive buffer.==

~~If the send mode is <span class="sans-serif">standard</span> then the send-complete call may return before a matching receive occurred, if the message is buffered. On the other hand, the send-complete may not complete until a matching receive occurred, and the message was copied into the receive buffer.~~

==If the send mode is <span class="sans-serif">standard</span> then the send-complete call may return before a matching receive==

==is posted,==

==if the message is buffered. On the other hand, the send-complete may not complete until a matching receive==

==is posted,==

==and the message was copied into the receive buffer.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

> The completion of a send operation may be delayed, for standard mode, and must be delayed, for synchronous mode, until a matching receive is posted. The use of nonblocking sends in these two cases allows the sender to proceed ahead of the receiver, so that the computation is more tolerant of fluctuations in the speeds of the two processes. > > Nonblocking sends in the buffered and ready modes have a more limited ~~impact. A~~ ==impact, e.g., the blocking version of buffered send is capable of completing regardless of when a matching receive call is made. However, separating the start from the completion of these sends still gives some opportunity for optimization within the MPI library. For example, starting a buffered send gives an implementation more flexibility in determining if and how the message is buffered. There are also advantages for both== nonblocking ~~send will return as soon as possible, whereas a blocking send will return after the data has been copied out of the sender memory. The use of nonblocking sends is advantageous in these cases only if~~ ==buffered and ready modes when== data copying can be ~~concurrent~~ ==done concurrently== with computation. > > The message-passing model implies that communication is initiated by the sender. The communication will generally have lower overhead if a receive is already posted when the sender initiates the communication (data can be moved directly to the receive buffer, and there is no need to queue a pending send request). However, a receive operation can complete only after the matching send has occurred. The use of nonblocking receives allows one to achieve lower communication overheads without blocking the receiver while it waits for the send.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~can~~

~~return before the message was copied out of the send buffer. A separate **send complete** call is needed to complete the communication, i.e., to verify that the data has been copied out of the send buffer. With suitable hardware, the transfer of data out of the sender memory may proceed concurrently with computations done at the sender after the send was initiated and before it completed. Similarly, a nonblocking **receive start call** initiates the receive operation, but does not complete it. The call~~

~~can~~

~~return before a message is stored into the receive buffer. A separate **receive complete** call is needed to complete the receive operation and verify that the data has been received into the receive buffer. With suitable hardware, the transfer of data into the receiver memory may proceed concurrently with computations done after the receive was initiated and before it completed. The use of nonblocking receives may also avoid system buffering and memory-to-memory copying, as information is provided early on the location of the receive buffer.~~

==can return before the message was copied out of the send buffer. A separate **send complete** call is needed to complete the communication, i.e., to verify that the data has been copied out of the send buffer. With suitable hardware, the transfer of data out of the sender memory may proceed concurrently with computations done at the sender after the send was initiated and before it completed. Similarly, a nonblocking **receive start call** initiates the receive operation, but does not complete it. The call==

==can return before a message is stored into the receive buffer. A separate **receive complete** call is needed to complete the receive operation and verify that the data has been received into the receive buffer. With suitable hardware, the transfer of data into the receiver memory may proceed concurrently with computations done after the receive was initiated and before it completed. The use of nonblocking receives may also avoid system buffering and memory-to-memory copying, as information is provided early on the location of the receive buffer.==

~~is posted,~~

~~if the message is buffered. On the other hand, the send-complete may not complete until a matching receive~~

~~is posted,~~

~~and the message was copied into the receive buffer.~~

==is posted, if the message is buffered. On the other hand, the receive-complete may not complete until a matching receive==

==is posted, and the message was copied into the receive buffer.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~One can improve performance on many systems by overlapping communication and computation. This is especially true on systems where communication can be executed autonomously by an intelligent communication controller. Light-weight threads are one mechanism for achieving such overlap. An alternative mechanism that often leads to better performance is to use **nonblocking communication**. A nonblocking **send start** call initiates the send operation, but does not complete it. The send start call~~

~~can return before the message was copied out of the send buffer. A separate **send complete** call is needed to complete the communication, i.e., to verify that the data has been copied out of the send buffer. With suitable hardware, the transfer of data out of the sender memory may proceed concurrently with computations done at the sender after the send was initiated and before it completed. Similarly, a nonblocking **receive start call** initiates the receive operation, but does not complete it. The call~~

~~can return before a message is stored into the receive buffer. A separate **receive complete** call is needed to complete the receive operation and verify that the data has been received into the receive buffer. With suitable hardware, the transfer of data into the receiver memory may proceed concurrently with computations done after the receive was initiated and before it completed. The use of nonblocking receives may also avoid system buffering and memory-to-memory copying, as information is provided early on the location of the receive buffer.~~

~~Nonblocking send start calls can use the same four modes as blocking sends: <span class="sans-serif">standard</span>, <span class="sans-serif">buffered</span>, <span class="sans-serif">synchronous</span> and <span class="sans-serif">ready</span>. These carry the same meaning. Sends of all modes, <span class="sans-serif">ready</span> excepted, can be started whether a matching receive has been posted or not; a nonblocking <span class="sans-serif">ready</span> send can be started only if a matching receive is posted. In all cases, the send start call is local: it returns immediately, irrespective of the status of other processes. If the call causes some system resource to be exhausted, then it will fail and return an error code. Quality implementations of MPI should ensure that this happens only in “pathological” cases. That is, an MPI implementation should be able to support a large number of pending nonblocking operations.~~

==One can improve performance on many systems by overlapping communication and computation. This is especially true on systems where communication can be executed autonomously by an intelligent communication controller. Light-weight threads are one mechanism for achieving such overlap. An alternative mechanism that often leads to better performance is to use **nonblocking communication**. A nonblocking **send start** call initiates the send operation, but does not complete it. The send start call can return before the message was copied out of the send buffer. A separate **send complete** call is needed to complete the communication, i.e., to verify that the data has been copied out of the send buffer. With suitable hardware, the transfer of data out of the sender memory may proceed concurrently with computations done at the sender after the send was initiated and before it completed. Similarly, a nonblocking **receive start call** initiates the receive operation, but does not complete it. The call can return before a message is stored into the receive buffer. A separate **receive complete** call is needed to complete the receive operation and verify that the data has been received into the receive buffer. With suitable hardware, the transfer of data into the receiver memory may proceed concurrently with computations done after the receive was initiated and before it completed. The use of nonblocking receives may also avoid system buffering and memory-to-memory copying, as information is provided early on the location of the receive buffer.==

==Nonblocking send start calls can use the same four modes as blocking sends: *standard*, *buffered*, *synchronous* and *ready*. These carry the same meaning. Sends of all modes, *ready* excepted, can be started whether a matching receive has been posted or not; a nonblocking **ready** send can be started only if a matching receive is posted. In all cases, the send start call is local: it returns immediately, irrespective of the status of other processes. If the call causes some system resource to be exhausted, then it will fail and return an error code. Quality implementations of MPI should ensure that this happens only in “pathological” cases. That is, an MPI implementation should be able to support a large number of pending nonblocking operations.==

~~If the send mode is <span class="sans-serif">synchronous</span>, then the send can complete only if a matching receive has started. That is, a receive has been posted, and has been matched with the send. In this case, the send-complete call is non-local. Note that a synchronous, nonblocking send may complete, if matched by a nonblocking receive, before the receive complete call occurs. (It can complete as soon as the sender “knows” the transfer will complete, but before the receiver “knows” the transfer will complete.)~~

~~If the send mode is <span class="sans-serif">buffered</span> then the message must be buffered if there is no pending receive. In this case, the send-complete call is local, and must succeed irrespective of the status of a matching receive.~~

~~If the send mode is <span class="sans-serif">standard</span> then the send-complete call may return before a matching receive~~

~~is posted, if the message is buffered. On the other hand, the receive-complete may not complete until a matching receive~~

~~is posted, and the message was copied into the receive buffer.~~

==If the send mode is **synchronous**, then the send can complete only if a matching receive has started. That is, a receive has been posted, and has been matched with the send. In this case, the send-complete call is non-local. Note that a synchronous, nonblocking send may complete, if matched by a nonblocking receive, before the receive complete call occurs. (It can complete as soon as the sender “knows” the transfer will complete, but before the receiver “knows” the transfer will complete.)==

==If the send mode is **buffered** then the message must be buffered if there is no pending receive. In this case, the send-complete call is local, and must succeed irrespective of the status of a matching receive.==

==If the send mode is **standard** then the send-complete call may return before a matching receive is posted, if the message is buffered. On the other hand, the receive-complete may not complete until a matching receive is posted, and the message was copied into the receive buffer.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

~~One can improve performance on many systems by overlapping communication and computation. This is especially true on systems where communication can be executed autonomously by an intelligent communication controller. Light-weight threads are one mechanism for achieving such overlap. An alternative mechanism that often leads to better performance is to use **nonblocking communication**. A nonblocking **send start** call initiates the send operation, but does not complete it. The send start call can return before the message was copied out of the send buffer. A separate **send complete** call is needed to complete the communication, i.e., to verify that the data has been copied out of the send buffer. With suitable hardware, the transfer of data out of the sender memory may proceed concurrently with computations done at the sender after the send was initiated and before it completed. Similarly, a nonblocking **receive start call** initiates the receive operation, but does not complete it. The call can return before a message is stored into the receive buffer. A separate **receive complete** call is needed to complete the receive operation and verify that the data has been received into the receive buffer. With suitable hardware, the transfer of data into the receiver memory may proceed concurrently with computations done after the receive was initiated and before it completed. The use of nonblocking receives may also avoid system buffering and memory-to-memory copying, as information is provided early on the location of the receive buffer.~~

~~Nonblocking send start calls can use the same four modes as blocking sends: *standard*, *buffered*, *synchronous* and *ready*. These carry the same meaning. Sends of all modes, *ready* excepted, can be started whether a matching receive has been posted or not; a nonblocking **ready** send can be started only if a matching receive is posted. In all cases, the send start call is local: it returns immediately, irrespective of the status of other processes. If the call causes some system resource to be exhausted, then it will fail and return an error code. Quality implementations of MPI should ensure that this happens only in “pathological” cases. That is, an MPI implementation should be able to support a large number of pending nonblocking operations.~~

==**Nonblocking communication** is important both for reasons of correctness and performance. For complex communication patterns, the use of only blocking communication (without buffering) is difficult because the programmer must ensure that each send is matched with a receive in an order that avoids *deadlock*. For communication patterns that are determined only at run time, this is even more difficult. Nonblocking communication can be used to avoid this problem, allowing programmers to express complex and possibly dynamic communication patterns without needing to ensure that all sends and receives are issued in an order that prevents deadlock (see Section [[versions/v40/sections/pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] and the discussion of “safe” programs). Nonblocking communication also allows for the *overlap* of communication with different communication operations, e.g., to prevent the *serialization* of such operations, and for the *overlap* of communication with computation. Whether an implementation is able to accomplish an effective (from a performance standpoint) overlap of operations depends on the implementation itself and the system on which the implementation is running. Using nonblocking operations *permits* an implementation to overlap communication with computation, but does not require it to do so.==

==A nonblocking **send start** call *initiates* the send operation, but does not complete it. The send start call can return before the message was copied out of the send buffer. A separate **send complete** call is needed to complete the communication, i.e., to verify that the data has been copied out of the send buffer. With suitable hardware, the transfer of data out of the sender memory may proceed concurrently with computations done at the sender after the send was initiated and before it completed. Similarly, a nonblocking **receive start** call *initiates* the receive operation, but does not complete it. The call can return before a message is stored into the receive buffer. A separate **receive complete** call is needed to complete the receive operation and verify that the data has been received into the receive buffer. With suitable hardware, the transfer of data into the receiver memory may proceed concurrently with computations done after the receive was initiated and before it completed. The use of nonblocking receives may also avoid system buffering and memory-to-memory copying, as information is provided early on the location of the receive buffer.==

==Nonblocking send start calls can use the same four modes as blocking sends: *standard*, *buffered*, *synchronous*, and *ready*. These carry the same meaning. Sends of all modes, *ready* excepted, can be started whether a matching receive has been posted or not; a nonblocking **ready** send can be started only if a matching receive is posted. In all cases, the send start call is *local*: it returns immediately, irrespective of the status of other processes. If the call causes some system resource to be exhausted, then it will fail and return an error code. Quality implementations of MPI should ensure that this happens only in “pathological” cases. That is, an MPI implementation should be able to support a large number of pending nonblocking operations.==

If the send mode is **synchronous**, then the send can complete only if a matching receive has started. That is, a receive has been posted, and has been matched with the send. In this case, the send-complete call is ~~non-local.~~ ==*non-local*.== Note that a synchronous, nonblocking send may complete, if matched by a nonblocking receive, before the receive complete call occurs. (It can complete as soon as the sender “knows” the transfer will complete, but before the receiver “knows” the transfer will complete.)

If the send mode is **buffered** then the message must be buffered if there is no pending receive. In this case, the send-complete call is ~~local,~~ ==*local*,== and must succeed irrespective of the status of a matching receive.

If the send mode is **standard** then the send-complete call may return before a matching receive is posted, if the message is buffered. On the other hand, the ~~receive-complete~~ ==send-complete== may not complete until a matching receive is posted, and the message was copied into the receive buffer.

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

**Nonblocking communication** is important both for reasons of correctness and performance. For complex communication patterns, the use of only blocking communication (without buffering) is difficult because the programmer must ensure that each send is matched with a receive in an order that avoids *deadlock*. For communication patterns that are determined only at run time, this is even more difficult. Nonblocking communication can be used to avoid this problem, allowing programmers to express complex and possibly dynamic communication patterns without needing to ensure that all sends and receives are issued in an order that prevents deadlock (see Section [[versions/v41/sections/pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] and the discussion of “safe” programs). Nonblocking communication also allows for the *overlap* of communication with different communication operations, e.g., to prevent the ==unintentional== *serialization* of such operations, and for the *overlap* of communication with computation. Whether an implementation is able to accomplish an effective (from a performance standpoint) overlap of operations depends on the implementation itself and the system on which the implementation is running. Using nonblocking operations *permits* an implementation to overlap communication with computation, but does not require it to do so.

Nonblocking send start calls can use the same four modes as blocking sends: *standard*, *buffered*, *synchronous*, and *ready*. These carry the same meaning. Sends of all modes, *ready* excepted, can be started whether a matching receive has been ~~posted~~ ==started== or not; a nonblocking **ready** send can be started only if ~~a~~ ==the== matching receive is ~~posted.~~ ==already started.== In all cases, the send start call is *local*: it returns immediately, irrespective of the status of other ==MPI== processes. If the call causes some system resource to be exhausted, then it will fail and return an error code. ~~Quality~~ ==High-quality== implementations of MPI should ensure that this happens only in “pathological” cases. That is, an MPI implementation should be able to support a large number of ~~pending~~ ==*pending*== nonblocking operations.

The send-complete call returns ==no earlier than== when ==all message== data has been copied out of the send buffer. It may carry additional meaning, depending on the send mode.

If the send mode is **synchronous**, then ==the send-complete call is *nonlocal*;== the send can complete only if a matching receive has ~~started. That is, a receive has~~ been ~~posted,~~ ==started== and has been matched with the send. ~~In this case, the send-complete call is *non-local*.~~ Note that a ~~synchronous, nonblocking~~ ==synchronous mode== send may complete, if matched by a nonblocking receive, before the receive complete call occurs. (It can complete as soon as the sender “knows” the transfer will complete, but before the receiver “knows” the transfer will complete.)

If the send mode is ~~**buffered**~~ ==**buffered**,== then ~~the message must be buffered if there is no pending receive. In this case,~~ the send-complete call is ~~*local*, and~~ ==*local*; the send== must ~~succeed~~ ==complete== irrespective of the status of a matching receive. ==If there is no *pending* receive operation, then the message must be buffered.==

If the send mode is ~~**standard**~~ ==**standard**,== then the send-complete call ~~may return~~ ==can be either *local* or *nonlocal*. If the message is buffered, it is permitted for the send to complete== before a matching receive is ~~posted, if the message is buffered.~~ ==started.== On the other hand, ==it is permitted for== the ~~send-complete may~~ ==send== not ==to== complete until a matching receive ~~is posted,~~ ==has been started== and the message ~~was~~ ==has been== copied into the receive buffer.

> The completion of a send operation may be ~~delayed,~~ ==delayed== for standard mode, and must be ~~delayed,~~ ==delayed== for synchronous mode, until a matching receive ~~is posted.~~ ==has been started.== The use of nonblocking sends in these two cases allows the sender to proceed ahead of the receiver, so that the computation is more tolerant of fluctuations in the speeds of the two ==MPI== processes. > > Nonblocking sends in the buffered and ready modes have a more limited impact, e.g., the blocking version of buffered send is capable of completing regardless of when a matching receive call is made. However, separating the start from the completion of these sends still gives some opportunity for optimization within the MPI library. For example, starting a buffered send gives an implementation more flexibility in determining if and how the message is buffered. There are also advantages for both nonblocking buffered and ready modes when data copying can be done concurrently with computation. > > The message-passing model implies that communication is initiated by the sender. The communication will generally have lower overhead if a receive is already ~~posted~~ ==*started*== when the sender initiates the communication (data can be moved directly to the receive buffer, and there is no need to queue a pending send request). However, a receive operation can complete only after the matching send has ~~occurred.~~ ==*started*.== The use of nonblocking receives allows one to achieve lower communication overheads without blocking the receiver while it waits for the send.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Nonblocking communication]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Nonblocking Communication]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Nonblocking Communication]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Nonblocking Communication]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Nonblocking Communication]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Nonblocking Communication]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Nonblocking Communication]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Nonblocking Communication]]
