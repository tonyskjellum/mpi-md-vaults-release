7

# External Interfaces



## Introduction



This chapter begins with calls used to create **generalized requests**.

The objective of this MPI-2 addition is to allow users of MPI to be able to create new nonblocking operations with an interface similar to what is present in MPI. This can be used to layer new functionality on top of MPI. Next, Section [[ei#Associating Information with Status|Associating Information with Status]] deals with setting the information found in `status`. This is needed for generalized requests.

Section [[ei#Naming Objects|Naming Objects]] allows users to associate names with

communicators, windows, and datatypes. This will allow debuggers and profilers to identify communicators, windows, and datatypes with more useful labels. Section [[ei#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] allows users to add error codes, classes, and strings to MPI. With users being able to layer functionality on top of MPI, it is desirable for them to use the same error mechanisms found in MPI.

Section [[ei#Decoding a Datatype|Decoding a Datatype]] deals with decoding datatypes. The opaque datatype object has found a number of uses outside MPI. Furthermore, a number of tools wish to display internal information about a datatype. To achieve this, datatype decoding functions are provided.

The chapter continues, in Section [[ei#MPI and Threads|MPI and Threads]] , with a discussion of how threads are to be handled in MPI-2. Although thread compliance is not required, the standard specifies how threads are to work if they are provided. Section [[ei#New Attribute Caching Functions|New Attribute Caching Functions]] has information on caching on communicators, datatypes, and windows. Finally, Section [[ei#Duplicating a Datatype|Duplicating a Datatype]] discusses duplicating a datatype.

## Generalized Requests



The goal of this MPI-2 extension is to allow users to define new nonblocking operations. Such an outstanding nonblocking operation is represented by a (generalized) request. A fundamental property of nonblocking operations is that progress toward the completion of this operation occurs asynchronously, i.e., concurrently with normal program execution. Typically, this requires execution of code concurrently with the execution of the user code, e.g., in a separate thread or in a signal handler. Operating systems provide a variety of mechanisms in support of concurrent execution. MPI does not attempt to standardize or replace these mechanisms: it is assumed programmers who wish to define new asynchronous operations will use the mechanisms provided by the underlying operating system. Thus, the calls in this section only provide a means for defining the effect of MPI calls such as [[MPI_WAIT]] or [[MPI_CANCEL]] when they apply to generalized requests, and for signaling to MPI the completion of a generalized operation.

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

The syntax and meaning of the callback functions are listed below. All callback functions are passed the `extra_state` argument that was associated with the request by the starting call [[MPI_GREQUEST_START]] . This can be used to maintain user-defined state for the request. In C, the query function is

in Fortran

and in C++

[[query_fn]] function computes the status that should be returned for the generalized request. The status also includes information about successful/unsuccessful cancellation of the request (result to be returned by [[MPI_TEST_CANCELLED]] ).

[[query_fn]] callback is invoked by the `MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` call that completed the generalized request associated with this callback.

The callback function is also invoked by calls to [[MPI_REQUEST_GET_STATUS]] , if the request is complete when the call occurs. In both cases, the callback is passed a reference to the corresponding status variable passed by the user to the MPI call; the status set by the callback function is returned by the MPI call.

If the user provided MPI_STATUS_IGNORE or MPI_STATUSES_IGNORE to the MPI function that causes [[query_fn]] to be called, then MPI will pass a valid status object to [[query_fn]] , and this status will be ignored upon return of the callback function.

Note that [[query_fn]] is invoked only after

[[MPI_GREQUEST_COMPLETE]] is called on the request;

it may be invoked several times for the same generalized request, e.g., if the user calls [[MPI_REQUEST_GET_STATUS]] several times for this request. Note also that a call to `MPI\_{WAIT$`|`$TEST}{SOME$`|`$ALL}` may cause multiple invocations of [[query_fn]] callback functions, one for each generalized request that is completed by the MPI call. The order of these invocations is not specified by MPI.

In C, the free function is

and in Fortran

and in C++

[[free_fn]] function is invoked to clean up user-allocated resources when the generalized request is freed.

[[free_fn]] callback is invoked by the `MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` call that completed the generalized request associated with this callback. [[free_fn]] is invoked after the call to [[query_fn]] for the same request. However, if the MPI call completed multiple generalized requests, the order in which [[free_fn]] callback functions are invoked is not specified by MPI.

[[free_fn]] callback is also invoked for generalized requests that are freed by a call to [[MPI_REQUEST_FREE]] (no call to `WAIT\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` will occur for such a request). In this case, the callback function will be called either in the MPI call [[MPI_REQUEST_FREE]] , or in the MPI call [[MPI_GREQUEST_COMPLETE]] , whichever happens last. I.e., in this case the actual freeing code is executed as soon as both calls [[MPI_REQUEST_FREE]] and [[MPI_GREQUEST_COMPLETE]] have occurred.

The `request` is not deallocated until after [[free_fn]] completes.

Note that [[free_fn]] will be invoked only once per request by a correct program.

> [!note] Advice to users

> Calling [[MPI_REQUEST_FREE]] will cause the `request` handle to be set to MPI_REQUEST_NULL. This handle to the generalized request is no longer valid. However, user copies of this handle are valid until after
>
> [[free_fn]] completes since MPI does not deallocate the object until then. Since [[free_fn]] is not called until after [[MPI_GREQUEST_COMPLETE]] , the user copy of the handle can be used to make this call. Users should note that MPI will deallocate the object after [[free_fn]] executes. At this point, user copies of the `request` handle no longer point to a valid request. MPI will not set user copies to MPI_REQUEST_NULL in this case, so it is up to the user to avoid accessing this stale handle. This is a special case where MPI defers deallocating the object until a later time that is known by the user.

In C, the cancel function is

in Fortran

and in C++

[[cancel_fn]] function is invoked to start the cancelation of a generalized request. It is called by [[MPI_REQUEST_CANCEL]] . MPI passes to the callback function `complete=true` if

[[MPI_GREQUEST_COMPLETE]] was already called on the request, and `complete=false` otherwise.

All callback functions return an error code.

The code is passed back and dealt with as appropriate for the error code by the MPI function that invoked the callback function. For example, if error codes are returned then the error code returned by the callback function will be returned by the MPI function that invoked the callback function.

In the case of `MPI\_{WAIT$`|`$TEST}{ANY}` call that invokes both [[query_fn]] and [[free_fn]] , the MPI call will return the error code returned by the last callback, namely [[free_fn]] . If one or more of the requests in a call to `MPI\_{WAIT$`|`$TEST}{SOME$`|`$ALL}` failed, then the MPI call will return MPI_ERR_IN_STATUS.

In such a case, if the MPI call was passed an array of statuses, then MPI will return in each of the statuses that correspond to a completed generalized request the error code returned by the corresponding invocation of its [[free_fn]] callback function. However, if the MPI function was passed MPI_STATUSES_IGNORE, then the individual error codes returned by each callback functions will be lost.

> [!note] Advice to users

> [[query_fn]] must **not** set the error field of `status` since [[query_fn]] may be called by [[MPI_WAIT]] or [[MPI_TEST]] , in which case the error field of `status` should not change. The MPI library knows the “context” in which [[query_fn]] is invoked and can decide correctly when to put in the error field of status the returned error code.

![[API/MPI_GREQUEST_COMPLETE]]

The call informs MPI that the operations represented by the generalized request `request` are complete. (See definitions in Section [[terms-semantic]] .) A call to [[MPI_WAIT]] will return and a call to [[MPI_TEST]] will return `flag=true` only after a call to [[MPI_GREQUEST_COMPLETE]] has declared that these operations are complete.

MPI imposes no restrictions on the code executed by the callback functions. However, new nonblocking operations should be defined so that the general semantic rules about MPI calls such as [[MPI_TEST, MPI_REQUEST_FREE]] , or [[MPI_CANCEL]] still hold. For example, all these calls are supposed to be local and nonblocking. Therefore, the callback functions [[query_fn, free_fn]] , or [[cancel_fn]] should invoke blocking MPI communication calls only if the context is such that these calls are guaranteed to return in finite time. Once [[MPI_CANCEL]] is invoked, the cancelled operation should complete in finite time, irrespective of the state of other processes (the operation has acquired “local” semantics). It should either succeed, or fail without side-effects. The user should guarantee these same properties for newly defined operations.

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
    void reduce_thread(void *ptr) 
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
    return;
    }

    int query_fn(void *extra_state, MPI_Status *status)
    {
    /* always send just one int */
    MPI_Status_set_elements(status, MPI_INT, 1);
    /* can never cancel so always true */
    MPI_Status_set_cancelled(status, 0);
    /* choose not to return a value for this */
    status->MPI_SOURCE = MPI_UNDEFINED;
    /* tag has not meaning for this generalized request */
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
       Abort if not already done.  If done then treat as if cancel failed. */
    if (!complete) {
      fprintf(stderr, "Cannot cancel generalized request - aborting program\n");
      MPI_Abort(MPI_COMM_WORLD, 99);
      }
    return MPI_SUCCESS;
    }

## Associating Information with Status



In MPI-1, requests were associated with point-to-point operations.

In MPI-2 there are several different types of requests. These range from new MPI calls for I/O to generalized requests. It is desirable to allow these calls use the same request mechanism. This allows one to wait or test on different types of requests. However, `MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}` returns a status with information about the request. With the generalization of requests, one needs to define what information will be returned in the status object.

In MPI-2, each call fills in the appropriate fields in the status object. Any unused fields will have undefined values. A call to `MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}` can modify any of the fields in the status object. Specifically, it can modify fields that are undefined. The fields with meaningful value for a given request are defined in the sections with the new request.

Generalized requests raise additional considerations. Here, the user provides the functions to deal with the request. Unlike other MPI calls, the user needs to provide the information to be returned in status. The status argument is provided directly to the callback function where the status needs to be set. Users can directly set the values in 3 of the 5 status values. The count and cancel fields are opaque. To overcome this, new calls are provided:

![[API/MPI_STATUS_SET_ELEMENTS]]

This call modifies the opaque part of `status` so that a call to [[MPI_GET_ELEMENTS]] will return `count`. [[MPI_GET_COUNT]] will return a compatible value.

> [!tip] Rationale

> The number of elements is set instead of the count because the former can deal with nonintegral number of datatypes.

A subsequent call to [[MPI_GET_COUNT]] or to [[MPI_GET_ELEMENTS]] must use a `datatype` argument that has the same type signature as the `datatype` argument that was used in the call to [[MPI_STATUS_SET_ELEMENTS]] .

> [!tip] Rationale

> This is similar to the restriction that holds when when `count` is set by a receive operation: in that case, the calls to [[MPI_GET_COUNT]] and [[MPI_GET_ELEMENTS]] must use a `datatype` with the same signature as the datatype used in the receive call.

![[API/MPI_STATUS_SET_CANCELLED]]

If `flag` is set to `true` then a subsequent call to [[MPI_TEST_CANCELLED]] will also return `flag = true`, otherwise it will return `false`.

> [!note] Advice to users

> Users are advised not to reuse the status fields for values other than those for which they were intended. Doing so may lead to unexpected results when using the status object. For example, calling [[MPI_GET_ELEMENTS]] may cause an error if the value is out of range or it may be impossible to detect such an error. The `extra_state` argument provided with a generalized request can be used to return information that does not logically belong in status.
>
> Furthermore, modifying the values in a status set internally by MPI, e.g., [[MPI_RECV]] , may lead to unpredictable results and is strongly discouraged.

## Naming Objects



There are many occasions on which it would be useful to allow a user to associate a printable identifier with an MPI communicator, window, or datatype, for instance error reporting, debugging, and profiling.

The names attached to opaque objects do not propagate when the object is duplicated or copied by MPI routines.

For communicators this can be achieved using the following two functions.

![[API/MPI_COMM_SET_NAME]]

[[MPI_COMM_SET_NAME]] allows a user to associate a name string with a communicator. The character string which is passed to [[MPI_COMM_SET_NAME]] will be saved inside the MPI library (so it can be freed by the caller immediately after the call, or allocated on the stack). Leading spaces in `name` are significant but trailing ones are not.

[[MPI_COMM_SET_NAME]] is a local (non-collective) operation, which only affects the name of the communicator as seen in the process which made the [[MPI_COMM_SET_NAME]] call. There is no requirement that the same (or any) name be assigned to a communicator in every process where it exists.

> [!note] Advice to users

> Since [[MPI_COMM_SET_NAME]] is provided to help debug code, it is sensible to give the same name to a communicator in all of the processes where it exists, to avoid confusion.

The length of the name which can be stored is limited to the value of MPI_MAX_OBJECT_NAME in Fortran and MPI_MAX_OBJECT_NAME-1 in C and C++ to allow for the null terminator.

Attempts to put names longer than this will result in truncation of the name.

MPI_MAX_OBJECT_NAME must have a value of at least 64.

> [!note] Advice to users

> Under circumstances of store exhaustion an attempt to put a name of any length could fail, therefore the value of
>
> MPI_MAX_OBJECT_NAME should be viewed only as a strict upper
>
> bound on the name length, not a guarantee that setting names of less than this length will always succeed.

> [!warning] Advice to implementors

> Implementations which pre-allocate a fixed size space for a name should use the length of that allocation as the value of
>
> MPI_MAX_OBJECT_NAME. Implementations which allocate space for the name from the heap should still define MPI_MAX_OBJECT_NAME to be a relatively small value, since the user has to allocate space for a string of up to this size when calling [[MPI_COMM_GET_NAME]] .

![[API/MPI_COMM_GET_NAME]]

[[MPI_COMM_GET_NAME]] returns the last name which has previously been associated with the given communicator. The name may be set and got from any language. The same name will be returned independent of the language used.

`name` should be allocated so that it can hold a resulting string of length MPI_MAX_OBJECT_NAME characters.

[[MPI_COMM_GET_NAME]] returns a copy of the set name in `name`.

If the user has not associated a name with a communicator, or an error occurs, [[MPI_COMM_GET_NAME]] will return an empty string (all spaces in Fortran, `""` in C and C++). The three predefined communicators will have predefined names associated with them. Thus, the names of MPI_COMM_WORLD, MPI_COMM_SELF, and MPI_COMM_PARENT will have the default of `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and `MPI_COMM_PARENT`. The fact that the system may have chosen to give a default name to a communicator does not prevent the user from setting a name on the same communicator; doing this removes the old name and assigns the new one.

> [!tip] Rationale

> We provide separate functions for setting and getting the name of a communicator, rather than simply providing a predefined attribute key for the following reasons:
>
> - It is not, in general, possible to store a string as an attribute from Fortran.
>
> - It is not easy to set up the delete function for a string attribute unless it is known to have been allocated from the heap.
>
> - To make the attribute key useful additional code to call `strdup` is necessary. If this is not standardized then users have to write it. This is extra unneeded work which we can easily eliminate.
>
> - The Fortran binding is not trivial to write (it will depend on details of the Fortran compilation system), and will not be portable. Therefore it should be in the library rather than in user code.

> [!note] Advice to users

> The above definition means that it is safe simply to print the string returned by [[MPI_COMM_GET_NAME]] , as it is always a valid string even if there was no name.
>
> Note that associating a name with a communicator has no effect on the semantics of an MPI program, and will (necessarily) increase the store requirement of the program, since the names must be saved. Therefore there is no requirement that users use these functions to associate names with communicators. However debugging and profiling MPI applications may be made easier if names are associated with communicators, since the debugger or profiler should then be able to present information in a less cryptic manner.

The following functions are used for setting and getting names of datatypes.

![[API/MPI_TYPE_SET_NAME]]

![[API/MPI_TYPE_GET_NAME]]

Named predefined datatypes have the default names of the datatype name.

For example, `MPI_WCHAR` has the default name of MPI_WCHAR.

The following functions are used for setting and getting names of windows.

![[API/MPI_WIN_SET_NAME]]

![[API/MPI_WIN_GET_NAME]]

## Error Classes, Error Codes, and Error Handlers



Users may want to write a layered library on top of an existing MPI implementation, and this library may have its own set of error codes and classes. An example of such a library is an I/O library based on the I/O chapter in MPI-2. For this purpose, functions are needed to:

1.  add a new error class to the ones an MPI implementation already knows.

2.  associate error codes with this error class, so that [[MPI_ERROR_CLASS]] works.

3.  associate strings with these error codes, so that [[MPI_ERROR_STRING]] works.

4.  invoke the error handler associated with a communicator, window, or object.

Several new functions are provided to do this. They are all local. No functions are provided to free error handlers or error classes: it is not expected that an application will generate them in significant numbers.

![[API/MPI_ADD_ERROR_CLASS]]

Creates a new error class and returns the value for it.

> [!tip] Rationale

> To avoid conflicts with existing error codes and classes, the value is set by the implementation and not by the user.

> [!warning] Advice to implementors

> A high quality implementation will return the value for a new `errorclass` in the same deterministic way on all processes.

> [!note] Advice to users

> Since a call to [[MPI_ADD_ERROR_CLASS]] is local, the same `errorclass` may not be returned on all processes that make this call. Thus, it is not safe to assume that registering a new error on a set of processes at the same time will yield the same `errorclass` on all of the processes. However, if an implementation returns the new `errorclass` in a deterministic way, and they are always generated in the same order on the same set of processes (for example, all processes), then the value will be the same. However, even if a deterministic algorithm is used, the value can vary across processes. This can happen, for example, if different but overlapping groups of processes make a series of calls. As a result of these issues, getting the “same” error on multiple processes may not cause the same value of error code to be generated.

The value of MPI_ERR_LASTCODE is not affected by new user-defined error codes and classes. As in MPI-1, it is a constant value. Instead, a predefined attribute key MPI_LASTUSEDCODE is associated with MPI_COMM_WORLD. The attribute value corresponding to this key

is the current maximum error class including the user-defined ones.

This is a local value and may be different on different processes.

The value returned by this key is always greater than or equal to MPI_ERR_LASTCODE.

> [!note] Advice to users

> The value returned by the key MPI_LASTUSEDCODE will not change unless the user calls a function to explicitly add an error class/code. In a multi-threaded environment, the user must take extra care in assuming this value has not changed.
>
> Note that error codes and error classes are not necessarily dense. A user may not assume that each error class below MPI_LASTUSEDCODE is valid.

![[API/MPI_ADD_ERROR_CODE]]

Creates new error code associated with `errorclass` and returns its value in `errorcode`.

> [!tip] Rationale

> To avoid conflicts with existing error codes and classes, the value of the new error code is set by the implementation and not by the user.

> [!warning] Advice to implementors

> A high quality implementation will return the value for a new `errorcode` in the same deterministic way on all processes.

![[API/MPI_ADD_ERROR_STRING]]

Associates an error string with an error code or class. The string must be no more than MPI_MAX_ERROR_STRING characters long. The length of the string is as defined in the calling language.

The length of the string does not include the null terminator in C or C++.

Trailing blanks will be stripped in Fortran.

Calling [[MPI_ADD_ERROR_STRING]] for an `errorcode` that already has a string will replace the old string with the new string. It is erroneous to call [[MPI_ADD_ERROR_STRING]] for an error code or class with a value $`\leq MPI_ERR_LASTCODE`$.

If [[MPI_ERROR_STRING]] is called when no string has been set, it will return a empty string (all spaces in Fortran, `""` in C and C++).

Section [[misc-sec-errhandler]] on page [[misc-sec-errhandler]] describes the methods for creating and associating error handlers with communicators, files, and windows.

![[API/MPI_COMM_CALL_ERRHANDLER]]

This function invokes the error handler assigned to the communicator with the error code supplied. This function returns MPI_SUCCESS in C and C++ and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).

> [!note] Advice to users

> Users should note that the default error handler is MPI_ERRORS_ARE_FATAL. Thus, calling `MPI_COMM_CALL_ERRHANDLER` will abort the `comm` processes if the default error handler has not been changed for this communicator or on the parent before the communicator was created.

![[API/MPI_WIN_CALL_ERRHANDLER]]

This function invokes the error handler assigned to the window with the error code supplied. This function returns MPI_SUCCESS in C and C++ and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).

> [!note] Advice to users

> As with communicators, the default error handler for windows is MPI_ERRORS_ARE_FATAL.

![[API/MPI_FILE_CALL_ERRHANDLER]]

This function invokes the error handler assigned to the file with the error code supplied. This function returns MPI_SUCCESS in C and C++ and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).

> [!note] Advice to users

> Unlike errors on communicators and windows, the default behavior for files is to
>
> have [[MPI_ERRORS_RETURN]]

> [!note] Advice to users

> Users are warned that handlers should not be called recursively with [[MPI_COMM_CALL_ERRHANDLER]] , [[MPI_FILE_CALL_ERRHANDLER]] , or [[MPI_WIN_CALL_ERRHANDLER]] . Doing this can create a situation where an infinite recursion is created. This can occur if [[MPI_COMM_CALL_ERRHANDLER]] , [[MPI_FILE_CALL_ERRHANDLER]] , or [[MPI_WIN_CALL_ERRHANDLER]] is called inside an error handler.
>
> Error codes and classes are associated with a process. As a result, they may be used in any error handler. Error handlers should be prepared to deal with any error code it is given. Furthermore, it is good practice to only call an error handler with the appropriate error codes. For example, file errors would normally be sent to the file error handler.

## Decoding a Datatype



MPI-1 provides datatype objects, which allow users to specify an arbitrary layout of data in memory. The layout information, once put in a datatype, could not be decoded from the datatype. There are several cases, however, where accessing the layout information in opaque datatype objects would be useful.

The two functions in this section are used together to decode datatypes to recreate the calling sequence used in their initial definition. These can be used to allow a user to determine the type map and type signature of a datatype.

![[API/MPI_TYPE_GET_ENVELOPE]]

For the given `datatype`, [[MPI_TYPE_GET_ENVELOPE]] returns information on the number and type of input arguments used in the call that created the `datatype`. The number-of-arguments values returned can be used to provide sufficiently large arrays in the decoding routine [[MPI_TYPE_GET_CONTENTS]] . This call and the meaning of the

returned values is described below. The `combiner` reflects

the MPI datatype constructor call that was used in creating `datatype`.

> [!tip] Rationale

> By requiring that the `combiner` reflect the constructor used in the creation of the `datatype`, the decoded information can be used to effectively recreate the calling sequence used in the original creation. One call is effectively the same as another when the information obtained from [[MPI_TYPE_GET_CONTENTS]] may be used with either to produce the same outcome. C calls [[MPI_Type_hindexed]] and [[MPI_Type_create_hindexed]] are always effectively the same while the Fortran call [[MPI_TYPE_HINDEXED]] will be different than either of these in some MPI implementations.
>
> This is the most useful information and
>
> was felt to be reasonable even though it constrains implementations to remember the original constructor sequence even if the internal representation is different.
>
> The decoded information keeps track of datatype duplications. This is important as one needs to distinguish between a predefined datatype and a dup of a predefined datatype. The former is a constant object that cannot be freed, while the latter is a derived datatype that can be freed.

The list below has the values that can be returned in `combiner` on the left and the call associated with them on the right.

a named predefined datatype

[[MPI_TYPE_DUP]]

[[MPI_TYPE_CONTIGUOUS]]

[[MPI_TYPE_VECTOR]]

[[MPI_TYPE_HVECTOR]] from Fortran

[[MPI_TYPE_HVECTOR]] from C or C++

and in some case Fortran

or [[MPI_TYPE_CREATE_HVECTOR]]

[[MPI_TYPE_INDEXED]]

[[MPI_TYPE_HINDEXED]] from Fortran

[[MPI_TYPE_HINDEXED]] from C or C++

and in some case Fortran

or [[MPI_TYPE_CREATE_HINDEXED]]

[[MPI_TYPE_CREATE_INDEXED_BLOCK]]

[[MPI_TYPE_STRUCT]] from Fortran

[[MPI_TYPE_STRUCT]] from C or C++

and in some case Fortran

or [[MPI_TYPE_CREATE_STRUCT]]

[[MPI_TYPE_CREATE_SUBARRAY]]

[[MPI_TYPE_CREATE_DARRAY]]

[[MPI_TYPE_CREATE_F90_REAL]]

[[MPI_TYPE_CREATE_F90_COMPLEX]]

[[MPI_TYPE_CREATE_F90_INTEGER]]

[[MPI_TYPE_CREATE_RESIZED]]

If `combiner` is MPI_COMBINER_NAMED then `datatype` is a named predefined datatype.

For calls with address arguments, we sometimes need to differentiate whether the call used an integer or an address size argument. For example, there are two combiners for hvector: MPI_COMBINER_HVECTOR_INTEGER and MPI_COMBINER_HVECTOR. The former is used if it was the MPI-1 call from Fortran, and the latter is used if it was the MPI-1 call from C or C++. However, on systems where MPI_ADDRESS_KIND = MPI_INTEGER_KIND (i.e., where integer arguments and address size arguments are the same), the combiner MPI_COMBINER_HVECTOR may be returned for a datatype constructed by a call to [[MPI_TYPE_HVECTOR]] from Fortran. Similarly, MPI_COMBINER_HINDEXED may be returned for a datatype constructed by a call to [[MPI_TYPE_HINDEXED]] from Fortran, and MPI_COMBINER_STRUCT may be returned for a datatype constructed by a call to [[MPI_TYPE_STRUCT]] from Fortran. On such systems, one need not differentiate constructors that take address size arguments from constructors that take integer arguments, since these are the same. The new MPI-2 calls all use address sized arguments.

> [!tip] Rationale

> For recreating the original call, it is important to know if address information may have been truncated. The MPI-1 calls from Fortran for a few routines could be subject to truncation in the case where the default `INTEGER` size is smaller than the size of an address.

The actual arguments used in the creation call for a `datatype` can be obtained from the call:

![[API/MPI_TYPE_GET_CONTENTS]]

`datatype` must be a predefined unnamed or a derived datatype; the call is erroneous if `datatype` is a predefined named datatype.

The values given for `max_integers`, `max_addresses`, and `max_datatypes` must be at least as large as the value returned in `num_integers`, `num_addresses`, and `num_datatypes`, respectively, in the call [[MPI_TYPE_GET_ENVELOPE]] for the same `datatype` argument.

> [!tip] Rationale

> The arguments `max_integers`, `max_addresses`, and `max_datatypes` allow for error checking in the call. This is analogous to the topology calls in MPI-1.

The datatypes returned in `array_of_datatypes` are handles to datatype objects that are equivalent to the datatypes used in the original construction call. If these were derived datatypes, then the returned datatypes are new datatype objects, and the user is responsible for freeing these datatypes with [[MPI_TYPE_FREE]] . If these were predefined datatypes, then the returned datatype is equal to that (constant) predefined datatype and cannot be freed.

The committed state of returned derived datatypes is undefined, i.e., the datatypes may or may not be committed. Furthermore, the content of attributes of returned datatypes is undefined.

Note that [[MPI_TYPE_GET_CONTENTS]] can be invoked with a `datatype` argument that was constructed using [[MPI_TYPE_CREATE_F90_REAL]] , [[MPI_TYPE_CREATE_F90_INTEGER]] , or [[MPI_TYPE_CREATE_F90_COMPLEX]] (an unnamed predefined datatype). In such a case, an empty `array_of_datatypes` is returned.

> [!tip] Rationale

> The definition of datatype equivalence implies that equivalent predefined datatypes are equal. By requiring the same handle for named predefined datatypes, it is possible to use the `==` or `.EQ.` comparison operator to determine the datatype involved.

> [!warning] Advice to implementors

> The datatypes returned in `array_of_datatypes` must appear to the user as if each is an equivalent copy of the datatype used in the type constructor call.
>
> Whether this is done by creating a new datatype or via another mechanism such as a reference count mechanism is up to the implementation as long as the semantics are preserved.

> [!tip] Rationale

> The committed state and attributes of the returned datatype is deliberately left vague. The datatype used in the original construction may have been modified since its use in the constructor call. Attributes can be added, removed, or modified as well as having the datatype committed. The semantics given allow for a reference count implementation without having to track these changes.

In the MPI-1 datatype constructor calls, the address arguments in Fortran are of type `INTEGER`. In the new MPI-2 calls, the address arguments are of type `INTEGER(KIND=MPI_ADDRESS_KIND)`. The call [[MPI_TYPE_GET_CONTENTS]] returns all addresses in an argument of type `INTEGER(KIND=MPI_ADDRESS_KIND)`. This is true even if the old MPI-1 calls were used. Thus, the location of values returned can be thought of as being returned by the C bindings. It can also be determined by examining the new MPI-2 calls for datatype constructors for the deprecated MPI-1 calls that involve addresses.

> [!tip] Rationale

> By having all address arguments returned in the `array_of_addresses` argument, the result from a C and Fortran decoding of a `datatype` gives the result in the same argument. It is assumed that an integer of type `INTEGER(KIND=MPI_ADDRESS_KIND)` will be at least as large as the `INTEGER` argument used in datatype construction with the old MPI-1 calls so no loss of information will occur.

The following defines what values are placed in each entry of the returned arrays depending on the datatype constructor used for `datatype`. It also specifies the size of the arrays needed which is the values returned by [[MPI_TYPE_GET_ENVELOPE]] . In Fortran, the following calls were made:

          PARAMETER (LARGE = 1000)
          INTEGER TYPE, NI, NA, ND, COMBINER, I(LARGE), D(LARGE), IERROR
          INTEGER(KIND=MPI_ADDRESS_KIND) A(LARGE)
    !     CONSTRUCT DATATYPE TYPE (NOT SHOWN)
          CALL MPI_TYPE_GET_ENVELOPE(TYPE, NI, NA, ND, COMBINER, IERROR)
          IF ((NI .GT. LARGE) .OR. (NA .GT. LARGE) .OR. (ND .GT. LARGE)) THEN
            WRITE (*, *) "NI, NA, OR ND = ", NI, NA, ND, &
            " RETURNED BY MPI_TYPE_GET_ENVELOPE IS LARGER THAN LARGE = ", LARGE
            CALL MPI_ABORT(MPI_COMM_WORLD, 99)
          ENDIF
          CALL MPI_TYPE_GET_CONTENTS(TYPE, NI, NA, ND, I, A, D, IERROR)

or in C the analogous calls of:

    #define LARGE 1000
    int ni, na, nd, combiner, i[LARGE];
    MPI_Aint a[LARGE];
    MPI_Datatype type, d[LARGE];
    /* construct datatype type (not shown) */
    MPI_Type_get_envelope(type, &ni, &na, &nd, &combiner);
    if ((ni > LARGE) || (na > LARGE) || (nd > LARGE)) {
      fprintf(stderr, "ni, na, or nd = %d %d %d returned by ", ni, na, nd);
      fprintf(stderr, "MPI_Type_get_envelope is larger than LARGE = %d\n", 
              LARGE);
      MPI_Abort(MPI_COMM_WORLD, 99);
    };
    MPI_Type_get_contents(type, ni, na, nd, i, a, d);

The C++ code is in analogy to the C code above with the same values returned.

In the descriptions that follow, the lower case name

of arguments

is used.

If combiner is MPI_COMBINER_NAMED then it is erroneous to call [[MPI_TYPE_GET_CONTENTS]] .

If combiner is MPI_COMBINER_DUP then

| Constructor argument | C & C++ location | Fortran location |
|:---------------------|:----------------:|:----------------:|
| oldtype              |      d\[0\]      |       D(1)       |

and ni = 0, na = 0, nd = 1.

If combiner is MPI_COMBINER_CONTIGUOUS then

| Constructor argument | C & C++ location | Fortran location |
|:---------------------|:----------------:|:----------------:|
| count                |      i\[0\]      |       I(1)       |
| oldtype              |      d\[0\]      |       D(1)       |

and ni = 1, na = 0, nd = 1.

If combiner is MPI_COMBINER_VECTOR then

| Constructor argument | C & C++ location | Fortran location |
|:---------------------|:----------------:|:----------------:|
| count                |      i\[0\]      |       I(1)       |
| blocklength          |      i\[1\]      |       I(2)       |
| stride               |      i\[2\]      |       I(3)       |
| oldtype              |      d\[0\]      |       D(1)       |

and ni = 3, na = 0, nd = 1.

If combiner is MPI_COMBINER_HVECTOR_INTEGER or MPI_COMBINER_HVECTOR then

| Constructor argument | C & C++ location | Fortran location |
|:---------------------|:----------------:|:----------------:|
| count                |      i\[0\]      |       I(1)       |
| blocklength          |      i\[1\]      |       I(2)       |
| stride               |      a\[0\]      |       A(1)       |
| oldtype              |      d\[0\]      |       D(1)       |

and ni = 2, na = 1, nd = 1.

If combiner is MPI_COMBINER_INDEXED then

| Constructor argument | C & C++ location | Fortran location |
|:---|:--:|:--:|
| count | i\[0\] | I(1) |
| array_of_blocklengths | i\[1\] to i\[i\[0\]\] | I(2) to I(I(1)+1) |
| array_of_displacements | i\[i\[0\]+1\] to i\[2\*i\[0\]\] | I(I(1)+2) to I(2\*I(1)+1) |
| oldtype | d\[0\] | D(1) |

and ni = 2\*count+1, na = 0, nd = 1.

If combiner is MPI_COMBINER_HINDEXED_INTEGER or MPI_COMBINER_HINDEXED then

| Constructor argument   |    C & C++ location     | Fortran location  |
|:-----------------------|:-----------------------:|:-----------------:|
| count                  |         i\[0\]          |       I(1)        |
| array_of_blocklengths  |  i\[1\] to i\[i\[0\]\]  | I(2) to I(I(1)+1) |
| array_of_displacements | a\[0\] to a\[i\[0\]-1\] |  A(1) to A(I(1))  |
| oldtype                |         d\[0\]          |       D(1)        |

and ni = count+1, na = count, nd = 1.

If combiner is MPI_COMBINER_INDEXED_BLOCK then

| Constructor argument   |    C & C++ location     | Fortran location  |
|:-----------------------|:-----------------------:|:-----------------:|
| count                  |         i\[0\]          |       I(1)        |
| blocklength            |         i\[1\]          |       I(2)        |
| array_of_displacements | i\[2\] to i\[i\[0\]+1\] | I(3) to I(I(1)+2) |
| oldtype                |         d\[0\]          |       D(1)        |

and ni = count+2, na = 0, nd = 1.

If combiner is MPI_COMBINER_STRUCT_INTEGER or MPI_COMBINER_STRUCT then

| Constructor argument   |    C & C++ location     | Fortran location  |
|:-----------------------|:-----------------------:|:-----------------:|
| count                  |         i\[0\]          |       I(1)        |
| array_of_blocklengths  |  i\[1\] to i\[i\[0\]\]  | I(2) to I(I(1)+1) |
| array_of_displacements | a\[0\] to a\[i\[0\]-1\] |  A(1) to A(I(1))  |
| array_of_types         | d\[0\] to d\[i\[0\]-1\] |  D(1) to D(I(1))  |

and ni = count+1, na = count, nd = count.

If combiner is MPI_COMBINER_SUBARRAY then

| Constructor argument | C & C++ location | Fortran location |
|:---|:--:|:--:|
| ndims | i\[0\] | I(1) |
| array_of_sizes | i\[1\] to i\[i\[0\]\] | I(2) to I(I(1)+1) |
| array_of_subsizes | i\[i\[0\]+1\] to i\[2\*i\[0\]\] | I(I(1)+2) to I(2\*I(1)+1) |
| array_of_starts | i\[2\*i\[0\]+1\] to i\[3\*i\[0\]\] | I(2\*I(1)+2) to I(3\*I(1)+1) |
| order | i\[3\*i\[0\]+1\] | I(3\*I(1)+2\] |
| oldtype | d\[0\] | D(1) |

and ni = 3\*ndims+2, na = 0, nd = 1.

If combiner is MPI_COMBINER_DARRAY then

| Constructor argument | C & C++ location | Fortran location |
|:---|:--:|:--:|
| size | i\[0\] | I(1) |
| rank | i\[1\] | I(2) |
| ndims | i\[2\] | I(3) |
| array_of_gsizes | i\[3\] to i\[i\[2\]+2\] | I(4) to I(I(3)+3) |
| array_of_distribs | i\[i\[2\]+3\] to i\[2\*i\[2\]+2\] | I(I(3)+4) to I(2\*I(3)+3) |
| array_of_dargs | i\[2\*i\[2\]+3\] to i\[3\*i\[2\]+2\] | I(2\*I(3)+4) to I(3\*I(3)+3) |
| array_of_psizes | i\[3\*i\[2\]+3\] to i\[4\*i\[2\]+2\] | I(3\*I(3)+4) to I(4\*I(3)+3) |
| order | i\[4\*i\[2\]+3\] | I(4\*I(3)+4) |
| oldtype | d\[0\] | D(1) |

and ni = 4\*ndims+4, na = 0, nd = 1.

If combiner is MPI_COMBINER_F90_REAL then

| Constructor argument | C & C++ location | Fortran location |
|:---------------------|:----------------:|:----------------:|
| p                    |      i\[0\]      |       I(1)       |
| r                    |      i\[1\]      |       I(2)       |

and ni = 2, na = 0, nd = 0.

If combiner is MPI_COMBINER_F90_COMPLEX then

| Constructor argument | C & C++ location | Fortran location |
|:---------------------|:----------------:|:----------------:|
| p                    |      i\[0\]      |       I(1)       |
| r                    |      i\[1\]      |       I(2)       |

and ni = 2, na = 0, nd = 0.

If combiner is MPI_COMBINER_F90_INTEGER then

| Constructor argument | C & C++ location | Fortran location |
|:---------------------|:----------------:|:----------------:|
| r                    |      i\[0\]      |       I(1)       |

and ni = 1, na = 0, nd = 0.

If combiner is MPI_COMBINER_RESIZED then

| Constructor argument | C & C++ location | Fortran location |
|:---------------------|:----------------:|:----------------:|
| lb                   |      a\[0\]      |       A(1)       |
| extent               |      a\[1\]      |       A(2)       |
| oldtype              |      d\[0\]      |       D(1)       |

and ni = 0, na = 2, nd = 1.

This example shows how a datatype can be decoded. The routine printdatatype prints out the elements of the datatype. Note the use of [[MPI_Type_free]] for datatypes that are not predefined.

    /*
      Example of decoding a datatype. 

      Returns 0 if the datatype is predefined, 1 otherwise
     */
    #include <stdio.h>
    #include <stdlib.h>
    #include "mpi.h"
    int printdatatype( MPI_Datatype datatype ) 
    {
        int *array_of_ints;
        MPI_Aint *array_of_adds;
        MPI_Datatype *array_of_dtypes;
        int num_ints, num_adds, num_dtypes, combiner;
        int i;

        MPI_Type_get_envelope( datatype, 
                               &num_ints, &num_adds, &num_dtypes, &combiner );
        switch (combiner) {
        case MPI_COMBINER_NAMED:
            printf( "Datatype is named:" );
            /* To print the specific type, we can match against the
               predefined forms. We can NOT use a switch statement here 
               We could also use MPI_TYPE_GET_NAME if we prefered to use
               names that the user may have changed.
             */
            if      (datatype == MPI_INT)    printf( "MPI_INT\n" );
            else if (datatype == MPI_DOUBLE) printf( "MPI_DOUBLE\n" );
            ... else test for other types ...
            return 0;
            break;
        case MPI_COMBINER_STRUCT:
        case MPI_COMBINER_STRUCT_INTEGER:
            printf( "Datatype is struct containing" );
            array_of_ints   = (int *)malloc( num_ints * sizeof(int) );
            array_of_adds   = 
                       (MPI_Aint *) malloc( num_adds * sizeof(MPI_Aint) );
            array_of_dtypes = (MPI_Datatype *)
                malloc( num_dtypes * sizeof(MPI_Datatype) );
            MPI_Type_get_contents( datatype, num_ints, num_adds, num_dtypes,
                             array_of_ints, array_of_adds, array_of_dtypes );
            printf( " %d datatypes:\n", array_of_ints[0] );
            for (i=0; i<array_of_ints[0]; i++) {
                printf( "blocklength %d, displacement %ld, type:\n", 
                        array_of_ints[i+1], array_of_adds[i] );
                if (printdatatype( array_of_dtypes[i] )) {
                    /* Note that we free the type ONLY if it 
                       is not predefined */
                    MPI_Type_free( &array_of_dtypes[i] );
                }
            }
            free( array_of_ints );
            free( array_of_adds );
            free( array_of_dtypes );
            break;
            ... other combiner values ...
        default:
            printf( "Unrecognized combiner type\n" );
        }
        return 1;
    }

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

1.  All MPI calls are *thread-safe*. I.e., two concurrently running threads may make MPI calls and the outcome will be as if the calls executed in some order, even if their execution is interleaved.

2.  Blocking MPI calls will block the calling thread only, allowing another thread to execute, if available. The calling thread will be blocked until the event on which it is waiting occurs. Once the blocked communication is enabled and can proceed, then the call will complete and the thread will be marked runnable, within a finite time. A blocked thread will not prevent progress of other runnable threads on the same process, and will not prevent them from executing MPI calls.

Process 0 consists of two threads. The first thread executes a blocking send call [[MPI_Send]] , whereas the second thread executes a blocking receive call [[MPI_Recv]] . I.e., the first thread sends a message that is received by the second thread. This communication should always succeed. According to the first requirement, the execution will correspond to some interleaving of the two calls. According to the second requirement, a call can only block the calling thread and cannot prevent progress of the other thread. If the send call went ahead of the receive call, then the sending thread may block, but this will not prevent the receiving thread from executing. Thus, the receive call will occur. Once both calls occur, the communication is enabled and both calls will complete. On the other hand, a single-threaded process that posts a send, followed by a matching receive, may deadlock. The progress requirement for multithreaded implementations is stronger, as a blocked call cannot prevent progress in other threads.

> [!warning] Advice to implementors

> MPI calls can be made thread-safe by executing only one at a time, e.g., by protecting MPI code with one process-global lock. However, blocked operations cannot hold the lock, as this would prevent progress of other threads in the process. The lock is held only for the duration of an atomic, locally-completing suboperation such as posting a send or completing a send, and is released in between. Finer locks can provide more concurrency, at the expense of higher locking overheads. Concurrency can also be achieved by having some of the MPI protocol executed by separate server threads.

### Clarifications

##### Initialization and Completion

The call to [[MPI_FINALIZE]] should occur on the same thread that initialized MPI. We call this thread the **main thread**. The call should occur only after all the process threads have completed their MPI calls, and have no pending communications or I/O operations.

> [!tip] Rationale

> This constraint simplifies implementation.

##### Multiple threads completing the same request.

A program where two threads block, waiting on the same request, is erroneous. Similarly, the same request cannot appear in the array of requests of two concurrent `MPI_WAIT{ANY$`|`$SOME$`|`$ALL}` calls. In MPI, a request can only be completed once. Any combination of wait or test which violates this rule is erroneous.

> [!tip] Rationale

> This is consistent with the view that a multithreaded execution corresponds to an interleaving of the MPI calls. In a single threaded implementation, once a wait is posted on a request the request handle will be nullified before it is possible to post a second wait on the same handle. With threads, an `MPI_WAIT{ANY$`|`$SOME$`|`$ALL}` may be blocked without having nullified its request(s) so it becomes the user’s responsibility to avoid using the same request in an [[MPI_WAIT]] on another thread. This constraint also simplifies implementation, as only one thread will be blocked on any communication or I/O event.

##### Probe

A receive call that uses source and tag values returned by a preceding call to [[MPI_PROBE]] or [[MPI_IPROBE]] will receive the message matched by the probe call only if there was no other matching receive after the probe and before that receive. In a multithreaded environment, it is up to the user to enforce this condition using suitable mutual exclusion logic. This can be enforced by making sure that each communicator is used by only one thread on each process.

##### Collective calls

Matching of collective calls on a

communicator, window, or file handle is done according to the order in which the calls are issued

at each process. If concurrent threads issue such calls on the same communicator, window or file handle, it is up to the user to make sure the calls are correctly ordered, using interthread synchronization.

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
> This is as with [[MPI_INIT]] as discussed in Section [[misc#Passing NULL to MPIInit|Passing NULL to MPIInit]] .

This call initializes MPI in the same way that a call to [[MPI_INIT]] would. In addition, it initializes the thread environment. The argument `required`

is used to specify the desired level of thread support.

The possible values are listed in increasing order of thread support.

MPI_THREAD_SINGLE  
Only one thread will execute.

MPI_THREAD_FUNNELED  
The process may be multi-threaded, but only the main thread will make MPI calls (all MPI calls are “funneled” to the main thread).

MPI_THREAD_SERIALIZED  
The process may be multi-threaded, and multiple threads may make MPI calls, but only one at a time: MPI calls are not made concurrently from two distinct threads (all MPI calls are “serialized”).

MPI_THREAD_MULTIPLE  
Multiple threads may call MPI, with no restrictions.

These values are monotonic; i.e., MPI_THREAD_SINGLE $`<`$ MPI_THREAD_FUNNELED $`<`$ MPI_THREAD_SERIALIZED $`<`$ MPI_THREAD_MULTIPLE.

Different processes in MPI_COMM_WORLD may require different levels of thread support.

The call returns in `provided` information about the actual level of thread support that will be provided by MPI. It can be one of the four values listed above.

The level(s) of thread support that can be provided by [[MPI_INIT_THREAD]] will depend on the implementation, and may depend on information provided by the user before the program started to execute (e.g., with arguments to [[mpiexec]] ). If possible, the call will return `provided = required`. Failing this, the call will return the least supported level such that `provided `$`>`$` required` (thus providing a stronger level of support than required by the user). Finally, if the user requirement cannot be satisfied, then the call will return in `provided` the highest supported level.

A **thread compliant** MPI implementation will be able to return `provided`

`= MPI_THREAD_MULTIPLE`. Such an implementation may always return `provided`

`= MPI_THREAD_MULTIPLE`, irrespective of the value of `required`. At the other extreme, an MPI library that is not thread compliant may always return `provided = MPI_THREAD_SINGLE`, irrespective of the value of `required`.

A call to [[MPI_INIT]] has the same effect as a call to [[MPI_INIT_THREAD]] with a `required = MPI_THREAD_SINGLE`.

Vendors may provide (implementation dependent) means to specify the level(s) of thread support available when the MPI program is started, e.g., with arguments to [[mpiexec]] . This will affect the outcome of calls to [[MPI_INIT]] and `MPI_INIT_THREAD`. Suppose, for example, that an MPI program has been started so that only MPI_THREAD_MULTIPLE is available. Then [[MPI_INIT_THREAD]] will return `provided = MPI_THREAD_MULTIPLE`, irrespective of the value of `required`; a call to [[MPI_INIT]] will also initialize the MPI thread support level to MPI_THREAD_MULTIPLE. Suppose, on the other hand, that an MPI program has been started so that all four levels of thread support are available. Then, a call to [[MPI_INIT_THREAD]] will return `provided = required`; on the other hand, a call to [[MPI_INIT]] will initialize the MPI thread support level to MPI_THREAD_SINGLE.

> [!tip] Rationale

> Various optimizations are possible when MPI code is executed single-threaded, or is executed on multiple threads, but not concurrently: mutual exclusion code may be omitted. Furthermore, if only one thread executes, then the MPI library can use library functions that are not thread safe, without risking conflicts with user threads. Also, the model of one communication thread, multiple computation threads fits well many applications. E.g., if the process code is a sequential Fortran/C/C++ program with MPI calls that has been parallelized by a compiler for execution on an SMP node, in a cluster of SMPs, then the process computation is multi-threaded, but MPI calls will likely execute on a single thread.
>
> The design accommodates a static specification of the thread support level, for environments that require static binding of libraries, and for compatibility for current multi-threaded MPI codes.

> [!warning] Advice to implementors

> If `provided` is not MPI_THREAD_SINGLE then the MPI library should not
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
> The level of thread support provided is a global property of the MPI process that can be specified only once, when MPI is initialized on that process (or before). Portable third party libraries have to be written so as to accommodate any provided level of thread support. Otherwise, their usage will be restricted to specific level(s) of thread support. If such a library can run only with specific level(s) of thread support, e.g., only with MPI_THREAD_MULTIPLE, then [[MPI_QUERY_THREAD]] can be used to check whether the user initialized MPI to the correct level of thread support and, if not, raise an exception.

## New Attribute Caching Functions



Caching on communicators has been a very useful feature. In MPI-2 it is expanded to include caching on windows and datatypes.

> [!tip] Rationale

> In one extreme you can allow caching on all opaque handles. The other extreme is to only allow it on communicators. Caching has a cost associated with it and should only be allowed when it is clearly needed and the increased cost is modest. This is the reason that windows and datatypes were added but not other handles.

One difficulty in MPI-1 is the potential for size differences between Fortran integers and C pointers. To overcome this problem with attribute caching on communicators, new functions are also given for this case. The new functions to cache on datatypes and windows also address this issue. For a general discussion of the address size problem, see Section [[misc#Addresses|Addresses]] .

The MPI-1.2 clarification, described in Section [[misc-1.2#Clarification of Error Behavior of Attribute Callback Functions|Clarification of Error Behavior of Attribute Callback Functions]] on page [[misc-1.2#Clarification of Error Behavior of Attribute Callback Functions|Clarification of Error Behavior of Attribute Callback Functions]] , about the effect of returning other than MPI_SUCCESS from attribute callbacks applies to these new versions as well.

### Communicators

The new functions that are replacements for the MPI-1 functions for caching on communicators are:

![[API/MPI_COMM_CREATE_KEYVAL]]

This function replaces [[MPI_KEYVAL_CREATE]] ,

whose use is deprecated.

The C binding is identical. The Fortran binding differs in that `extra_state` is an address-sized integer. Also, the copy and delete callback functions have Fortran bindings that are consistent with address-sized attributes.

The argument `comm_copy_attr_fn` may be specified as

[[MPI_COMM_NULL_COPY_FN]] or [[MPI_COMM_DUP_FN]] from either C, C++, or Fortran. [[MPI_COMM_NULL_COPY_FN]] is a function that does nothing other than returning `flag = 0` and MPI_SUCCESS. [[MPI_COMM_DUP_FN]] is a simple-minded copy function that sets `flag = 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns MPI_SUCCESS. These replace the MPI-1 predefined callbacks [[MPI_NULL_COPY_FN]] and [[MPI_DUP_FN]] , whose use is deprecated.

The argument `comm_delete_attr_fn` may be specified as

[[MPI_COMM_NULL_DELETE_FN]] from either C, C++, or Fortran. [[MPI_COMM_NULL_DELETE_FN]] is a function that does nothing, other than returning MPI_SUCCESS. [[MPI_COMM_NULL_DELETE_FN]] replaces [[MPI_NULL_DELETE_FN]] , whose use is deprecated.

The C callback functions are:

and

which are the same as the MPI-1.1 calls but with a new name.

The old names are deprecated.

The Fortran callback functions are:

and

The C++ callbacks are:

and

![[API/MPI_COMM_FREE_KEYVAL]]

This call is identical to the MPI-1 call [[MPI_KEYVAL_FREE]] but is needed to match the new communicator-specific creation function.

The use of [[MPI_KEYVAL_FREE]] is deprecated.

![[API/MPI_COMM_SET_ATTR]]

This function replaces [[MPI_ATTR_PUT]] ,

whose use is deprecated.

The C binding is identical. The Fortran binding differs in that `attribute_val` is an address-sized integer.

![[API/MPI_COMM_GET_ATTR]]

This function replaces [[MPI_ATTR_GET]] ,

whose use is deprecated.

The C binding is identical. The Fortran binding differs in that `attribute_val` is an address-sized integer.

![[API/MPI_COMM_DELETE_ATTR]]

This function is the same as [[MPI_ATTR_DELETE]] but is needed to match the new communicator specific functions.

The use of [[MPI_ATTR_DELETE]] is deprecated.

### Windows

The new functions for caching on windows are:

![[API/MPI_WIN_CREATE_KEYVAL]]

The argument `win_copy_attr_fn` may be specified as

[[MPI_WIN_NULL_COPY_FN]] or [[MPI_WIN_DUP_FN]] from either C, C++, or Fortran. [[MPI_WIN_NULL_COPY_FN]] is a function that does nothing other than returning `flag = 0` and MPI_SUCCESS. [[MPI_WIN_DUP_FN]] is a simple-minded copy function that sets `flag = 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns MPI_SUCCESS.

The argument `win_delete_attr_fn` may be specified as

[[MPI_WIN_NULL_DELETE_FN]] from either C, C++, or Fortran. [[MPI_WIN_NULL_DELETE_FN]] is a function that does nothing, other than returning MPI_SUCCESS.

The C callback functions are:

and

The Fortran callback functions are:

and

The C++ callbacks are:

and

![[API/MPI_WIN_FREE_KEYVAL]]

![[API/MPI_WIN_SET_ATTR]]

![[API/MPI_WIN_GET_ATTR]]

![[API/MPI_WIN_DELETE_ATTR]]

### Datatypes

The new functions for caching on datatypes are:

![[API/MPI_TYPE_CREATE_KEYVAL]]

The argument `type_copy_attr_fn` may be specified as

[[MPI_TYPE_NULL_COPY_FN]] or [[MPI_TYPE_DUP_FN]] from either C, C++, or Fortran. [[MPI_TYPE_NULL_COPY_FN]] is a function that does nothing other than returning `flag = 0` and MPI_SUCCESS. [[MPI_TYPE_DUP_FN]] is a simple-minded copy function that sets `flag = 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns MPI_SUCCESS.

The argument `type_delete_attr_fn` may be specified as

[[MPI_TYPE_NULL_DELETE_FN]] from either C, C++, or Fortran. [[MPI_TYPE_NULL_DELETE_FN]] is a function that does nothing, other than returning MPI_SUCCESS.

The C callback functions are:

and

The Fortran callback functions are:

and

The C++ callbacks are:

and

![[API/MPI_TYPE_FREE_KEYVAL]]

![[API/MPI_TYPE_SET_ATTR]]

![[API/MPI_TYPE_GET_ATTR]]

![[API/MPI_TYPE_DELETE_ATTR]]

## Duplicating a Datatype



![[API/MPI_TYPE_DUP]]

`MPI_TYPE_DUP` is a new type constructor which duplicates the existing `type` with associated key values.

For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new datatype. Returns in `newtype` a new datatype with exactly the same properties as `type` and any copied cached information. The new datatype has identical upper bound and lower bound and yields the same net result when fully decoded with the functions in Section [[ei#Decoding a Datatype|Decoding a Datatype]] . The

`newtype` has the same committed state as the old `type`.
