# External Interfaces



## Introduction



This chapter contains calls used to create **generalized requests**, which allow users to create new nonblocking operations with an interface similar to what is present in MPI. These calls can be used to layer new functionality on top of MPI. Section [[ei#Associating Information with Status|Associating Information with Status]] deals with setting the information found in `status`. This functionality is needed for generalized requests.

## Generalized Requests



The goal of generalized requests is to allow users to define new nonblocking operations. Such an outstanding nonblocking operation is represented by a (generalized) request. A fundamental property of nonblocking operations is that *progress* toward the completion of this operation occurs asynchronously, i.e., concurrently with normal program execution. Typically, this requires execution of code concurrently with the execution of the user code, e.g., in a separate thread or in a signal handler. Operating systems provide a variety of mechanisms in support of concurrent execution. MPI does not attempt to standardize or to replace these mechanisms: it is assumed programmers who wish to define new asynchronous operations will use the mechanisms provided by the underlying operating system. Thus, the calls in this section only provide a means for defining the effect of MPI calls such as [[MPI_WAIT]] or [[MPI_CANCEL]] when they apply to generalized requests, and for signaling to MPI the completion of a generalized operation.

> [!tip] Rationale

> It is tempting to also define an MPI standard mechanism for achieving concurrent execution of user-defined nonblocking operations. However, it is difficult to define such a mechanism without consideration of the specific mechanisms used in the operating system. The Forum feels that concurrency mechanisms are a proper part of the underlying operating system and should not be standardized by MPI; the MPI standard should only deal with the interaction of such mechanisms with MPI.

For a regular request, the operation associated with the request is performed by the MPI implementation, and the operation completes without intervention by the application. For a generalized request, the operation associated with the request is performed by the application; therefore, the application must notify MPI through a call to [[MPI_GREQUEST_COMPLETE]] when the operation completes. MPI maintains the “completion” status of generalized requests. Any other request state has to be maintained by the user.

A new generalized request is started with

![[API/MPI_GREQUEST_START]]

> [!note] Advice to users

> Note that a generalized request is of the same type as regular requests, in C and Fortran.

The call starts a generalized request and returns a handle to it in `request`.

The syntax and meaning of the callback functions are listed below. All callback functions are passed the `extra_state` argument that was associated with the request by the starting call [[MPI_GREQUEST_START]] ; `extra_state` can be used to maintain user-defined state for the request.

In C, the query procedure is

in Fortran with the `mpi_f08` module

in Fortran with the `mpi` module and (deprecated) `mpif.h` include file

The `query_fn` function computes the status that should be returned for the generalized request. The status also includes information about successful/unsuccessful cancellation of the request (result to be returned by [[MPI_TEST_CANCELLED]] ).

The `query_fn` callback is invoked by the

`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` call that completed the generalized request associated with this callback. The callback function is also invoked by calls to [[MPI_REQUEST_GET_STATUS]] , if the request is complete when the call occurs. In both cases, the callback is passed a reference to the corresponding status variable passed by the user to the MPI call; the status set by the callback function is returned by the MPI call. If the user provided `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` to the MPI procedure that causes `query_fn` to be called, then MPI will pass a valid status object to `query_fn`, and this status will be ignored upon return of the callback function. Note that `query_fn` is invoked only after [[MPI_GREQUEST_COMPLETE]] is called on the request; it may be invoked several times for the same generalized request, e.g., if the user calls [[MPI_REQUEST_GET_STATUS]] several times for this request. Note also that a call to

`MPI\_{WAIT$`|`$TEST}{SOME$`|`$ALL}` may cause multiple invocations of `query_fn` callback functions, one for each generalized request that is completed by the MPI call. The order of these invocations is not specified by MPI.

In C, the free procedures is

in Fortran with the `mpi_f08` module

in Fortran with the `mpi` module and (deprecated) `mpif.h` include file

The `free_fn` function is invoked to clean up user-allocated resources when the generalized request is freed.

The `free_fn` callback is invoked by the

`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` call that completed the generalized request associated with this callback. `free_fn` is invoked after the call to `query_fn` for the same request. However, if the MPI call completed multiple generalized requests, the order in which `free_fn` callback functions are invoked is not specified by MPI.

The `free_fn` callback is also invoked for generalized requests that are freed by a call to [[MPI_REQUEST_FREE]] (no call to

`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` will occur for such a request). In this case, the callback function will be called either in the MPI call [[MPI_REQUEST_FREE]] , or in the MPI call [[MPI_GREQUEST_COMPLETE]] , whichever happens last, i.e., in this case the actual freeing code is executed as soon as both calls [[MPI_REQUEST_FREE]] and [[MPI_GREQUEST_COMPLETE]] have occurred. The `request` is not deallocated until after `free_fn` completes. Note that `free_fn` will be invoked only once per request by a correct program.

> [!note] Advice to users

> Calling [[MPI_REQUEST_FREE]] will cause the `request` handle to be set to `MPI_REQUEST_NULL`. This handle to the generalized request is no longer valid. However, user copies of this handle are valid until after `free_fn` completes since MPI does not deallocate the object until then. Since `free_fn` is not called until after [[MPI_GREQUEST_COMPLETE]] , the user copy of the handle can be used to make this call. Users should note that MPI will deallocate the object after `free_fn` executes. At this point, user copies of the `request` handle no longer point to a valid request. MPI will not set user copies to `MPI_REQUEST_NULL` in this case, so it is up to the user to avoid accessing this stale handle. This is a special case in which MPI defers deallocating the object until a later time that is known by the user.

In C, the cancel procedure is

in Fortran with the `mpi_f08` module

in Fortran with the `mpi` module and (deprecated) `mpif.h` include file

The `cancel_fn` function is invoked to start the cancelation of a generalized request. It is called by [[MPI_CANCEL]] . MPI passes `complete` = `true` to the callback function if [[MPI_GREQUEST_COMPLETE]] was already called on the request, and `complete` = `false` otherwise.

All callback functions return an error code. The code is passed back and dealt with as appropriate for the error code by the MPI procedure that invoked the callback function. For example, if error codes are returned then the error code returned by the callback function will be returned by the MPI procedure that invoked the callback function. In the case of an

`MPI\_{WAIT$`|`$TEST}{ANY}` call that invokes both `query_fn` and `free_fn`, the MPI call will return the error code returned by the last callback, namely `free_fn`. If one or more of the requests in a call to

`MPI\_{WAIT$`|`$TEST}{SOME$`|`$ALL}` failed, then the MPI call will return `MPI_ERR_IN_STATUS`. In such a case, if the MPI call was passed an array of statuses, then MPI will return in each of the statuses that correspond to a completed generalized request the error code returned by the corresponding invocation of its `free_fn` callback function. However, if the MPI procedure was passed `MPI_STATUSES_IGNORE`, then the individual error codes returned by each callback functions will be lost.

> [!note] Advice to users

> `query_fn` must *not* set the error field of `status` since `query_fn` may be called by [[MPI_WAIT]] or [[MPI_TEST]] , in which case the error field of `status` should not change. The MPI library knows the “context” in which `query_fn` is invoked and can decide correctly when to put the returned error code in the error field of `status`.

![[API/MPI_GREQUEST_COMPLETE]]

The call informs MPI that the operations represented by the generalized request `request` are complete (see definitions in Section [[terms-semantic]] ). A call to [[MPI_WAIT]] will return and a call to [[MPI_TEST]] will return `flag` = `true` only after a call to [[MPI_GREQUEST_COMPLETE]] has declared that these operations are complete.

MPI imposes no restrictions on the code executed by the callback functions. However, new nonblocking operations should be defined so that the general semantic rules about MPI calls such as [[MPI_TEST]] , [[MPI_REQUEST_FREE]] , or [[MPI_CANCEL]] still hold. For example, these calls are supposed to be local and nonblocking. Therefore, the callback functions `query_fn`, `free_fn`, or `cancel_fn` should invoke blocking MPI communication calls only if the context is such that these calls are guaranteed to return in finite time. Once [[MPI_CANCEL]] is invoked, the cancelled operation should complete in finite time, irrespective of the state of other MPI processes (the operation has acquired “local” semantics). It should either succeed, or fail without side-effects. The user should guarantee these same properties for newly defined operations.

> [!warning] Advice to implementors

> A call to [[MPI_GREQUEST_COMPLETE]] may unblock a blocked user process/thread. The MPI library should ensure that the blocked user computation will resume.

### Examples

This example shows the code for a user-defined reduce operation on an `int` using a binary tree: each nonroot node receives two messages, sums them, and sends them up. We assume that no status is returned and that the operation cannot be cancelled.

``` [MPI]C
typedef struct {
   MPI_Comm comm;
   int tag;
   int root;
   int valin;
   int *valout;
   MPI_Request request;
   } ARGS;

int myreduce(MPI_Comm comm, int tag, int root,
             int valin, int *valout, MPI_Request *request)
{
   ARGS *args;
   pthread_t thread;
   
   /* start request */
   MPI_Grequest_start(query_fn, free_fn, cancel_fn, NULL, request);
   
   args = (ARGS*)malloc(sizeof(ARGS));
   args->comm = comm;
   args->tag = tag;
   args->root = root;
   args->valin = valin;
   args->valout = valout;
   args->request = *request;
   
   /* spawn thread to handle request */
   /* The availability of the pthread_create call is system dependent */
   pthread_create(&thread, NULL, reduce_thread, args);
   
   return MPI_SUCCESS;
}

/* thread code */
void* reduce_thread(void *ptr) 
{
   int lchild, rchild, parent, lval, rval, val;
   MPI_Request req[2];
   ARGS *args;
   
   args = (ARGS*)ptr;
   
   /* compute left and right child and parent in tree; set 
      to MPI_PROC_NULL if does not exist  */
   /* code not shown */
   ...
     
   MPI_Irecv(&lval, 1, MPI_INT, lchild, args->tag, args->comm, &req[0]);
   MPI_Irecv(&rval, 1, MPI_INT, rchild, args->tag, args->comm, &req[1]);
   MPI_Waitall(2, req, MPI_STATUSES_IGNORE);
   val = lval + args->valin + rval;
   MPI_Send(&val, 1, MPI_INT, parent, args->tag, args->comm);
   if (parent == MPI_PROC_NULL) *(args->valout) = val;
   MPI_Grequest_complete((args->request));   
   free(ptr);
   return(NULL);
}

int query_fn(void *extra_state, MPI_Status *status)
{
   /* always send just one int */
   MPI_Status_set_elements(status, MPI_INT, 1);
   /* can never cancel so always true */
   MPI_Status_set_cancelled(status, 0);
   /* choose not to return a value for this */
   status->MPI_SOURCE = MPI_UNDEFINED;
   /* tag has no meaning for this generalized request */
   status->MPI_TAG = MPI_UNDEFINED;
   /* this generalized request never fails */
   return MPI_SUCCESS;
}

int free_fn(void *extra_state)
{
   /* this generalized request does not need to do any freeing */
   /* as a result it never fails here */
   return MPI_SUCCESS;
}

int cancel_fn(void *extra_state, int complete)
{
   /* This generalized request does not support cancelling.
      Abort if not already done.
      If done then treat as if cancel failed.*/
   if (!complete) {
     fprintf(stderr,
             "Cannot cancel generalized request - aborting program\n");
     MPI_Abort(MPI_COMM_WORLD, 99);
   }
   return MPI_SUCCESS;
}
```

## Associating Information with Status



MPI supports several different types of requests besides those for point-to-point operations. These range from MPI calls for I/O to generalized requests. It is desirable to allow these calls to use the same request mechanism, which allows one to wait or test on different types of requests. However,

`MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}` returns a status with information about the request. With the generalization of requests, one needs to define what information will be returned in the status object.

Each MPI call fills in the appropriate fields in the status object. Any unused fields will have undefined values. A call to

`MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}` can modify any of the fields in the status object. Specifically, it can modify fields that are undefined. The fields with meaningful values for a given request are defined in the sections with the new request.

Generalized requests raise additional considerations. Here, the user provides the functions to deal with the request. Unlike other MPI calls, the user needs to provide the information to be returned in the status. The status argument is provided directly to the callback function where the status needs to be set. Users can directly set the values in 3 of the 5 status values. The count and cancel fields are opaque. To overcome this, these calls are provided:

![[API/MPI_STATUS_SET_ELEMENTS]]

This procedure modifies the opaque part of `status` so calls to [[MPI_GET_ELEMENTS]] will return `count`. Calls to [[MPI_GET_COUNT]] will return a compatible value.

> [!tip] Rationale

> The number of elements is set instead of the count because the former can deal with a non-integer number of datatypes.

A subsequent call to [[MPI_GET_COUNT]] or [[MPI_GET_ELEMENTS]] must use a `datatype` argument that has the same type signature as the `datatype` argument that was used in the call to [[MPI_STATUS_SET_ELEMENTS]] .

> [!tip] Rationale

> The requirement of matching type signatures for these calls is similar to the restriction that holds when `count` is set by a receive operation: in that case, calls to [[MPI_GET_COUNT]] and [[MPI_GET_ELEMENTS]] must use a `datatype` with the same signature as the datatype used in the receive call.

![[API/MPI_STATUS_SET_CANCELLED]]

If `flag` is set to `true` then a subsequent call to [[MPI_TEST_CANCELLED]] will also return `flag``= true`, otherwise it will return `false`.

> [!note] Advice to users

> Users are advised not to reuse the status fields for values other than those for which they were intended. Doing so may lead to unexpected results when using the status object. For example, calling [[MPI_GET_ELEMENTS]] may cause an error if the value is out of range or it may be impossible to detect such an error. The `extra_state` argument provided with a generalized request can be used to return information that does not logically belong in status. Furthermore, modifying the values in a status set internally by MPI, e.g., [[MPI_RECV]] , may lead to unpredictable results and is strongly discouraged.

While the `MPI_SOURCE`, `MPI_TAG`, and `MPI_ERROR` status values are directly accessible by the user, for convenience in some contexts, users can also modify them via the procedure calls described below. Procedures for querying these fields from a status object are defined in Section [[pt2pt#Return Status|Return Status]] .

![[API/MPI_STATUS_SET_SOURCE]]

Set the `MPI_SOURCE` field in the `status` object to the provided `source` argument.

![[API/MPI_STATUS_SET_TAG]]

Set the `MPI_TAG` field in the `status` object to the provided `tag` argument.

![[API/MPI_STATUS_SET_ERROR]]

Set the `MPI_ERROR` field in the `status` object to the provided `err` error code.

> [!tip] Rationale

> These functions exist for convenience when using MPI from languages other than C and Fortran, where having a function in the MPI library with a known API reduces the need for utility code written in C.
