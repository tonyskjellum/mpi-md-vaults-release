---
title: "Cancel"
chapter: pt2pt
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Cancel

Chapter **pt2pt** · in [[versions/v30/sections/pt2pt#Cancel|MPI-3.0]], [[versions/v31/sections/pt2pt#Cancel|MPI-3.1]], [[versions/v40/sections/pt2pt#Cancel|MPI-4.0]], [[versions/v41/sections/pt2pt#Cancel|MPI-4.1]], [[versions/v50/sections/pt2pt#Cancel|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

A call to ~~`MPI_CANCEL`~~ ==[[versions/v31/API/MPI_CANCEL|MPI_CANCEL]]== marks for cancellation a pending, nonblocking communication operation (send or receive). The cancel call is local. It returns immediately, possibly before the communication is actually cancelled. It is still necessary to call ~~`MPI_REQUEST_FREE`, `MPI_WAIT`~~ ==[[versions/v31/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , [[versions/v31/API/MPI_WAIT|MPI_WAIT]]== or ~~`MPI_TEST`~~ ==[[versions/v31/API/MPI_TEST|MPI_TEST]]== (or any of the derived operations) with the cancelled request as argument after the call to ~~`MPI_CANCEL`.~~ ==[[versions/v31/API/MPI_CANCEL|MPI_CANCEL]] .== If a communication is marked for cancellation, then a ~~`MPI_WAIT`~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]]== call for that communication is guaranteed to return, irrespective of the activities of other processes (i.e., ~~`MPI_WAIT`~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]]== behaves as a local function); similarly if ~~`MPI_TEST`~~ ==[[versions/v31/API/MPI_TEST|MPI_TEST]]== is repeatedly called in a busy wait loop for a cancelled communication, then [[versions/v31/API/MPI_TEST|MPI_TEST]] will eventually be successful.

Returns `flag = true` if the communication associated with the status object was cancelled successfully. In such a case, all other fields of `status` (such as `count` or `tag`) are undefined. Returns `flag = false`, otherwise. If a receive operation might be cancelled then one should call ~~`MPI_TEST_CANCELLED`~~ ==[[versions/v31/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]]== first, to check whether the operation was cancelled, before checking on the other fields of the return status.

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

A call to [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] marks for ~~cancellation~~ ==*cancellation*== a pending, ~~nonblocking~~ ==*nonblocking*== communication operation (send or receive). ==*Cancelling* a send request by calling [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] is deprecated.== The ~~cancel~~ ==*cancel*== call is ~~local.~~ ==*local*.== It returns ~~immediately,~~ ==*immediately*,== possibly before the communication is actually ~~cancelled.~~ ==*cancelled*.== It is still necessary to call [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , [[versions/v40/API/MPI_WAIT|MPI_WAIT]] or [[versions/v40/API/MPI_TEST|MPI_TEST]] (or any of the derived ~~operations)~~ ==procedures)== with the ~~cancelled~~ ==*cancelled*== request as argument after the call to [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] . If a communication is marked for ~~cancellation,~~ ==*cancellation*,== then a [[versions/v40/API/MPI_WAIT|MPI_WAIT]] call for that communication is guaranteed to return, irrespective of the activities of other processes (i.e., [[versions/v40/API/MPI_WAIT|MPI_WAIT]] behaves as a ~~local~~ ==*local*== function); similarly if [[versions/v40/API/MPI_TEST|MPI_TEST]] is repeatedly called in a busy wait loop for a ~~cancelled~~ ==*cancelled*== communication, then [[versions/v40/API/MPI_TEST|MPI_TEST]] will eventually be successful.

[[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] can be used to ~~cancel~~ ==*cancel*== a communication that uses a ~~persistent request~~ ==*persistent communication request*== (see Section [[versions/v40/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] ), in the same way it is used for nonpersistent requests. ==*Cancelling* a persistent send request by calling [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] is deprecated.== A successful ~~cancellation cancels~~ ==*cancellation* *cancels*== the ~~active~~ ==*active*== communication, but not the request itself. After the call to [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] and the subsequent call to [[versions/v40/API/MPI_WAIT|MPI_WAIT]] or [[versions/v40/API/MPI_TEST|MPI_TEST]] , the request becomes ~~inactive~~ ==*inactive*== and can be activated for a new communication.

The successful ~~cancellation~~ ==*cancellation*== of a ~~buffered send~~ ==*buffered mode send*== frees the buffer space occupied by the pending message. ==*Cancelling* a *buffered mode send* request by calling [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] is deprecated.==

Either the ~~cancellation~~ ==*cancellation*== succeeds, or the communication succeeds, but not both. If a send is marked for ~~cancellation,~~ ==*cancellation*, which is deprecated,== then it must be the case that either the send ~~completes~~ ==*completes*== normally, in which case the message sent was received at the destination process, or that the send is successfully ~~cancelled,~~ ==*cancelled*,== in which case no part of the message was received at the destination. Then, any matching receive has to be satisfied by another send. If a receive is marked for ~~cancellation,~~ ==*cancellation*,== then it must be the case that either the receive ~~completes~~ ==*completes*== normally, or that the receive is successfully ~~cancelled,~~ ==*cancelled*,== in which case no part of the receive buffer is altered. Then, any matching send has to be satisfied by another receive.

If the operation has been ~~cancelled,~~ ==*cancelled*,== then information to that effect will be returned in the status argument of the operation that ~~completes~~ ==*completes*== the communication.

> Although the IN request handle parameter should not need to be passed by reference, the C binding has listed the argument type as ~~`MPI_Request*`~~ ==`MPI_Request``*`== since MPI-1/. This function signature therefore cannot be changed without breaking existing MPI applications.

Returns ~~`flag =~~ ==`flag``=== true` if the communication associated with the status object was ~~cancelled~~ ==*cancelled*== successfully. In such a case, all other fields of `status` (such as `count` or `tag`) are undefined. Returns ~~`flag =~~ ==`flag``=== false`, otherwise. If a receive operation might be ~~cancelled~~ ==*cancelled*== then one should call [[versions/v40/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] first, to check whether the operation was ~~cancelled,~~ ==*cancelled*,== before checking on the other fields of the return status.

> ~~Cancel~~ ==*Cancel*== can be an expensive operation that should be used only exceptionally.

> If a send operation uses an “eager” protocol (data is transferred to the receiver before a matching receive is posted), then the ~~cancellation~~ ==*cancellation*== of this send may require communication with the intended receiver in order to free allocated buffers. On some systems this may require an interrupt to the intended receiver. Note that, while communication may be needed to implement [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] , this is still a ~~local operation,~~ ==*local* procedure,== since its completion does not depend on the code executed by other processes. If processing is required on another process, this should be transparent to the application (hence the need for an interrupt and an interrupt handler).

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

A call to [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] marks for *cancellation* a ~~pending,~~ ==*pending*,== *nonblocking* communication operation (send or receive). *Cancelling* a send request by calling [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] is deprecated. The *cancel* call is *local*. It returns *immediately*, possibly before the communication is actually *cancelled*. It is still necessary to call [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , [[versions/v41/API/MPI_WAIT|MPI_WAIT]] or [[versions/v41/API/MPI_TEST|MPI_TEST]] (or any of the derived procedures) with the *cancelled* request as argument after the call to [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] . If a communication is marked for *cancellation*, then a [[versions/v41/API/MPI_WAIT|MPI_WAIT]] call for that communication is guaranteed to return, irrespective of the activities of other ==MPI== processes (i.e., [[versions/v41/API/MPI_WAIT|MPI_WAIT]] behaves as a *local* function); similarly if [[versions/v41/API/MPI_TEST|MPI_TEST]] is repeatedly called ~~in a busy wait loop~~ for a *cancelled* communication, then [[versions/v41/API/MPI_TEST|MPI_TEST]] will eventually ~~be successful.~~ ==return `flag``= true`.==

[[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] can be used to *cancel* a communication that uses a *persistent communication request* (see Section [[versions/v41/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] ), in the same way ==as== it is ~~used~~ ==described above== for ~~nonpersistent requests.~~ ==nonblocking operations.== *Cancelling* a persistent send request by calling [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] is deprecated. A successful *cancellation* *cancels* the *active* communication, but not the request itself. After the call to [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] and the subsequent call to [[versions/v41/API/MPI_WAIT|MPI_WAIT]] or [[versions/v41/API/MPI_TEST|MPI_TEST]] , the request becomes *inactive* and can be activated for a new communication.

Either the *cancellation* succeeds, or the communication succeeds, but not both. If a send is marked for *cancellation*, which is deprecated, then it must be the case that either the send *completes* normally, in which case the message sent was received at the ~~destination process,~~ ==destination,== or that the send is successfully *cancelled*, in which case no part of the message was received at the destination. Then, any matching receive has to be satisfied by another send. If a receive is marked for *cancellation*, then it must be the case that either the receive *completes* normally, or that the receive is successfully *cancelled*, in which case no part of the receive buffer is altered. Then, any matching send has to be satisfied by another receive.

> If a send operation uses an “eager” protocol (data is transferred to the receiver before a matching receive is ~~posted),~~ ==*started*),== then the *cancellation* of this send may require communication with the intended receiver in order to free allocated buffers. On some systems this may require an interrupt to the intended receiver. Note that, while communication may be needed to implement [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] , this is still a *local* procedure, since its completion does not depend on the code executed by other ==MPI== processes. If processing is required on another ==MPI== process, this should be transparent to the application (hence the need for an interrupt and an interrupt handler). ==See also [[versions/v41/sections/terms#Progress|Progress]] on *progress*.==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Cancel]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Cancel]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Cancel]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Cancel]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Cancel]]
