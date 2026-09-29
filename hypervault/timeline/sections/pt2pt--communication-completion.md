---
title: "Communication Completion"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Communication Completion

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Communication Completion|MPI-1.3]], [[versions/v21/sections/pt2pt#Communication Completion|MPI-2.1]], [[versions/v22/sections/pt2pt#Communication Completion|MPI-2.2]], [[versions/v30/sections/pt2pt#Communication Completion|MPI-3.0]], [[versions/v31/sections/pt2pt#Communication Completion|MPI-3.1]], [[versions/v40/sections/pt2pt#Communication Completion|MPI-4.0]], [[versions/v41/sections/pt2pt#Communication Completion|MPI-4.1]], [[versions/v50/sections/pt2pt#Communication Completion|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (7 changed paragraphs)

~~We shall use the following terminology: A **null** handle is a handle with value MPI_REQUEST_NULL. A persistent request and the handle to it are **inactive** if the request is not associated with any ongoing communication (see Section [[versions/v21/sections/pt2pt#Persistent communication requests|Persistent communication requests]] ). A handle is **active** if it is neither null nor inactive.~~

~~An **empty** status is a status which is set to return `tag = MPI_ANY_TAG`, `source = MPI_ANY_SOURCE`, `error = MPI_SUCCESS`, and is also internally configured so that calls to [[versions/v21/API/MPI_GET_COUNT|MPI_GET_COUNT]] and [[versions/v21/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] return `count = 0` and [[versions/v21/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] returns false.~~

==We shall use the following terminology: A **null** handle is a handle with value MPI_REQUEST_NULL. A persistent request and the handle to it are **inactive** if the request is not associated with any ongoing communication (see Section [[versions/v21/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] ). A handle is **active** if it is neither null nor inactive.==

==An==

==**empty** status is a status which is set to return `tag = MPI_ANY_TAG`, `source = MPI_ANY_SOURCE`, `error = MPI_SUCCESS`, and is also internally configured so that calls to [[versions/v21/API/MPI_GET_COUNT|MPI_GET_COUNT]] and [[versions/v21/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] return `count = 0` and [[versions/v21/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] returns false.==

~~The fields in a `status` object returned by a call to [[versions/v21/API/MPI_WAIT|MPI_WAIT]] , [[versions/v21/API/MPI_TEST|MPI_TEST]] , or any of the other derived functions ( MPI\_{TEST,WAIT}{ALL,SOME,ANY}), where the `request` corresponds to a send call, are undefined, with two exceptions: The error status field will contain valid information if the wait or test call returned with MPI_ERR_IN_STATUS; and the returned status can be queried by the call [[versions/v21/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] .~~

~~Error codes belonging to the error class MPI_ERR_IN_STATUS should be returned only by the MPI completion functions that take arrays of `MPI_STATUS`. For the functions (MPI_TEST, MPI_TESTANY, MPI_WAIT, MPI_WAITANY) that return a single `MPI_STATUS` value, the normal MPI error return process should be used (not the MPI_ERROR field in the `MPI_STATUS` argument).~~

==The fields in a `status` object returned by a call to [[versions/v21/API/MPI_WAIT|MPI_WAIT]] , [[versions/v21/API/MPI_TEST|MPI_TEST]] , or any of the other derived functions==

==( MPI\_{TEST$`|`$WAIT}{ALL$`|`$SOME$`|`$ANY}),==

==where the `request` corresponds to a send call, are undefined, with two exceptions: The error status field will contain valid information if the wait or test call returned with MPI_ERR_IN_STATUS; and the returned status can be queried by the call [[versions/v21/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] .==

==Error codes belonging to the error class MPI_ERR_IN_STATUS should be returned only by the MPI completion functions that take arrays of `MPI_STATUS`.==

==For the functions [[versions/v21/API/MPI_TEST|MPI_TEST]] , [[versions/v21/API/MPI_TESTANY|MPI_TESTANY]] , [[versions/v21/API/MPI_WAIT|MPI_WAIT]] , and [[versions/v21/API/MPI_WAITANY|MPI_WAITANY]] , which==

==return a single `MPI_STATUS` value, the normal MPI error return process should be used (not the MPI_ERROR field in the `MPI_STATUS` argument).==

The call returns, in `status`, information on the completed operation. The content of the status object for a receive operation can be accessed as described in ~~section~~ ==Section== [[versions/v21/sections/pt2pt#Return ~~status|Return status]]~~ ==Status|Return Status]]== . The status object for a send operation may be queried by a call to [[versions/v21/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] (see Section [[versions/v21/sections/pt2pt#Probe and Cancel|Probe and Cancel]] ).

> Successful return of `MPI_WAIT` after a `MPI_IBSEND` implies that the user send buffer can be reused — i.e., data has been sent out or copied into a buffer attached with `MPI_BUFFER_ATTACH`. Note that, at this point, we can no longer cancel the send (see ~~Sec.~~ ==Section== [[versions/v21/sections/pt2pt#Probe and Cancel|Probe and Cancel]] ). If a matching receive is never posted, then the buffer cannot be freed. This runs somewhat counter to the stated goal of `MPI_CANCEL` (always being able to free program space that was committed to the communication subsystem).

The return status object for a receive operation carries information that can be accessed as described in ~~section~~ ==Section== [[versions/v21/sections/pt2pt#Return ~~status|Return status]]~~ ==Status|Return Status]]== . The status object for a send operation carries information that can be accessed by a call to [[versions/v21/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] (see Section [[versions/v21/sections/pt2pt#Probe and Cancel|Probe and Cancel]] ).

CALL MPI_COMM_RANK(comm, rank, ierr) ~~IF(rank.EQ.0)~~ ==IF (rank.EQ.0)== THEN CALL MPI_ISEND(a(1), 10, MPI_REAL, 1, tag, comm, request, ierr) **** do some computation to mask latency **** CALL MPI_WAIT(request, status, ierr) ELSE ==IF (rank.EQ.1) THEN== CALL MPI_IRECV(a(1), 15, MPI_REAL, 0, tag, comm, request, ierr) **** do some computation to mask latency **** CALL MPI_WAIT(request, status, ierr) END IF

CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr) ~~IF(rank.EQ.0)~~ ==IF (rank.EQ.0)== THEN DO i=1, n CALL MPI_ISEND(outval, 1, MPI_REAL, 1, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_REQUEST_FREE(req, ierr) CALL MPI_IRECV(inval, 1, MPI_REAL, 1, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_WAIT(req, status, ierr) END DO ELSE ~~! rank.EQ.1~~ ==IF (rank.EQ.1) THEN== CALL MPI_IRECV(inval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_WAIT(req, status, ierr) DO I=1, n-1 CALL MPI_ISEND(outval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_REQUEST_FREE(req, ierr) CALL MPI_IRECV(inval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_WAIT(req, status, ierr) END DO CALL MPI_ISEND(outval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_WAIT(req, status, ierr) END IF

### MPI-2.1 → MPI-2.2  (9 changed paragraphs)

We shall use the following terminology: A **null** handle is a handle with value ~~MPI_REQUEST_NULL.~~ ==`MPI_REQUEST_NULL`.== A persistent request and the handle to it are **inactive** if the request is not associated with any ongoing communication (see Section [[versions/v22/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] ). A handle is **active** if it is neither null nor inactive.

**empty** status is a status which is set to return `tag ~~= MPI_ANY_TAG`,~~ ===` `MPI_ANY_TAG`,== `source ~~= MPI_ANY_SOURCE`,~~ ===` `MPI_ANY_SOURCE`,== `error ~~= MPI_SUCCESS`,~~ ===` `MPI_SUCCESS`,== and is also internally configured so that calls to [[versions/v22/API/MPI_GET_COUNT|MPI_GET_COUNT]] and [[versions/v22/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] return `count = 0` and [[versions/v22/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] returns ~~false.~~ ==`false`.==

~~( MPI\_{TEST$`|`$WAIT}{ALL$`|`$SOME$`|`$ANY}),~~ ==(<span class="sans-serif">MPI\_</span>{<span class="sans-serif">TEST$`|`$WAIT</span>}{<span class="sans-serif">ALL$`|`$SOME$`|`$ANY</span>}),==

where the `request` corresponds to a send call, are undefined, with two exceptions: The error status field will contain valid information if the wait or test call returned with ~~MPI_ERR_IN_STATUS;~~ ==`MPI_ERR_IN_STATUS`;== and the returned status can be queried by the call [[versions/v22/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] .

Error codes belonging to the error class ~~MPI_ERR_IN_STATUS~~ ==`MPI_ERR_IN_STATUS`== should be returned only by the MPI completion functions that take arrays of `MPI_STATUS`.

return a single `MPI_STATUS` value, the normal MPI error return process should be used (not the ~~MPI_ERROR~~ ==`MPI_ERROR`== field in the `MPI_STATUS` argument).

A call to `MPI_WAIT` returns when the operation identified by `request` is complete. If the communication object associated with this request was created by a nonblocking send or receive call, then the object is deallocated by the call to `MPI_WAIT` and the request handle is set to ~~MPI_REQUEST_NULL.~~ ==`MPI_REQUEST_NULL`.== [[versions/v22/API/MPI_WAIT|MPI_WAIT]] is a non-local operation.

A call to `MPI_TEST` returns `flag = true` if the operation identified by `request` is complete. In such a case, the status object is set to contain information on the completed operation; if the communication object was created by a nonblocking send or receive, then it is deallocated and the request handle is set to ~~MPI_REQUEST_NULL.~~ ==`MPI_REQUEST_NULL`.== The call returns `flag = false`, otherwise. In this case, the value of the status object is undefined. `MPI_TEST` is a local operation.

~~> [!tip] Rationale~~

~~> The function [[versions/v22/API/MPI_TEST|MPI_TEST]] returns with `flag = true` exactly in those situations where the function [[versions/v22/API/MPI_WAIT|MPI_WAIT]] returns; both functions return in such case the same value in `status`. Thus, a blocking Wait can be easily replaced by a nonblocking Test.~~

Mark the request object for deallocation and set `request` to ~~MPI_REQUEST_NULL.~~ ==`MPI_REQUEST_NULL`.== An ongoing communication that is associated with the request will be allowed to complete. The request will be deallocated only after its completion.

> Once a request is freed by a call to [[versions/v22/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , it is not possible to check for the successful completion of the associated communication with calls to [[versions/v22/API/MPI_WAIT|MPI_WAIT]] or [[versions/v22/API/MPI_TEST|MPI_TEST]] . Also, if an error occurs subsequently during the communication, an error code cannot be returned to the user — such an error must be treated as fatal. ~~Questions arise as to how one knows when the operations have completed when using [[versions/v22/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] . Depending on the program logic, there may be other ways in which the program knows that certain operations have completed and this makes usage of [[versions/v22/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] practical. For example, an active send request could be freed when the logic of the program is such that the receiver sends a reply to the message sent — the arrival of the reply informs the sender that the send has completed and the send buffer can be reused.~~ An active receive request should never be freed as the receiver will have no way to verify that the receive has completed and the receive buffer can be reused.

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~We shall use the following terminology: A **null** handle is a handle with value `MPI_REQUEST_NULL`. A persistent request and the handle to it are **inactive** if the request is not associated with any ongoing communication (see Section [[versions/v30/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] ). A handle is **active** if it is neither null nor inactive.~~

~~An~~

~~**empty** status is a status which is set to return `tag =` `MPI_ANY_TAG`, `source =` `MPI_ANY_SOURCE`, `error =` `MPI_SUCCESS`, and is also internally configured so that calls to [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] and [[versions/v30/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] return `count = 0` and [[versions/v30/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] returns `false`.~~

~~We set a status variable to empty when the value returned by it is not significant. Status is set in this way so as to prevent errors due to accesses of stale information.~~

~~The fields in a `status` object returned by a call to [[versions/v30/API/MPI_WAIT|MPI_WAIT]] , [[versions/v30/API/MPI_TEST|MPI_TEST]] , or any of the other derived functions~~

~~(<span class="sans-serif">MPI\_</span>{<span class="sans-serif">TEST$`|`$WAIT</span>}{<span class="sans-serif">ALL$`|`$SOME$`|`$ANY</span>}),~~

~~where the `request` corresponds to a send call, are undefined, with two exceptions: The error status field will contain valid information if the wait or test call returned with `MPI_ERR_IN_STATUS`; and the returned status can be queried by the call [[versions/v30/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] .~~

~~Error codes belonging to the error class `MPI_ERR_IN_STATUS` should be returned only by the MPI completion functions that take arrays of `MPI_STATUS`.~~

~~For the functions [[versions/v30/API/MPI_TEST|MPI_TEST]] , [[versions/v30/API/MPI_TESTANY|MPI_TESTANY]] , [[versions/v30/API/MPI_WAIT|MPI_WAIT]] , and [[versions/v30/API/MPI_WAITANY|MPI_WAITANY]] , which~~

~~return a single `MPI_STATUS` value, the normal MPI error return process should be used (not the `MPI_ERROR` field in the `MPI_STATUS` argument).~~

==We shall use the following terminology: A **null** handle is a handle with value `MPI_REQUEST_NULL`. A persistent request and the handle to it are **inactive** if the request is not associated with any ongoing communication (see Section [[versions/v30/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] ). A handle is **active** if it is neither null nor inactive. An **empty** status is a status which is set to return `tag =` `MPI_ANY_TAG`, `source =` `MPI_ANY_SOURCE`, `error =` `MPI_SUCCESS`, and is also internally configured so that calls to [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] , [[versions/v30/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] , and `MPI_GET_ELEMENTS_X` return `count = 0` and [[versions/v30/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] returns `false`. We set a status variable to empty when the value returned by it is not significant. Status is set in this way so as to prevent errors due to accesses of stale information.==

==The fields in a `status` object returned by a call to [[versions/v30/API/MPI_WAIT|MPI_WAIT]] , [[versions/v30/API/MPI_TEST|MPI_TEST]] , or any of the other derived functions (<span class="sans-serif">MPI\_</span>{<span class="sans-serif">TEST$`|`$WAIT</span>}{<span class="sans-serif">ALL$`|`$SOME$`|`$ANY</span>}), where the `request` corresponds to a send call, are undefined, with two exceptions: The error status field will contain valid information if the wait or test call returned with `MPI_ERR_IN_STATUS`; and the returned status can be queried by the call [[versions/v30/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] .==

==Error codes belonging to the error class `MPI_ERR_IN_STATUS` should be returned only by the MPI completion functions that take arrays of `MPI_Status`.==

==For the functions [[versions/v30/API/MPI_TEST|MPI_TEST]] , [[versions/v30/API/MPI_TESTANY|MPI_TESTANY]] , [[versions/v30/API/MPI_WAIT|MPI_WAIT]] , and [[versions/v30/API/MPI_WAITANY|MPI_WAITANY]] , which return a single `MPI_Status` value, the normal MPI error return process should be used (not the `MPI_ERROR` field in the `MPI_Status` argument).==

A call to `MPI_WAIT` returns when the operation identified by `request` is complete. If the ~~communication object associated with this~~ request ~~was created by a nonblocking send or receive call, then the object~~ is ~~deallocated by the call to `MPI_WAIT`~~ ==an active persistent request, it is marked inactive. Any other type of request is== and the request handle is set to `MPI_REQUEST_NULL`. [[versions/v30/API/MPI_WAIT|MPI_WAIT]] is a non-local operation.

> In a ~~multi-threaded~~ ==multithreaded== environment, a call to `MPI_WAIT` should block only the calling thread, allowing the thread scheduler to schedule another thread for execution.

A call to `MPI_TEST` returns `flag = true` if the operation identified by `request` is complete. In such a case, the status object is set to contain information on the completed ~~operation; if~~ ==operation. If== the ~~communication object was created by a nonblocking send or receive, then~~ ==request is an active persistent request,== it ==is marked as inactive. Any other type of request== is deallocated and the request handle is set to `MPI_REQUEST_NULL`. The call returns `flag = ~~false`, otherwise.~~ ==false` if the operation identified by request is not complete.== In this case, the value of the status object is undefined. `MPI_TEST` is a local operation.

### MPI-3.0 → MPI-3.1  (9 changed paragraphs)

The functions ~~`MPI_WAIT`~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]]== and ~~`MPI_TEST`~~ ==[[versions/v31/API/MPI_TEST|MPI_TEST]]== are used to complete a nonblocking communication. The completion of a send operation indicates that the sender is now free to update the locations in the send buffer (the send operation itself leaves the content of the send buffer unchanged). It does not indicate that the message has been received, rather, it may have been buffered by the communication subsystem. However, if a ~~<span class="sans-serif">synchronous</span>~~ ==**synchronous**== mode send was used, the completion of the send operation indicates that a matching receive was initiated, and that the message will eventually be received by this matching receive.

~~We shall use the following terminology: A **null** handle is a handle with value `MPI_REQUEST_NULL`. A persistent request and the handle to it are **inactive** if the request is not associated with any ongoing communication (see Section [[versions/v31/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] ). A handle is **active** if it is neither null nor inactive. An **empty** status is a status which is set to return `tag =` `MPI_ANY_TAG`, `source =` `MPI_ANY_SOURCE`, `error =` `MPI_SUCCESS`, and is also internally configured so that calls to [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] , [[versions/v31/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] , and `MPI_GET_ELEMENTS_X` return `count = 0` and [[versions/v31/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] returns `false`. We set a status variable to empty when the value returned by it is not significant. Status is set in this way so as to prevent errors due to accesses of stale information.~~

~~The fields in a `status` object returned by a call to [[versions/v31/API/MPI_WAIT|MPI_WAIT]] , [[versions/v31/API/MPI_TEST|MPI_TEST]] , or any of the other derived functions (<span class="sans-serif">MPI\_</span>{<span class="sans-serif">TEST$`|`$WAIT</span>}{<span class="sans-serif">ALL$`|`$SOME$`|`$ANY</span>}), where the `request` corresponds to a send call, are undefined, with two exceptions: The error status field will contain valid information if the wait or test call returned with `MPI_ERR_IN_STATUS`; and the returned status can be queried by the call [[versions/v31/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] .~~

~~Error codes belonging to the error class `MPI_ERR_IN_STATUS` should be returned only by the MPI completion functions that take arrays of `MPI_Status`.~~

~~For the functions [[versions/v31/API/MPI_TEST|MPI_TEST]] , [[versions/v31/API/MPI_TESTANY|MPI_TESTANY]] , [[versions/v31/API/MPI_WAIT|MPI_WAIT]] , and [[versions/v31/API/MPI_WAITANY|MPI_WAITANY]] , which return a single `MPI_Status` value, the normal MPI error return process should be used (not the `MPI_ERROR` field in the `MPI_Status` argument).~~

==We shall use the following terminology: A **null handle** is a handle with value `MPI_REQUEST_NULL`. A persistent request and the handle to it are **inactive** if the request is not associated with any ongoing communication (see [[versions/v31/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] ). A handle is **active** if it is neither null nor inactive. An **empty** status is a status which is set to return `tag =` `MPI_ANY_TAG`, `source =` `MPI_ANY_SOURCE`, `error =` `MPI_SUCCESS`, and is also internally configured so that calls to [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] , [[versions/v31/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] , and [[versions/v31/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] return `count = 0` and [[versions/v31/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] returns `false`. We set a status variable to empty when the value returned by it is not significant. Status is set in this way so as to prevent errors due to accesses of stale information.==

==The fields in a `status` object returned by a call to [[versions/v31/API/MPI_WAIT|MPI_WAIT]] , [[versions/v31/API/MPI_TEST|MPI_TEST]] , or any of the other derived functions (`MPI_`{`TEST`$`|`$`WAIT`}{`ALL`$`|`$`SOME`$`|`$`ANY`}), where the `request` corresponds to a send call, are undefined, with two exceptions: The error status field will contain valid information if the wait or test call returned with `MPI_ERR_IN_STATUS`; and the returned status can be queried by the call [[versions/v31/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] .==

==Error codes belonging to the error class `MPI_ERR_IN_STATUS` should be returned only by the MPI completion functions that take arrays of `MPI_Status`. For the functions [[versions/v31/API/MPI_TEST|MPI_TEST]] , [[versions/v31/API/MPI_TESTANY|MPI_TESTANY]] , [[versions/v31/API/MPI_WAIT|MPI_WAIT]] , and [[versions/v31/API/MPI_WAITANY|MPI_WAITANY]] , which return a single `MPI_Status` value, the normal MPI error return process should be used (not the `MPI_ERROR` field in the `MPI_Status` argument).==

A call to ~~`MPI_WAIT`~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]]== returns when the operation identified by `request` is complete. If the request is an active persistent request, it is marked inactive. Any other type of request is and the request handle is set to `MPI_REQUEST_NULL`. [[versions/v31/API/MPI_WAIT|MPI_WAIT]] is a non-local operation.

> Successful return of ~~`MPI_WAIT`~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]]== after a ~~`MPI_IBSEND`~~ ==[[versions/v31/API/MPI_IBSEND|MPI_IBSEND]]== implies that the user send buffer can be reused — i.e., data has been sent out or copied into a buffer attached with ~~`MPI_BUFFER_ATTACH`.~~ ==[[versions/v31/API/MPI_BUFFER_ATTACH|MPI_BUFFER_ATTACH]] .== Note that, at this point, we can no longer cancel the send (see Section [[versions/v31/sections/pt2pt#Probe and Cancel|Probe and Cancel]] ). If a matching receive is never posted, then the buffer cannot be freed. This runs somewhat counter to the stated goal of ~~`MPI_CANCEL`~~ ==[[versions/v31/API/MPI_CANCEL|MPI_CANCEL]]== (always being able to free program space that was committed to the communication subsystem).

> In a multithreaded environment, a call to ~~`MPI_WAIT`~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]]== should block only the calling thread, allowing the thread scheduler to schedule another thread for execution.

A call to ~~`MPI_TEST`~~ ==[[versions/v31/API/MPI_TEST|MPI_TEST]]== returns `flag = true` if the operation identified by `request` is complete. In such a case, the status object is set to contain information on the completed operation. If the request is an active persistent request, it is marked as inactive. Any other type of request is deallocated and the request handle is set to `MPI_REQUEST_NULL`. The call returns `flag = false` if the operation identified by request is not complete. In this case, the value of the status object is undefined. ~~`MPI_TEST`~~ ==[[versions/v31/API/MPI_TEST|MPI_TEST]]== is a local operation.

The functions ~~`MPI_WAIT`~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]]== and ~~`MPI_TEST`~~ ==[[versions/v31/API/MPI_TEST|MPI_TEST]]== can be used to complete both sends and receives.

> The use of the nonblocking ~~`MPI_TEST`~~ ==[[versions/v31/API/MPI_TEST|MPI_TEST]]== call allows the user to schedule alternative activities within a single thread of execution. An event-driven thread scheduler can be emulated with periodic calls to [[versions/v31/API/MPI_TEST|MPI_TEST]] .

Simple usage of nonblocking operations and ~~`MPI_WAIT`.~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]] .==

An example using [[versions/v31/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] .

### MPI-3.1 → MPI-4.0  (12 changed paragraphs)

The functions [[versions/v40/API/MPI_WAIT|MPI_WAIT]] and [[versions/v40/API/MPI_TEST|MPI_TEST]] are used to complete a nonblocking communication. The ~~completion~~ ==*completion*== of a send operation indicates that the sender is now free to update the locations in the send buffer (the send operation itself leaves the content of the send buffer unchanged). It does not indicate that the message has been received, rather, it may have been buffered by the communication subsystem. However, if a ~~**synchronous**~~ ==*synchronous== mode ~~send~~ ==send*== was used, the ~~completion~~ ==*completion*== of the send operation indicates that a matching receive was ~~initiated,~~ ==*initiated*,== and that the message will eventually be received by this matching receive.

The ~~completion~~ ==*completion*== of a receive operation indicates that the receive buffer contains the received message, the receiver is now free to access it, and that the status object is set. It does not indicate that the matching send operation has ~~completed~~ ==*completed*== (but indicates, of course, that the send was ~~initiated).~~ ==*initiated*).==

We shall use the following terminology: A **null handle** is a handle with value `MPI_REQUEST_NULL`. A ~~persistent request~~ ==*persistent communication request*== and the handle to it are **inactive** if the request is not associated with any ongoing communication (see [[versions/v40/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] ). A handle is **active** if it is neither ~~null~~ ==*null*== nor ~~inactive.~~ ==*inactive*.== An **empty** status is a status which is set to return ~~`tag =` `MPI_ANY_TAG`, `source =` `MPI_ANY_SOURCE`, `error =` `MPI_SUCCESS`,~~ ==`tag``=``MPI_ANY_TAG`, `source``=``MPI_ANY_SOURCE`, `error``=``MPI_SUCCESS`,== and is also internally configured so that calls to [[versions/v40/API/MPI_GET_COUNT|MPI_GET_COUNT]] , [[versions/v40/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] , and [[versions/v40/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] return ~~`count =~~ ==`count``=== 0` and [[versions/v40/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] returns `false`. We set a status variable to ~~empty~~ ==*empty*== when the value returned by it is not significant. Status is set in this way so as to prevent errors due to accesses of stale information.

Error codes belonging to the error class `MPI_ERR_IN_STATUS` should be returned only by the MPI completion functions that take arrays of `MPI_Status`. For the functions ~~[[versions/v40/API/MPI_TEST|MPI_TEST]] , [[versions/v40/API/MPI_TESTANY|MPI_TESTANY]] , [[versions/v40/API/MPI_WAIT|MPI_WAIT]] , and [[versions/v40/API/MPI_WAITANY|MPI_WAITANY]] , which return~~ ==that take== a single `MPI_Status` ~~value,~~ ==argument,== the ~~normal MPI~~ error ~~return process should be used (not~~ ==code is returned by the function, and the value of== the `MPI_ERROR` field in the `MPI_Status` ~~argument).~~ ==argument is undefined (see [[versions/v40/sections/pt2pt#Return Status|Return Status]] ).==

A call to [[versions/v40/API/MPI_WAIT|MPI_WAIT]] returns when the operation identified by `request` is ~~complete.~~ ==*complete*.== If the request is an ~~active persistent request,~~ ==*active* *persistent communication request*,== it is marked ~~inactive.~~ ==*inactive*.== Any other type of request is ==deallocated== and the request handle is set to `MPI_REQUEST_NULL`. [[versions/v40/API/MPI_WAIT|MPI_WAIT]] is a ~~non-local operation.~~ ==*non-local* procedure.==

One is allowed to call [[versions/v40/API/MPI_WAIT|MPI_WAIT]] with a ~~null~~ ==*null*== or ~~inactive~~ ==*inactive*== `request` argument. In this case the ~~operation~~ ==procedure== returns immediately with ~~empty~~ ==*empty*== `status`.

> Successful return of [[versions/v40/API/MPI_WAIT|MPI_WAIT]] after a [[versions/v40/API/MPI_IBSEND|MPI_IBSEND]] implies that the user send buffer can be ~~reused — i.e.,~~ ==reused—i.e.,== data has been sent out or copied into a buffer attached with [[versions/v40/API/MPI_BUFFER_ATTACH|MPI_BUFFER_ATTACH]] . Note that, at this point, we can no longer ~~cancel~~ ==*cancel*== the send (see Section [[versions/v40/sections/pt2pt#Probe and Cancel|Probe and Cancel]] ). If a matching receive is never posted, then the buffer cannot be freed. This runs somewhat counter to the stated goal of [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] (always being able to free program space that was committed to the communication subsystem).

A call to [[versions/v40/API/MPI_TEST|MPI_TEST]] returns ~~`flag =~~ ==`flag``=== true` if the operation identified by `request` is ~~complete.~~ ==*complete*.== In such a case, the status object is set to contain information on the completed operation. If the request is an ~~active persistent request,~~ ==*active* *persistent communication request*,== it is marked as ~~inactive.~~ ==*inactive*.== Any other type of request is deallocated and the request handle is set to `MPI_REQUEST_NULL`. The call returns ~~`flag =~~ ==`flag``=== false` if the operation identified by ~~request~~ ==`request`== is not complete. In this case, the value of the status object is undefined. [[versions/v40/API/MPI_TEST|MPI_TEST]] is a ~~local operation.~~ ==*local* procedure.==

One is allowed to call [[versions/v40/API/MPI_TEST|MPI_TEST]] with a ~~null~~ ==*null*== or ~~inactive~~ ==*inactive*== `request` argument. In such a case the ~~operation~~ ==procedure== returns with ~~`flag =~~ ==`flag``=== true` and ~~empty~~ ==*empty*== `status`.

The ~~functions~~ ==procedures== [[versions/v40/API/MPI_WAIT|MPI_WAIT]] and [[versions/v40/API/MPI_TEST|MPI_TEST]] can be used to complete ~~both sends and receives.~~ ==any request-based nonblocking or persistent operation.==

CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN CALL MPI_ISEND(a(1), 10, MPI_REAL, 1, tag, comm, request, ierr) **** do some computation to mask latency **** CALL MPI_WAIT(request, status, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_IRECV(a(1), 15, MPI_REAL, 0, tag, comm, request, ierr) **** do some computation to mask latency **** CALL MPI_WAIT(request, status, ierr) END IF

A request object can be ~~deallocated without waiting for the associated communication to complete, by~~ ==*freed*== using the following ~~operation.~~ ==MPI procedure.==

~~Mark the request object for deallocation and set `request` to `MPI_REQUEST_NULL`. An ongoing communication that is associated with the request will be allowed to complete. The request will be deallocated only after its completion.~~

==[[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] is a *local* procedure. Upon successful return, [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] sets `request` to `MPI_REQUEST_NULL`. For an *inactive* `request` representing any type of MPI operation, [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] shall do the *freeing stage* of the associated operation during its execution.==

==For a `request` representing a *nonblocking* point-to-point or a persistent point-to-point operation, it is permitted (although strongly discouraged) to call [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] when the `request` is *active*. In this special case, [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] will only mark the request for freeing and MPI will actually do the *freeing stage* of the associated operation later.==

==The use of this procedure for generalized requests is described in [[versions/v40/sections/ei#Generalized Requests|Generalized Requests]] .==

==Calling [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] with an *active* `request` representing any other type of MPI operation (e.g., any partitioned operation (see Chapter [[versions/v40/sections/part#Partitioned Point-to-Point Communication|Partitioned Point-to-Point Communication]] ), any collective operation (see Chapter [[versions/v40/sections/coll#Collective Communication|Collective Communication]] ), any I/O operation (see Chapter [[versions/v40/sections/io#I/O|I/O]] ), or any request-based RMA operation (see Chapter [[versions/v40/sections/one-side#One-Sided Communications|One-Sided Communications]] )) is *erroneous*.==

> ~~The~~ ==For point-to-point operations, the== [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] mechanism is provided for reasons of performance and convenience on the sending side.

> Once a request is freed by a call to [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , it is not possible to check for the successful completion of the associated communication with calls to [[versions/v40/API/MPI_WAIT|MPI_WAIT]] or [[versions/v40/API/MPI_TEST|MPI_TEST]] . Also, if an error occurs subsequently during the communication, an error code cannot be returned to the ~~user — such~~ ==user—such== an error must be treated as fatal. An active receive request should never be freed as the receiver will have no way to verify that the receive has completed and the receive buffer can be reused.

CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN DO ~~i=1, n~~ ==i=1,n== CALL MPI_ISEND(outval, 1, MPI_REAL, 1, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_REQUEST_FREE(req, ierr) CALL MPI_IRECV(inval, 1, MPI_REAL, 1, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_WAIT(req, status, ierr) END DO ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_IRECV(inval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_WAIT(req, status, ierr) DO ~~I=1, n-1~~ ==I=1,n-1== CALL MPI_ISEND(outval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_REQUEST_FREE(req, ierr) CALL MPI_IRECV(inval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_WAIT(req, status, ierr) END DO CALL MPI_ISEND(outval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_WAIT(req, status, ierr) END IF

### MPI-4.0 → MPI-4.1  (7 changed paragraphs)

The functions [[versions/v41/API/MPI_WAIT|MPI_WAIT]] and [[versions/v41/API/MPI_TEST|MPI_TEST]] are used to complete a nonblocking communication. The *completion* of a send operation indicates that the sender is now free to update ~~the locations in~~ the send buffer (the send operation itself leaves the content of the send buffer unchanged). It does not indicate that the message has been received, rather, it may have been buffered by the communication subsystem. However, if a *synchronous mode send* was used, the *completion* of the send operation indicates that a matching receive was *initiated*, and that the message will eventually be received by this matching receive.

We shall use the following terminology: A **null handle** is a handle with value `MPI_REQUEST_NULL`. A *persistent communication request* and the handle to it are **inactive** if the request is not associated with any ongoing communication (see [[versions/v41/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] ). A handle is **active** if it is neither *null* nor *inactive*. An **empty** status is a status ~~which~~ ==that== is set to return `tag``=``MPI_ANY_TAG`, `source``=``MPI_ANY_SOURCE`, `error``=``MPI_SUCCESS`, and is also internally configured so that calls to [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] ~~,~~ ==and== [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] ~~, and [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]~~ return `count``= 0` and [[versions/v41/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] returns `false`. We set a status variable to *empty* when the value returned by it is not significant. Status is set in this way so as to prevent errors due to accesses of stale information.

A call to [[versions/v41/API/MPI_WAIT|MPI_WAIT]] returns when the operation identified by `request` is *complete*. If the request is an *active* *persistent communication request*, it is marked *inactive*. Any other type of request is deallocated and the request handle is set to `MPI_REQUEST_NULL`. [[versions/v41/API/MPI_WAIT|MPI_WAIT]] is ==in general== a ~~*non-local*~~ ==*nonlocal*== procedure. ==When the operation represented by the `request` is *enabled* then a call to [[versions/v41/API/MPI_WAIT|MPI_WAIT]] is a *local* procedure call.==

> Successful return of [[versions/v41/API/MPI_WAIT|MPI_WAIT]] after a [[versions/v41/API/MPI_IBSEND|MPI_IBSEND]] implies that the user send buffer can be reused—i.e., data has been sent out or copied into a buffer attached with [[versions/v41/API/MPI_BUFFER_ATTACH|MPI_BUFFER_ATTACH]] ==, [[versions/v41/API/MPI_COMM_ATTACH_BUFFER|MPI_COMM_ATTACH_BUFFER]] or [[versions/v41/API/MPI_SESSION_ATTACH_BUFFER|MPI_SESSION_ATTACH_BUFFER]]== . ~~Note that,~~ ==Further,== at this point, we can no longer *cancel* the send (see Section [[versions/v41/sections/pt2pt#Probe and Cancel|Probe and Cancel]] ). If a matching receive is never ~~posted,~~ ==*started*,== then the buffer cannot be freed. This runs somewhat counter to the stated goal of [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] (always being able to free program space that was committed to the communication subsystem).

~~    CALL MPI_COMM_RANK(comm, rank, ierr)     IF (rank .EQ. 0) THEN        CALL MPI_ISEND(a(1), 10, MPI_REAL, 1, tag, comm, request, ierr)        **** do some computation to mask latency ****        CALL MPI_WAIT(request, status, ierr)     ELSE IF (rank .EQ. 1) THEN        CALL MPI_IRECV(a(1), 15, MPI_REAL, 0, tag, comm, request, ierr)        **** do some computation to mask latency ****        CALL MPI_WAIT(request, status, ierr)     END IF~~

==(code block added)==
``` [MPI]Fortran
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .EQ. 0) THEN
   CALL MPI_ISEND(a(1), 10, MPI_REAL, 1, tag, comm, request, ierr)
   ! **** do some computation to mask latency ****
   CALL MPI_WAIT(request, status, ierr)
ELSE IF (rank .EQ. 1) THEN
   CALL MPI_IRECV(a(1), 15, MPI_REAL, 0, tag, comm, request, ierr)
   ! **** do some computation to mask latency ****
   CALL MPI_WAIT(request, status, ierr)
END IF
```

For a `request` representing a *nonblocking* point-to-point or a persistent point-to-point operation, it is permitted (although strongly discouraged) to call [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] when the `request` is *active*. In this special case, [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] will only mark the request for freeing and MPI will actually do the *freeing stage* of the ==operation== associated ~~operation~~ ==with the request== later.

==[language={[MPI]Fortran},basicstyle=]== CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr) IF (rank .EQ. 0) THEN DO i=1,n CALL MPI_ISEND(outval, 1, MPI_REAL, 1, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_REQUEST_FREE(req, ierr) CALL MPI_IRECV(inval, 1, MPI_REAL, 1, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_WAIT(req, status, ierr) END DO ELSE IF (rank .EQ. 1) THEN CALL MPI_IRECV(inval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_WAIT(req, status, ierr) DO I=1,n-1 CALL MPI_ISEND(outval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_REQUEST_FREE(req, ierr) CALL MPI_IRECV(inval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_WAIT(req, status, ierr) END DO CALL MPI_ISEND(outval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr) CALL MPI_WAIT(req, status, ierr) END IF

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

For a `request` representing a *nonblocking* point-to-point or a ~~persistent~~ ==*persistent*== point-to-point operation, it is permitted (although strongly discouraged) to call [[versions/v50/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] when the `request` is *active*. In this special case, [[versions/v50/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] will only mark the request for freeing and MPI will actually do the *freeing stage* of the operation associated with the request later.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Communication Completion]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Communication Completion]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Communication Completion]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Communication Completion]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Communication Completion]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Communication Completion]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Communication Completion]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Communication Completion]]
