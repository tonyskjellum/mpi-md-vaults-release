---
title: "Non-Destructive Test of `status`"
chapter: pt2pt
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Non-Destructive Test of `status`

Chapter **pt2pt** · in [[versions/v21/sections/pt2pt#Non-destructive Test of `status`|MPI-2.1]], [[versions/v22/sections/pt2pt#Non-destructive Test of `status`|MPI-2.2]], [[versions/v30/sections/pt2pt#Non-destructive Test of `status`|MPI-3.0]], [[versions/v31/sections/pt2pt#Non-destructive Test of `status`|MPI-3.1]], [[versions/v40/sections/pt2pt#Non-Destructive Test of `status`|MPI-4.0]], [[versions/v41/sections/pt2pt#Non-Destructive Test of `status`|MPI-4.1]], [[versions/v50/sections/pt2pt#Non-Destructive Test of `status`|MPI-5.0]]

Heading by release: MPI-2.1: “Non-destructive Test of `status`”; MPI-2.2: “Non-destructive Test of `status`”; MPI-3.0: “Non-destructive Test of `status`”; MPI-3.1: “Non-destructive Test of `status`”; MPI-4.0: “Non-Destructive Test of `status`”; MPI-4.1: “Non-Destructive Test of `status`”; MPI-5.0: “Non-Destructive Test of `status`”

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

==One is allowed to call [[versions/v22/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] with a null or inactive request argument. In such a case the operation returns with `flag=true` and empty status.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

This call is useful for accessing the information associated with a request, without ~~freeing~~ ==*freeing*== the request (in case the user is expected to access it later). It allows one to layer libraries more conveniently, since multiple layers of software may access the same ~~completed~~ ==*completed*== request and extract from it the status information.

Sets ~~`flag=true`~~ ==`flag``= true`== if the operation is ~~complete,~~ ==*complete*,== and, if so, returns in status the request status. However, unlike test or wait, it does not deallocate or ~~inactivate~~ ==*inactivate*== the request; a subsequent call to test, wait or free should be executed with that request. It sets ~~`flag=false`~~ ==`flag``= false`== if the operation is not ~~complete.~~ ==*complete*.==

One is allowed to call [[versions/v40/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] with a ~~null~~ ==*null*== or ~~inactive~~ ==*inactive*== request argument. In such a case the ~~operation~~ ==procedure== returns with ~~`flag=true`~~ ==`flag``= true`== and ~~empty~~ ==*empty*== status.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~This call is~~ ==These procedures are== useful for accessing the information associated with a request, without *freeing* the request (in case the user is expected to access it later). It allows one to layer libraries more conveniently, since multiple layers of software may access the same *completed* request and extract from it the status information.

==The *progress* rule for [[versions/v41/API/MPI_TEST|MPI_TEST]] , as described in Section [[versions/v41/sections/pt2pt#Semantics of Nonblocking Communication Operations|Semantics of Nonblocking Communication Operations]] , also applies to [[versions/v41/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] .==

==![[versions/v41/API/MPI_REQUEST_GET_STATUS_ANY]]==

==Tests for *completion* of either one or none of the operations associated with *active* handles. In the former case, it returns `flag``= true`, returns in `index` the index of this request in the array, and returns in `status` the status of that operation. (The array is indexed from zero in C, and from one in Fortran.) In the latter case (no operation *completed*), it returns `flag``= false`, returns a value of `MPI_UNDEFINED` in `index` and `status` is undefined.==

==The array may contain *null* or inactive handles. If the array contains no *active* handles then the call returns *immediately* with `flag``= true`, `index``=``MPI_UNDEFINED`, and an *empty* `status`.==

==If the array of requests contains active handles then the execution of [[versions/v41/API/MPI_REQUEST_GET_STATUS_ANY|MPI_REQUEST_GET_STATUS_ANY]] has the same effect as the execution of [[versions/v41/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] with each of the active array elements in some arbitrary order, until one call returns `flag``= true`, or all return `flag``= false`. In the former case, `index` is set to indicate which array element returned `flag``= true` and in the latter case, it is set to `MPI_UNDEFINED`. [[versions/v41/API/MPI_REQUEST_GET_STATUS_ANY|MPI_REQUEST_GET_STATUS_ANY]] with an array containing one request is equivalent to [[versions/v41/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] .==

==![[versions/v41/API/MPI_REQUEST_GET_STATUS_ALL]]==

==[[versions/v41/API/MPI_REQUEST_GET_STATUS_ALL|MPI_REQUEST_GET_STATUS_ALL]] returns `flag``= true` if all communication operations associated with *active* handles in the array have *completed* (this includes the case where all handles in the list are *inactive* or `MPI_REQUEST_NULL`). In this case, each status entry that corresponds to an *active* request is set to the status of the corresponding operation. Unlike test or wait, it does not deallocate or *inactivate* the requests; a subsequent call to test, wait or free should be executed with each of those requests.==

==Each status entry that corresponds to a *null* or *inactive* handle is set to *empty*.==

==Otherwise, `flag``= false` is returned and the values of the status entries are undefined.==

==The *progress* rule for [[versions/v41/API/MPI_TEST|MPI_TEST]] , as described in Section [[versions/v41/sections/pt2pt#Semantics of Nonblocking Communication Operations|Semantics of Nonblocking Communication Operations]] , also applies to [[versions/v41/API/MPI_REQUEST_GET_STATUS_ALL|MPI_REQUEST_GET_STATUS_ALL]] .==

==![[versions/v41/API/MPI_REQUEST_GET_STATUS_SOME]]==

==[[versions/v41/API/MPI_REQUEST_GET_STATUS_SOME|MPI_REQUEST_GET_STATUS_SOME]] returns in `outcount` the number of requests from the list `array_of_requests` that have *completed*. Returns in the first `outcount` locations of the array `array_of_indices` the indices of these operations within the array `array_of_requests`; the array is indexed from zero in C and from one in Fortran. Returns in the first `outcount` locations of the array `array_of_statuses` the status for these *completed* operations. However, unlike test or wait, it does not deallocate or *inactivate* any requests in `array_of_requests`; a subsequent call to test, wait or free should be executed with each completed request. If no operation in `array_of_requests` is complete, it returns `outcount``= 0`. If all operations in `array_of_requests` are either `MPI_REQUEST_NULL` or *inactive*, `outcount` will be set to `MPI_UNDEFINED`. The *progress* rule for [[versions/v41/API/MPI_TEST|MPI_TEST]] , as described in Section [[versions/v41/sections/pt2pt#Semantics of Nonblocking Communication Operations|Semantics of Nonblocking Communication Operations]] , also applies to [[versions/v41/API/MPI_REQUEST_GET_STATUS_SOME|MPI_REQUEST_GET_STATUS_SOME]] .==

==Like [[versions/v41/API/MPI_WAITSOME|MPI_WAITSOME]] and [[versions/v41/API/MPI_TESTSOME|MPI_TESTSOME]] , [[versions/v41/API/MPI_REQUEST_GET_STATUS_SOME|MPI_REQUEST_GET_STATUS_SOME]] fulfills a **fairness requirement**: If a request for a receive repeatedly appears in a list of requests passed to [[versions/v41/API/MPI_REQUEST_GET_STATUS_SOME|MPI_REQUEST_GET_STATUS_SOME]] , [[versions/v41/API/MPI_WAITSOME|MPI_WAITSOME]] , or [[versions/v41/API/MPI_TESTSOME|MPI_TESTSOME]] and a matching send has been *started*, then the receive will eventually succeed, unless the send is satisfied by another receive; and similarly for send requests.==

==Errors that occur during the execution of [[versions/v41/API/MPI_REQUEST_GET_STATUS_SOME|MPI_REQUEST_GET_STATUS_SOME]] are handled as for [[versions/v41/API/MPI_WAITSOME|MPI_WAITSOME]] .==

==> [!warning] Advice to implementors==

==> [[versions/v41/API/MPI_REQUEST_GET_STATUS_SOME|MPI_REQUEST_GET_STATUS_SOME]] should *complete* as many pending communication operations as possible.==

==> [!note] Advice to users==

==> [[versions/v41/API/MPI_REQUEST_GET_STATUS_ANY|MPI_REQUEST_GET_STATUS_ANY]] , [[versions/v41/API/MPI_REQUEST_GET_STATUS_SOME|MPI_REQUEST_GET_STATUS_SOME]] , and [[versions/v41/API/MPI_REQUEST_GET_STATUS_ALL|MPI_REQUEST_GET_STATUS_ALL]] offer tradeoffs between precision and speed, as do the corrsponding TEST and WAIT functions. The ANY variants are fast, but imprecise and unfair. The ALL variants will provide all-or-nothing information and/or completion, which can limit their applicability. The SOME variants, because of their precision and fairness guarantee, will typically be the slowest on a per-call basis.==

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

Sets `flag``= true` if the operation is *complete*, and, if so, returns in status the request status. However, unlike test or wait, it does not deallocate or *inactivate* the request; a subsequent call to test, wait or free ~~should~~ ==must== be executed with that request. It sets `flag``= false` if the operation is not *complete*.

~~Errors that occur during the execution of [[versions/v50/API/MPI_REQUEST_GET_STATUS_SOME|MPI_REQUEST_GET_STATUS_SOME]] are handled as for [[versions/v50/API/MPI_WAITSOME|MPI_WAITSOME]] .~~

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Non-destructive Test of `status`]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Non-destructive Test of `status`]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Non-destructive Test of `status`]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Non-destructive Test of `status`]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Non-Destructive Test of `status`]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Non-Destructive Test of `status`]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Non-Destructive Test of `status`]]
