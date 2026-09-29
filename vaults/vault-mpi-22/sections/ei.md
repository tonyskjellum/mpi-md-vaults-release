# External Interfaces



## Introduction



This chapter begins with calls used to create **generalized requests**,

which allow users

to create new nonblocking operations with an interface similar to what is present in MPI. This can be used to layer new functionality on top of MPI. Next, Section [[ei#Associating Information with Status|Associating Information with Status]] deals with setting the information found in `status`. This is needed for generalized

requests.

The chapter continues, in Section [[ei#MPI and Threads|MPI and Threads]] , with a discussion of how threads are to be handled in

MPI.

Although thread compliance is not required, the standard specifies how threads are to work if they are provided.

## Generalized Requests



The goal of

generalized requests

is to allow users to define new nonblocking operations. Such an outstanding nonblocking operation is represented by a (generalized) request. A fundamental property of nonblocking operations is that progress toward the completion of this operation occurs asynchronously, i.e., concurrently with normal program execution. Typically, this requires execution of code concurrently with the execution of the user code, e.g., in a separate thread or in a signal handler. Operating systems provide a variety of mechanisms in support of concurrent execution. MPI does not attempt to standardize or replace these mechanisms: it is assumed programmers who wish to define new asynchronous operations will use the mechanisms provided by the underlying operating system. Thus, the calls in this section only provide a means for defining the effect of MPI calls such as [[MPI_WAIT]] or [[MPI_CANCEL]] when they apply to generalized requests, and for signaling to MPI the completion of a generalized operation.

> [!tip] Rationale

> It is tempting to also define an MPI standard mechanism for achieving concurrent execution of user-defined nonblocking operations.
>
> However, it is very difficult to define such a mechanism without consideration of the specific mechanisms used in the operating system.
>
> The Forum feels that concurrency mechanisms are a proper part of the underlying operating system and should not be standardized by MPI; the MPI standard should only deal with the interaction of such mechanisms with MPI.

For a regular request, the operation associated with the request is performed by the MPI implementation, and the operation completes without intervention by the application. For a generalized request, the operation associated with the request is performed by the application; therefore, the application must notify MPI when the

operation completes. This is done by making a call to

[[MPI_GREQUEST_COMPLETE]] . MPI maintains the “completion” status of generalized requests. Any other request state has to be maintained by the user.

A new generalized request is started with

![[API/MPI_GREQUEST_START]]

> [!note] Advice to users

> Note that a generalized request belongs, in C++, to the class `MPI::Grequest`, which is a derived class of `MPI::Request`. It is of the same type as regular requests, in C and Fortran.

The call starts a generalized request and returns a handle to it in `request`.

The syntax and meaning of the callback functions are listed below. All callback functions are passed the `extra_state` argument that was associated with the request by the starting call [[MPI_GREQUEST_START]] . This can be used to maintain user-defined state for the request.

In

C, the query function is

in Fortran

and in C++

[[query_fn]] function computes the status that should be returned for the generalized request. The status also includes information about successful/unsuccessful cancellation of the request (result to be returned by [[MPI_TEST_CANCELLED]] ).

[[query_fn]] callback is invoked by the

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` call that completed the generalized request associated with this callback.

The callback function is also invoked by calls to [[MPI_REQUEST_GET_STATUS]] , if the request is complete when the call occurs. In both cases, the callback is passed a reference to the corresponding status variable passed by the user to the MPI call; the status set by the callback function is returned by the MPI call.

If the user provided `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` to the MPI function that causes [[query_fn]] to be called, then MPI will pass a valid status object to [[query_fn]] , and this status will be ignored upon return of the callback function.

Note that [[query_fn]] is invoked only after

[[MPI_GREQUEST_COMPLETE]] is called on the request;

it may be invoked several times for the same generalized request, e.g., if the user calls [[MPI_REQUEST_GET_STATUS]] several times for this request. Note also that a call to

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>SOME$`|`$ALL<span class="roman">}</span>` may cause multiple invocations of [[query_fn]] callback functions, one for each generalized request that is completed by the MPI call. The order of these invocations is not specified by MPI.

In C, the free function is

and in Fortran

and in C++

[[free_fn]] function is invoked to clean up user-allocated resources when the generalized request is freed.

[[free_fn]] callback is invoked by the

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` call that completed the generalized request associated with this callback. [[free_fn]] is invoked after the call to [[query_fn]] for the same request. However, if the MPI call completed multiple generalized requests, the order in which [[free_fn]] callback functions are invoked is not specified by MPI.

[[free_fn]] callback is also invoked for generalized requests that are freed by a call to [[MPI_REQUEST_FREE]] (no call to

`WAIT\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` will occur for such a request). In this case, the callback function will be called either in the MPI call [[MPI_REQUEST_FREE]] , or in the MPI call [[MPI_GREQUEST_COMPLETE]] , whichever happens

last, i.e.,

in this case the actual freeing code is executed as soon as both calls [[MPI_REQUEST_FREE]] and [[MPI_GREQUEST_COMPLETE]] have occurred.

The `request` is not deallocated until after [[free_fn]] completes.

Note that [[free_fn]] will be invoked only once per request by a correct program.

> [!note] Advice to users

> Calling [[MPI_REQUEST_FREE]] will cause the `request` handle to be set to `MPI_REQUEST_NULL`. This handle to the generalized request is no longer valid. However, user copies of this handle are valid until after
>
> [[free_fn]] completes since MPI does not deallocate the object until then. Since [[free_fn]] is not called until after [[MPI_GREQUEST_COMPLETE]] , the user copy of the handle can be used to make this call. Users should note that MPI will deallocate the object after [[free_fn]] executes. At this point, user copies of the `request` handle no longer point to a valid request. MPI will not set user copies to `MPI_REQUEST_NULL` in this case, so it is up to the user to avoid accessing this stale handle. This is a special case where MPI defers deallocating the object until a later time that is known by the user.

In C, the cancel function is

in Fortran

and in C++

[[cancel_fn]] function is invoked to start the cancelation of a generalized request.

It is called by [[MPI_CANCEL]] .

MPI passes to the callback function `complete=true` if

[[MPI_GREQUEST_COMPLETE]] was already called on the request, and `complete=false` otherwise.

All callback functions return an error code.

The code is passed back and dealt with as appropriate for the error code by the MPI function that invoked the callback function. For example, if error codes are returned then the error code returned by the callback function will be returned by the MPI function that invoked the callback function.

In the case of

an

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY<span class="roman">}</span>` call that invokes both [[query_fn]] and [[free_fn]] , the MPI call will return the error code returned by the last callback, namely [[free_fn]] . If one or more of the requests in a call to

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>SOME$`|`$ALL<span class="roman">}</span>` failed, then the MPI call will return `MPI_ERR_IN_STATUS`.

In such a case, if the MPI call was passed an array of statuses, then MPI will return in each of the statuses that correspond to a completed generalized request the error code returned by the corresponding invocation of its [[free_fn]] callback function. However, if the MPI function was passed `MPI_STATUSES_IGNORE`, then the individual error codes returned by each callback functions will be lost.

> [!note] Advice to users

> [[query_fn]] must **not** set the error field of `status` since [[query_fn]] may be called by [[MPI_WAIT]] or [[MPI_TEST]] , in which case the error field of `status` should not change. The MPI library knows the “context” in which [[query_fn]] is invoked and can decide correctly when to put in the error field of status the returned error code.

![[API/MPI_GREQUEST_COMPLETE]]

The call informs MPI that the operations represented by the generalized request `request` are

complete (see

definitions in Section [[terms-semantic]] ). A call to [[MPI_WAIT]] will return and a call to [[MPI_TEST]] will return `flag=true` only after a call to [[MPI_GREQUEST_COMPLETE]] has declared that these operations are complete.

MPI imposes no restrictions on the code executed by the callback functions. However, new nonblocking operations should be defined so that the general semantic rules about MPI calls such as [[MPI_TEST]] , [[MPI_REQUEST_FREE]] , or [[MPI_CANCEL]] still hold. For example, all these calls are supposed to be local and nonblocking. Therefore, the callback functions [[query_fn]] , [[free_fn]] , or [[cancel_fn]] should invoke blocking MPI communication calls only if the context is such that these calls are guaranteed to return in finite time. Once [[MPI_CANCEL]] is invoked, the cancelled operation should complete in finite time, irrespective of the state of other processes (the operation has acquired “local” semantics). It should either succeed, or fail without side-effects. The user should guarantee these same properties for newly defined operations.

> [!warning] Advice to implementors

> A call to [[MPI_GREQUEST_COMPLETE]] may unblock a blocked user process/thread. The MPI library should ensure that the blocked user computation will resume.

### Examples

This example shows the code for a user-defined reduce operation on an `int` using a binary tree: each non-root node receives two messages, sums them, and sends them up. We assume that no status is returned and that the operation cannot be cancelled.

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
       
       /* compute left,right child and parent in tree; set 
          to MPI_PROC_NULL if does not exist  */
       /* code not shown */
       ...
         
       MPI_Irecv(&lval, 1, MPI_INT, lchild, args->tag, args->comm, &req[0]);
       MPI_Irecv(&rval, 1, MPI_INT, rchild, args->tag, args->comm, &req[1]);
       MPI_Waitall(2, req, MPI_STATUSES_IGNORE);
       val = lval + args->valin + rval;
       MPI_Send( &val, 1, MPI_INT, parent, args->tag, args->comm );
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
          Abort if not already done.  If done then treat as if cancel failed.*/
       if (!complete) {
         fprintf(stderr,
                 "Cannot cancel generalized request - aborting program\n");
         MPI_Abort(MPI_COMM_WORLD, 99);
         }
       return MPI_SUCCESS;
    }

## Associating Information with Status



MPI supports several different types of requests besides those for

point-to-point operations.

These range from

MPI calls for I/O to generalized requests. It is desirable to allow these calls use the same request mechanism. This allows one to wait or test on different types of requests. However,

`MPI\_<span class="roman">{</span>TEST$`|`$WAIT<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` returns a status with information about the request. With the generalization of requests, one needs to define what information will be returned in the status object.

Each MPI

call fills in the appropriate fields in the status object. Any unused fields will have undefined values. A call to

`MPI\_<span class="roman">{</span>TEST$`|`$WAIT<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` can modify any of the fields in the status object. Specifically, it can modify fields that are undefined. The fields with meaningful value for a given request are defined in the sections with the new request.

Generalized requests raise additional considerations. Here, the user provides the functions to deal with the request. Unlike other MPI calls, the user needs to provide the information to be returned in status. The status argument is provided directly to the callback function where the status needs to be set. Users can directly set the values in 3 of the 5 status values. The count and cancel fields are opaque. To overcome this,

these calls

are provided:

![[API/MPI_STATUS_SET_ELEMENTS]]

This call modifies the opaque part of `status` so that a call to [[MPI_GET_ELEMENTS]] will return `count`. [[MPI_GET_COUNT]] will return a compatible value.

> [!tip] Rationale

> The number of elements is set instead of the count because the former can deal with
>
> a
>
> nonintegral number of datatypes.

A subsequent call to [[MPI_GET_COUNT]] or to [[MPI_GET_ELEMENTS]] must use a `datatype` argument that has the same type signature as the `datatype` argument that was used in the call to [[MPI_STATUS_SET_ELEMENTS]] .

> [!tip] Rationale

> This is similar to the restriction that holds
>
> when
>
> `count` is set by a receive operation: in that case, the calls to [[MPI_GET_COUNT]] and [[MPI_GET_ELEMENTS]] must use a `datatype` with the same signature as the datatype used in the receive call.

![[API/MPI_STATUS_SET_CANCELLED]]

If `flag` is set to `true` then a subsequent call to [[MPI_TEST_CANCELLED]] will also return `flag = true`, otherwise it will return

`false`.

> [!note] Advice to users

> Users are advised not to reuse the status fields for values other than those for which they were intended. Doing so may lead to unexpected results when using the status object. For example, calling [[MPI_GET_ELEMENTS]] may cause an error if the value is out of range or it may be impossible to detect such an error. The `extra_state` argument provided with a generalized request can be used to return information that does not logically belong in status.
>
> Furthermore, modifying the values in a status set internally by MPI, e.g., [[MPI_RECV]] , may lead to unpredictable results and is strongly discouraged.

## MPI and Threads



This section specifies the interaction between MPI calls and threads. The section lists minimal requirements for **thread compliant** MPI implementations and defines functions that can be used for initializing the thread environment. MPI may be implemented in environments where threads are not supported or perform poorly. Therefore, it is not required that all MPI implementations fulfill all the requirements specified in this section.

This section generally assumes a thread package similar to POSIX threads , but the syntax and semantics of thread calls are not specified here — these are beyond the scope of this document.

### General

In a thread-compliant implementation, an MPI process is a process that may be multi-threaded. Each thread can issue MPI calls; however, threads are not separately addressable: a rank in a send or receive call identifies a process, not a thread. A message sent to a process can be received by any thread in this process.

> [!tip] Rationale

> This model corresponds to the POSIX model of interprocess communication: the fact that a process is multi-threaded, rather than single-threaded, does not affect the external interface of this process.
>
> MPI implementations where MPI ‘processes’ are POSIX threads inside a single POSIX process are not thread-compliant by this definition (indeed, their “processes” are single-threaded).

> [!note] Advice to users

> It is the user’s responsibility to prevent races when threads within the same application post conflicting communication calls. The user can make sure that two threads in the same process will not issue conflicting communication calls by using distinct communicators at each thread.

The two main requirements for a thread-compliant implementation are listed below.

1.  All MPI calls are *thread-safe*,

    i.e.,

    two concurrently running threads may make MPI calls and the outcome will be as if the calls executed in some order, even if their execution is interleaved.

2.  Blocking MPI calls will block the calling thread only, allowing another thread to execute, if available. The calling thread will be blocked until the event on which it is waiting occurs. Once the blocked communication is enabled and can proceed, then the call will complete and the thread will be marked runnable, within a finite time. A blocked thread will not prevent progress of other runnable threads on the same process, and will not prevent them from executing MPI calls.

Process 0 consists of two threads. The first thread executes a blocking send call `MPI_Send(buff1, count, type, 0, 0, comm)`, whereas the second thread executes a blocking receive call `MPI_Recv(buff2, count, type, 0, 0, comm, &status)`, i.e., the first thread sends a message that is received by the second thread. This communication should always succeed. According to the first requirement, the execution will correspond to some interleaving of the two calls. According to the second requirement, a call can only block the calling thread and cannot prevent progress of the other thread. If the send call went ahead of the receive call, then the sending thread may block, but this will not prevent the receiving thread from executing. Thus, the receive call will occur. Once both calls occur, the communication is enabled and both calls will complete. On the other hand, a single-threaded process that posts a send, followed by a matching receive, may deadlock. The progress requirement for multithreaded implementations is stronger, as a blocked call cannot prevent progress in other threads.

> [!warning] Advice to implementors

> MPI calls can be made thread-safe by executing only one at a time, e.g., by protecting MPI code with one process-global lock. However, blocked operations cannot hold the lock, as this would prevent progress of other threads in the process. The lock is held only for the duration of an atomic, locally-completing suboperation such as posting a send or completing a send, and is released in between. Finer locks can provide more concurrency, at the expense of higher locking overheads. Concurrency can also be achieved by having some of the MPI protocol executed by separate server threads.

### Clarifications

##### Initialization and Completion

The call to [[MPI_FINALIZE]] should occur on the same thread that initialized MPI. We call this thread the **main thread**. The call should occur only after all the process threads have completed their MPI calls, and have no pending communications or I/O operations.

> [!tip] Rationale

> This constraint simplifies implementation.

##### Multiple threads completing the same request.

A program where two threads block, waiting on the same request, is erroneous. Similarly, the same request cannot appear in the array of requests of two concurrent

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`

calls. In MPI, a request can only be completed once. Any combination of wait or test which violates this rule is erroneous.

> [!tip] Rationale

> This is consistent with the view that a multithreaded execution corresponds to an interleaving of the MPI calls. In a single threaded implementation, once a wait is posted on a request the request handle will be nullified before it is possible to post a second wait on the same handle.
>
> With threads, an `MPI_WAIT<span class="roman">{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` may be blocked without having nullified its request(s) so it becomes the user’s responsibility to avoid using the same request in an [[MPI_WAIT]] on another thread. This constraint also simplifies implementation, as only one thread will be blocked on any communication or I/O event.

##### Probe

A receive call that uses source and tag values returned by a preceding call to [[MPI_PROBE]] or [[MPI_IPROBE]] will receive the message matched by the probe call only if there was no other matching receive after the probe and before that receive. In a multithreaded environment, it is up to the user to enforce this condition using suitable mutual exclusion logic. This can be enforced by making sure that each communicator is used by only one thread on each process.

##### Collective calls

Matching of collective calls on a

communicator, window, or file handle is done according to the order in which the calls are issued

at each process. If concurrent threads issue such calls on the same communicator, window or file handle, it is up to the user to make sure the calls are correctly ordered, using interthread synchronization.

> [!note] Advice to users

> With three concurrent threads in each MPI process of a communicator `comm`, it is allowed that thread A in each MPI process calls a collective operation on `comm`, thread B calls a file operation on an existing filehandle that was formerly opened on `comm`, and thread C invokes one-sided operations on an existing window handle that was also formerly created on `comm`.

> [!tip] Rationale

> As already specified in [[MPI_FILE_OPEN]] and [[MPI_WIN_CREATE]] , a file handle and a window handle inherit only the group of processes of the underlying communicator, but not the communicator itself. Accesses to communicators, window handles and file handles cannot affect one another.

> [!warning] Advice to implementors

> Advice to implementors. If the implementation of file or window operations internally uses MPI communication then a duplicated communicator may be cached on the file or window object.

##### Exception handlers

An exception handler does not necessarily execute in the context of the thread that made the exception-raising MPI call; the exception handler may be executed by a thread that is distinct from the thread that will return the error code.

> [!tip] Rationale

> The MPI implementation may be multithreaded, so that part of the communication protocol may execute on a thread that is distinct from the thread that made the MPI call. The design allows the exception handler to be executed on the thread where the exception occurred.

##### Interaction with signals and cancellations

The outcome is undefined if a thread that executes an MPI call is cancelled (by another thread), or if a thread catches a signal while executing an MPI call. However, a thread of an MPI process may terminate, and may catch signals or be cancelled by another thread when not executing MPI calls.

> [!tip] Rationale

> Few C library functions are signal safe, and many have cancellation points — points where the thread executing them may be cancelled. The above restriction simplifies implementation (no need for the MPI library to be “async-cancel-safe” or “async-signal-safe.”

> [!note] Advice to users

> Users can catch signals in separate, non-MPI threads (e.g., by masking signals on MPI calling threads, and unmasking them in one or more non-MPI threads).
>
> A good programming practice is to have a distinct thread blocked in a call to `sigwait` for each user expected signal that may occur. Users must not catch signals used by the MPI implementation; as each MPI implementation is required to document the signals used internally, users can avoid these signals.

> [!warning] Advice to implementors

> The MPI library should not invoke library calls that are not thread safe, if multiple threads execute.

### Initialization

The following function may be used to initialize MPI, and initialize the MPI thread environment, instead of [[MPI_INIT]] .

![[API/MPI_INIT_THREAD]]

> [!note] Advice to users

> In C and C++, the passing of `argc` and `argv` is optional.
>
> In C, this is accomplished by passing the appropriate null pointer.
>
> In C++, this is accomplished with two separate bindings to cover these two cases.
>
> This is as with [[MPI_INIT]] as discussed in Section [[inquiry#Startup|Startup]] .

This call initializes MPI in the same way that a call to [[MPI_INIT]] would. In addition, it initializes the thread environment. The argument `required`

is used to specify the desired level of thread support.

The possible values are listed in increasing order of thread support.

`MPI_THREAD_SINGLE`  
Only one thread will execute.

`MPI_THREAD_FUNNELED`  
The process may be multi-threaded, but

the application must ensure that only the main thread makes MPI calls (for the definition of main thread, see [[MPI_IS_THREAD_MAIN]] on page [[function-mpiisthreadmain]] ).

`MPI_THREAD_SERIALIZED`  
The process may be multi-threaded, and multiple threads may make MPI calls, but only one at a time: MPI calls are not made concurrently from two distinct threads (all MPI calls are “serialized”).

`MPI_THREAD_MULTIPLE`  
Multiple threads may call MPI, with no restrictions.

These values are monotonic; i.e., `MPI_THREAD_SINGLE` $`<`$ `MPI_THREAD_FUNNELED` $`<`$ `MPI_THREAD_SERIALIZED` $`<`$ `MPI_THREAD_MULTIPLE`.

Different processes in `MPI_COMM_WORLD` may require different levels of thread support.

The call returns in `provided` information about the actual level of thread support that will be provided by MPI. It can be one of the four values listed above.

The level(s) of thread support that can be provided by [[MPI_INIT_THREAD]] will depend on the implementation, and may depend on information provided by the user before the program started to execute (e.g., with

arguments to `mpiexec`). If possible, the call will return `provided = required`. Failing this, the call will return the least supported level such that `provided `$`>`$` required` (thus providing a stronger level of support than required by the user). Finally, if the user requirement cannot be satisfied, then the call will return in `provided` the highest supported level.

A **thread compliant** MPI implementation will be able to return `provided`

`= MPI_THREAD_MULTIPLE`. Such an implementation may always return `provided`

`= MPI_THREAD_MULTIPLE`, irrespective of the value of `required`. At the other extreme, an MPI library that is not thread compliant may always return `provided = MPI_THREAD_SINGLE`, irrespective of the value of `required`.

A call to [[MPI_INIT]] has the same effect as a call to [[MPI_INIT_THREAD]] with a `required = MPI_THREAD_SINGLE`.

Vendors may provide (implementation dependent) means to specify the level(s) of thread support available when the MPI

program is started, e.g., with arguments to `mpiexec`. This will affect the outcome of calls to [[MPI_INIT]] and `MPI_INIT_THREAD`. Suppose, for example, that an MPI program has been started so that only `MPI_THREAD_MULTIPLE` is available. Then [[MPI_INIT_THREAD]] will return `provided = MPI_THREAD_MULTIPLE`, irrespective of the value of `required`; a call to [[MPI_INIT]] will also initialize the MPI thread support level to `MPI_THREAD_MULTIPLE`. Suppose, on the other hand, that an MPI program has been started so that all four levels of thread support are available. Then, a call to [[MPI_INIT_THREAD]] will return `provided = required`; on the other hand, a call to [[MPI_INIT]] will initialize the MPI thread support level to `MPI_THREAD_SINGLE`.

> [!tip] Rationale

> Various optimizations are possible when MPI code is executed single-threaded, or is executed on multiple threads, but not concurrently: mutual exclusion code may be omitted. Furthermore, if only one thread executes, then the MPI library can use library functions that are not thread safe, without risking conflicts with user threads. Also, the model of one communication thread, multiple computation threads fits
>
> many applications well, e.g.,
>
> if the process code is a sequential Fortran/C/C++ program with MPI calls that has been parallelized by a compiler for execution on an SMP node, in a cluster of SMPs, then the process computation is multi-threaded, but MPI calls will likely execute on a single thread.
>
> The design accommodates a static specification of the thread support level, for environments that require static binding of libraries, and for compatibility for current multi-threaded MPI codes.

> [!warning] Advice to implementors

> If `provided` is not `MPI_THREAD_SINGLE` then the MPI library should not
>
> invoke C/ C++/Fortran library calls that are not thread safe, e.g., in an environment where `malloc` is not thread safe, then `malloc` should not be used by the MPI library.
>
> Some implementors may want to use different MPI libraries for different levels of thread support. They can do so using dynamic linking and selecting which library will be linked when [[MPI_INIT_THREAD]] is invoked. If this is not possible, then optimizations for lower levels of thread support will occur only when the level of thread support required is specified at link time.

The following function can be used to query the current level of thread support.

![[API/MPI_QUERY_THREAD]]

The call returns in `provided` the current level of thread support. This will be the value returned in `provided` by [[MPI_INIT_THREAD]] , if MPI was initialized by a call to [[MPI_INIT_THREAD]] .

![[API/MPI_IS_THREAD_MAIN]]

This function can be called by a thread to find out whether it is the main thread (the thread that called [[MPI_INIT]] or [[MPI_INIT_THREAD]] ).

All routines listed in this section must be supported by all MPI implementations.

> [!tip] Rationale

> MPI libraries are required to provide these calls even if they do not support threads, so that portable code that contains invocations to these functions be able to link correctly. [[MPI_INIT]] continues to be supported so as to provide compatibility with current MPI codes.

> [!note] Advice to users

> It is possible to spawn threads before MPI is initialized, but no MPI call other than [[MPI_INITIALIZED]] should be executed by these threads, until [[MPI_INIT_THREAD]] is invoked by one thread (which, thereby, becomes the main thread). In particular, it is possible to enter the MPI execution with a multi-threaded process.
>
> The level of thread support provided is a global property of the MPI process that can be specified only once, when MPI is initialized on that process (or before). Portable third party libraries have to be written so as to accommodate any provided level of thread support. Otherwise, their usage will be restricted to specific level(s) of thread support. If such a library can run only with specific level(s) of thread support, e.g., only with `MPI_THREAD_MULTIPLE`, then [[MPI_QUERY_THREAD]] can be used to check whether the user initialized MPI to the correct level of thread support and, if not, raise an exception.
