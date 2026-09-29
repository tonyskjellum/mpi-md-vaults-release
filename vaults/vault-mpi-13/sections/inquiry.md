# MPI Environmental Management



This chapter discusses routines for getting and, where appropriate, setting various parameters that relate to the MPI implementation and the execution environment (such as error handling). The procedures for entering and leaving the MPI execution environment are also described here.

## Implementation information



### Version Inquiries



In order to cope with changes to the MPI Standard, there are both compile-time and run-time ways to determine which version of the standard is in use in the environment one is using.

The “version” will be represented by two separate integers, for the version and subversion: In C and C++,

        #define MPI_VERSION    1
        #define MPI_SUBVERSION 2

in Fortran,

        INTEGER MPI_VERSION, MPI_SUBVERSION
        PARAMETER (MPI_VERSION    = 1)
        PARAMETER (MPI_SUBVERSION = 2)

For runtime determination,

![[API/MPI_GET_VERSION]]

[[MPI_GET_VERSION]] is one of the few functions that can be called before [[MPI_INIT]] and after [[MPI_FINALIZE]] .

### Environmental Inquiries



A set of attributes that describe the execution environment are attached to the communicator MPI_COMM_WORLD when MPI is initialized. The value of these attributes can be inquired by using the function [[MPI_ATTR_GET]] described in Chapter [[context#Groups, Contexts, and Communicators|Groups, Contexts, and Communicators]] . It is erroneous to delete these attributes,

free their keys, or change their values.

The list of predefined attribute keys include

MPI_TAG_UB  
Upper bound for tag value.

MPI_HOST  
Host process rank, if such exists, MPI_PROC_NULL, otherwise.

MPI_IO  
rank of a node that has regular I/O facilities (possibly myrank). Nodes in the same communicator may return different values for this parameter.

MPI_WTIME_IS_GLOBAL  
Boolean variable that indicates whether clocks are synchronized.

Vendors may add implementation specific parameters (such as node number, real memory size, virtual memory size, etc.)

These predefined attributes do not change value between MPI initialization ( [[MPI_INIT]] and MPI completion ( [[MPI_FINALIZE]] ), and cannot be updated or deleted by users.

> [!note] Advice to users

> Note that in the C binding, the value returned by these attributes is a *pointer* to an `int` containing the requested value.

The required parameter values are discussed in more detail below:

#### Tag values

Tag values range from `0` to the value returned for MPI_TAG_UB inclusive. These values are guaranteed to be unchanging during the execution of an MPI program. In addition, the tag upper bound value must be *at least* 32767. An MPI implementation is free to make the value of MPI_TAG_UB larger than this; for example, the value $`2^{30}-1`$ is also a legal value for MPI_TAG_UB.

The attribute MPI_TAG_UB has the same value on all processes of MPI_COMM_WORLD.

#### Host rank

The value returned for MPI_HOST gets the rank of the `HOST` process in the group associated with communicator MPI_COMM_WORLD, if there is such. MPI_PROC_NULL is returned if there is no host. MPI does not specify what it means for a process to be a `HOST`, nor does it requires that a `HOST` exists.

The attribute MPI_HOST has the same value on all processes of MPI_COMM_WORLD.

#### IO rank

The value returned for MPI_IO is the rank of a processor that can provide language-standard I/O facilities. For Fortran, this means that all of the Fortran I/O operations are supported (e.g., `OPEN`, `REWIND`, `WRITE`). For C, this means that all of the ANSI-C I/O operations are supported (e.g., `fopen`, `fprintf`, `lseek`).

If every process can provide language-standard I/O, then the value MPI_ANY_SOURCE will be returned. Otherwise, if the calling process can provide language-standard I/O, then its rank will be returned. Otherwise, if some process can provide language-standard I/O then the rank of one such process will be returned. The same value need not be returned by all processes. If no process can provide language-standard I/O, then the value MPI_PROC_NULL will be returned.

> [!note] Advice to users

> Note that input is not collective, and this attribute does *not* indicate which process can or does provide input.

#### Clock synchronization

The value returned for MPI_WTIME_IS_GLOBAL is 1 if clocks at all processes in MPI_COMM_WORLD are synchronized, 0 otherwise. A collection of clocks is considered synchronized if explicit effort has been taken to synchronize them. The expectation is that the variation in time, as measured by calls to [[MPI_WTIME]] , will be less then one half the round-trip time for an MPI message of length zero. If time is measured at a process just before a send and at another process just after a matching receive, the second time should be always higher than the first one.

The attribute MPI_WTIME_IS_GLOBAL need not be present when the clocks are not synchronized (however, the attribute key MPI_WTIME_IS_GLOBAL is always valid). This attribute may be associated with communicators other then MPI_COMM_WORLD.

The attribute MPI_WTIME_IS_GLOBAL has the same value on all processes of MPI_COMM_WORLD.

![[API/MPI_GET_PROCESSOR_NAME]]

This routine returns the name of the processor on which it was called at the moment of the call. The name is a character string for maximum flexibility. From this value it must be possible to identify a specific piece of hardware; possible values include “processor 9 in rack 4 of mpp.cs.org” and “231” (where 231 is the actual processor number in the running homogeneous system). The argument `name` must represent storage that is at least MPI_MAX_PROCESSOR_NAME characters long. `MPI_GET_PROCESSOR_NAME` may write up to this many characters into `name`.

The number of characters actually written is returned in the output argument, `resultlen`.

In C, a null character is additionally stored at `name[resultlen]`. The `resultlen` cannot be larger then MPI_MAX_PROCESSOR_NAME-1. In Fortran, name is padded on the right with blank characters. The `resultlen` cannot be larger then MPI_MAX_PROCESSOR_NAME.

> [!tip] Rationale

> This function allows MPI implementations that do process migration to return the current processor. Note that nothing in MPI *requires* or defines process migration; this definition of [[MPI_GET_PROCESSOR_NAME]] simply allows such an implementation.

> [!note] Advice to users

> The user must provide at least MPI_MAX_PROCESSOR_NAME space to write the processor name — processor names can be this long. The user
>
> should examine the output argument, `resultlen`, to determine the actual length of the name.

The constant MPI_BSEND_OVERHEAD provides an upper bound on the fixed overhead per message buffered by a call to [[MPI_BSEND]] (see Section [[pt2pt#Model implementation of buffered mode|Model implementation of buffered mode]] ).

## Error handling



An MPI implementation cannot or may choose not to handle some errors that occur during MPI calls. These can include errors that generate exceptions or traps, such as floating point errors or access violations. The set of errors that are handled by MPI is implementation-dependent. Each such error generates an **MPI exception**.

The above text takes precedence over any text on error handling within this document. Specifically, text that states that errors *will* be handled should be read as *may* be handled.

A user can associate an error handler with a communicator. The specified error handling routine will be used for any MPI exception that occurs during a call to MPI for a communication with this communicator. MPI calls that are not related to any communicator are considered to be attached to the communicator MPI_COMM_WORLD. The attachment of error handlers to communicators is purely local: different processes may attach different error handlers to the same communicator.

A newly created communicator inherits the error handler that is associated with the “parent” communicator. In particular, the user can specify a “global” error handler for all communicators by associating this handler with the communicator MPI_COMM_WORLD immediately after initialization.

Several predefined error handlers are available in MPI:

MPI_ERRORS_ARE_FATAL  
The handler, when called, causes the program to abort on all executing processes. This has the same effect as if [[MPI_ABORT]] was called by the process that invoked the handler.

MPI_ERRORS_RETURN  
The handler has no effect

other than returning the error code to the user.

Implementations may provide additional predefined error handlers and programmers can code their own error handlers.

The error handler MPI_ERRORS_ARE_FATAL is associated by default with MPI_COMM- \_WORLD after initialization. Thus, if the user chooses not to control error handling, every error that MPI handles is treated as fatal. Since (almost) all MPI calls return an error code, a user may choose to handle errors in its main code, by testing the return code of MPI calls and executing a suitable recovery code when the call was not successful. In this case, the error handler MPI_ERRORS_RETURN will be used. Usually it is more convenient and more efficient not to test for errors after each MPI call, and have such error handled by a non trivial MPI error handler.

After an error is detected, the state of MPI is undefined. That is, using a user-defined error handler, or MPI_ERRORS_RETURN, does *not* necessarily allow the user to continue to use MPI after an error is detected. The purpose of these error handlers is to allow a user to issue user-defined error messages and to take actions unrelated to MPI (such as flushing I/O buffers) before a program exits. An MPI implementation is free to allow MPI to continue after an error but is not required to do so.

> [!warning] Advice to implementors

> A good quality implementation will, to the greatest possible extent, circumscribe the impact of an error, so that normal processing can continue after an error handler was invoked. The implementation documentation will provide information on the possible effect of each class of errors.

An MPI error handler is an opaque object, which is accessed by a handle. MPI calls are provided to create new error handlers, to associate error handlers with communicators, and to test which error handler is associated with a communicator.

![[API/MPI_ERRHANDLER_CREATE]]

Register the user routine `function` for use as an MPI exception handler. Returns in `errhandler` a handle to the registered exception handler.

In the C language,

the user routine should be a C function of type MPI_Handler_function, which is defined as:

    typedef void (MPI_Handler_function)(MPI_Comm *, int *, ...);

The first argument is the communicator in use.

The second is the error code to be returned by the MPI routine that raised the error. If the routine would have returned MPI_ERR_IN_STATUS, it is the error code returned in the status for the request that caused the error handler to be invoked.

The remaining arguments are “`stdargs`” arguments whose number and meaning is implementation-dependent. An implementation should clearly document these arguments. Addresses are used so that the handler may be written in Fortran.

In the Fortran language, the user routine should be of the form:

    SUBROUTINE HANDLER_FUNCTION(COMM, ERROR_CODE, .....)
       INTEGER COMM, ERROR_CODE

> [!note] Advice to users

> Users are discouraged from using a Fortran [[HANDLER_FUNCTION]] since the routine expects a variable number of arguments. Some Fortran systems may allow this but some may fail to give the correct result or compile/link this code. Thus, it will not, in general, be possible to create portable code with a Fortran [[HANDLER_FUNCTION]] .

> [!tip] Rationale

> The variable argument list is provided because it provides an ANSI-standard hook for providing additional information to the error handler; without this hook, ANSI C prohibits additional arguments.

![[API/MPI_ERRHANDLER_SET]]

Associates the new error handler `errorhandler` with communicator `comm` at the calling process. Note that an error handler is always associated with the communicator.

![[API/MPI_ERRHANDLER_GET]]

Returns in `errhandler` (a handle to) the error handler that is currently associated with communicator `comm`.

Example: A library function may register at its entry point the current error handler for a communicator, set its own private error handler for this communicator, and restore before exiting the previous error handler.

![[API/MPI_ERRHANDLER_FREE]]

Marks the error handler associated with `errhandler` for deallocation and sets `errhandler` to MPI_ERRHANDLER_NULL. The error handler will be deallocated after all communicators associated with it have been deallocated.

![[API/MPI_ERROR_STRING]]

Returns the error string associated with an error code

or class.

The argument `string` must represent storage that is at least MPI_MAX_ERROR_STRING characters long.

The number of characters actually written is returned in the output argument, `resultlen`.

> [!tip] Rationale

> The form of this function was chosen to make the Fortran and C bindings similar. A version that returns a pointer to a string has two difficulties. First, the return string must be statically allocated and different for each error message (allowing the pointers returned by successive calls to MPI_ERROR_STRING to point to the correct message). Second, in Fortran, a function declared as returning CHARACTER\*(\*) can not be referenced in, for example, a PRINT statement.

## Error codes and classes

The error codes returned by MPI are left entirely to the implementation (with the exception of MPI_SUCCESS). This is done to allow an implementation to provide as much information as possible in the error code (for use with [[MPI_ERROR_STRING]] ).

To make it possible for an application to interpret an error code, the routine [[MPI_ERROR_CLASS]]

converts any error code into one of a small set of standard error codes, called *error classes*. Valid error classes include

|                   |                                     |
|:------------------|:------------------------------------|
| MPI_SUCCESS       | No error                            |
| MPI_ERR_BUFFER    | Invalid buffer pointer              |
| MPI_ERR_COUNT     | Invalid count argument              |
| MPI_ERR_TYPE      | Invalid datatype argument           |
| MPI_ERR_TAG       | Invalid tag argument                |
| MPI_ERR_COMM      | Invalid communicator                |
| MPI_ERR_RANK      | Invalid rank                        |
| MPI_ERR_REQUEST   | Invalid request (handle)            |
| MPI_ERR_ROOT      | Invalid root                        |
| MPI_ERR_GROUP     | Invalid group                       |
| MPI_ERR_OP        | Invalid operation                   |
| MPI_ERR_TOPOLOGY  | Invalid topology                    |
| MPI_ERR_DIMS      | Invalid dimension argument          |
| MPI_ERR_ARG       | Invalid argument of some other kind |
| MPI_ERR_UNKNOWN   | Unknown error                       |
| MPI_ERR_TRUNCATE  | Message truncated on receive        |
| MPI_ERR_OTHER     | Known error not in this list        |
| MPI_ERR_INTERN    | Internal MPI (implementation) error |
| MPI_ERR_IN_STATUS | Error code is in status             |
| MPI_ERR_PENDING   | Pending request                     |
| MPI_ERR_LASTCODE  | Last error code                     |

The error classes are a subset of the error codes: an MPI function may return an error class number; and the function [[MPI_ERROR_STRING]] can be used to compute the error string associated with an error class.

An MPI error class is a valid MPI error code. Specifically, the values defined for MPI error classes are valid MPI error codes.

The error codes satisfy,
``` math
0 = MPI_SUCCESS < MPI_ERR_... \leq MPI_ERR_LASTCODE.
```

> [!tip] Rationale

> The difference between MPI_ERR_UNKNOWN and MPI_ERR_OTHER is that `MPI_ERROR_STRING` can return useful information about MPI_ERR_OTHER.
>
> Note that MPI_SUCCESS $`= 0`$ is necessary to be consistent with C practice; the separation of error classes and error codes allows us to define the error classes this way. Having a known LASTCODE is often a nice sanity check as well.

![[API/MPI_ERROR_CLASS]]

The function [[MPI_ERROR_CLASS]] maps each standard error code (error class) onto itself.

## Timers and synchronization

MPI defines a timer. A timer is specified even though it is not “message-passing,” because timing parallel programs is important in “performance debugging” and because existing timers (both in POSIX 1003.1-1988 and 1003.4D 14.1 and in Fortran 90) are either inconvenient or do not provide adequate access to high-resolution timers.

![[API/MPI_WTIME]]

`MPI_WTIME` returns a floating-point number of seconds, representing elapsed wall-clock time since some time in the past.

The “time in the past” is guaranteed not to change during the life of the process. The user is responsible for converting large numbers of seconds to other units if they are preferred.

This function is portable (it returns seconds, not “ticks”), it allows high-resolution, and carries no unnecessary baggage. One would use it like this:

    {
       double starttime, endtime;
       starttime = MPI_Wtime();
        ....  stuff to be timed  ...
       endtime   = MPI_Wtime();
       printf("That took %f seconds\n",endtime-starttime);
    }

The times returned are local to the node that called them. There is no requirement that different nodes return “the same time.” (But see also the discussion of MPI_WTIME_IS_GLOBAL).

![[API/MPI_WTICK]]

`MPI_WTICK` returns the resolution of [[MPI_WTIME]] in seconds. That is, it returns, as a double precision value, the number of seconds between successive clock ticks. For example, if the clock is implemented by the hardware as a counter that is incremented every millisecond, the value returned by [[MPI_WTICK]] should be $`10^{-3}`$.

## Startup

 One goal of MPI is to achieve *source code portability*. By this we mean that a program written using MPI and complying with the relevant language standards is portable as written, and must not require any source code changes when moved from one system to another. This explicitly does *not* say anything about how an MPI program is started or launched from the command line, nor what the user must do to set up the environment in which an MPI program will run. However, an implementation may require some setup to be performed before other MPI routines may be called. To provide for this, MPI includes an initialization routine [[MPI_INIT]] .

![[API/MPI_INIT]]

This routine must be called before any other MPI routine. It must be called at most once; subsequent calls are erroneous (see [[MPI_INITIALIZED]] ).

All MPI programs must contain a call to [[MPI_INIT]] ; this routine must be called before any other MPI routine (apart from `MPI_INITIALIZED`) is called. The version for ANSI C accepts the argc and argv that are provided by the arguments to `main`:

    int main(argc, argv)
    int argc;
    char **argv;
    {
        MPI_Init(&argc, &argv);

        /* parse arguments */
        /* main program    */

        MPI_Finalize();     /* see below */
    }

The Fortran version takes only IERROR.

An MPI implementation is free to require that the arguments in the C binding must be the arguments to `main`.

> [!tip] Rationale

> The command line arguements are provided *to* [[MPI_Init]] to allow an MPI implementation to use them in initializing the MPI environment. They are passed by reference to allow an MPI implementation to *provide* them in environments where the command-line arguments are not provided to `main`.

![[API/MPI_FINALIZE]]

This routine cleans up all MPI state.

Each process must call [[MPI_FINALIZE]] before it exits. Unless there has been a call to [[MPI_ABORT]] , each process must ensure that all pending non-blocking communications are (locally) complete before calling [[MPI_FINALIZE]] . Further, at the instant at which the last process calls [[MPI_FINALIZE]] , all pending sends must be matched by a receive, and all pending receives must be matched by a send.

For example, the following program is correct:

            Process 0                Process 1
            ---------                ---------
            MPI_Init();              MPI_Init();
            MPI_Send(dest=1);        MPI_Recv(src=0);
            MPI_Finalize();          MPI_Finalize();

Without the matching receive, the program is erroneous:

            Process 0                Process 1
            -----------              -----------
            MPI_Init();              MPI_Init();
            MPI_Send (dest=1);
            MPI_Finalize();          MPI_Finalize();

A successful return from a blocking communication operation or from [[MPI_WAIT]] or [[MPI_TEST]] tells the user that the buffer can be reused and means that the communication is completed by the user, but does not guarantee that the local process has no more work to do. A successful return from [[MPI_REQUEST_FREE]] with a request handle generated by an [[MPI_ISEND]] nullifies the handle but provides no assurance of operation completion. The [[MPI_ISEND]] is complete only when it is known by some means that a matching receive has completed. [[MPI_FINALIZE]] guarantees that all local actions required by communications the user has completed will, in fact, occur before it returns.

[[MPI_FINALIZE]] guarantees nothing about pending communications that have not been completed (completion is assured only by [[MPI_WAIT]] , [[MPI_TEST]] , or [[MPI_REQUEST_FREE]] combined with some other verification of completion).

This program is correct:

    rank 0                          rank 1
    =====================================================
    ...                             ...
    MPI_Isend();                    MPI_Recv();
    MPI_Request_free();             MPI_Barrier();
    MPI_Barrier();                  MPI_Finalize();
    MPI_Finalize();                 exit();
    exit();

This program is erroneous and its behavior is undefined:

    rank 0                          rank 1
    =====================================================
    ...                             ...
    MPI_Isend();                    MPI_Recv();
    MPI_Request_free();             MPI_Finalize();
    MPI_Finalize();                 exit();
    exit();

If no [[MPI_BUFFER_DETACH]] occurs between an [[MPI_BSEND]] (or other buffered send) and [[MPI_FINALIZE]] , the [[MPI_FINALIZE]] implicitly supplies the [[MPI_BUFFER_DETACH]] .

This program is correct, and after the [[MPI_Finalize]] , it is as if the buffer had been detached.

    rank 0                          rank 1
    =====================================================
    ...                             ...
    buffer = malloc(1000000);       MPI_Recv();
    MPI_Buffer_attach();            MPI_Finalize();
    MPI_Bsend();                    exit();
    MPI_Finalize();
    free(buffer);
    exit();

In this example, [[MPI_Iprobe]] must return a `FALSE` flag. [[MPI_Test_cancelled]] must return a `TRUE` flag, independent of the relative order of execution of [[MPI_Cancel]] in process 0 and [[MPI_Finalize]] in process 1. The [[MPI_Iprobe]] call is there to make sure the implementation knows that the “tag1” message exists at the destination, without being able to claim that the user knows about it.

    rank 0                          rank 1
    ========================================================
    MPI_Init();                     MPI_Init();
    MPI_Isend(tag1);
    MPI_Barrier();                  MPI_Barrier();
                                    MPI_Iprobe(tag2);
    MPI_Barrier();                  MPI_Barrier();
                                    MPI_Finalize();
                                    exit();
    MPI_Cancel();
    MPI_Wait();
    MPI_Test_cancelled();
    MPI_Finalize();
    exit();

> [!warning] Advice to implementors

> An implementation may need to delay the return from [[MPI_FINALIZE]] until all potential future message cancellations have been processed. One possible solution is to place a barrier inside [[MPI_FINALIZE]]

Once [[MPI_FINALIZE]] returns, no MPI routine (not even [[MPI_INIT]] ) may be called, except for [[MPI_GET_VERSION]] , [[MPI_INITIALIZED]] , and the MPI-2 function [[MPI_FINALIZED]] . Each process must complete any pending communication it initiated before it calls [[MPI_FINALIZE]] . If the call returns, each process may continue local computations, or exit, without participating in further MPI communication with other processes. [[MPI_FINALIZE]] is collective on [[MPI_COMM_WORLD]] .

> [!warning] Advice to implementors

> Even though a process has completed all the communication it initiated, such communication may not yet be completed from the viewpoint of the underlying MPI system. E.g., a blocking send may have completed, even though the data is still buffered at the sender. The MPI implementation must ensure that a process has completed any involvement in MPI communication before [[MPI_FINALIZE]] returns. Thus, if a process exits after the call to [[MPI_FINALIZE]] , this will not cause an ongoing communication to fail.

Although it is not required that all processes return from [[MPI_FINALIZE]] , it is required that at least process 0 in [[MPI_COMM_WORLD]] return, so that users can know that the MPI portion of the computation is over. In addition, in a POSIX environment, they may desire to supply an exit code for each process that returns from [[MPI_FINALIZE]] .

The following illustrates the use of requiring that at least one process return and that it be known that process 0 is one of the processes that return. One wants code like the following to work no matter how many processes return.

        ...
        MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
        ...
        MPI_Finalize();
        if (myrank == 0) {
            resultfile = fopen("outfile","w");
            dump_results(resultfile);
            fclose(resultfile);
        }
        exit(0);

![[API/MPI_INITIALIZED]]

This routine may be used to determine whether [[MPI_INIT]] has been called.

[[MPI_INITIALIZED]] returns `true` if the calling process has called [[MPI_INIT]] . Whether [[MPI_FINALIZE]] has been called does not affect the behavior of [[MPI_INITIALIZED]] .

It is one of the few routines that may be called before [[MPI_INIT]] is called.

![[API/MPI_ABORT]]

This routine makes a “best attempt” to abort all tasks in the group of `comm`. This function does not require that the invoking environment take any action with the error code. However, a Unix or POSIX environment should handle this as a `return errorcode` from the main program.

It may not be possible for an MPI implementation to abort only the processes represented by `comm` if this is a subset of the processes. In this case, the MPI implementation should attempt to abort all the connected processes but should not abort any unconnected processes. If no processes were spawned, accepted or connected then this has the effect of aborting all the processes associated with MPI_COMM_WORLD.

> [!tip] Rationale

> The communicator argument is provided to allow for future extensions of MPI to environments with, for example, dynamic process management. In particular, it allows but does not require an MPI implementation to abort a subset of MPI_COMM_WORLD.

> [!note] Advice to users

> Whether the errorcode is returned from the executable or from the MPI process startup mechanism (e.g., mpiexec), is an aspect of quality of the MPI library but not mandatory.

> [!warning] Advice to implementors

> Where possible, a high quality implementation will try to return the errorcode from the MPI process startup mechanism (e.g. mpiexec or singleton init).
