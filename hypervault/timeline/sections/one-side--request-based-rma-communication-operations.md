---
title: "Request-based RMA Communication Operations"
chapter: one-side
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Request-based RMA Communication Operations

Chapter **one-side** · in [[versions/v30/sections/one-side#Request-based RMA Communication Operations|MPI-3.0]], [[versions/v31/sections/one-side#Request-based RMA Communication Operations|MPI-3.1]], [[versions/v40/sections/one-side#Request-based RMA Communication Operations|MPI-4.0]], [[versions/v41/sections/one-side#Request-based RMA Communication Operations|MPI-4.1]], [[versions/v50/sections/one-side#Request-based RMA Communication Operations|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

Request-based RMA communication operations allow the user to associate a request handle with the RMA operations and test or wait for the completion of these requests using the functions described in ~~Section [[versions/v31/sections/pt2pt#Communication Completion|Communication Completion]] , page~~ [[versions/v31/sections/pt2pt#Communication Completion|Communication Completion]] . Request-based RMA operations are only valid within a passive target epoch (see Section [[versions/v31/sections/one-side#Synchronization Calls|Synchronization Calls]] ).

Upon returning from a completion call in which an RMA operation completes, the `MPI_ERROR` field in the associated status object is set appropriately (see ~~Section [[versions/v31/sections/pt2pt#Return Status|Return Status]] on page~~ [[versions/v31/sections/pt2pt#Return Status|Return Status]] ). All other fields of status and the results of status query functions (e.g., [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] ) are undefined. It is valid to mix different request types (e.g., any combination of RMA requests, collective requests, I/O requests, generalized requests, or point-to-point requests) in functions that enable multiple completions (e.g., [[versions/v31/API/MPI_WAITALL|MPI_WAITALL]] ). It is erroneous to call [[versions/v31/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] or [[versions/v31/API/MPI_CANCEL|MPI_CANCEL]] for a request associated with an RMA operation. RMA requests are not persistent.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Upon returning from a completion call in which an RMA operation completes, ~~the `MPI_ERROR` field in the associated status object is set appropriately (see [[versions/v40/sections/pt2pt#Return Status|Return Status]] ). All other~~ ==all== fields of ==the== status ==object, if any,== and the results of status query functions (e.g., [[versions/v40/API/MPI_GET_COUNT|MPI_GET_COUNT]] ) are ~~undefined.~~ ==undefined with the exception of `MPI_ERROR` if appropriate (see Section [[versions/v40/sections/pt2pt#Return Status|Return Status]] ).== It is valid to mix different request types (e.g., any combination of RMA requests, collective requests, I/O requests, generalized requests, or point-to-point requests) in functions that enable multiple completions (e.g., [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] ). It is erroneous to call [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] or [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] for a request associated with an RMA operation. RMA requests are not persistent.

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

The ~~end~~ ==closing== of the epoch, or explicit bulk synchronization using [[versions/v41/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] , [[versions/v41/API/MPI_WIN_FLUSH_ALL|MPI_WIN_FLUSH_ALL]] , [[versions/v41/API/MPI_WIN_FLUSH_LOCAL|MPI_WIN_FLUSH_LOCAL]] , or [[versions/v41/API/MPI_WIN_FLUSH_LOCAL_ALL|MPI_WIN_FLUSH_LOCAL_ALL]] , also indicates completion of ==request-based RMA operations on== the ~~RMA operations.~~ ==specified window.== However, users must still ~~wait~~ ==free the request by testing, waiting,== or ~~test~~ ==calling [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]]== on the `request` handle to allow the MPI implementation to ~~clean up~~ ==release== any resources associated with these ~~requests; in such cases the wait operation will complete locally.~~ ==requests.==

[[versions/v41/API/MPI_RPUT|MPI_RPUT]] is similar to [[versions/v41/API/MPI_PUT|MPI_PUT]] (Section [[versions/v41/sections/one-side#Put|Put]] ), except that it allocates a communication request object and associates it with the request handle (the argument `request`). The completion of ~~an [[versions/v41/API/MPI_RPUT|MPI_RPUT]]~~ ==the== operation ==at the origin== (i.e., after the corresponding test or wait) indicates that the sender is now free to update the locations in the origin buffer. It does not indicate that the data is available at the target window. If remote completion is required, [[versions/v41/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] , [[versions/v41/API/MPI_WIN_FLUSH_ALL|MPI_WIN_FLUSH_ALL]] , [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] , or [[versions/v41/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] can be used.

[[versions/v41/API/MPI_RGET|MPI_RGET]] is similar to [[versions/v41/API/MPI_GET|MPI_GET]] (Section [[versions/v41/sections/one-side#Get|Get]] ), except that it allocates a communication request object and associates it with the request handle (the argument `request`) that can be used to wait or test for ~~completion. The~~ completion of ~~an [[versions/v41/API/MPI_RGET|MPI_RGET]]~~ ==the== operation ==at the origin, which== indicates that the data is available in the origin buffer. If `origin_addr` points to memory attached to a window, then the data becomes available in the private copy of this window.

[[versions/v41/API/MPI_RACCUMULATE|MPI_RACCUMULATE]] is similar to [[versions/v41/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] (Section [[versions/v41/sections/one-side#Accumulate Functions|Accumulate Functions]] ), except that it allocates a communication request object and associates it with the request handle (the argument `request`) that can be used to wait or test for completion. The completion of ~~an [[versions/v41/API/MPI_RACCUMULATE|MPI_RACCUMULATE]]~~ ==the== operation ==at the origin (i.e., after the corresponding test or wait)== indicates that the origin buffer is free to be updated. It does not indicate that the operation has completed at the target window.

[[versions/v41/API/MPI_RGET_ACCUMULATE|MPI_RGET_ACCUMULATE]] is similar to [[versions/v41/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] (Section [[versions/v41/sections/one-side#Get ~~Accumulate Function|Get Accumulate Function]]~~ ==Accumulate|Get Accumulate]]== ), except that it allocates a communication request object and associates it with the request handle (the argument `request`) that can be used to wait or test for completion. The completion of ~~an [[versions/v41/API/MPI_RGET_ACCUMULATE|MPI_RGET_ACCUMULATE]]~~ ==the== operation ==at the origin (i.e., after the corresponding test or wait)== indicates that the data is available in the result buffer and the origin buffer is free to be updated. It does not indicate that the operation has been completed at the target window.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

The closing of the epoch, or explicit bulk synchronization using [[versions/v50/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] , [[versions/v50/API/MPI_WIN_FLUSH_ALL|MPI_WIN_FLUSH_ALL]] , [[versions/v50/API/MPI_WIN_FLUSH_LOCAL|MPI_WIN_FLUSH_LOCAL]] , or [[versions/v50/API/MPI_WIN_FLUSH_LOCAL_ALL|MPI_WIN_FLUSH_LOCAL_ALL]] , also indicates completion of request-based RMA operations on the specified window. However, users must still ~~free~~ ==wait or test on== the request ~~by testing, waiting, or calling [[versions/v50/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] on the `request`~~ handle to allow the MPI implementation to release any resources associated with these requests.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Request-based RMA Communication Operations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Request-based RMA Communication Operations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Request-based RMA Communication Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Request-based RMA Communication Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Request-based RMA Communication Operations]]
