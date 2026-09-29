---
title: "Generalized Requests"
chapter: ei
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/ei]
---

# Generalized Requests

Chapter **ei** · in [[versions/v20/sections/ei#Generalized Requests|MPI-2.0]], [[versions/v21/sections/ei#Generalized Requests|MPI-2.1]], [[versions/v22/sections/ei#Generalized Requests|MPI-2.2]], [[versions/v30/sections/ei#Generalized Requests|MPI-3.0]], [[versions/v31/sections/ei#Generalized Requests|MPI-3.1]], [[versions/v40/sections/ei#Generalized Requests|MPI-4.0]], [[versions/v41/sections/ei#Generalized Requests|MPI-4.1]], [[versions/v50/sections/ei#Generalized Requests|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (8 changed paragraphs)

~~The goal of this MPI-2 extension is to allow users to define new nonblocking operations. Such an outstanding nonblocking operation is represented by a (generalized) request. A fundamental property of nonblocking operations is that progress toward the completion of this operation occurs asynchronously, i.e., concurrently with normal program execution. Typically, this requires execution of code concurrently with the execution of the user code, e.g., in a separate thread or in a signal handler. Operating systems provide a variety of mechanisms in support of concurrent execution. MPI does not attempt to standardize or replace these mechanisms: it is assumed programmers who wish to define new asynchronous operations will use the mechanisms provided by the underlying operating system. Thus, the calls in this section only provide a means for defining the effect of MPI calls such as [[versions/v21/API/MPI_WAIT|MPI_WAIT]] or [[versions/v21/API/MPI_CANCEL|MPI_CANCEL]] when they apply to generalized requests, and for signaling to MPI the completion of a generalized operation.~~

==The goal of==

==generalized requests==

==is to allow users to define new nonblocking operations. Such an outstanding nonblocking operation is represented by a (generalized) request. A fundamental property of nonblocking operations is that progress toward the completion of this operation occurs asynchronously, i.e., concurrently with normal program execution. Typically, this requires execution of code concurrently with the execution of the user code, e.g., in a separate thread or in a signal handler. Operating systems provide a variety of mechanisms in support of concurrent execution. MPI does not attempt to standardize or replace these mechanisms: it is assumed programmers who wish to define new asynchronous operations will use the mechanisms provided by the underlying operating system. Thus, the calls in this section only provide a means for defining the effect of MPI calls such as [[versions/v21/API/MPI_WAIT|MPI_WAIT]] or [[versions/v21/API/MPI_CANCEL|MPI_CANCEL]] when they apply to generalized requests, and for signaling to MPI the completion of a generalized operation.==

~~The syntax and meaning of the callback functions are listed below. All callback functions are passed the `extra_state` argument that was associated with the request by the starting call [[versions/v21/API/MPI_GREQUEST_START|MPI_GREQUEST_START]] . This can be used to maintain user-defined state for the request. In C, the query function is~~

==The syntax and meaning of the callback functions are listed below. All callback functions are passed the `extra_state` argument that was associated with the request by the starting call [[versions/v21/API/MPI_GREQUEST_START|MPI_GREQUEST_START]] . This can be used to maintain user-defined state for the request.==

==In==

==C, the query function is==

~~[[query_fn]] callback is invoked by the `MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` call that completed the generalized request associated with this callback.~~

==[[query_fn]] callback is invoked by the==

==`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` call that completed the generalized request associated with this callback.==

~~it may be invoked several times for the same generalized request, e.g., if the user calls [[versions/v21/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] several times for this request. Note also that a call to `MPI\_{WAIT$`|`$TEST}{SOME$`|`$ALL}` may cause multiple invocations of [[query_fn]] callback functions, one for each generalized request that is completed by the MPI call. The order of these invocations is not specified by MPI.~~

==it may be invoked several times for the same generalized request, e.g., if the user calls [[versions/v21/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] several times for this request. Note also that a call to==

==`MPI\_{WAIT$`|`$TEST}{SOME$`|`$ALL}` may cause multiple invocations of [[query_fn]] callback functions, one for each generalized request that is completed by the MPI call. The order of these invocations is not specified by MPI.==

~~[[free_fn]] callback is invoked by the `MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` call that completed the generalized request associated with this callback. [[free_fn]] is invoked after the call to [[query_fn]] for the same request. However, if the MPI call completed multiple generalized requests, the order in which [[free_fn]] callback functions are invoked is not specified by MPI.~~

~~[[free_fn]] callback is also invoked for generalized requests that are freed by a call to [[versions/v21/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] (no call to `WAIT\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` will occur for such a request). In this case, the callback function will be called either in the MPI call [[versions/v21/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or in the MPI call [[versions/v21/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , whichever happens last. I.e., in this case the actual freeing code is executed as soon as both calls [[versions/v21/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] and [[versions/v21/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] have occurred.~~

==[[free_fn]] callback is invoked by the==

==`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` call that completed the generalized request associated with this callback. [[free_fn]] is invoked after the call to [[query_fn]] for the same request. However, if the MPI call completed multiple generalized requests, the order in which [[free_fn]] callback functions are invoked is not specified by MPI.==

==[[free_fn]] callback is also invoked for generalized requests that are freed by a call to [[versions/v21/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] (no call to==

==`WAIT\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` will occur for such a request). In this case, the callback function will be called either in the MPI call [[versions/v21/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or in the MPI call [[versions/v21/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , whichever happens==

==last, i.e.,==

==in this case the actual freeing code is executed as soon as both calls [[versions/v21/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] and [[versions/v21/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] have occurred.==

~~[[cancel_fn]] function is invoked to start the cancelation of a generalized request. It is called by [[MPI_REQUEST_CANCEL]] . MPI passes to the callback function `complete=true` if~~

==[[cancel_fn]] function is invoked to start the cancelation of a generalized request.==

==It is called by [[versions/v21/API/MPI_CANCEL|MPI_CANCEL]] .==

==MPI passes to the callback function `complete=true` if==

~~In the case of `MPI\_{WAIT$`|`$TEST}{ANY}` call that invokes both [[query_fn]] and [[free_fn]] , the MPI call will return the error code returned by the last callback, namely [[free_fn]] . If one or more of the requests in a call to `MPI\_{WAIT$`|`$TEST}{SOME$`|`$ALL}` failed, then the MPI call will return MPI_ERR_IN_STATUS.~~

==In the case of==

==an==

==`MPI\_{WAIT$`|`$TEST}{ANY}` call that invokes both [[query_fn]] and [[free_fn]] , the MPI call will return the error code returned by the last callback, namely [[free_fn]] . If one or more of the requests in a call to==

==`MPI\_{WAIT$`|`$TEST}{SOME$`|`$ALL}` failed, then the MPI call will return MPI_ERR_IN_STATUS.==

~~The call informs MPI that the operations represented by the generalized request `request` are complete. (See definitions in Section [[terms-semantic]] .) A call to [[versions/v21/API/MPI_WAIT|MPI_WAIT]] will return and a call to [[versions/v21/API/MPI_TEST|MPI_TEST]] will return `flag=true` only after a call to [[versions/v21/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] has declared that these operations are complete.~~

~~MPI imposes no restrictions on the code executed by the callback functions. However, new nonblocking operations should be defined so that the general semantic rules about MPI calls such as [[MPI_TEST, MPI_REQUEST_FREE]] , or [[versions/v21/API/MPI_CANCEL|MPI_CANCEL]] still hold. For example, all these calls are supposed to be local and nonblocking. Therefore, the callback functions [[query_fn, free_fn]] , or [[cancel_fn]] should invoke blocking MPI communication calls only if the context is such that these calls are guaranteed to return in finite time. Once [[versions/v21/API/MPI_CANCEL|MPI_CANCEL]] is invoked, the cancelled operation should complete in finite time, irrespective of the state of other processes (the operation has acquired “local” semantics). It should either succeed, or fail without side-effects. The user should guarantee these same properties for newly defined operations.~~

==The call informs MPI that the operations represented by the generalized request `request` are==

==complete (see==

==definitions in Section [[terms-semantic]] ). A call to [[versions/v21/API/MPI_WAIT|MPI_WAIT]] will return and a call to [[versions/v21/API/MPI_TEST|MPI_TEST]] will return `flag=true` only after a call to [[versions/v21/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] has declared that these operations are complete.==

==MPI imposes no restrictions on the code executed by the callback functions. However, new nonblocking operations should be defined so that the general semantic rules about MPI calls such as [[versions/v21/API/MPI_TEST|MPI_TEST]] , [[versions/v21/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or [[versions/v21/API/MPI_CANCEL|MPI_CANCEL]] still hold. For example, all these calls are supposed to be local and nonblocking. Therefore, the callback functions [[query_fn]] , [[free_fn]] , or [[cancel_fn]] should invoke blocking MPI communication calls only if the context is such that these calls are guaranteed to return in finite time. Once [[versions/v21/API/MPI_CANCEL|MPI_CANCEL]] is invoked, the cancelled operation should complete in finite time, irrespective of the state of other processes (the operation has acquired “local” semantics). It should either succeed, or fail without side-effects. The user should guarantee these same properties for newly defined operations.==

### MPI-2.1 → MPI-2.2  (7 changed paragraphs)

~~`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}`~~ ==`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`== call that completed the generalized request associated with this callback.

If the user provided ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== or ~~MPI_STATUSES_IGNORE~~ ==`MPI_STATUSES_IGNORE`== to the MPI function that causes [[query_fn]] to be called, then MPI will pass a valid status object to [[query_fn]] , and this status will be ignored upon return of the callback function.

~~`MPI\_{WAIT$`|`$TEST}{SOME$`|`$ALL}`~~ ==`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>SOME$`|`$ALL<span class="roman">}</span>`== may cause multiple invocations of [[query_fn]] callback functions, one for each generalized request that is completed by the MPI call. The order of these invocations is not specified by MPI.

~~`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}`~~ ==`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`== call that completed the generalized request associated with this callback. [[free_fn]] is invoked after the call to [[query_fn]] for the same request. However, if the MPI call completed multiple generalized requests, the order in which [[free_fn]] callback functions are invoked is not specified by MPI.

~~`WAIT\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}`~~ ==`WAIT\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`== will occur for such a request). In this case, the callback function will be called either in the MPI call [[versions/v22/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or in the MPI call [[versions/v22/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , whichever happens

> Calling [[versions/v22/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] will cause the `request` handle to be set to ~~MPI_REQUEST_NULL.~~ ==`MPI_REQUEST_NULL`.== This handle to the generalized request is no longer valid. However, user copies of this handle are valid until after > > [[free_fn]] completes since MPI does not deallocate the object until then. Since [[free_fn]] is not called until after [[versions/v22/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , the user copy of the handle can be used to make this call. Users should note that MPI will deallocate the object after [[free_fn]] executes. At this point, user copies of the `request` handle no longer point to a valid request. MPI will not set user copies to ~~MPI_REQUEST_NULL~~ ==`MPI_REQUEST_NULL`== in this case, so it is up to the user to avoid accessing this stale handle. This is a special case where MPI defers deallocating the object until a later time that is known by the user.

~~`MPI\_{WAIT$`|`$TEST}{ANY}`~~ ==`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY<span class="roman">}</span>`== call that invokes both [[query_fn]] and [[free_fn]] , the MPI call will return the error code returned by the last callback, namely [[free_fn]] . If one or more of the requests in a call to

~~`MPI\_{WAIT$`|`$TEST}{SOME$`|`$ALL}`~~ ==`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>SOME$`|`$ALL<span class="roman">}</span>`== failed, then the MPI call will return ~~MPI_ERR_IN_STATUS.~~ ==`MPI_ERR_IN_STATUS`.==

In such a case, if the MPI call was passed an array of statuses, then MPI will return in each of the statuses that correspond to a completed generalized request the error code returned by the corresponding invocation of its [[free_fn]] callback function. However, if the MPI function was passed ~~MPI_STATUSES_IGNORE,~~ ==`MPI_STATUSES_IGNORE`,== then the individual error codes returned by each callback functions will be lost.

### MPI-2.2 → MPI-3.0  (11 changed paragraphs)

~~generalized requests~~

~~is to allow users to define new nonblocking operations. Such an outstanding nonblocking operation is represented by a (generalized) request. A fundamental property of nonblocking operations is that progress toward the completion of this operation occurs asynchronously, i.e., concurrently with normal program execution. Typically, this requires execution of code concurrently with the execution of the user code, e.g., in a separate thread or in a signal handler. Operating systems provide a variety of mechanisms in support of concurrent execution. MPI does not attempt to standardize or replace these mechanisms: it is assumed programmers who wish to define new asynchronous operations will use the mechanisms provided by the underlying operating system. Thus, the calls in this section only provide a means for defining the effect of MPI calls such as [[versions/v30/API/MPI_WAIT|MPI_WAIT]] or [[versions/v30/API/MPI_CANCEL|MPI_CANCEL]] when they apply to generalized requests, and for signaling to MPI the completion of a generalized operation.~~

==generalized requests is to allow users to define new nonblocking operations. Such an outstanding nonblocking operation is represented by a (generalized) request. A fundamental property of nonblocking operations is that progress toward the completion of this operation occurs asynchronously, i.e., concurrently with normal program execution. Typically, this requires execution of code concurrently with the execution of the user code, e.g., in a separate thread or in a signal handler. Operating systems provide a variety of mechanisms in support of concurrent execution. MPI does not attempt to standardize or to replace these mechanisms: it is assumed programmers who wish to define new asynchronous operations will use the mechanisms provided by the underlying operating system. Thus, the calls in this section only provide a means for defining the effect of MPI calls such as [[versions/v30/API/MPI_WAIT|MPI_WAIT]] or [[versions/v30/API/MPI_CANCEL|MPI_CANCEL]] when they apply to generalized requests, and for signaling to MPI the completion of a generalized operation.==

~~> It is tempting to also define an MPI standard mechanism for achieving concurrent execution of user-defined nonblocking operations. > > However, it is very difficult to define such a mechanism without consideration of the specific mechanisms used in the operating system. > > The Forum feels that concurrency mechanisms are a proper part of the underlying operating system and should not be standardized by MPI; the MPI standard should only deal with the interaction of such mechanisms with MPI.~~

~~For a regular request, the operation associated with the request is performed by the MPI implementation, and the operation completes without intervention by the application. For a generalized request, the operation associated with the request is performed by the application; therefore, the application must notify MPI when the~~

~~operation completes. This is done by making a call to~~

~~[[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] . MPI maintains the “completion” status of generalized requests. Any other request state has to be maintained by the user.~~

==> It is tempting to also define an MPI standard mechanism for achieving concurrent execution of user-defined nonblocking operations. However, it is difficult to define such a mechanism without consideration of the specific mechanisms used in the operating system. The Forum feels that concurrency mechanisms are a proper part of the underlying operating system and should not be standardized by MPI; the MPI standard should only deal with the interaction of such mechanisms with MPI.==

==For a regular request, the operation associated with the request is performed by the MPI implementation, and the operation completes without intervention by the application. For a generalized request, the operation associated with the request is performed by the application; therefore, the application must notify MPI through a call to [[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] when the operation completes. MPI maintains the “completion” status of generalized requests. Any other request state has to be maintained by the user.==

> Note that a generalized request ~~belongs, in C++, to the class `MPI::Grequest`, which is a derived class of `MPI::Request`. It~~ is of the same type as regular requests, in C and Fortran.

~~The syntax and meaning of the callback functions are listed below. All callback functions are passed the `extra_state` argument that was associated with the request by the starting call [[versions/v30/API/MPI_GREQUEST_START|MPI_GREQUEST_START]] . This can be used to maintain user-defined state for the request.~~

~~In~~

~~C, the query function is~~

~~in Fortran~~

~~and in C++~~

~~[[query_fn]] function computes the status that should be returned for the generalized request. The status also includes information about successful/unsuccessful cancellation of the request (result to be returned by [[versions/v30/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] ).~~

~~[[query_fn]] callback is invoked by the~~

~~`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` call that completed the generalized request associated with this callback.~~

~~The callback function is also invoked by calls to [[versions/v30/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] , if the request is complete when the call occurs. In both cases, the callback is passed a reference to the corresponding status variable passed by the user to the MPI call; the status set by the callback function is returned by the MPI call.~~

~~If the user provided `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` to the MPI function that causes [[query_fn]] to be called, then MPI will pass a valid status object to [[query_fn]] , and this status will be ignored upon return of the callback function.~~

~~Note that [[query_fn]] is invoked only after~~

~~[[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] is called on the request;~~

~~it may be invoked several times for the same generalized request, e.g., if the user calls [[versions/v30/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] several times for this request. Note also that a call to~~

==The syntax and meaning of the callback functions are listed below. All callback functions are passed the `extra_state` argument that was associated with the request by the starting call [[versions/v30/API/MPI_GREQUEST_START|MPI_GREQUEST_START]] ; `extra_state` can be used to maintain user-defined state for the request.==

==In C, the query function is==

==in Fortran with the `mpi_f08` module==

==in Fortran with the `mpi` module and `mpif.h`==

==The [[query_fn]] function computes the status that should be returned for the generalized request. The status also includes information about successful/unsuccessful cancellation of the request (result to be returned by [[versions/v30/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] ).==

==The [[query_fn]] callback is invoked by the==

==`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` call that completed the generalized request associated with this callback. The callback function is also invoked by calls to [[versions/v30/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] , if the request is complete when the call occurs. In both cases, the callback is passed a reference to the corresponding status variable passed by the user to the MPI call; the status set by the callback function is returned by the MPI call. If the user provided `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` to the MPI function that causes [[query_fn]] to be called, then MPI will pass a valid status object to [[query_fn]] , and this status will be ignored upon return of the callback function. Note that [[query_fn]] is invoked only after [[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] is called on the request; it may be invoked several times for the same generalized request, e.g., if the user calls [[versions/v30/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] several times for this request. Note also that a call to==

~~and~~ in Fortran ==with the `mpi_f08` module==

==in Fortran with the `mpi` module== and ~~in C++~~ ==`mpif.h`==

==The== [[free_fn]] function is invoked to clean up user-allocated resources when the generalized request is freed.

==The== [[free_fn]] callback is invoked by the

~~[[free_fn]] callback is also invoked for generalized requests that are freed by a call to [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] (no call to~~

~~`WAIT\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` will occur for such a request). In this case, the callback function will be called either in the MPI call [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or in the MPI call [[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , whichever happens~~

~~last, i.e.,~~

~~in this case the actual freeing code is executed as soon as both calls [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] and [[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] have occurred.~~

~~The `request` is not deallocated until after [[free_fn]] completes.~~

~~Note that [[free_fn]] will be invoked only once per request by a correct program.~~

==The [[free_fn]] callback is also invoked for generalized requests that are freed by a call to [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] (no call to==

==`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` will occur for such a request). In this case, the callback function will be called either in the MPI call [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or in the MPI call [[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , whichever happens==

==last, i.e., in this case the actual freeing code is executed as soon as both calls [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] and [[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] have occurred. The `request` is not deallocated until after [[free_fn]] completes. Note that [[free_fn]] will be invoked only once per request by a correct program.==

> Calling [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] will cause the `request` handle to be set to `MPI_REQUEST_NULL`. This handle to the generalized request is no longer valid. However, user copies of this handle are valid until after ~~> >~~ [[free_fn]] completes since MPI does not deallocate the object until then. Since [[free_fn]] is not called until after [[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , the user copy of the handle can be used to make this call. Users should note that MPI will deallocate the object after [[free_fn]] executes. At this point, user copies of the `request` handle no longer point to a valid request. MPI will not set user copies to `MPI_REQUEST_NULL` in this case, so it is up to the user to avoid accessing this stale handle. This is a special case ~~where~~ ==in which== MPI defers deallocating the object until a later time that is known by the user.

~~in Fortran~~

~~and in C++~~

~~[[cancel_fn]] function is invoked to start the cancelation of a generalized request.~~

~~It is called by [[versions/v30/API/MPI_CANCEL|MPI_CANCEL]] .~~

~~MPI passes to the callback function `complete=true` if~~

~~[[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] was already called on the request, and `complete=false` otherwise.~~

~~All callback functions return an error code.~~

~~The code is passed back and dealt with as appropriate for the error code by the MPI function that invoked the callback function. For example, if error codes are returned then the error code returned by the callback function will be returned by the MPI function that invoked the callback function.~~

~~In the case of~~

~~an~~

==in Fortran with the `mpi_f08` module==

==in Fortran with the `mpi` module and `mpif.h`==

==The [[cancel_fn]] function is invoked to start the cancelation of a generalized request.==

==It is called by [[versions/v30/API/MPI_CANCEL|MPI_CANCEL]] . MPI passes `complete=true` to the callback function if [[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] was already called on the request, and `complete=false` otherwise.==

==All callback functions return an error code. The code is passed back and dealt with as appropriate for the error code by the MPI function that invoked the callback function. For example, if error codes are returned then the error code returned by the callback function will be returned by the MPI function that invoked the callback function. In the case of an==

~~`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>SOME$`|`$ALL<span class="roman">}</span>` failed, then the MPI call will return `MPI_ERR_IN_STATUS`.~~

~~In such a case, if the MPI call was passed an array of statuses, then MPI will return in each of the statuses that correspond to a completed generalized request the error code returned by the corresponding invocation of its [[free_fn]] callback function. However, if the MPI function was passed `MPI_STATUSES_IGNORE`, then the individual error codes returned by each callback functions will be lost.~~

==`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>SOME$`|`$ALL<span class="roman">}</span>` failed, then the MPI call will return `MPI_ERR_IN_STATUS`. In such a case, if the MPI call was passed an array of statuses, then MPI will return in each of the statuses that correspond to a completed generalized request the error code returned by the corresponding invocation of its [[free_fn]] callback function. However, if the MPI function was passed `MPI_STATUSES_IGNORE`, then the individual error codes returned by each callback functions will be lost.==

> [[query_fn]] must **not** set the error field of `status` since [[query_fn]] may be called by [[versions/v30/API/MPI_WAIT|MPI_WAIT]] or [[versions/v30/API/MPI_TEST|MPI_TEST]] , in which case the error field of `status` should not change. The MPI library knows the “context” in which [[query_fn]] is invoked and can decide correctly when to put ==the returned error code== in the error field of ~~status the returned error code.~~ ==`status`.==

~~complete (see~~

~~definitions in Section [[terms-semantic]] ). A call to [[versions/v30/API/MPI_WAIT|MPI_WAIT]] will return and a call to [[versions/v30/API/MPI_TEST|MPI_TEST]] will return `flag=true` only after a call to [[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] has declared that these operations are complete.~~

~~MPI imposes no restrictions on the code executed by the callback functions. However, new nonblocking operations should be defined so that the general semantic rules about MPI calls such as [[versions/v30/API/MPI_TEST|MPI_TEST]] , [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or [[versions/v30/API/MPI_CANCEL|MPI_CANCEL]] still hold. For example, all these calls are supposed to be local and nonblocking. Therefore, the callback functions [[query_fn]] , [[free_fn]] , or [[cancel_fn]] should invoke blocking MPI communication calls only if the context is such that these calls are guaranteed to return in finite time. Once [[versions/v30/API/MPI_CANCEL|MPI_CANCEL]] is invoked, the cancelled operation should complete in finite time, irrespective of the state of other processes (the operation has acquired “local” semantics). It should either succeed, or fail without side-effects. The user should guarantee these same properties for newly defined operations.~~

==complete (see definitions in Section [[terms-semantic]] ). A call to [[versions/v30/API/MPI_WAIT|MPI_WAIT]] will return and a call to [[versions/v30/API/MPI_TEST|MPI_TEST]] will return `flag=true` only after a call to [[versions/v30/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] has declared that these operations are complete.==

==MPI imposes no restrictions on the code executed by the callback functions. However, new nonblocking operations should be defined so that the general semantic rules about MPI calls such as [[versions/v30/API/MPI_TEST|MPI_TEST]] , [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or [[versions/v30/API/MPI_CANCEL|MPI_CANCEL]] still hold. For example, these calls are supposed to be local and nonblocking. Therefore, the callback functions [[query_fn]] , [[free_fn]] , or [[cancel_fn]] should invoke blocking MPI communication calls only if the context is such that these calls are guaranteed to return in finite time. Once [[versions/v30/API/MPI_CANCEL|MPI_CANCEL]] is invoked, the cancelled operation should complete in finite time, irrespective of the state of other processes (the operation has acquired “local” semantics). It should either succeed, or fail without side-effects. The user should guarantee these same properties for newly defined operations.==

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

~~The goal of~~

~~generalized requests is to allow users to define new nonblocking operations. Such an outstanding nonblocking operation is represented by a (generalized) request. A fundamental property of nonblocking operations is that progress toward the completion of this operation occurs asynchronously, i.e., concurrently with normal program execution. Typically, this requires execution of code concurrently with the execution of the user code, e.g., in a separate thread or in a signal handler. Operating systems provide a variety of mechanisms in support of concurrent execution. MPI does not attempt to standardize or to replace these mechanisms: it is assumed programmers who wish to define new asynchronous operations will use the mechanisms provided by the underlying operating system. Thus, the calls in this section only provide a means for defining the effect of MPI calls such as [[versions/v31/API/MPI_WAIT|MPI_WAIT]] or [[versions/v31/API/MPI_CANCEL|MPI_CANCEL]] when they apply to generalized requests, and for signaling to MPI the completion of a generalized operation.~~

==The goal of generalized requests is to allow users to define new nonblocking operations. Such an outstanding nonblocking operation is represented by a (generalized) request. A fundamental property of nonblocking operations is that progress toward the completion of this operation occurs asynchronously, i.e., concurrently with normal program execution. Typically, this requires execution of code concurrently with the execution of the user code, e.g., in a separate thread or in a signal handler. Operating systems provide a variety of mechanisms in support of concurrent execution. MPI does not attempt to standardize or to replace these mechanisms: it is assumed programmers who wish to define new asynchronous operations will use the mechanisms provided by the underlying operating system. Thus, the calls in this section only provide a means for defining the effect of MPI calls such as [[versions/v31/API/MPI_WAIT|MPI_WAIT]] or [[versions/v31/API/MPI_CANCEL|MPI_CANCEL]] when they apply to generalized requests, and for signaling to MPI the completion of a generalized operation.==

~~`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` will occur for such a request). In this case, the callback function will be called either in the MPI call [[versions/v31/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or in the MPI call [[versions/v31/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , whichever happens~~

~~last, i.e., in this case the actual freeing code is executed as soon as both calls [[versions/v31/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] and [[versions/v31/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] have occurred. The `request` is not deallocated until after [[free_fn]] completes. Note that [[free_fn]] will be invoked only once per request by a correct program.~~

==`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` will occur for such a request). In this case, the callback function will be called either in the MPI call [[versions/v31/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or in the MPI call [[versions/v31/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , whichever happens last, i.e., in this case the actual freeing code is executed as soon as both calls [[versions/v31/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] and [[versions/v31/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] have occurred. The `request` is not deallocated until after [[free_fn]] completes. Note that [[free_fn]] will be invoked only once per request by a correct program.==

~~The [[cancel_fn]] function is invoked to start the cancelation of a generalized request.~~

~~It is called by [[versions/v31/API/MPI_CANCEL|MPI_CANCEL]] . MPI passes `complete=true` to the callback function if [[versions/v31/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] was already called on the request, and `complete=false` otherwise.~~

==The [[cancel_fn]] function is invoked to start the cancelation of a generalized request. It is called by [[versions/v31/API/MPI_CANCEL|MPI_CANCEL]] . MPI passes `complete=true` to the callback function if [[versions/v31/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] was already called on the request, and `complete=false` otherwise.==

> [[query_fn]] must ~~**not**~~ ==*not*== set the error field of `status` since [[query_fn]] may be called by [[versions/v31/API/MPI_WAIT|MPI_WAIT]] or [[versions/v31/API/MPI_TEST|MPI_TEST]] , in which case the error field of `status` should not change. The MPI library knows the “context” in which [[query_fn]] is invoked and can decide correctly when to put the returned error code in the error field of `status`.

~~The call informs MPI that the operations represented by the generalized request `request` are~~

~~complete (see definitions in Section [[terms-semantic]] ). A call to [[versions/v31/API/MPI_WAIT|MPI_WAIT]] will return and a call to [[versions/v31/API/MPI_TEST|MPI_TEST]] will return `flag=true` only after a call to [[versions/v31/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] has declared that these operations are complete.~~

==The call informs MPI that the operations represented by the generalized request `request` are complete (see definitions in Section [[terms-semantic]] ). A call to [[versions/v31/API/MPI_WAIT|MPI_WAIT]] will return and a call to [[versions/v31/API/MPI_TEST|MPI_TEST]] will return `flag=true` only after a call to [[versions/v31/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] has declared that these operations are complete.==

### MPI-3.1 → MPI-4.0  (8 changed paragraphs)

The goal of generalized requests is to allow users to define new nonblocking operations. Such an outstanding nonblocking operation is represented by a (generalized) request. A fundamental property of nonblocking operations is that ~~progress~~ ==*progress*== toward the completion of this operation occurs asynchronously, i.e., concurrently with normal program execution. Typically, this requires execution of code concurrently with the execution of the user code, e.g., in a separate thread or in a signal handler. Operating systems provide a variety of mechanisms in support of concurrent execution. MPI does not attempt to standardize or to replace these mechanisms: it is assumed programmers who wish to define new asynchronous operations will use the mechanisms provided by the underlying operating system. Thus, the calls in this section only provide a means for defining the effect of MPI calls such as [[versions/v40/API/MPI_WAIT|MPI_WAIT]] or [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] when they apply to generalized requests, and for signaling to MPI the completion of a generalized operation.

The ~~[[query_fn]]~~ ==`query_fn`== function computes the status that should be returned for the generalized request. The status also includes information about successful/unsuccessful cancellation of the request (result to be returned by [[versions/v40/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] ).

The ~~[[query_fn]]~~ ==`query_fn`== callback is invoked by the

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` call that completed the generalized request associated with this callback. The callback function is also invoked by calls to [[versions/v40/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] , if the request is complete when the call occurs. In both cases, the callback is passed a reference to the corresponding status variable passed by the user to the MPI call; the status set by the callback function is returned by the MPI call. If the user provided `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` to the MPI function that causes ~~[[query_fn]]~~ ==`query_fn`== to be called, then MPI will pass a valid status object to ~~[[query_fn]] ,~~ ==`query_fn`,== and this status will be ignored upon return of the callback function. Note that ~~[[query_fn]]~~ ==`query_fn`== is invoked only after [[versions/v40/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] is called on the request; it may be invoked several times for the same generalized request, e.g., if the user calls [[versions/v40/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] several times for this request. Note also that a call to

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>SOME$`|`$ALL<span class="roman">}</span>` may cause multiple invocations of ~~[[query_fn]]~~ ==`query_fn`== callback functions, one for each generalized request that is completed by the MPI call. The order of these invocations is not specified by MPI.

The ~~[[free_fn]]~~ ==`free_fn`== function is invoked to clean up user-allocated resources when the generalized request is freed.

The ~~[[free_fn]]~~ ==`free_fn`== callback is invoked by the

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` call that completed the generalized request associated with this callback. ~~[[free_fn]]~~ ==`free_fn`== is invoked after the call to ~~[[query_fn]]~~ ==`query_fn`== for the same request. However, if the MPI call completed multiple generalized requests, the order in which ~~[[free_fn]]~~ ==`free_fn`== callback functions are invoked is not specified by MPI.

The ~~[[free_fn]]~~ ==`free_fn`== callback is also invoked for generalized requests that are freed by a call to [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] (no call to

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` will occur for such a request). In this case, the callback function will be called either in the MPI call [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or in the MPI call [[versions/v40/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , whichever happens last, i.e., in this case the actual freeing code is executed as soon as both calls [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] and [[versions/v40/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] have occurred. The `request` is not deallocated until after ~~[[free_fn]]~~ ==`free_fn`== completes. Note that ~~[[free_fn]]~~ ==`free_fn`== will be invoked only once per request by a correct program.

> Calling [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] will cause the `request` handle to be set to `MPI_REQUEST_NULL`. This handle to the generalized request is no longer valid. However, user copies of this handle are valid until after ~~[[free_fn]]~~ ==`free_fn`== completes since MPI does not deallocate the object until then. Since ~~[[free_fn]]~~ ==`free_fn`== is not called until after [[versions/v40/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , the user copy of the handle can be used to make this call. Users should note that MPI will deallocate the object after ~~[[free_fn]]~~ ==`free_fn`== executes. At this point, user copies of the `request` handle no longer point to a valid request. MPI will not set user copies to `MPI_REQUEST_NULL` in this case, so it is up to the user to avoid accessing this stale handle. This is a special case in which MPI defers deallocating the object until a later time that is known by the user.

The ~~[[cancel_fn]]~~ ==`cancel_fn`== function is invoked to start the cancelation of a generalized request. It is called by [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] . MPI passes ~~`complete=true`~~ ==`complete` = `true`== to the callback function if [[versions/v40/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] was already called on the request, and ~~`complete=false`~~ ==`complete` = `false`== otherwise.

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY<span class="roman">}</span>` call that invokes both ~~[[query_fn]]~~ ==`query_fn`== and ~~[[free_fn]] ,~~ ==`free_fn`,== the MPI call will return the error code returned by the last callback, namely ~~[[free_fn]] .~~ ==`free_fn`.== If one or more of the requests in a call to

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>SOME$`|`$ALL<span class="roman">}</span>` failed, then the MPI call will return `MPI_ERR_IN_STATUS`. In such a case, if the MPI call was passed an array of statuses, then MPI will return in each of the statuses that correspond to a completed generalized request the error code returned by the corresponding invocation of its ~~[[free_fn]]~~ ==`free_fn`== callback function. However, if the MPI function was passed `MPI_STATUSES_IGNORE`, then the individual error codes returned by each callback functions will be lost.

> ~~[[query_fn]]~~ ==`query_fn`== must *not* set the error field of `status` since ~~[[query_fn]]~~ ==`query_fn`== may be called by [[versions/v40/API/MPI_WAIT|MPI_WAIT]] or [[versions/v40/API/MPI_TEST|MPI_TEST]] , in which case the error field of `status` should not change. The MPI library knows the “context” in which ~~[[query_fn]]~~ ==`query_fn`== is invoked and can decide correctly when to put the returned error code in the error field of `status`.

The call informs MPI that the operations represented by the generalized request `request` are complete (see definitions in Section [[terms-semantic]] ). A call to [[versions/v40/API/MPI_WAIT|MPI_WAIT]] will return and a call to [[versions/v40/API/MPI_TEST|MPI_TEST]] will return ~~`flag=true`~~ ==`flag` = `true`== only after a call to [[versions/v40/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] has declared that these operations are complete.

MPI imposes no restrictions on the code executed by the callback functions. However, new nonblocking operations should be defined so that the general semantic rules about MPI calls such as [[versions/v40/API/MPI_TEST|MPI_TEST]] , [[versions/v40/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] still hold. For example, these calls are supposed to be local and nonblocking. Therefore, the callback functions ~~[[query_fn]] , [[free_fn]] ,~~ ==`query_fn`, `free_fn`,== or ~~[[cancel_fn]]~~ ==`cancel_fn`== should invoke blocking MPI communication calls only if the context is such that these calls are guaranteed to return in finite time. Once [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] is invoked, the cancelled operation should complete in finite time, irrespective of the state of other processes (the operation has acquired “local” semantics). It should either succeed, or fail without side-effects. The user should guarantee these same properties for newly defined operations.

### MPI-4.0 → MPI-4.1  (10 changed paragraphs)

In C, the query ~~function~~ ==procedure== is

in Fortran with the `mpi` module and ==(deprecated)== `mpif.h` ==include file==

~~`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`~~ ==`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}`== call that completed the generalized request associated with this callback. The callback function is also invoked by calls to [[versions/v41/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] , if the request is complete when the call occurs. In both cases, the callback is passed a reference to the corresponding status variable passed by the user to the MPI call; the status set by the callback function is returned by the MPI call. If the user provided `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` to the MPI ~~function~~ ==procedure== that causes `query_fn` to be called, then MPI will pass a valid status object to `query_fn`, and this status will be ignored upon return of the callback function. Note that `query_fn` is invoked only after [[versions/v41/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] is called on the request; it may be invoked several times for the same generalized request, e.g., if the user calls [[versions/v41/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] several times for this request. Note also that a call to

~~`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>SOME$`|`$ALL<span class="roman">}</span>`~~ ==`MPI\_{WAIT$`|`$TEST}{SOME$`|`$ALL}`== may cause multiple invocations of `query_fn` callback functions, one for each generalized request that is completed by the MPI call. The order of these invocations is not specified by MPI.

In C, the free ~~function~~ ==procedures== is

in Fortran with the `mpi` module and ==(deprecated)== `mpif.h` ==include file==

~~`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`~~ ==`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}`== call that completed the generalized request associated with this callback. `free_fn` is invoked after the call to `query_fn` for the same request. However, if the MPI call completed multiple generalized requests, the order in which `free_fn` callback functions are invoked is not specified by MPI.

~~`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`~~ ==`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}`== will occur for such a request). In this case, the callback function will be called either in the MPI call [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or in the MPI call [[versions/v41/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , whichever happens last, i.e., in this case the actual freeing code is executed as soon as both calls [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] and [[versions/v41/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] have occurred. The `request` is not deallocated until after `free_fn` completes. Note that `free_fn` will be invoked only once per request by a correct program.

In C, the cancel ~~function~~ ==procedure== is

in Fortran with the `mpi` module and ==(deprecated)== `mpif.h` ==include file==

All callback functions return an error code. The code is passed back and dealt with as appropriate for the error code by the MPI ~~function~~ ==procedure== that invoked the callback function. For example, if error codes are returned then the error code returned by the callback function will be returned by the MPI ~~function~~ ==procedure== that invoked the callback function. In the case of an

~~`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY<span class="roman">}</span>`~~ ==`MPI\_{WAIT$`|`$TEST}{ANY}`== call that invokes both `query_fn` and `free_fn`, the MPI call will return the error code returned by the last callback, namely `free_fn`. If one or more of the requests in a call to

~~`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>SOME$`|`$ALL<span class="roman">}</span>`~~ ==`MPI\_{WAIT$`|`$TEST}{SOME$`|`$ALL}`== failed, then the MPI call will return `MPI_ERR_IN_STATUS`. In such a case, if the MPI call was passed an array of statuses, then MPI will return in each of the statuses that correspond to a completed generalized request the error code returned by the corresponding invocation of its `free_fn` callback function. However, if the MPI ~~function~~ ==procedure== was passed `MPI_STATUSES_IGNORE`, then the individual error codes returned by each callback functions will be lost.

MPI imposes no restrictions on the code executed by the callback functions. However, new nonblocking operations should be defined so that the general semantic rules about MPI calls such as [[versions/v41/API/MPI_TEST|MPI_TEST]] , [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] still hold. For example, these calls are supposed to be local and nonblocking. Therefore, the callback functions `query_fn`, `free_fn`, or `cancel_fn` should invoke blocking MPI communication calls only if the context is such that these calls are guaranteed to return in finite time. Once [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] is invoked, the cancelled operation should complete in finite time, irrespective of the state of other ==MPI== processes (the operation has acquired “local” semantics). It should either succeed, or fail without side-effects. The user should guarantee these same properties for newly defined operations.

### MPI-4.1 → MPI-5.0  (7 changed paragraphs)

~~`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}`~~ ==`MPI\_{WAIT$`|`$TEST}{$`|`$ANY$`|`$SOME$`|`$ALL}`== call that completed the generalized request associated with this callback. The callback function is also invoked by calls to [[versions/v50/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] , if the request is complete when the call occurs. In both cases, the callback is passed a reference to the corresponding status variable passed by the user to the MPI call; the status set by the callback function is returned by the MPI call. If the user provided `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` to the MPI procedure that causes `query_fn` to be called, then MPI will pass a valid status object to `query_fn`, and this status will be ignored upon return of the callback function. Note that `query_fn` is invoked only after [[versions/v50/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] is called on the request; it may be invoked several times for the same generalized request, e.g., if the user calls [[versions/v50/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] several times for this request. Note also that a call to

In C, the free ~~procedures~~ ==procedure== is

~~`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}`~~ ==`MPI\_{WAIT$`|`$TEST}{$`|`$ANY$`|`$SOME$`|`$ALL}`== call that completed the generalized request associated with this callback. `free_fn` is invoked after the call to `query_fn` for the same request. However, if the MPI call completed multiple generalized requests, the order in which `free_fn` callback functions are invoked is not specified by MPI.

~~`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}`~~ ==`MPI\_{WAIT$`|`$TEST}{$`|`$ANY$`|`$SOME$`|`$ALL}`== will occur for such a request). In this case, the callback function will be called either in the MPI call [[versions/v50/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] ~~,~~ ==`(request)`,== or in the MPI call [[versions/v50/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] ~~,~~ ==`(request)`,== whichever happens last, i.e., in this case the actual freeing code is executed as soon as both calls [[versions/v50/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] and [[versions/v50/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] have occurred. The `request` is not deallocated until after `free_fn` completes. Note that `free_fn` will be invoked only once per request by a correct program.

> Calling [[versions/v50/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] ==`(request)`== will cause the `request` handle to be set to `MPI_REQUEST_NULL`. This handle to the generalized request is no longer valid. However, user copies of this handle are valid until after `free_fn` completes since MPI does not deallocate the object until then. Since `free_fn` is not called until after [[versions/v50/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] , the user copy of the handle can be used to make this call. Users should note that MPI will deallocate the object after `free_fn` executes. At this point, user copies of the `request` handle no longer point to a valid request. MPI will not set user copies to `MPI_REQUEST_NULL` in this case, so it is up to the user to avoid accessing this stale handle. This is a special case in which MPI defers deallocating the object until a later time that is known by the user.

The `cancel_fn` function is invoked to start the cancelation of a generalized request. It is called by [[versions/v50/API/MPI_CANCEL|MPI_CANCEL]] ~~.~~ ==`(request)`.== MPI passes `complete` = `true` to the callback function if [[versions/v50/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] was already called on the request, and `complete` = `false` otherwise.

The call informs MPI that the operations represented by the generalized request `request` are complete (see definitions in Section [[terms-semantic]] ). A call to [[versions/v50/API/MPI_WAIT|MPI_WAIT]] ==`(request, status)`== will return and a call to [[versions/v50/API/MPI_TEST|MPI_TEST]] ==`(request, flag, status)`== will return `flag` = `true` only after a call to [[versions/v50/API/MPI_GREQUEST_COMPLETE|MPI_GREQUEST_COMPLETE]] has declared that these operations are complete.

MPI imposes no restrictions on the code executed by the callback functions. However, new nonblocking operations should be defined so that the general semantic rules about MPI calls such as [[versions/v50/API/MPI_TEST|MPI_TEST]] , [[versions/v50/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or [[versions/v50/API/MPI_CANCEL|MPI_CANCEL]] still hold. ~~For example, these calls are supposed to be local and nonblocking.~~ Therefore, the callback functions `query_fn`, `free_fn`, or `cancel_fn` should invoke blocking MPI communication calls only if the context is such that these calls are guaranteed to return in finite time. Once [[versions/v50/API/MPI_CANCEL|MPI_CANCEL]] is invoked, the cancelled operation should complete in finite time, irrespective of the state of other MPI processes (the operation has acquired “local” semantics). It should either succeed, or fail without side-effects. The user should guarantee these ~~same~~ properties for newly defined operations.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/ei#Generalized Requests]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/ei#Generalized Requests]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/ei#Generalized Requests]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/ei#Generalized Requests]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/ei#Generalized Requests]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/ei#Generalized Requests]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/ei#Generalized Requests]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/ei#Generalized Requests]]
