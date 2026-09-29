# Process Initialization, Creation, and Management



## Introduction



MPI is primarily concerned with communication rather than process or resource management. However, it is necessary to address these issues to some degree in order to define a useful framework for communication. This chapter presents a set of MPI interfaces that allows for several approaches to MPI initialization and process management while placing minimal restrictions on the execution environment.

One goal of MPI is to achieve *source code portability*. By this we mean that a program written using MPI and complying with the relevant language standards is portable as written, and must not require any source code changes when moved from one system to another. This explicitly does *not* say anything about how an MPI program is started or launched from the command line, nor what the user must do to set up the environment in which an MPI program will run. However, an implementation may require some setup or initialization procedure to be performed before the complete set of MPI routines may be called.

To this end, MPI presents two models for **MPI process initialization**. In the World Model, an initial set of processes is created that are related by their membership in a common `MPI_COMM_WORLD` (see Section [[dynamic#The World Model|The World Model]] ) communicator. In the Sessions Model (Section [[dynamic#The Sessions Model|The Sessions Model]] ), an initial set of processes is also created, but the application must explicitly manage the creation of MPI groups, and hence MPI communicators. `MPI_COMM_WORLD` is only valid for use as a communicator in the World Model, i.e., after a successful call to [[MPI_INIT]] or [[MPI_INIT_THREAD]] and before a call to [[MPI_FINALIZE]] . An application can employ both of these Process Models concurrently. In multi-component MPI applications, for example, a component such as a library can make use of the Sessions Model to instantiate MPI resources without impacting the rest of the application.

Both of these models also support the Dynamic Process Model (see Section [[dynamic#The Dynamic Process Model|The Dynamic Process Model]] ), which provides for the creation and management of additional processes after an MPI application has been started. A major impetus for the Dynamic Process Model comes from the PVM research effort. This work has provided a wealth of experience with process management and resource control that illustrates their benefits and potential pitfalls.

In developing the Dynamic Process Model, the MPI Forum decided not to address resource control because it was not able to design a portable interface that would be appropriate for the broad spectrum of existing and potential resource and process controllers. MPI assumes that resource control is provided externally.

Process management functionality is included in MPI to enable its use in classes of message-passing applications requiring process control. These include task farms, serial applications with parallel modules, and problems that require a run-time assessment of the number and type of processes that should be started.

The following goals are central to the design of MPI process management:

- The MPI process model must apply to the vast majority of current parallel environments.

- MPI must not take over operating system responsibilities. It should instead provide a clean interface between an application and system software.

- MPI must guarantee communication determinism in the presence of dynamic processes, i.e., dynamic process management must not introduce unavoidable race conditions.

- MPI must not contain features that compromise performance.

The Dynamic Process Model addresses these issues in two ways. First, MPI remains primarily a communication library. It does not manage the parallel environment in which a parallel program executes, though it provides a minimal interface between an application and external resource and process managers.

Second, MPI maintains a consistent concept of a communicator, regardless of how its members came into existence. A communicator is never changed once created, and it is always created using deterministic collective operations.

## The World Model



### Starting MPI Processes





When using the World Model, MPI is initialized by calling either [[MPI_INIT]] or [[MPI_INIT_THREAD]] .

![[API/MPI_INIT]]

In the World Model, an MPI program must contain exactly one call to an MPI initialization routine: [[MPI_INIT]] or [[MPI_INIT_THREAD]] . `MPI_COMM_WORLD` and `MPI_COMM_SELF` are not valid for use as communicators prior to invocation of [[MPI_INIT]] or [[MPI_INIT_THREAD]] . Subsequent calls to either of these initialization routines are erroneous. A subset of MPI functions may be invoked before MPI initialization routines are called. See Section [[dynamic#Common Elements of Both Process Models|Common Elements of Both Process Models]] . [[MPI_INIT]] accepts the `argc` and `argv` that are provided by the arguments to `main` or `NULL`:

    int main(int argc, char *argv[])
    {
        MPI_Init(&argc, &argv);

        /* parse arguments */
        /* main program    */

        MPI_Finalize();     /* see below */
        return 0; 
    }

The Fortran version takes only `IERROR`.

Conforming implementations of MPI are required to allow applications to pass `NULL` for both the `argc` and `argv` arguments of `main` in C.

Failures may disrupt the execution of the program before or during MPI initialization. A high-quality implementation shall not deadlock during MPI initialization, even in the presence of failures. Except for functions with the `MPI_T_` prefix, failures in MPI operations prior to or during MPI initialization are reported by invoking the initial error handler. Users can use the `mpi_initial_errhandler` info key during the launch of MPI processes (e.g., [[MPI_COMM_SPAWN]] / [[MPI_COMM_SPAWN_MULTIPLE]] , or [[mpiexec]] ) to set a non-fatal initial error handler before MPI initialization. When the initial error handler is set to `MPI_ERRORS_ABORT`, raising an error before or during initialization aborts the local MPI process (i.e., it is similar to calling [[MPI_ABORT]] on `MPI_COMM_SELF`).

An implementation may not always be capable of determining, before MPI initialization, what constitutes the local MPI process, or the set of connected processes. In this case, errors before initialization may cause a different set of MPI processes to abort than specified.

During MPI initialization, the initial error handler is associated with `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and the communicator returned by [[MPI_COMM_GET_PARENT]] (if any).

> [!warning] Advice to implementors

> Some failures may leave MPI in an undefined state, or raise an error before the error handling capabilities are fully operational, in which cases the implementation may be incapable of providing the desired error handling behavior. Of note, in some implementations, the notion of an MPI process is not clearly established in the early stages of MPI initialization (for example, when the implementation considers threads that called [[MPI_INIT]] as independent MPI processes); in this case, before MPI is initialized, the `MPI_ERRORS_ABORT` error handler may abort what would have become multiple MPI processes.
>
> When a failure occurs during MPI initialization, the implementation may decide to return `MPI_SUCCESS` from the MPI initialization function instead of raising an error. It is recommended that an implementation masks an initialization error only when it expects that later MPI calls will result in well-specified behavior (i.e., barring additional failures, either the outcome of any call will be correct, or the call will raise an appropriate error). For example, it may be difficult for an implementation to avoid unspecified behavior when the group of `MPI_COMM_WORLD` does not contain the same set of MPI processes at all members of the communicator, or if the communicator returned from [[MPI_COMM_GET_PARENT]] was not initialized correctly.

After MPI is initialized, the application can access information about the execution environment by querying the predefined info object `MPI_INFO_ENV`. The following keys are predefined for this object, corresponding to the arguments of [[MPI_COMM_SPAWN]] or of [[mpiexec]] :

`command`  
Name of program executed.

`argv`  
Space separated arguments to command.

`maxprocs`  
Maximum number of MPI processes to start.

`mpi_initial_errhandler`  
Name of the initial errhandler.

`soft`  
Allowed values for number of processors.

`host`  
Hostname.

`arch`  
Architecture name.

`wdir`  
Working directory of the MPI process.

`file`  
Value is the name of a file in which additional information is specified.

`thread_level`  
Requested level of thread support, if requested before the program started execution.

Note that all values are strings. Thus, the maximum number of processes is represented by a string such as `"1024"` and the requested level is represented by a string such as `"MPI_THREAD_SINGLE"`.

> [!note] Advice to users

> If one of the `argv` arguments contains a space, there is no way to tell from the value of the `argv` info key whether a space is part of the argument or is separating different arguments.

The info object `MPI_INFO_ENV` need not contain a (key,value) pair for each of these predefined keys; the set of (key,value) pairs provided is implementation-dependent. Implementations may provide additional, implementation specific, (key,value) pairs.

In cases where the MPI processes were started with [[MPI_COMM_SPAWN_MULTIPLE]] or, equivalently, with a startup mechanism that supports multiple process specifications, then the values stored in the info object `MPI_INFO_ENV` at a process are those values that affect the local MPI process.

If MPI is started with a call to

        mpiexec -n 5 -arch x86_64 ocean : -n 10 -arch power9 atmos

Then the first 5 processes will have in their `MPI_INFO_ENV` object the pairs `(command, ocean)`, `(maxprocs, 5)`, and `(arch, x86_64)`. The next 10 processes will have in `MPI_INFO_ENV` `(command, atmos)`, `(maxprocs, 10)`, and `(arch, power9)`

> [!note] Advice to users

> The values passed in `MPI_INFO_ENV` are the values of the arguments passed to the mechanism that started the MPI execution—not the actual value provided. Thus, the value associated with `maxprocs` is the number of MPI processes requested; it can be larger than the actual number of processes obtained, if the `soft` option was used.

> [!warning] Advice to implementors

> High-quality implementations will provide a (key,value) pair for each parameter that can be passed to the command that starts an MPI program.



The following function may be used to initialize MPI, and to initialize the MPI thread environment, instead of [[MPI_INIT]] .

![[API/MPI_INIT_THREAD]]

This call initializes MPI in the same way that a call to [[MPI_INIT]] would. In addition, it initializes the thread environment. The argument `required` is used to specify the desired level of thread support. The possible values are listed in increasing order of thread support.

`MPI_THREAD_SINGLE`  
Only one thread will execute.

`MPI_THREAD_FUNNELED`  
The process may be multithreaded, but the application must ensure that only the main thread makes MPI calls (for the definition of main thread, see [[MPI_IS_THREAD_MAIN]] on page [[function-mpiisthreadmain]] ).

`MPI_THREAD_SERIALIZED`  
The process may be multithreaded, and multiple threads may make MPI calls, but only one at a time: MPI calls are not made concurrently from two distinct threads (all MPI calls are “serialized”).

`MPI_THREAD_MULTIPLE`  
Multiple threads may call MPI, with no restrictions.

These values are monotonic; i.e., `MPI_THREAD_SINGLE` $`<`$ `MPI_THREAD_FUNNELED` $`<`$ `MPI_THREAD_SERIALIZED` $`<`$ `MPI_THREAD_MULTIPLE`.

Different processes in `MPI_COMM_WORLD` may require different levels of thread support.

The call returns in `provided` information about the actual level of thread support that will be provided by MPI. It can be one of the four values listed above.

The level(s) of thread support that can be provided by [[MPI_INIT_THREAD]] will depend on the implementation, and may depend on information provided by the user before the program started to execute (e.g., with

arguments to `mpiexec`). If possible, the call will return `provided``=``required`. Failing this, the call will return the least supported level such that `provided` $`>`$ `required` (thus providing a stronger level of support than required by the user). Finally, if the user requirement cannot be satisfied, then the call will return in `provided` the highest supported level.

A **thread compliant** MPI implementation will be able to return `provided` `=``MPI_THREAD_MULTIPLE`. Such an implementation may always return `provided` `=``MPI_THREAD_MULTIPLE`, irrespective of the value of `required`.

An MPI library that is not thread compliant must always return `provided``=``MPI_THREAD_SINGLE`, even if [[MPI_INIT_THREAD]] is called on a multithreaded process. The library should also return correct values for the MPI calls that can be executed before initialization, even if multiple threads have been spawned.

> [!tip] Rationale

> Such code is erroneous, but if the MPI initialization is performed by a library, the error cannot be detected until [[MPI_INIT_THREAD]] is called. The requirements in the previous paragraph ensure that the error can be properly detected.

A call to [[MPI_INIT]] has the same effect as a call to [[MPI_INIT_THREAD]] with a `required``=``MPI_THREAD_SINGLE`.

Vendors may provide (implementation dependent) means to specify the level(s) of thread support available when the MPI

program is started, e.g., with arguments to `mpiexec`. This will affect the outcome of calls to [[MPI_INIT]] and [[MPI_INIT_THREAD]] . Suppose, for example, that an MPI program has been started so that only `MPI_THREAD_MULTIPLE` is available. Then [[MPI_INIT_THREAD]] will return `provided``=``MPI_THREAD_MULTIPLE`, irrespective of the value of `required`; a call to [[MPI_INIT]] will also initialize the MPI thread support level to `MPI_THREAD_MULTIPLE`. Suppose, instead, that an MPI program has been started so that all four levels of thread support are available. Then, a call to [[MPI_INIT_THREAD]] will return `provided``=``required`; alternatively, a call to [[MPI_INIT]] will initialize the MPI thread support level to `MPI_THREAD_SINGLE`.

> [!tip] Rationale

> Various optimizations are possible when MPI code is executed single-threaded, or is executed on multiple threads, but not concurrently: mutual exclusion code may be omitted. Furthermore, if only one thread executes, then the MPI library can use library functions that are not thread safe, without risking conflicts with user threads. Also, the model of one communication thread, multiple computation threads fits many applications well, e.g., if the process code is a sequential Fortran/C program with MPI calls that has been parallelized by a compiler for execution on an SMP node, in a cluster of SMPs, then the process computation is multithreaded, but MPI calls will likely execute on a single thread.
>
> The design accommodates a static specification of the thread support level, for environments that require static binding of libraries, and for compatibility for current multithreaded MPI codes.

> [!warning] Advice to implementors

> If `provided` is not `MPI_THREAD_SINGLE` then the MPI library should not invoke C or Fortran library calls that are not thread safe, e.g., in an environment where `malloc` is not thread safe, then `malloc` should not be used by the MPI library.
>
> Some implementors may want to use different MPI libraries for different levels of thread support. They can do so using dynamic linking and selecting which library will be linked when [[MPI_INIT_THREAD]] is invoked. If this is not possible, then optimizations for lower levels of thread support will occur only when the level of thread support required is specified at link time.
>
> Note that `required` need not be the same value on all processes of `MPI_COMM_WORLD`.

As with [[MPI_INIT]] , discussed in Section [[dynamic#Starting MPI Processes|Starting MPI Processes]] , the version for ISO C accepts the `argc` and `argv` that are provided by the arguments to `main` or `NULL` for both arguments.

The following function can be used to query the current level of thread support.

![[API/MPI_QUERY_THREAD]]

The call returns in `provided` the current level of thread support, which will be the value returned in `provided` by [[MPI_INIT_THREAD]] , if MPI was initialized by a call to [[MPI_INIT_THREAD]] . This function is only applicable when using the World Model to initialize MPI. In the case of applications using both the World Model and the Sessions Model, this function only returns the thread support level returned in `provided` by [[MPI_INIT_THREAD]] .



![[API/MPI_IS_THREAD_MAIN]]

This function can be called by a thread to determine if it is the main thread (the thread that called [[MPI_INIT]] or [[MPI_INIT_THREAD]] ). This function is only applicable when using the World Model to initialize MPI. In the case of applications using both the World Model and the Sessions Model, the behavior of this procedure is the same as if the application were only using the World Model.

All routines listed in this section must be supported by all MPI implementations.

> [!tip] Rationale

> MPI libraries are required to provide these calls even if they do not support threads, so that portable code that contains invocations to these functions can link correctly. [[MPI_INIT]] continues to be supported so as to provide compatibility with current MPI codes.

> [!note] Advice to users

> It is possible to spawn threads before MPI is initialized, but `MPI_COMM_WORLD` and `MPI_COMM_SELF` cannot be used until the World Model is active, *i.e.*, until [[MPI_INIT_THREAD]] is invoked by one thread (which, thereby, becomes the main thread). In particular, it is possible to enter the MPI execution with a multithreaded process.
>
> In the World Model, the level of thread support provided is a global property of the MPI process that can be specified only once, when MPI is initialized on that process (or before). Portable third party libraries have to be written so as to accommodate any provided level of thread support. Otherwise, their usage will be restricted to specific level(s) of thread support. If such a library can run only with specific level(s) of thread support, e.g., only with `MPI_THREAD_MULTIPLE`, then [[MPI_QUERY_THREAD]] can be used to check whether the user initialized MPI to the correct level of thread support.

### Finalizing MPI



![[API/MPI_FINALIZE]]

This routine cleans up all MPI state associated with the World Model. If an MPI program terminates normally (i.e., not due to a call to [[MPI_ABORT]] or an unrecoverable error) then each process must call [[MPI_FINALIZE]] before it exits.

Before an MPI process invokes [[MPI_FINALIZE]] , the process must perform all MPI calls needed to complete its involvement in MPI communications associated with the World Model. It must locally complete all MPI operations that it initiated and must execute matching calls needed to complete MPI communications initiated by other processes. For example, if the process executed a nonblocking send, it must eventually call [[MPI_WAIT]] , [[MPI_TEST]] , [[MPI_REQUEST_FREE]] , or any derived function; if the process is the target of a send, then it must post the matching receive; if it is part of a group executing a collective operation, then it must have completed its participation in the operation.

The call to [[MPI_FINALIZE]] does not clean up MPI state associated with objects created using [[MPI_SESSION_INIT]] and other Sessions Model methods, nor objects created using the communicator returned by [[MPI_COMM_GET_PARENT]] . See Sections [[dynamic#The Sessions Model|The Sessions Model]] and [[dynamic#Process Manager Interface|Process Manager Interface]] .

The call to [[MPI_FINALIZE]] does not free objects created by MPI calls; these objects are freed using

`MPI_XXX_FREE` calls.

[[MPI_FINALIZE]] is collective over all connected processes. If no processes were spawned, accepted or connected then this means over `MPI_COMM_WORLD`; otherwise it is collective over the union of all processes that have been and continue to be connected, as explained in [[dynamic#Releasing Connections|Releasing Connections]] .

The following examples illustrate these rules.

The following code is correct

            Process 0                Process 1
            ---------                ---------
            MPI_Init();              MPI_Init();
            MPI_Send(dest=1);        MPI_Recv(src=0);
            MPI_Finalize();          MPI_Finalize();

Without a matching receive, the program is erroneous

            Process 0                Process 1
            ---------                ---------
            MPI_Init();              MPI_Init();
            MPI_Send (dest=1);
            MPI_Finalize();          MPI_Finalize();

This program is correct: Process 0 calls `MPI_Finalize` after it has executed the MPI calls that complete the send operation. Likewise, process 1 executes the MPI call that completes the matching receive operation before it calls `MPI_Finalize`.

       Process 0                     Process 1
       ---------                     ---------
       MPI_Init();                   MPI_Init(); 
       MPI_Isend(dest=1);            MPI_Recv(src=0);
       MPI_Request_free();           MPI_Finalize();
       MPI_Finalize();               exit();
       exit();

This program is correct. The attached buffer is a resource allocated by the user, not by MPI; it is available to the user after MPI is finalized.

       Process 0                     Process 1
       ---------                     ---------
       MPI_Init();                   MPI_Init();
       buffer = malloc(1000000);     MPI_Recv(src=0);
       MPI_Buffer_attach();          MPI_Finalize();
       MPI_Send(dest=1));            exit();
       MPI_Finalize();
       free(buffer);
       exit();

This program is correct. The cancel operation must succeed, since the send cannot complete normally. The wait operation, after the call to `MPI_Cancel`, is local—no matching MPI call is required on process 1. Cancelling a send request by calling [[MPI_CANCEL]] is deprecated.

       Process 0                    Process 1
       ---------                    ---------
       MPI_Issend(dest=1);          MPI_Finalize();
       MPI_Cancel();
       MPI_Wait();
       MPI_Finalize();

> [!warning] Advice to implementors

> Even though a process has executed all MPI calls needed to complete the communications it is involved with, such communication may not yet be completed from the viewpoint of the underlying MPI system. For example, a blocking send may have returned, even though the data is still buffered at the sender in an MPI buffer; an MPI process may receive a cancel request for a message it has completed receiving. The MPI implementation must ensure that a process has completed any involvement in MPI communication before [[MPI_FINALIZE]] returns. Thus, if a process exits after the call to [[MPI_FINALIZE]] , this will not cause an ongoing communication to fail. The MPI implementation should also complete freeing all objects marked for deletion by MPI calls that freed them.

Failures may disrupt MPI operations during and after MPI finalization. A high quality implementation shall not deadlock in MPI finalization, even in the presence of failures. The normal rules for MPI error handling continue to apply. After `MPI_COMM_SELF` has been “freed” (see Section [[dynamic#Allowing User Functions at MPI Finalization|Allowing User Functions at MPI Finalization]] ), errors that are not associated with a communicator, window, or file raise the initial error handler (set during the launch operation, see [[dynamic#Reserved Keys|Reserved Keys]] ).

Although it is not required that all processes return from [[MPI_FINALIZE]] , it is required that, when it has not failed or aborted, at least the MPI process that was assigned rank 0 in `MPI_COMM_WORLD` returns, so that users can know that the MPI portion of the computation is over. In addition, in a POSIX environment, users may desire to supply an exit code for each process that returns from [[MPI_FINALIZE]] .

Note that a failure may terminate the MPI process that was assigned rank 0 in `MPI_COMM_WORLD`, in which case it is possible that no MPI process returns from [[MPI_FINALIZE]] .

> [!note] Advice to users

> Applications that handle errors are encouraged to implement all rank-specific code before the call to [[MPI_FINALIZE]] . In Example [[example-finalize-rank0]] below, the process with rank 0 in `MPI_COMM_WORLD` may have been terminated before, during, or after the call to [[MPI_FINALIZE]] , possibly leading to the code after [[MPI_FINALIZE]] never being executed.



The following illustrates the use of requiring that at least one process return and that it be known that process 0 is one of the processes that return. One wants code like the following to work no matter how many processes return.

        ...
        MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
        ...
        MPI_Finalize();
        if (myrank == 0) {
            resultfile = fopen("outfile", "w");
            dump_results(resultfile);
            fclose(resultfile);
        }
        exit(0);

### Determining Whether MPI Has Been Initialized When Using the World Model

One of the goals of MPI is to allow for layered libraries. A library using the World Model needs to know if MPI has been initialized using either of [[MPI_INIT]] or [[MPI_INIT_THREAD]] . In MPI the function [[MPI_INITIALIZED]] is provided to tell if MPI had been initialized using the World Model. In the World Model, once MPI has been finalized it cannot be restarted. A library needs to be able to determine this to act accordingly. To achieve this, the function [[MPI_FINALIZED]] is needed.

![[API/MPI_INITIALIZED]]

This routine may be used to determine whether [[MPI_INIT]] or [[MPI_INIT_THREAD]] has been called. [[MPI_INITIALIZED]] returns `true` if the calling process has called either of these MPI procedures. Whether [[MPI_FINALIZE]] has been called does not affect the behavior of [[MPI_INITIALIZED]] . This function must always be thread-safe, as defined in Section [[dynamic#MPI and Threads|MPI and Threads]] . This function returns `false` for applications using the Sessions Model exclusively.

![[API/MPI_FINALIZED]]

This routine returns `true` if [[MPI_FINALIZE]] has completed. It is valid to call [[MPI_FINALIZED]] before [[MPI_INIT]] and after [[MPI_FINALIZE]] . This function must always be thread-safe, as defined in Section [[dynamic#MPI and Threads|MPI and Threads]] .

### Allowing User Functions at MPI Finalization



In the context of the World Model, there are times in which it would be convenient to have actions happen when an MPI process finalizes MPI. For example, a routine may do initializations that are useful until the MPI job (or that part of the job that is being terminated in the case of dynamically created processes) finalizes MPI. This can be accomplished in MPI by attaching an attribute to `MPI_COMM_SELF` with a callback function. When [[MPI_FINALIZE]] is called, it will first execute the equivalent of an [[MPI_COMM_FREE]] on `MPI_COMM_SELF`. This will cause the delete callback function to be executed on all keys associated with `MPI_COMM_SELF`, in the reverse order that they were set on `MPI_COMM_SELF`. If no key has been attached to `MPI_COMM_SELF`, then no callback is invoked. The “freeing” of `MPI_COMM_SELF` occurs before any other parts of MPI are affected. Thus, for example, calling [[MPI_FINALIZED]] will return `false` in any of these callback functions. Once done with `MPI_COMM_SELF`, the order and rest of the actions taken by [[MPI_FINALIZE]] is not specified.

> [!warning] Advice to implementors

> Since attributes can be added from any supported language, the MPI implementation needs to remember the creating language so the correct callback is made. Implementations that use the attribute delete callback on `MPI_COMM_SELF` internally should register their internal callbacks before returning from [[MPI_INIT]] / [[MPI_INIT_THREAD]] , so that libraries or applications will not have portions of the MPI implementation shut down before the application-level callbacks are made.

## The Sessions Model



There are a number of limitations with the World Model described in the preceding section. Among these are the following: MPI cannot be initialized from different application components without *a priori* knowledge or coordination; MPI cannot be initialized more than once; and MPI cannot be reinitialized after [[MPI_FINALIZE]] has been called. This section describes an alternative approach to MPI initialization—the Sessions Model. With this approach, an MPI application, or components of the application, can instantiate MPI resources for the specific communication needs of this component. `MPI_COMM_WORLD` is not valid for use as a communicator. `MPI_INFO_ENV` is not valid for use as an info object when only using the Sessions Model. As described in Section [[dynamic#Starting MPI Processes|Starting MPI Processes]] , MPI must be initialized using the World Model to use this info object. Note that an application may employ both the Sessions Model and World Model concurrently (see Section [[dynamic#Introduction|Introduction]] ).

In the Sessions Model, MPI resources can be allocated and freed multiple times in an MPI process.

As shown in Figure [[sessions-fig]] , when using the Sessions Model, an MPI process instantiates an *MPI Session handle*, which can be used to query the runtime system about characteristics of the job within which the process is running, as well as other system resources. Using this information, the MPI process can then create an MPI Group based on application requirements and available resources, which in turn can be used to create an MPI Communicator, Window, or File. By judicious creation of communicators, an application only needs to allocate MPI resources based on its communication requirements. Although there are existing MPI interfaces for creating communicators which can, in principle, allow for resource optimizations within an MPI implementation, this can only be done following initialization of MPI.

For multithreaded applications, the Sessions Model provides fine-grain control of the thread support level for MPI objects. It is possible to specify different thread support levels when creating different *MPI Session handles*. Thus different components of an application can use different thread support levels.

The Sessions Model introduces a concept of isolation. MPI objects derived from different *MPI Session handles* shall not be intermixed with each other in a single MPI procedure call.

MPI objects derived from the Sessions Model shall not be intermixed in a single MPI procedure call with MPI objects derived from the World Model.

MPI objects derived from the Sessions Model shall not be intermixed in a single MPI procedure call with MPI objects derived from the communicator obtained from a call to [[MPI_COMM_GET_PARENT]] or [[MPI_COMM_JOIN]] .

This restriction does not apply to generalized requests (Section [[ei#Generalized Requests|Generalized Requests]] ) as such requests are not associated directly with communicators or other MPI objects. Note however, the Sessions Model does not otherwise change the semantics or behavior of MPI objects.

*Figure: Steps to creating an MPI Communicator from an MPI Session handle.*

### Session Creation and Destruction Methods

![[API/MPI_SESSION_INIT]]

The `info` argument is used to request MPI functionality requirements and possible MPI implementation specific capabilities. The following info key is predefined:

`thread_level`  
used to request the thread support level required for MPI objects derived from the Session. Allowed values are `MPI_THREAD_SINGLE`, `MPI_THREAD_FUNNELED`, `MPI_THREAD_SERIALIZED`, and `MPI_THREAD_MULTIPLE`. Note that the thread support value is specified by a string rather than the integer values supplied to [[MPI_INIT_THREAD]] . The thread support level actually provided by the MPI implementation can be determined via a subsequent call to [[MPI_SESSION_GET_INFO]] to return the info object associated with the Session. The default thread support level is MPI implementation dependent.

The `errhandler` argument specifies an error handler to invoke in the event that the Session instantiation call encounters an error. The error handler shall be either a pre-defined error handler (see [[inquiry#Error Handling|Error Handling]] ) or one created using [[MPI_SESSION_CREATE_ERRHANDLER]] . Session instantiation is intended to be a lightweight operation. An MPI process may instantiate multiple Sessions. [[MPI_SESSION_INIT]] is always thread safe; multiple threads within an application may invoke it concurrently.

> [!note] Advice to users

> Requesting “`MPI_THREAD_SINGLE`” thread support level is generally not recommended, because this will conflict with other components of an application requesting higher levels of thread support.

> [!warning] Advice to implementors

> Owing to the restrictions of the `MPI_THREAD_SINGLE` thread support level, implementators are discouraged from making this the default thread support level for Sessions.

![[API/MPI_SESSION_FINALIZE]]

This routine cleans up all MPI state associated with the supplied `session`. Every instantiated Session must be finalized using [[MPI_SESSION_FINALIZE]] . The handle `session` is set to `MPI_SESSION_NULL` by the call.

Before an MPI process invokes [[MPI_SESSION_FINALIZE]] , the process must perform all MPI calls needed to complete its involvement in MPI communications: it must locally complete all MPI operations that it initiated and it must execute matching calls needed to complete MPI communications initiated by other processes.

The call to [[MPI_SESSION_FINALIZE]] does not free objects created by MPI calls; these objects are freed using

`MPI_XXX_FREE` calls.

[[MPI_SESSION_FINALIZE]] may be synchronizing on any or all of the groups associated with communicators, windows, or files derived from the session and not disconnected, freed, or closed, respectively, before the call to the [[MPI_SESSION_FINALIZE]] procedure. [[MPI_SESSION_FINALIZE]] behaves as if all such synchronizations occur concurrently. As [[MPI_COMM_FREE]] may mark a communicator for freeing later, [[MPI_SESSION_FINALIZE]] may be synchronizing on the group associated with a communicator that is only freed (with [[MPI_COMM_FREE]] ) rather than disconnected (with [[MPI_COMM_DISCONNECT]] ).

> [!tip] Rationale

> This rule is similar to the rule that [[MPI_FINALIZE]] is collective (see [[dynamic#Finalizing MPI|Finalizing MPI]] ), but does not require that [[MPI_SESSION_FINALIZE]] be collective over all connected MPI processes. It also allows for cases where some MPI processes may have derived a set of communicators using a different number of session handles. See Example [[dynamic#Session Creation and Destruction Methods|Session Creation and Destruction Methods]] .

> [!warning] Advice to implementors

> This rule also allows for the completion of communications the MPI process is involved with that may not yet be completed from the viewpoint of the underlying MPI system. See the advice to implementors at the end of Section [[dynamic#Finalizing MPI|Finalizing MPI]] .

> [!warning] Advice to implementors

> An MPI implementation should be able to implement the semantics of [[MPI_SESSION_FINALIZE]] as a *local* procedure, provided an application frees all MPI windows, closes all MPI files, and uses [[MPI_COMM_DISCONNECT]] to free all MPI communicators associated with a session prior to invoking [[MPI_SESSION_FINALIZE]] on the corresponding session handle.

 Three MPI processes are connected with 2 communicators (indicated by the `=` symbols), derived from one session handle in process X but from two separate session handles in both process Y and Z.

      process-X     process-Y     process-Z     Remarks
                                                sesX, sesYA, ses YB, sesZA and
                                                  sesZB are session handles.
        (sesX)=======(sesYA)=======(sesZA)      communicator_1 and
        (sesX)=======(sesYB)=======(sesZB)      communicator_2 are derived
                                                  from them.
       SF(sesX)     SF(sesYA)     SF(sesZA)     SF = MPI_SESSION_FINALIZE
                    SF(sesYB)     SF(sesZB)

Process X has only to finalize its one session handle, whereas the other two MPI processes have to call [[MPI_SESSION_FINALIZE]] twice in the same sequence with respect to the communicators derived from the session handles. Specifically, both process Y and process Z shall call [[MPI_SESSION_FINALIZE]] for the session from which `communicator_1` was derived before calling the [[MPI_SESSION_FINALIZE]] for the session from which `communicator_2` was derived, or vice versa (i.e. both shall finalize the session for `communicator_2` first then finalize the session for `communicator_1`). The call `SF(ses)` in process X may not return until both `SF(ses*A)` and `SF(ses*B)` are called in processes Y and Z.

### Processes Sets



Process sets are the mechanism for MPI applications to query the runtime. Process sets are identified by process set names. Process set names have a *Uniform Resource Identifier* (URI) format. Two process set names are mandated: `mpi://WORLD` and `mpi://SELF`. Additional process set names may be defined, for example, `mpix://UNIVERSE` and `hwloc://L3Cache` may be defined by the MPI implementation. The `mpi://` namespace is reserved for exclusive use by the MPI standard. Figure [[sessions-pset-fig]] depicts process sets that the runtime could associate with an instance of an MPI job. In this example, the two mandated process sets are defined, in addition to optional, implementation specific ones.

Mechanisms for defining process sets and how system resources are assigned to these sets is considered to be implementation dependent.

A process set caches key/value tuples that are accessible to the application via an `MPI_Info` object. The `mpi_size` key is mandatory for all process sets.

*Figure: Examples of process sets. Illustrated are the two mandated process sets - `mpi://WORLD` and `mpi://SELF` - along with several optional ones that a runtime could define. In this example, [[MPI_SESSION_GET_NUM_PSETS]] would return five at each MPI process.*

### Runtime Query Functions

![[API/MPI_SESSION_GET_NUM_PSETS]]

This function is used to query the runtime for the number of available process sets in which the calling MPI process is a member. An MPI implementation is allowed to increase the number of available process sets during the execution of an MPI application when new process sets become available. However, MPI implementations are not allowed to change the index of a particular process set name, or to change the name of the process set at a particular index, or to delete a process set name once it has been added. When a process set becomes invalid, for example, when some processes become unreachable due to failures in the communication system, subsequent usage of the process set name should raise an error. For example, creating an `MPI_Group` from such a process set might succeed because it is a local operation, but creating an `MPI_Comm` from that group and attempting collective communication should raise an error.

> [!warning] Advice to implementors

> It is anticipated that an MPI implementation may be relying on an external runtime system to provide process sets. Such runtime systems may have the ability to dynamically create process sets during the course of application execution. Requiring the number of process sets returned by [[MPI_SESSION_GET_NUM_PSETS]] to be constant over the course of application execution would prevent an application from taking advantage of such capabilities.

![[API/MPI_SESSION_GET_NTH_PSET]]

This function returns the name of the `n`th process set in the supplied `pset_name` buffer. `pset_len` is the size of the buffer needed to store the `n`th process set name. If the `pset_len` passed into the function is less than the actual buffer size needed for the process set name, then the string value returned in `pset_name` is truncated. If `pset_len` is set to 0, `pset_name` is not changed. On return, the value of `pset_len` will be set to the required buffer size to hold the process set name. In C, `pset_len` includes the required space for the null terminator. In C, this function returns a null terminated string in all cases where the `pset_len` input value is greater than 0.

If two MPI processes get the same process set name, then the intersection of the two process sets shall either be the empty set or identical to the union of the two process sets.

After a successful call to [[MPI_SESSION_GET_NTH_PSET]] , subsequent calls to routines that query information about the same process set name and same session handle must return the same information. An MPI implementation is not allowed to alter any of the returned process set names.

Process set names have an implementation-defined maximum length of `MPI_MAX_PSET_NAME_LEN` characters. `MPI_MAX_PSET_NAME_LEN` shall have a value of at least 63.

> [!note] Advice to users

> `MPI_MAX_PSET_NAME_LEN` might be very large, so it might not be wise to declare a string of that size. Users are encouraged to use [[MPI_SESSION_GET_NTH_PSET]] both for obtaining the length of a `pset_name` and the process set name.

![[API/MPI_SESSION_GET_INFO]]

[[MPI_SESSION_GET_INFO]] returns a new info object containing the hints of the MPI Session associated with `session`. The current setting of all hints related to this MPI Session is returned in `info_used`. An MPI implementation is required to return all hints that are supported by the implementation and have default values specified; any user-supplied hints that were not ignored by the implementation; and any additional hints that were set by the implementation. If no such hints exist, a handle to a newly created info object is returned that contains no key/value pair. The user is responsible for freeing `info_used` via [[MPI_INFO_FREE]] .

![[API/MPI_SESSION_GET_PSET_INFO]]

This function is used to query properties of a specific process set. The returned *info* object can be queried with existing MPI info object query functions. One key/value pair must be defined, `mpi_size`. The value of the `mpi_size` key specifies the number of MPI processes in the process set. The user is responsible for freeing the returned `MPI_Info` object.

### Sessions Model Examples

This section presents several examples of how to use MPI Sessions to create MPI Groups and MPI Communicators.

Simple example illustrating creation of an MPI communicator using the Sessions Model.

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "mpi.h"

    static MPI_Session lib_shandle = MPI_SESSION_NULL;
    static MPI_Comm lib_comm = MPI_COMM_NULL;

    int library_foo_init(void)
    {
       int rc, flag, valuelen;
       int ret = 0;
       const char pset_name[] = "mpi://WORLD";
       const char mt_key[] = "thread_level";
       const char mt_value[] = "MPI_THREAD_MULTIPLE";
       char out_value[100];   /* large enough */
       MPI_Group wgroup = MPI_GROUP_NULL;
       MPI_Info sinfo = MPI_INFO_NULL;
       MPI_Info tinfo = MPI_INFO_NULL;

       MPI_Info_create(&sinfo);
       MPI_Info_set(sinfo, mt_key, mt_value);
       rc = MPI_Session_init(sinfo, MPI_ERRORS_RETURN, 
                              &lib_shandle);
       if (rc != MPI_SUCCESS) {
          ret = -1;
          goto fn_exit;
       }

       /*
        * check we got thread support level foo library needs
        */
       rc = MPI_Session_get_info(lib_shandle, &tinfo);
       if (rc != MPI_SUCCESS) {
          ret = -1;
          goto fn_exit;
       }

       valuelen = sizeof(out_value);
       MPI_Info_get_string(tinfo, mt_key, &valuelen,
                    out_value, &flag);
       if (0 == flag) {
          printf("Could not find key %s\n", mt_key);
          ret = -1;
          goto fn_exit;
       }

       if (strcmp(out_value, mt_value)) {
          printf("Did not get thread multiple support, got %s\n",
                 out_value);
          ret = -1;
          goto fn_exit;
       }

       /*
        * create a group from the WORLD process set
        */
       rc = MPI_Group_from_session_pset(lib_shandle,
                                        pset_name,
                                        &wgroup);
       if (rc != MPI_SUCCESS) {
          ret = -1;
          goto fn_exit;
       }

       /*
        * get a communicator
        */
       rc = MPI_Comm_create_from_group(wgroup,
                                       "org.mpi-forum.mpi-v4_0.example-ex11_8",
                                       MPI_INFO_NULL,
                                       MPI_ERRORS_RETURN,
                                       &lib_comm);
       if (rc != MPI_SUCCESS) {
          ret = -1;
          goto fn_exit;
       }

       /*
        * free group, library doesn't need it.
        */

    fn_exit:
       MPI_Group_free(&wgroup);

       if (sinfo != MPI_INFO_NULL) {
          MPI_Info_free(&sinfo);
       }

       if (tinfo != MPI_INFO_NULL) {
          MPI_Info_free(&tinfo);
       }

       if (ret != 0) {
          MPI_Session_finalize(&lib_shandle);
       }

       return ret;
    }

Example [[dynamic#Sessions Model Examples|Sessions Model Examples]] shows how the pre-defined `mpi://WORLD` process set can be used to first create a local MPI group and then subsequently to create an MPI communicator from this group.

This example illustrates the use of Process Set query functions to select a Process Set to use for MPI Group creation.

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "mpi.h"

    int main(int argc, char *argv[])
    {
       int i, n_psets, psetlen, rc, ret;
       int valuelen;
       int flag = 0;
       char *pset_name = NULL;
       char *info_val = NULL;
       MPI_Session shandle = MPI_SESSION_NULL;
       MPI_Info sinfo = MPI_INFO_NULL;
       MPI_Group pgroup = MPI_GROUP_NULL;

       if (argc < 2) {
          fprintf(stderr, "A process set name fragment is required\n");
          return EXIT_FAILURE;
       }

       rc = MPI_Session_init(MPI_INFO_NULL, MPI_ERRORS_RETURN, &shandle);
       if (rc != MPI_SUCCESS) {
          fprintf(stderr, "Could not initialize session, bailing out\n");
          return EXIT_FAILURE;
       }

       MPI_Session_get_num_psets(shandle, MPI_INFO_NULL, &n_psets);

       for (i=0, pset_name=NULL; i<n_psets; i++) {
           psetlen = 0;
           MPI_Session_get_nth_pset(shandle, MPI_INFO_NULL, i,
                                    &psetlen, NULL);
           pset_name = (char *)malloc(sizeof(char) * psetlen);
           MPI_Session_get_nth_pset(shandle, MPI_INFO_NULL, i,
                                    &psetlen, pset_name);
           if (strstr(pset_name, argv[1]) != NULL) break;

           free(pset_name);
           pset_name = NULL;
       }

       /*
        * get instance of an info object for this Session
        */

       MPI_Session_get_pset_info(shandle, pset_name, &sinfo);
       valuelen = 0;
       MPI_Info_get_string(sinfo, "mpi_size", &valuelen, NULL, &flag);
       if (flag) {
           info_val = (char *)malloc(valuelen);
           MPI_Info_get_string(sinfo, "mpi_size", &valuelen, info_val, &flag);
           free(info_val);
        }

       /*
        * create a group from the process set
        */

       rc = MPI_Group_from_session_pset(shandle, pset_name,
                                        &pgroup);
       ret = (rc == MPI_SUCCESS) ? 0 : EXIT_FAILURE;

       free(pset_name);
       MPI_Group_free(&pgroup);
       MPI_Info_free(&sinfo);
       MPI_Session_finalize(&shandle);

       fprintf(stderr, "Test completed ret = %d\n", ret);
       return ret;
    }

Example [[dynamic#Sessions Model Examples|Sessions Model Examples]] illustrates several aspects of the Sessions Model. First, the default error handler can be specified when instantiating a Session instance. Second, there must be at least two process sets associated with a Session. Third, the example illustrates use of the Sessions info object and the one required key: `mpi_size`.

A Fortran 2008 example illustrating how to obtain information about available process sets, create an MPI Group from a process set, and subsequently create an MPI Communicator.

    PROGRAM MAIN
        USE mpi_f08
        IMPLICIT NONE
        INTEGER :: pset_len, ierror, n_psets
        CHARACTER(LEN=:), ALLOCATABLE :: pset_name
        TYPE(MPI_Session) :: shandle
        TYPE(MPI_Group) :: pgroup
        TYPE(MPI_Comm) :: pcomm

        CALL MPI_Session_init(MPI_INFO_NULL, MPI_ERRORS_RETURN, &
                             shandle, ierror)
        IF (ierror .NE. MPI_SUCCESS) THEN
           WRITE(*,*) "MPI_Session_init failed"
           ERROR STOP
        END IF

        CALL MPI_Session_get_num_psets(shandle, MPI_INFO_NULL, n_psets)
        IF (n_psets .LT. 2)  THEN
           WRITE(*,*) "MPI_Session_get_num_psets didn't return at least 2 psets"
           ERROR STOP
        END IF

    !
    !   Just get the second pset's length and name
    !   Note that index values are zero-based, even in Fortran
    !

        pset_len = 0
        CALL MPI_Session_get_nth_pset(shandle, MPI_INFO_NULL, 1,     &
                                      pset_len, pset_name)
        ALLOCATE(CHARACTER(LEN=pset_len)::pset_name)
        CALL MPI_Session_get_nth_pset(shandle, MPI_INFO_NULL, 1,     &
                                      pset_len, pset_name)

    !
    !   create a group from the pset
    !
        CALL MPI_Group_from_session_pset(shandle, pset_name, pgroup)
    !
    !   free the buffer used for the pset name
    !
        DEALLOCATE(pset_name)

    !
    !   create a MPI communicator from the group
    !
        CALL MPI_Comm_create_from_group(pgroup, "session_example",   &
                                                MPI_INFO_NULL,       &
                                                MPI_ERRORS_RETURN,   &
                                                pcomm)

        CALL MPI_Barrier(pcomm, ierror)
        IF (ierror .NE. MPI_SUCCESS) THEN
            WRITE(*,*) "Barrier call on communicator failed"
            ERROR STOP
        END IF

        CALL MPI_Comm_free(pcomm)
        CALL MPI_Group_free(pgroup)
        CALL MPI_Session_finalize(shandle, ierror)

    END PROGRAM MAIN

Note in this example that the call to [[MPI_SESSION_FINALIZE]] may block in order to ensure that the calling MPI process has completed its involvement in the preceding [[MPI_BARRIER]] operation. If [[MPI_COMM_DISCONNECT]] had been used instead of [[MPI_COMM_FREE]] , the example would have blocked in [[MPI_COMM_DISCONNECT]] rather than [[MPI_SESSION_FINALIZE]] .

## Common Elements of Both Process Models



### MPI Functionality that is Always Available



Some MPI functions may be invoked at any time, including prior to calling [[MPI_INIT]] or [[MPI_SESSION_INIT]] , and following MPI finalization, independent of whether the World Model, Sessions Model, or both are used. These functions can be called concurrently by multiple threads within an MPI Process. Table [[dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] lists the applicable MPI functions.

|                                       |
|:--------------------------------------|
| [[MPI_INITIALIZED]]               |
| [[MPI_FINALIZED]]                 |
| [[MPI_GET_VERSION]]               |
| [[MPI_GET_LIBRARY_VERSION]]       |
| [[MPI_INFO_CREATE]]               |
| [[MPI_INFO_CREATE_ENV]]           |
| [[MPI_INFO_SET]]                  |
| [[MPI_INFO_DELETE]]               |
| [[MPI_INFO_GET_STRING]]           |
| [[MPI_INFO_GET_NKEYS]]            |
| [[MPI_INFO_GET_NTHKEY]]           |
| [[MPI_INFO_DUP]]                  |
| [[MPI_INFO_FREE]]                 |
| [[MPI_INFO_F2C]]                  |
| [[MPI_INFO_C2F]]                  |
| [[MPI_SESSION_CREATE_ERRHANDLER]] |
| [[MPI_SESSION_CALL_ERRHANDLER]]   |
| [[MPI_ERRHANDLER_FREE]]           |
| [[MPI_ERRHANDLER_F2C]]            |
| [[MPI_ERRHANDLER_C2F]]            |
| [[MPI_ERROR_STRING]]              |
| [[MPI_ERROR_CLASS]]               |

List of MPI Functions that can be called at any time within an MPI program, including prior to MPI initialization and following MPI finalization



In addition to the functions listed in Table [[dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] , any function with the prefix `MPI_T_` (within the constraints for functions with this prefix listed in Section [[tools#Initialization and Finalization|Initialization and Finalization]] ) may also be called prior to MPI initialization and after MPI finalization.

### Aborting MPI Processes

![[API/MPI_ABORT]]

This routine makes a “best attempt” to abort all MPI processes in the group of `comm`. This function does not require that the invoking environment take any action with the error code. However, a Unix or POSIX environment should handle this as a `return errorcode` from the main program.

It may not be possible for an MPI implementation to abort only the processes represented by `comm` if this is a subset of the processes. In this case, the MPI implementation should attempt to abort all the connected processes but should not abort any unconnected processes. When using the World Model, and if no processes were spawned, accepted, or connected then this has the effect of aborting all the processes associated with `MPI_COMM_WORLD`. In the case of the Sessions Model, if an MPI process has instantiated multiple sessions, the union of the process sets in these sessions are considered connected processes. Thus invoking [[MPI_ABORT]] on a communicator derived from one of these sessions will result in all MPI processes in this union being aborted.

> [!warning] Advice to implementors

> After aborting a subset of processes, a high quality implementation should be able to provide error handling for communicators, windows, and files involving both aborted and non-aborted processes. As an example, if the user changes the error handler for `MPI_COMM_WORLD` to `MPI_ERRORS_RETURN` or a custom error handler, when a subset of `MPI_COMM_WORLD` is aborted, the remaining processes in `MPI_COMM_WORLD` should be able to continue communicating with each other and receive an appropriate error code when attempting communication with an aborted process (e.g., an error of class `MPI_ERR_PROC_ABORTED`). A high quality implementation should support equivalent behavior for communicators derived from sessions.

> [!note] Advice to users

> Whether the `errorcode` is returned from the executable or from the
>
> MPI process startup mechanism (e.g., `mpiexec`), is an aspect of quality of the MPI library but not mandatory.

> [!warning] Advice to implementors

> Where possible, a high-quality implementation will try to return the `errorcode` from the MPI process startup mechanism (e.g. `mpiexec` or singleton init).

## Portable MPI Process Startup



A number of implementations of MPI provide a startup command for MPI programs that is of the form

        mpirun <mpirun arguments> <program> <program arguments>

Separating the command to start the program from the program itself provides flexibility, particularly for network and heterogeneous implementations. For example, the startup script need not run on one of the machines that will be executing the MPI program itself.

Having a standard startup mechanism also extends the portability of MPI programs one step further, to the command lines and scripts that manage them. For example, a validation suite script that runs hundreds of programs can be a portable script if it is written using such a standard startup mechanism. In order that the “standard” command not be confused with existing practice, which is not standard and not portable among implementations,

instead of `mpirun` MPI specifies `mpiexec`.

While a standardized startup mechanism improves the usability of MPI, the range of environments is so diverse (e.g., there may not even be a command line interface) that MPI cannot mandate such a mechanism. Instead, MPI specifies an `mpiexec` startup command and recommends but does not require it, as advice to implementors. However, if an implementation does provide a command called `mpiexec`, it must be of the form described below.

It is suggested that

        mpiexec -n <numprocs> <program>

be at least one way to start `<program>` with an initial set of `<numprocs>` processes, which will be accessible as the process set named `mpi://WORLD` in the Sessions Model and/or used to form the group associated with the built-in communicator, `MPI_COMM_WORLD` in the World Model. Other arguments to `mpiexec` may be implementation-dependent.

> [!warning] Advice to implementors

> Implementors, if they do provide a special startup command for MPI programs, are advised to give it the following form. The syntax is chosen in order that `mpiexec` be able to be viewed as a command-line version of [[MPI_COMM_SPAWN]] (See Section [[dynamic#Reserved Keys|Reserved Keys]] ).
>
> Analogous to [[MPI_COMM_SPAWN]] , we have
>
>         mpiexec -n                  <maxprocs>
>                -soft                <        >
>                -host                <        >
>                -arch                <        >
>                -wdir                <        >
>                -path                <        >
>                -file                <        >
>                -initial-errhandler  <        >
>                ...
>                <command line>
>
> for the case where a single command line for the application program and its arguments will suffice. See Section [[dynamic#Reserved Keys|Reserved Keys]] for the meanings of these arguments. For the case corresponding to [[MPI_COMM_SPAWN_MULTIPLE]] there are two possible formats:
>
> Form A:
>
>         mpiexec { <above arguments> } : { ... } : { ... } : ... : { ... }
>
> As with [[MPI_COMM_SPAWN]] , all the arguments are optional. (Even the `-n x` argument is optional; the default is implementation dependent. It might be `1`, it might be taken from an environment variable, or it might be specified at compile time.) The names and meanings of the arguments are taken from the keys in the `info` argument to [[MPI_COMM_SPAWN]] . There may be other, implementation-dependent arguments as well.
>
> Note that Form A, though convenient to type, prevents colons from being program arguments. Therefore an alternate, file-based form is allowed:
>
> Form B:
>
>         mpiexec -configfile <filename>
>
> where the lines of $`<`$`filename`$`>`$ are of the form separated by the colons in Form A. Lines beginning with ‘`#`’ are comments, and lines may be continued by terminating the partial line with ‘`‘`\
> ’.
>
> 
>
> Start 16 instances of `myprog` on the current or default machine:
>
>         mpiexec -n 16 myprog
>
> 
>
> 
>
> Start 10 instances of `myprog` on the machine called `ferrari`:
>
>         mpiexec -n 10 -host ferrari myprog
>
> 
>
> 
>
> Start 3 instances of the same program `myprog` with different command-/line arguments:
>
>         mpiexec myprog infile1 : myprog infile2 : myprog infile3
>
> 
>
> 
>
> Start 5 instances of the `ocean` program on x86_64 hosts and 10 instances of the `atmos` program on Power9 hosts (Form B):
>
>         mpiexec -n 5 -arch x86_64 ocean : -n 10 -arch power9 atmos
>
> It is assumed that the implementation in this case has a method for choosing hosts of the appropriate type. Their ranks are in the order specified.
>
> 
>
> 
>
> Start the `ocean` program on five Suns and the `atmos` program on 10 RS/6000’s (Form B):
>
>         mpiexec -configfile myfile
>
> where `myfile` contains
>
>         -n 5  -arch sun    ocean 
>         -n 10 -arch rs6000 atmos
>
> 

## MPI and Threads





This section specifies the interaction between MPI calls and threads. Although thread compliance is not required, the standard specifies how threads are to work if they are provided. The section lists minimal requirements for **thread compliant** MPI implementations and defines functions that can be used for initializing the thread environment. MPI may be implemented in environments where threads are not supported or perform poorly. Therefore, MPI implementations are not required to be thread compliant as defined in this section. Regardless of whether or not the MPI implementation is thread compliant, a subset of MPI functions must always be thread safe. A complete list of such MPI functions is given in Table [[dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] . When a thread is executing one of these routines, if another concurrently running thread also makes an MPI call, the outcome will be as if the calls executed in some order.

This section generally assumes a thread package similar to POSIX threads , but the syntax and semantics of thread calls are not specified here—these are beyond the scope of this document.

### General

In a thread-compliant implementation, an MPI process is a process that may be multithreaded. Each thread can issue MPI calls; however, threads are not separately addressable: a rank in a send or receive call identifies a process, not a thread. A message sent to a process can be received by any thread in this process.

> [!tip] Rationale

> This model corresponds to the POSIX model of interprocess communication: the fact that a process is multithreaded, rather than single-threaded, does not affect the external interface of this process. MPI implementations in which MPI ‘processes’ are POSIX threads inside a single POSIX process are not thread-compliant by this definition (indeed, their “processes” are single-threaded).

> [!note] Advice to users

> It is the user’s responsibility to prevent races when threads within the same application post conflicting communication calls. The user can make sure that two threads in the same process will not issue conflicting communication calls by using distinct communicators at each thread.

The two main requirements for a thread-compliant implementation are listed below.

1.  All MPI calls are *thread-safe*, i.e., two concurrently running threads may make MPI calls and the outcome will be as if the calls executed in some order, even if their execution is interleaved.

2.  Blocking MPI calls will block the calling thread only, allowing another thread to execute, if available. The calling thread will be blocked until the event on which it is waiting occurs. Once the blocked communication is enabled and can proceed, then the call will complete and the thread will be marked runnable, within a finite time. A blocked thread will not prevent *progress* of other runnable threads on the same process, and will not prevent them from executing MPI calls.

Process 0 consists of two threads. The first thread executes a blocking send call `MPI_Send(buff1, count, type, 0, 0, comm)`, whereas the second thread executes a blocking receive call `MPI_Recv(buff2, count, type, 0, 0, comm, &status)`, i.e., the first thread sends a message that is received by the second thread. This communication should always succeed. According to the first requirement, the execution will correspond to some interleaving of the two calls. According to the second requirement, a call can only block the calling thread and cannot prevent progress of the other thread. If the send call went ahead of the receive call, then the sending thread may block, but this will not prevent the receiving thread from executing. Thus, the receive call will occur. Once both calls occur, the communication is enabled and both calls will complete. On the other hand, a single-threaded process that posts a send, followed by a matching receive, may deadlock. The progress requirement for multithreaded implementations is stronger, as a blocked call cannot prevent progress in other threads.

> [!warning] Advice to implementors

> MPI calls can be made thread-safe by executing only one at a time, e.g., by protecting MPI code with one process-global lock. However, blocked operations cannot hold the lock, as this would prevent progress of other threads in the process. The lock is held only for the duration of an atomic, locally-completing suboperation such as posting a send or completing a send, and is released in between. Finer locks can provide more concurrency, at the expense of higher locking overheads. Concurrency can also be achieved by having some of the MPI protocol executed by separate server threads.

### Clarifications

##### Initialization and Completion

When using the World Model, the call to [[MPI_FINALIZE]] should occur on the same thread that initialized MPI. We call this thread the **main thread**. The call should occur only after all process threads have completed their MPI calls, and have no pending communications or I/O operations.

> [!tip] Rationale

> This constraint simplifies implementation.

##### Threads and the Sessions Model

The Sessions Model provides a finer-grain approach to controlling the interaction between MPI calls and threads. When using this model, the desired level of thread support is specified at Session initialization time. See Section [[dynamic#The Sessions Model|The Sessions Model]] . Thus it is possible for communicators and other MPI objects derived from one Session to provide a different level of thread support than those created from another Session for which a different level of thread support was requested. Depending on the level of thread support requested at Session initialization time, different threads in a MPI process can make concurrent calls to MPI when using MPI objects derived from different *session handles*. Note that the requested and provided level of thread support when creating a Session may influence the granted level of thread support in a subsequent invocation of [[MPI_SESSION_INIT]] . Likewise, if the application at some point calls [[MPI_INIT_THREAD]] , the requested and granted level of thread support may influence the granted level of thread support for subsequent calls to [[MPI_SESSION_INIT]] . Similarly, if the application calls [[MPI_INIT_THREAD]] after a call to [[MPI_SESSION_INIT]] , the level of thread support returned from [[MPI_INIT_THREAD]] may be similarly influenced by the requested level of thread support in the prior call to [[MPI_SESSION_INIT]] .

In addition, if an MPI application is only using the Sessions Model, the provided thread support level returned by [[MPI_QUERY_THREAD]] is the same as that returned prior to invocation of [[MPI_INIT_THREAD]] or [[MPI_INIT]] . If the application also used the World Model in some component of the application, [[MPI_QUERY_THREAD]] will return the level of thread support returned by the original call to [[MPI_INIT_THREAD]] .

##### Multiple threads completing the same request.

A program in which two threads block, waiting on the same request, is erroneous. Similarly, the same request cannot appear in the array of requests of two concurrent

`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` calls. In MPI, a request can only be completed once. Any combination of wait or test that violates this rule is erroneous.

> [!tip] Rationale

> This restriction is consistent with the view that a multithreaded execution corresponds to an interleaving of the MPI calls. In a single threaded implementation, once a wait is posted on a request the request handle will be nullified before it is possible to post a second wait on the same handle.
>
> With threads, an `MPI_WAIT<span class="roman">{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` may be blocked without having nullified its request(s) so it becomes the user’s responsibility to avoid using the same request in an [[MPI_WAIT]] on another thread. This constraint also simplifies implementation, as only one thread will be blocked on any communication or I/O event.

##### Probe

A receive call that uses source and tag values returned by a preceding call to [[MPI_PROBE]] or [[MPI_IPROBE]] will receive the message matched by the probe call only if there was no other matching receive after the probe and before that receive. In a multithreaded environment, it is up to the user to enforce this condition using suitable mutual exclusion logic. This can be enforced by making sure that each communicator is used by only one thread on each process. Alternatively, [[MPI_MPROBE]] or [[MPI_IMPROBE]] can be used.

##### Collective calls

Matching of collective calls on a communicator, window, or file handle is done according to the order in which the calls are issued at each process. If concurrent threads issue such calls on the same communicator, window or file handle, it is up to the user to make sure the calls are correctly ordered, using interthread synchronization.

> [!note] Advice to users

> With three concurrent threads in each MPI process of a communicator `comm`, it is allowed that thread A in each MPI process calls a collective operation on `comm`, thread B calls a file operation on an existing file handle that was formerly opened on `comm`, and thread C invokes one-sided operations on an existing window handle that was also formerly created on `comm`.

> [!tip] Rationale

> As specified in [[MPI_FILE_OPEN]] and [[MPI_WIN_CREATE]] , a file handle and a window handle inherit only the group of processes of the underlying communicator, but not the communicator itself. Accesses to communicators, window handles and file handles cannot affect one another.

> [!warning] Advice to implementors

> If the implementation of file or window operations internally uses MPI communication then a duplicated communicator may be cached on the file or window object.

##### Error handlers

An error handler does not necessarily execute in the context of the thread that made the error-raising MPI call; the error handler may be executed by a thread that is distinct from the thread that will return the error code.

> [!tip] Rationale

> The MPI implementation may be multithreaded, so that part of the communication protocol may execute on a thread that is distinct from the thread that made the MPI call. The design allows the error handler to be executed on the thread where the error is raised.

##### Interaction with signals and cancellations

The outcome is undefined if a thread that executes an MPI call is cancelled (by another thread), or if a thread catches a signal while executing an MPI call. However, a thread of an MPI process may terminate, and may catch signals or be cancelled by another thread when not executing MPI calls.

> [!tip] Rationale

> Few C library functions are signal safe, and many have cancellation points—points at which the thread executing them may be cancelled. The above restriction simplifies implementation (no need for the MPI library to be “async-cancel-safe” or “async-signal-safe”).

> [!note] Advice to users

> Users can catch signals in separate, non-MPI threads (e.g., by masking signals on MPI calling threads, and unmasking them in one or more non-MPI threads). A good programming practice is to have a distinct thread blocked in a call to `sigwait` for each user expected signal that may occur. Users must not catch signals used by the MPI implementation; as each MPI implementation is required to document the signals used internally, users can avoid these signals.

> [!warning] Advice to implementors

> The MPI library should not invoke library calls that are not thread safe, if multiple threads execute.

## The Dynamic Process Model



The dynamic process model allows for the creation and cooperative termination of processes after an MPI application has started. It provides a mechanism to establish communication between the newly created processes and the existing MPI application. It also provides a mechanism to establish communication between two existing MPI applications, even when one did not “start” the other.

### Starting Processes

MPI applications may start new processes through an interface to an external process manager.

[[MPI_COMM_SPAWN]] starts MPI processes and establishes communication with them, returning an inter-/communicator. [[MPI_COMM_SPAWN_MULTIPLE]] starts several different binaries (or the same binary with different arguments), placing them in the same `MPI_COMM_WORLD` and returning an inter-communicator.

MPI uses the group abstraction to represent processes. A process is identified by a (group, rank) pair.

### The Runtime Environment

The [[MPI_COMM_SPAWN]] and [[MPI_COMM_SPAWN_MULTIPLE]] routines provide an interface between MPI and the *runtime environment* of an MPI application. The difficulty is that there is an enormous range of runtime environments and application requirements, and MPI must not be tailored to any particular one.

MPI assumes, implicitly, the existence of an environment in which an application runs. It does not provide “operating system” services, such as a general ability to query what processes are running, to kill arbitrary processes, to find out properties of the runtime environment (how many processors, how much memory, etc.). Complex interaction of an MPI application with its runtime environment should be done through an environment-specific API.

At some low level, obviously, MPI must be able to interact with the runtime system, but the interaction is not visible at the application level and the details of the interaction are not specified by the MPI standard.

In many cases, it is impossible to keep environment-specific information out of the MPI interface without seriously compromising MPI functionality. To permit applications to take advantage of environment-specific functionality, many MPI routines take an `info` argument that allows an application to specify environment-specific information. There is a tradeoff between functionality and portability: applications that make use of environment-specific `info` are not portable.

MPI does not require the existence of an underlying “virtual machine” model, in which there is a consistent global view of an MPI application and an implicit “operating system” managing resources and processes. For instance, processes spawned by one task may not be visible to another; additional hosts added to the runtime environment by one process may not be visible in another process; tasks spawned by different processes may not be automatically distributed over available resources.

Interaction between MPI and the runtime environment is limited to the following areas:

- A process may start new processes with [[MPI_COMM_SPAWN]] and [[MPI_COMM_SPAWN_MULTIPLE]] .

- When a process spawns a child process, it may optionally use an `info` argument to tell the runtime environment where or how to start the process. This extra information may be opaque to MPI.

- An attribute `MPI_UNIVERSE_SIZE` (See [[dynamic#Universe Size|Universe Size]] ) on `MPI_COMM_WORLD` tells a program how “large” the initial runtime environment is, namely how many processes can usefully be started in all. One can subtract the size of `MPI_COMM_WORLD` from this value to find out how many processes might usefully be started in addition to those already running.

## Process Manager Interface



### Processes in MPI

A process is represented in MPI by a (group, rank) pair. A (group, rank) pair specifies a unique process but a process does not determine a unique (group, rank) pair, since a process may belong to several groups.

### Starting Processes and Establishing Communication

The following routine starts a number of MPI processes and establishes communication with them, returning an inter-communicator.

> [!note] Advice to users

> It is possible in MPI to start an SPMD or MPMD application with a fixed number of processes after initialization by first starting one process and having that process start its siblings with [[MPI_COMM_SPAWN]] . This practice is discouraged primarily for reasons of performance. If possible, it is preferable to start all processes at once, as a single MPI application.

![[API/MPI_COMM_SPAWN]]

[[MPI_COMM_SPAWN]] tries to start `maxprocs` identical copies of the MPI program specified by `command`, establishing communication with them and returning an inter-/communicator. The spawned processes are referred to as children. The children have their own `MPI_COMM_WORLD`, which is separate from that of the parents. [[MPI_COMM_SPAWN]] is collective over `comm`, and also may not return until [[MPI_INIT]] has been called in the children. Similarly, [[MPI_INIT]] in the children may not return until all parents have called [[MPI_COMM_SPAWN]] . In this sense, [[MPI_COMM_SPAWN]] in the parents and [[MPI_INIT]] in the children form a collective operation over the union of parent and child processes. The inter-communicator returned by [[MPI_COMM_SPAWN]] contains the parent processes in the local group and the child processes in the remote group. The ordering of processes in the local and remote groups is the same as the ordering of the group of the `comm` in the parents and of `MPI_COMM_WORLD` of the children, respectively. This inter-communicator can be obtained in the children through the function [[MPI_COMM_GET_PARENT]] .

> [!note] Advice to users

> An implementation may automatically establish communication before [[MPI_INIT]] is called by the children. Thus, completion of [[MPI_COMM_SPAWN]] in the parent does not necessarily mean that [[MPI_INIT]] has been called in the children (although the returned inter-communicator can be used immediately).

##### The `command` argument

The `command` argument is a string containing the name of a program to be spawned. The string is null-terminated in C. In Fortran, leading and trailing spaces are stripped. MPI does not specify how to find the executable or how the working directory is determined. These rules are implementation-dependent and should be appropriate for the runtime environment.

> [!warning] Advice to implementors

> The implementation should use a natural rule for finding executables and determining working directories. For instance, a homogeneous system with a global file system might look first in the working directory of the spawning process, or might search the directories in a PATH environment variable as do Unix shells. An implementation should document its rules for finding executables and determining working directories, and a high-quality implementation should give the user some control over these rules.

If the program named in `command` does not call [[MPI_INIT]] , but instead forks a process that calls [[MPI_INIT]] , the results are undefined. Implementations may allow this case to work but are not required to.

> [!note] Advice to users

> MPI does not say what happens if the program you start is a shell script and that shell script starts a program that calls [[MPI_INIT]] . Though some implementations may allow you to do this, they may also have restrictions, such as requiring that arguments supplied to the shell script be supplied to the program, or requiring that certain parts of the environment not be changed.

##### The `argv` argument

`argv` is an array of strings containing arguments that are passed to the program. The first element of `argv` is the first argument passed to `command`, not, as is conventional in some contexts, the command itself. The argument list is terminated by `NULL` in C and an empty string in Fortran. In Fortran, leading and trailing spaces are always stripped, so that a string consisting of all spaces is considered an empty string. The constant `MPI_ARGV_NULL` may be used in C and Fortran to indicate an empty argument list. In C this constant is the same as `NULL`.

Examples of `argv` in C and Fortran

To run the program “ocean” with arguments “-gridfile” and “ocean1.grd” in C:

           char command[] = "ocean";
           char *argv[] = {"-gridfile", "ocean1.grd", NULL};
           MPI_Comm_spawn(command, argv, ...);

or, if not everything is known at compile time:

           char *command;
           char **argv;
           command = "ocean";
           argv=(char **)malloc(3 * sizeof(char *));
           argv[0] = "-gridfile";
           argv[1] = "ocean1.grd";
           argv[2] = NULL;
           MPI_Comm_spawn(command, argv, ...);

In Fortran:

           CHARACTER*25 command, argv(3)
           command = 'ocean'
           argv(1) = '-gridfile'
           argv(2) = 'ocean1.grd'
           argv(3) = ' '
           call MPI_COMM_SPAWN(command, argv, ...)

Arguments are supplied to the program if this is allowed by the operating system. In C, the [[MPI_COMM_SPAWN]] argument `argv` differs from the `argv` argument of `main` in two respects. First, it is shifted by one element. Specifically, `argv[0]` of `main` is provided by the implementation and conventionally contains the name of the program (given by `command`). `argv[1]` of `main` corresponds to `argv[0]` in [[MPI_COMM_SPAWN]] , `argv[2]` of `main` to `argv[1]` of [[MPI_COMM_SPAWN]] , etc. Passing an `argv` of `MPI_ARGV_NULL` to [[MPI_COMM_SPAWN]] results in `main` receiving `argc` of 1 and an `argv` whose element 0 is (conventionally) the name of the program. Second, `argv` of [[MPI_COMM_SPAWN]] must be null-terminated, so that its length can be determined.

If a Fortran implementation supplies routines that allow a program to obtain its arguments, the arguments may be available through that mechanism. In C, if the operating system does not support arguments appearing in `argv` of `main()`, the MPI implementation may add the arguments to the `argv` that is passed to [[MPI_INIT]] .

##### The `maxprocs` argument

MPI tries to spawn `maxprocs` processes. If it is unable to spawn `maxprocs` processes, it raises an error of class `MPI_ERR_SPAWN`.

An implementation may allow the `info` argument to change the default behavior, such that if the implementation is unable to spawn all `maxprocs` processes, it may spawn a smaller number of processes instead of raising an error. In principle, the `info` argument may specify an arbitrary set $`\{m_i: 0 \leq m_i \leq
\texttt{maxprocs}\}`$ of allowed values for the number of processes spawned. The set $`\{m_i\}`$ does not necessarily include the value `maxprocs`. If an implementation is able to spawn one of these allowed numbers of processes, [[MPI_COMM_SPAWN]] returns successfully and the number of spawned processes, $`m`$, is given by the size of the remote group of `intercomm`. If $`m`$ is less than `maxproc`, reasons why the other processes were not spawned are given in `array_of_errcodes` as described below. If it is not possible to spawn one of the allowed numbers of processes, [[MPI_COMM_SPAWN]] raises an error of class `MPI_ERR_SPAWN`.

A spawn call with the default behavior is called *hard*. A spawn call for which fewer than `maxprocs` processes may be returned is called `soft`. See [[dynamic#Reserved Keys|Reserved Keys]] for more information on the `soft` key for `info`.

> [!note] Advice to users

> By default, requests are hard and MPI errors are fatal. This means that by default there will be a fatal error if MPI cannot spawn all the requested processes. If you want the behavior “spawn as many processes as possible, up to $`N`$,” you should do a soft spawn, where the set of allowed values $`\{m_i\}`$ is $`\{0, ..., N\}`$. However, this is not completely portable, as implementations are not required to support soft spawning.

##### The `info` argument

The `info` argument to all of the routines in this

chapter is an opaque handle of type `MPI_Info` in C and Fortran with the `mpi_f08` module and `INTEGER` in Fortran with the `mpi` module or the include file `mpif.h`. It is a container for a number of user-specified (`key`,`value`) pairs. `key` and `value` are strings (null-terminated `char*` in C, `character*(*)` in Fortran). Routines to create and manipulate the `info` argument are described in [[Chapter]] subsec:info.

For the [[SPAWN]] calls, `info` provides additional (and possibly implementation-dependent) instructions to MPI and the runtime system on how to start processes. An application may pass `MPI_INFO_NULL` in C or Fortran. Portable programs not requiring detailed control over process locations should use `MPI_INFO_NULL`.

MPI does not specify the content of the `info` argument, except to reserve a number of special `key` values (see [[dynamic#Reserved Keys|Reserved Keys]] ). The `info` argument is quite flexible and could even be used, for example, to specify the executable and its command-line arguments. In this case the `command` argument to [[MPI_COMM_SPAWN]] could be empty. The ability to do this follows from the fact that MPI does not specify how an executable is found, and the `info` argument can tell the runtime system where to “find” the executable “” (empty string). Of course, a program that does this will not be portable across MPI implementations.

##### The `root` argument

All arguments before the `root` argument are examined only on the process whose rank in `comm` is equal to `root`. The value of these arguments on other processes is ignored.

##### The `array_of_errcodes` argument

The `array_of_errcodes` is an array of length `maxprocs` in which MPI reports the status of each process that MPI was requested to start. If all `maxprocs` processes were spawned, `array_of_errcodes` is filled in with the value `MPI_SUCCESS`. If only $`m`$ ($`0 \leq m < \texttt{maxprocs}`$) processes are spawned, $`m`$ of the entries will contain `MPI_SUCCESS` and the rest will contain an implementation-specific error code indicating the reason MPI could not start the process. MPI does not specify which entries correspond to failed processes. An implementation may, for instance, fill in error codes in one-to-one correspondence with a detailed specification in the `info` argument. These error codes all belong to the error class `MPI_ERR_SPAWN` if there was no error in the argument list. In C or Fortran, an application may pass `MPI_ERRCODES_IGNORE` if it is not interested in the error codes.

> [!warning] Advice to implementors

> `MPI_ERRCODES_IGNORE` in Fortran is a special type of constant, like `MPI_BOTTOM`. See the discussion in [[terms#Named Constants|Named Constants]] .

![[API/MPI_COMM_GET_PARENT]]

If a process was started with [[MPI_COMM_SPAWN]] or [[MPI_COMM_SPAWN_MULTIPLE]] , [[MPI_COMM_GET_PARENT]] returns the “parent” inter-communicator of the current process. This parent inter-communicator is created implicitly inside of [[MPI_INIT]] and is the same inter-communicator returned by [[SPAWN]] in the parents.

If the process was not spawned, [[MPI_COMM_GET_PARENT]] returns `MPI_COMM_NULL`.

After the parent communicator is freed or disconnected, [[MPI_COMM_GET_PARENT]] returns `MPI_COMM_NULL`.

> [!note] Advice to users

> [[MPI_COMM_GET_PARENT]] returns a handle to a single inter-communicator. Calling [[MPI_COMM_GET_PARENT]] a second time returns a handle to the same inter-communicator. Freeing the handle with [[MPI_COMM_DISCONNECT]] or [[MPI_COMM_FREE]] will cause other references to the inter-communicator to become invalid (dangling). Note that calling [[MPI_COMM_FREE]] on the parent communicator is not useful.

> [!tip] Rationale

> The desire of the Forum was to create a constant `MPI_COMM_PARENT` similar to `MPI_COMM_WORLD`. Unfortunately such a constant cannot be used (syntactically) as an argument to [[MPI_COMM_DISCONNECT]] , which is explicitly allowed.

### Starting Multiple Executables and Establishing Communication



While [[MPI_COMM_SPAWN]] is sufficient for most cases, it does not allow the spawning of multiple binaries, or of the same binary with multiple sets of arguments. The following routine spawns multiple binaries or the same binary with multiple sets of arguments, establishing communication with them and placing them in the same `MPI_COMM_WORLD`.

![[API/MPI_COMM_SPAWN_MULTIPLE]]

[[MPI_COMM_SPAWN_MULTIPLE]] is identical to [[MPI_COMM_SPAWN]] except that there are multiple executable specifications. The first argument, `count`, gives the number of specifications. Each of the next four arguments are simply arrays of the corresponding arguments in [[MPI_COMM_SPAWN]] . For the Fortran version of `array_of_argv`, the element `array_of_argv(i,j)` is the `j`-th argument to command number `i`.

> [!tip] Rationale

> This may seem backwards to Fortran programmers who are familiar with Fortran’s column-major ordering. However, it is necessary to do it this way to allow [[MPI_COMM_SPAWN]] to sort out arguments. Note that the leading dimension of `array_of_argv` *must* be the same as `count`. Also note that Fortran rules for sequence association allow a different value in the first dimension; in this case, the sequence of array elements is interpreted by [[MPI_COMM_SPAWN_MULTIPLE]] as if the sequence is stored in an array defined with the first dimension set to `count`. This Fortran feature allows an implementor to define `MPI_ARGVS_NULL` (see below) with fixed dimensions, e.g., (1,1), or only with one dimension, e.g., (1).

> [!note] Advice to users

> The argument `count` is interpreted by MPI only at the root, as is `array_of_argv`. Since the leading dimension of `array_of_argv` is `count`, a non-positive value of `count` at a non-root node could theoretically cause a runtime bounds check error, even though `array_of_argv` should be ignored by the subroutine. If this happens, you should explicitly supply a reasonable value of `count` on the non-root nodes.

In any language, an application may use the constant `MPI_ARGVS_NULL` (which is likely to be `(char ***)0` in C) to specify that no arguments should be passed to any commands. The effect of setting individual elements of `array_of_argv` to `MPI_ARGV_NULL` is not defined. To specify arguments for some commands but not others, the commands without arguments should have a corresponding `argv` whose first element is null (`(char *)0` in C and empty string in Fortran).

In Fortran at non-root processes, the `count` argument must be set to a value that is consistent with the provided `array_of_argv` although the content of these arguments has no meaning for this operation.

All of the spawned processes have the same `MPI_COMM_WORLD`. Their ranks in `MPI_COMM_WORLD` correspond directly to the order in which the commands are specified in [[MPI_COMM_SPAWN_MULTIPLE]] . Assume that $`m_1`$ processes are generated by the first command, $`m_2`$ by the second, etc. The processes corresponding to the first command have ranks $`0, 1, ...,
m_1-1`$. The processes in the second command have ranks $`m_1, m_1+1, ..., m_1+m_2-1`$. The processes in the third have ranks $`m_1+m_2, m_1+m_2+1, ..., m_1+m_2+m_3-1`$, etc.

> [!note] Advice to users

> Calling [[MPI_COMM_SPAWN]] multiple times would create many sets of children with different `MPI_COMM_WORLD`s whereas [[MPI_COMM_SPAWN_MULTIPLE]] creates children with a single `MPI_COMM_WORLD`, so the two methods are not completely equivalent. There are also two performance-related reasons why, if you need to spawn multiple executables, you may want to use [[MPI_COMM_SPAWN_MULTIPLE]] instead of calling [[MPI_COMM_SPAWN]] several times. First, spawning several things at once may be faster than spawning them sequentially. Second, in some implementations, communication between processes spawned at the same time may be faster than communication between processes spawned separately.

The `array_of_errcodes` argument is a 1-dimensional array of size $`\sum_{i=1}^{count} n_i`$, where $`n_i`$ is the $`i`$-th element of `array_of_maxprocs`. Command number $`i`$ corresponds to the $`n_i`$ contiguous slots in this array from element $`\sum_{j=1}^{i-1} n_j`$ to $`\left[\sum_{j=1}^{i} n_j\right] - 1`$. Error codes are treated the same as with [[MPI_COMM_SPAWN]] .

Examples of `array_of_argv` in C and Fortran

To run the program “ocean” with arguments `‘‘-gridfile’’` and `‘‘ocean1.grd’’` and the program “atmos” with argument `‘‘atmos.grd’’` in C:

           char *array_of_commands[2] = {"ocean", "atmos"};
           char **array_of_argv[2];
           char *argv0[] = {"-gridfile", "ocean1.grd", (char *)0};
           char *argv1[] = {"atmos.grd", (char *)0};
           array_of_argv[0] = argv0;
           array_of_argv[1] = argv1;
           MPI_Comm_spawn_multiple(2, array_of_commands, array_of_argv, ...);

Here is how you do it in Fortran:

           CHARACTER*25 commands(2), array_of_argv(2, 3)
           commands(1) = 'ocean'
           array_of_argv(1, 1) = '-gridfile'
           array_of_argv(1, 2) = 'ocean1.grd'
           array_of_argv(1, 3) = ' '

           commands(2) = 'atmos'
           array_of_argv(2, 1) = 'atmos.grd'
           array_of_argv(2, 2) = ' '

           call MPI_COMM_SPAWN_MULTIPLE(2, commands, array_of_argv, ...)

### Reserved Keys



The following keys are reserved. An implementation is not required to interpret these keys, but if it does interpret the key, it must provide the functionality described.

`host`  
Value is a hostname. The format of the hostname is determined by the implementation.

`arch`  
Value is an architecture name. Valid architecture names and what they mean are determined by the implementation.

`wdir`  
Value is the name of a directory on a machine on which the spawned process(es) execute(s). This directory is made the working directory of the executing process(es). The format of the directory name is determined by the implementation.

`path`  
Value is a directory or set of directories where the implementation should look for the executable. The format of `path` is determined by the implementation.

`file`  
Value is the name of a file in which additional information is specified. The format of the filename and internal format of the file are determined by the implementation.

`mpi_initial_errhandler`  
Value is the name of an errhandler that will be set as the initial error handler. The `mpi_initial_errhandler` key can take the case insensitive values `mpi_errors_are_fatal`, `mpi_errors_abort`, and `mpi_errors_return` representing the predefined MPI error handlers (`MPI_ERRORS_ARE_FATAL`—the default, `MPI_ERRORS_ABORT`, and `MPI_ERRORS_RETURN`, respectively). Other, nonstandard values may be supported by the implementation, which should document the resultant behavior.

`soft`  
Value specifies a set of numbers which are allowed values for the number of processes that [[MPI_COMM_SPAWN]] (et al.) may create. The format of the value is a comma-separated list of Fortran-90 triplets each of which specifies a set of integers and which together specify the set formed by the union of these sets. Negative values in this set and values greater than `maxprocs` are ignored. MPI will spawn the largest number of processes it can, consistent with some number in the set. The order in which triplets are given is not significant.

By Fortran-90 triplets, we mean:

1.  `a` means $`a`$

2.  `a:b` means $`a, a+1, a+2, ..., b`$

3.  `a:b:c` means $`a, a+c, a+2c, ..., a+ck`$, where for $`c > 0`$, $`k`$ is the largest integer for which $`a+ck \leq b`$ and for $`c < 0`$, $`k`$ is the largest integer for which $`a+ck \geq b`$. If $`b > a`$ then $`c`$ must be positive. If $`b < a`$ then $`c`$ must be negative.

Examples:

1.  `a:b` gives a range between $`a`$ and $`b`$

2.  `0:N` gives full “soft” functionality

3.  `1,2,4,8,16,32,64,128,256,512,1024,2048,4096` allows a power-of-two number of processes.

4.  `2:10000:2` allows an even number of processes up to a maximum of 10,000 processes.

5.  `2:10:2,7` allows 2, 4, 6, 7, 8, or 10 processes.

### Spawn Example



Manager-worker Example Using [[MPI_COMM_SPAWN]]

    /* manager */
    #include <stdio.h>
    #include "mpi.h"
    int main(int argc, char *argv[])
    {
       int world_size, universe_size, *universe_sizep, flag;
       MPI_Comm everyone;           /* inter-communicator */
       char worker_program[100];

       MPI_Init(&argc, &argv);
       MPI_Comm_size(MPI_COMM_WORLD, &world_size);

       if (world_size != 1)    error("Top heavy with management");

       MPI_Comm_get_attr(MPI_COMM_WORLD, MPI_UNIVERSE_SIZE, 
                         &universe_sizep, &flag); 
       if (!flag) {
            printf("This MPI does not support UNIVERSE_SIZE. How many\n\
    processes total?");
            scanf("%d", &universe_size);
       } else universe_size = *universe_sizep;
       if (universe_size == 1) error("No room to start workers");

       /* 
        * Now spawn the workers. Note that there is a run-time determination
        * of what type of worker to spawn, and presumably this calculation must
        * be done at run time and cannot be calculated before starting
        * the program. If everything is known when the application is 
        * first started, it is generally better to start them all at once
        * in a single MPI_COMM_WORLD. 
        */

       choose_worker_program(worker_program);
       MPI_Comm_spawn(worker_program, MPI_ARGV_NULL, universe_size-1, 
                 MPI_INFO_NULL, 0, MPI_COMM_SELF, &everyone, 
                 MPI_ERRCODES_IGNORE);
       /*
        * Parallel code here. The communicator "everyone" can be used
        * to communicate with the spawned processes, which have ranks 0,..
        * MPI_UNIVERSE_SIZE-1 in the remote group of the inter-communicator
        * "everyone".
        */

       MPI_Finalize();
       return 0;
    }

    /* worker */

    #include "mpi.h"
    int main(int argc, char *argv[])
    {
       int size;
       MPI_Comm parent;
       MPI_Init(&argc, &argv);
       MPI_Comm_get_parent(&parent);
       if (parent == MPI_COMM_NULL) error("No parent!");
       MPI_Comm_remote_size(parent, &size);
       if (size != 1) error("Something's wrong with the parent");

       /*
        * Parallel code here. 
        * The manager is represented as the process with rank 0 in (the remote
        * group of) the parent communicator.  If the workers need to communicate
        * among themselves, they can use MPI_COMM_WORLD.
        */

       MPI_Finalize();
       return 0;
    }

## Establishing Communication



This section provides functions that establish communication between two sets of MPI processes that do not share a communicator.

Some situations in which these functions are useful are:

1.  Two parts of an application that are started independently need to communicate.

2.  A visualization tool wants to attach to a running process.

3.  A server wants to accept connections from multiple clients. Both clients and server may be parallel programs.

In each of these situations, MPI must establish communication channels where none existed before, and there is no parent/child relationship. The routines described in this section establish communication between the two sets of processes by creating an MPI inter-communicator, where the two groups of the inter-communicator are the original sets of processes.

Establishing contact between two groups of processes that do not share an existing communicator is a collective but asymmetric process. One group of processes indicates its willingness to accept connections from other groups of processes. We will call this group the (parallel) *server*, even if this is not a client/server type of application. The other group connects to the server; we will call it the *client*.

> [!note] Advice to users

> While the names *client* and *server* are used throughout this section, MPI does not guarantee the traditional robustness of client/server systems. The functionality described in this section is intended to allow two cooperating parts of the same application to communicate with one another. For instance, a client that gets a segmentation fault and dies, or one that does not participate in a collective operation may cause a server to crash or hang.

### Names, Addresses, Ports, and All That

Almost all of the complexity in MPI client/server routines addresses the question “how does the client find out how to contact the server?” The difficulty, of course, is that there is no existing communication channel between them, yet they must somehow agree on a rendezvous point where they will establish communication.

Agreeing on a rendezvous point always involves a third party. The third party may itself provide the rendezvous point or may communicate rendezvous information from server to client. Complicating matters might be the fact that a client does not really care what server it contacts, only that it be able to get in touch with one that can handle its request.

Ideally, MPI can accommodate a wide variety of run-time systems while retaining the ability to write simple, portable code. The following should be compatible with MPI:

- The server resides at a well-known internet address host:port.

- The server prints out an address to the terminal; the user gives this address to the client program.

- The server places the address information on a nameserver, where it can be retrieved with an agreed-upon name.

- The server to which the client connects is actually a broker, acting as a middleman between the client and the real server.

MPI does not require a nameserver, so not all implementations will be able to support all of the above scenarios. However, MPI provides an optional nameserver interface, and is compatible with external name servers.

A `port_name` is a *system-supplied* string that encodes a low-level network address at which a server can be contacted. Typically this is an IP address and a port number, but an implementation is free to use any protocol. The server establishes a `port_name` with the [[MPI_OPEN_PORT]] routine. It accepts a connection to a given port with [[MPI_COMM_ACCEPT]] . A client uses `port_name` to connect to the server.

By itself, the `port_name` mechanism is completely portable, but it may be clumsy to use because of the necessity to communicate `port_name` to the client. It would be more convenient if a server could specify that it be known by an *application-supplied* `service_name` so that the client could connect to that `service_name` without knowing the `port_name`.

An MPI implementation may allow the server to publish a (`port_name`, `service_name`) pair with [[MPI_PUBLISH_NAME]] and the client to retrieve the port name from the service name with [[MPI_LOOKUP_NAME]] . This allows three levels of portability, with increasing levels of functionality.

1.  Applications that do not rely on the ability to publish names are the most portable. Typically the `port_name` must be transferred “by hand” from server to client.

2.  Applications that use the [[MPI_PUBLISH_NAME]] mechanism are completely portable among implementations that provide this service. To be portable among all implementations, these applications should have a fall-back mechanism that can be used when names are not published.

3.  Applications may ignore MPI’s name publishing functionality and use their own mechanism (possibly system-supplied) to publish names. This allows arbitrary flexibility but is not portable.

### Server Routines

A server makes itself available with two routines. First it must call [[MPI_OPEN_PORT]] to establish a `port` at which it may be contacted. Secondly it must call [[MPI_COMM_ACCEPT]] to accept connections from clients.

![[API/MPI_OPEN_PORT]]

This function establishes a network address, encoded in the `port_name` string, at which the server will be able to accept connections from clients. `port_name` is supplied by the system, possibly using information in the `info` argument.

MPI copies a system-supplied port name into `port_name`. `port_name` identifies the newly opened port and can be used by a client to contact the server. The maximum size string that may be supplied by the system is `MPI_MAX_PORT_NAME`.

> [!note] Advice to users

> The system copies the port name into `port_name`. The application must pass a buffer of sufficient size to hold this value.

`port_name` is essentially a network address. It is unique within the communication universe to which it belongs (determined by the implementation), and may be used by any client within that communication universe. For instance, if it is an internet (host:port) address, it will be unique on the internet. If it is a low level switch address on an IBM SP, it will be unique to that SP.

> [!warning] Advice to implementors

> These examples are not meant to constrain implementations. A `port_name` could, for instance, contain a user name or the name of a batch job, as long as it is unique within some well-defined communication domain. The larger the communication domain, the more useful MPI’s client/server functionality will be.

The precise form of the address is implementation-defined. For instance, an internet address may be a host name or IP address, or anything that the implementation can decode into an IP address. A port name may be reused after it is freed with [[MPI_CLOSE_PORT]] and released by the system.

> [!warning] Advice to implementors

> Since the user may type in `port_name` by hand, it is useful to choose a form that is easily readable and does not have embedded spaces.

`info` may be used to tell the implementation how to establish the address. It may, and usually will, be `MPI_INFO_NULL` in order to get the implementation defaults.

![[API/MPI_CLOSE_PORT]]

This function releases the network address represented by `port_name`.

![[API/MPI_COMM_ACCEPT]]

[[MPI_COMM_ACCEPT]] establishes communication with a client. It is collective over the calling communicator. It returns an inter-communicator that allows communication with the client.

The `port_name` must have been established through a call to [[MPI_OPEN_PORT]] .

`info` can be used to provide directives that may influence the behavior of the [[ACCEPT]] call.

### Client Routines

There is only one routine on the client side.

![[API/MPI_COMM_CONNECT]]

This routine establishes communication with a server specified by `port_name`. It is collective over the calling communicator and returns an inter-communicator in which the remote group participated in an [[MPI_COMM_ACCEPT]] .

If the named port does not exist (or has been closed), [[MPI_COMM_CONNECT]] raises an error of class `MPI_ERR_PORT`.

If the port exists, but does not have a pending [[MPI_COMM_ACCEPT]] , the connection attempt will eventually time out after an implementation-defined time, or succeed when the server calls [[MPI_COMM_ACCEPT]] . In the case of a time out, [[MPI_COMM_CONNECT]] raises an error of class `MPI_ERR_PORT`.

> [!warning] Advice to implementors

> The time out period may be arbitrarily short or long. However, a high-quality implementation will try to queue connection attempts so that a server can handle simultaneous requests from several clients. A high-quality implementation may also provide a mechanism, through the `info` arguments to [[MPI_OPEN_PORT]] , [[MPI_COMM_ACCEPT]] , and/or [[MPI_COMM_CONNECT]] , for the user to control timeout and queuing behavior.

MPI provides no guarantee of fairness in servicing connection attempts. That is, connection attempts are not necessarily satisfied in the order they were initiated and competition from other connection attempts may prevent a particular connection attempt from being satisfied.

`port_name` is the address of the server. It must be the same as the name returned by [[MPI_OPEN_PORT]] on the server. Some freedom is allowed here. If there are equivalent forms of `port_name`, an implementation may accept them as well. For instance, if `port_name` is (`hostname:port`), an implementation may accept (`ip_address:port`) as well.

### Name Publishing

The routines in this section provide a mechanism for publishing names. A (`service_name`, `port_name`) pair is published by the server, and may be retrieved by a client using the `service_name` only. An MPI implementation defines the *scope* of the `service_name`, that is, the domain over which the `service_name` can be retrieved. If the domain is the empty set, that is, if no client can retrieve the information, then we say that name publishing is not supported. Implementations should document how the scope is determined. High-quality implementations will give some control to users through the `info` arguments to name publishing functions. Examples are given in the descriptions of individual functions.

![[API/MPI_PUBLISH_NAME]]

This routine publishes the pair (`port_name`, `service_name`) so that an application may retrieve a system-supplied `port_name` using a well-known `service_name`.

The implementation must define the *scope* of a published service name, that is, the domain over which the service name is unique, and conversely, the domain over which the (`port_name`, `service_name`) pair may be retrieved. For instance, a service name may be unique to a job (where job is defined by a distributed operating system or batch scheduler), unique to a machine, or unique to a Kerberos realm. The scope may depend on the `info` argument to [[MPI_PUBLISH_NAME]] .

MPI permits publishing more than one `service_name` for a single `port_name`. On the other hand, if `service_name` has already been published within the scope determined by `info`, the behavior of [[MPI_PUBLISH_NAME]] is undefined. An MPI implementation may, through a mechanism in the `info` argument to [[MPI_PUBLISH_NAME]] , provide a way to allow multiple servers with the same service in the same scope. In this case, an implementation-defined policy will determine which of several port names is returned by [[MPI_LOOKUP_NAME]] .

Note that while `service_name` has a limited scope, determined by the implementation, `port_name` always has global scope within the communication universe used by the implementation (i.e., it is globally unique).

`port_name` should be the name of a port established by [[MPI_OPEN_PORT]] and not yet released by [[MPI_CLOSE_PORT]] . If it is not, the result is undefined.

> [!warning] Advice to implementors

> In some cases, an MPI implementation may use a name service that a user can also access directly. In this case, a name published by MPI could easily conflict with a name published by a user. In order to avoid such conflicts, MPI implementations should mangle service names so that they are unlikely to conflict with user code that makes use of the same service. Such name mangling will of course be completely transparent to the user.
>
> The following situation is problematic but unavoidable, if we want to allow implementations to use nameservers. Suppose there are multiple instances of “ocean” running on a machine. If the scope of a service name is confined to a job, then multiple oceans can coexist. If an implementation provides site-wide scope, however, multiple instances are not possible as all calls to [[MPI_PUBLISH_NAME]] after the first may fail. There is no universal solution to this.
>
> To handle these situations, a high-quality implementation should make it possible to limit the domain over which names are published.

![[API/MPI_UNPUBLISH_NAME]]

This routine unpublishes a service name that has been previously published. Attempting to unpublish a name that has not been published or has already been unpublished is erroneous and is indicated by the error class `MPI_ERR_SERVICE`.

All published names must be unpublished before the corresponding port is closed and before the publishing process exits. The behavior of [[MPI_UNPUBLISH_NAME]] is implementation dependent when a process tries to unpublish a name that it did not publish.

If the `info` argument was used with [[MPI_PUBLISH_NAME]] to tell the implementation how to publish names, the implementation may require that `info` passed to [[MPI_UNPUBLISH_NAME]] contain information to tell the implementation how to unpublish a name.

![[API/MPI_LOOKUP_NAME]]

This function retrieves a `port_name` published by [[MPI_PUBLISH_NAME]] with `service_name`. If `service_name` has not been published, it raises an error in the error class `MPI_ERR_NAME`. The application must supply a `port_name` buffer large enough to hold the largest possible port name (see discussion above under [[MPI_OPEN_PORT]] ).

If an implementation allows multiple entries with the same `service_name` within the same scope, a particular `port_name` is chosen in a way determined by the implementation.

If the `info` argument was used with [[MPI_PUBLISH_NAME]] to tell the implementation how to publish names, a similar `info` argument may be required for [[MPI_LOOKUP_NAME]] .

### Reserved Key Values



The following key values are reserved. An implementation is not required to interpret these key values, but if it does interpret the key value, it must provide the functionality described.

`ip_port`  
Value contains IP port number at which to establish a `port`. (Reserved for [[MPI_OPEN_PORT]] only).

`ip_address`  
Value contains IP address at which to establish a `port`. If the address is not a valid IP address of the host on which the [[MPI_OPEN_PORT]] call is made, the results are undefined. (Reserved for [[MPI_OPEN_PORT]] only).

### Client/Server Examples



Simplest Example—Completely Portable.

The following example shows the simplest way to use the client/server interface. It does not use service names at all.

On the server side:

       
        char myport[MPI_MAX_PORT_NAME];
        MPI_Comm intercomm;
        /* ... */
        MPI_Open_port(MPI_INFO_NULL, myport);
        printf("port name is: %s\n", myport);

        MPI_Comm_accept(myport, MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);
        /* do something with intercomm */

The server prints out the port name to the terminal and the user must type it in when starting up the client (assuming the MPI implementation supports `stdin` such that this works). On the client side:

        MPI_Comm intercomm;
        char name[MPI_MAX_PORT_NAME];
        printf("enter port name: "); 
        gets(name);
        MPI_Comm_connect(name, MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);

Ocean/Atmosphere—Relies on Name Publishing

In this example, the “ocean” application is the “server” side of a coupled ocean-atmosphere climate model. It assumes that the MPI implementation publishes names.

       
        MPI_Open_port(MPI_INFO_NULL, port_name);
        MPI_Publish_name("ocean", MPI_INFO_NULL, port_name);

        MPI_Comm_accept(port_name, MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);
        /* do something with intercomm */
        MPI_Unpublish_name("ocean", MPI_INFO_NULL, port_name);

On the client side:

        MPI_Lookup_name("ocean", MPI_INFO_NULL, port_name);
        MPI_Comm_connect(port_name, MPI_INFO_NULL, 0, MPI_COMM_SELF, 
                          &intercomm);

Simple Client-Server Example

This is a simple example; the server accepts only a single connection at a time and serves that connection until the client requests to be disconnected. The server is a single process.

Here is the server. It accepts a single connection and then processes data until it receives a message with tag `1`. A message with tag `0` tells the server to exit.

    #include "mpi.h"
    int main(int argc, char *argv[])
    {
        MPI_Comm client;
        MPI_Status status;
        char port_name[MPI_MAX_PORT_NAME];
        double buf[MAX_DATA];
        int    size, again;

        MPI_Init(&argc, &argv);
        MPI_Comm_size(MPI_COMM_WORLD, &size);
        if (size != 1) error(FATAL, "Server too big");
        MPI_Open_port(MPI_INFO_NULL, port_name);
        printf("server available at %s\n", port_name);
        while (1) {
            MPI_Comm_accept(port_name, MPI_INFO_NULL, 0, MPI_COMM_WORLD, 
                            &client);
            again = 1;
            while (again) {
                MPI_Recv(buf, MAX_DATA, MPI_DOUBLE, 
                         MPI_ANY_SOURCE, MPI_ANY_TAG, client, &status);
                switch (status.MPI_TAG) {
                    case 0: MPI_Comm_free(&client);
                            MPI_Close_port(port_name);
                            MPI_Finalize();
                            return 0;
                    case 1: MPI_Comm_disconnect(&client);
                            again = 0;
                            break;
                    case 2: /* do something */
                    ...
                    default:
                            /* Unexpected message type */
                            MPI_Abort(MPI_COMM_WORLD, 1);
                    }
                }
            }
    }

Here is the client.

    #include "mpi.h"
    int main(int argc, char *argv[])
    {
        MPI_Comm server;
        int done = 0;
        double buf[MAX_DATA];
        char port_name[MPI_MAX_PORT_NAME];

        MPI_Init(&argc, &argv);
        strcpy(port_name, argv[1]);/* assume server's name is cmd-line arg */

        MPI_Comm_connect(port_name, MPI_INFO_NULL, 0, MPI_COMM_WORLD, 
                         &server);

        while (!done) {
            tag = 2; /* Action to perform */
            MPI_Send(buf, n, MPI_DOUBLE, 0, tag, server);
            /* etc */
            }
        MPI_Send(buf, 0, MPI_DOUBLE, 0, 1, server);
        MPI_Comm_disconnect(&server);
        MPI_Finalize();
        return 0;
    }

## Other Functionality

### Universe Size



Many “dynamic” MPI applications are expected to exist in a static runtime environment, in which resources have been allocated before the application is run. When running one of these quasi-static applications, the user (or possibly a batch system) will usually specify a number of processes to start and a total number of processes that are expected. An application simply needs to know how many slots there are, i.e., how many processes it should spawn.

MPI provides an attribute on `MPI_COMM_WORLD`, `MPI_UNIVERSE_SIZE`, that allows the application to obtain this information in a portable manner. This attribute indicates the total number of processes that are expected. In Fortran, the attribute is the integer value. In C, the attribute is a pointer to the integer value. An application typically subtracts the size of `MPI_COMM_WORLD` from `MPI_UNIVERSE_SIZE` to find out how many processes it should spawn. `MPI_UNIVERSE_SIZE` is initialized in [[MPI_INIT]] and is not changed by MPI. If defined, it has the same value on all processes of `MPI_COMM_WORLD`. `MPI_UNIVERSE_SIZE` is determined by the application startup mechanism in a way not specified by MPI. (The size of `MPI_COMM_WORLD` is another example of such a parameter.)

Possibilities for how `MPI_UNIVERSE_SIZE` might be set include:

- A `-universe_size` argument to a program that starts MPI processes.

- Automatic interaction with a batch scheduler to figure out how many processors have been allocated to an application.

- An environment variable set by the user.

- Extra information passed to [[MPI_COMM_SPAWN]] through the `info` argument.

An implementation must document how `MPI_UNIVERSE_SIZE` is set. An implementation may not support the ability to set `MPI_UNIVERSE_SIZE`, in which case the attribute `MPI_UNIVERSE_SIZE` is not set.

`MPI_UNIVERSE_SIZE` is a recommendation, not necessarily a hard limit. For instance, some implementations may allow an application to spawn 50 processes per processor, if they are requested. However, it is likely that the user only wants to spawn one process per processor.

`MPI_UNIVERSE_SIZE` is assumed to have been specified when an application was started, and is in essence a portable mechanism to allow the user to pass to the application (through the MPI process startup mechanism, such as `mpiexec`) a piece of critical runtime information. Note that no interaction with the runtime environment is required. If the runtime environment changes size while an application is running, `MPI_UNIVERSE_SIZE` is not updated, and the application must find out about the change through direct communication with the runtime system.

### Singleton MPI Initialization



A high-quality implementation will allow any process (including those not started with a “parallel application” mechanism) to become an MPI process by calling [[MPI_INIT]] , [[MPI_INIT_THREAD]] , or [[MPI_SESSION_INIT]] . Such a process can then connect to other MPI processes using the [[MPI_COMM_ACCEPT]] and [[MPI_COMM_CONNECT]] routines, or spawn other MPI processes. MPI does not mandate this behavior, but strongly encourages it where technically feasible.

> [!warning] Advice to implementors

> Special coordination is required to start MPI processes belonging to the same `MPI_COMM_WORLD` in the case of the World Model, or the same `mpi://WORLD` process set in the Sessions Model. The processes must be started at the “same” time, they must have a mechanism to establish communication, etc. Either the user or the operating system must take special steps beyond simply starting processes.
>
> Considering the World Model, when an application enters [[MPI_INIT]] , clearly it must be able to determine if these special steps were taken. If a process enters [[MPI_INIT]] and determines that no special steps were taken (i.e., it has not been given the information to form an `MPI_COMM_WORLD` with other processes) it succeeds and forms a singleton MPI program, that is, one in which `MPI_COMM_WORLD` has size 1.
>
> In some implementations, MPI may not be able to function without an “MPI environment.” For example, MPI may require that daemons be running or MPI may not be able to work at all on the front-end of an MPP. In this case, an MPI implementation may either
>
> 1.  Create the environment (e.g., start a daemon) or
>
> 2.  Raise an error if it cannot create the environment and the environment has not been started independently.
>
> A high-quality implementation will try to create a singleton MPI process and not raise an error.

### `MPI_APPNUM`

There is a predefined attribute `MPI_APPNUM` of `MPI_COMM_WORLD`. In Fortran, the attribute is an integer value. In C, the attribute is a pointer to an integer value. If a process was spawned with [[MPI_COMM_SPAWN_MULTIPLE]] , `MPI_APPNUM` is the command number that generated the current process. Numbering starts from zero. If a process was spawned with [[MPI_COMM_SPAWN]] , it will have `MPI_APPNUM` equal to zero.

Additionally, if the process was not started by a spawn call, but by an implementation-specific startup mechanism that can handle multiple process specifications, `MPI_APPNUM` should be set to the number of the corresponding process specification. In particular, if it is started with

        mpiexec spec0 [: spec1 : spec2 : ...]

`MPI_APPNUM` should be set to the number of the corresponding specification.

If an application was not spawned with [[MPI_COMM_SPAWN]] or [[MPI_COMM_SPAWN_MULTIPLE]] , and `MPI_APPNUM` does not make sense in the context of the implementation-specific startup mechanism, `MPI_APPNUM` is not set.

MPI implementations may optionally provide a mechanism to override the value of `MPI_APPNUM` through the `info` argument. MPI reserves the following key for all [[SPAWN]] calls.

`appnum`  
Value contains an integer that overrides the default value for `MPI_APPNUM` in the child.

> [!tip] Rationale

> When a single application is started, it is able to figure out how many processes there are by looking at the size of `MPI_COMM_WORLD`. An application consisting of multiple SPMD sub-applications has no way to find out how many sub-applications there are and to which sub-application the process belongs. While there are ways to figure it out in special cases, there is no general mechanism. `MPI_APPNUM` provides such a general mechanism.

### Releasing Connections

 Before a client and a server connect, they are independent MPI applications. An error in one does not affect the other. After establishing a connection with [[MPI_COMM_CONNECT]] and [[MPI_COMM_ACCEPT]] , an error in one may affect the other. It is desirable for a client and a server to be able to disconnect, so that an error in one will not affect the other. Similarly, it might be desirable for a parent and child to disconnect, so that errors in the child do not affect the parent, or vice-versa.

- Two processes are **connected** if there is a communication path (direct or indirect) between them. More precisely:

  1.  Two processes are connected if

      1.  they both belong to the same communicator (inter- or intra-, including `MPI_COMM_WORLD`) *or*

      2.  they have previously belonged to a communicator that was freed with [[MPI_COMM_FREE]] instead of [[MPI_COMM_DISCONNECT]] *or*

      3.  they both belong to the group of the same window or file handle.

  2.  If A is connected to B and B to C, then A is connected to C.

- Two processes are **disconnected** (also **independent**) if they are not connected.

- By the above definitions, connectivity is a transitive property, and divides the universe of MPI processes into disconnected (independent) sets (equivalence classes) of processes.

- Processes which are connected, but do not share the same `MPI_COMM_WORLD`, may become disconnected (independent) if the communication path between them is broken by using [[MPI_COMM_DISCONNECT]] .

The following additional rules apply to MPI routines in other chapters:

- [[MPI_FINALIZE]] is collective over a set of connected processes.

- [[MPI_ABORT]] does not abort independent processes. It may abort all processes in the caller’s `MPI_COMM_WORLD` (ignoring its `comm` argument). Additionally, it may abort connected processes as well, though it makes a “best attempt” to abort only the processes in `comm`.

- If a process terminates without calling [[MPI_FINALIZE]] , independent processes are not affected but the effect on connected processes is not defined.

> [!warning] Advice to implementors

> In practice, it may be difficult to distinguish between an MPI process failure
>
> and an erroneous program that terminates without calling an MPI finalization function: an implementation that defines semantics for process failure management may have to exhibit the behavior defined for MPI process failures with such erroneous programs. A high quality implementation should exhibit a different behavior for erroneous programs and MPI process failures.

![[API/MPI_COMM_DISCONNECT]]

This function waits for all pending communication on `comm` to complete internally, deallocates the communicator object, and sets the handle to `MPI_COMM_NULL`. It is a collective operation.

It may not be called with the communicator `MPI_COMM_WORLD` or `MPI_COMM_SELF`.

[[MPI_COMM_DISCONNECT]] may be called only if all communication is complete and matched, so that buffered data can be delivered to its destination. This requirement is the same as for [[MPI_FINALIZE]] .

[[MPI_COMM_DISCONNECT]] has the same action as [[MPI_COMM_FREE]] , except that it waits for pending communication to finish internally and enables the guarantee about the behavior of disconnected processes.

> [!note] Advice to users

> To disconnect two processes you may need to call [[MPI_COMM_DISCONNECT]] , [[MPI_WIN_FREE]] , and [[MPI_FILE_CLOSE]] to remove all communication paths between the two processes. Note that it may be necessary to disconnect several communicators (or to free several windows or files) before two processes are completely independent.

> [!tip] Rationale

> It would be nice to be able to use [[MPI_COMM_FREE]] instead, but that function explicitly does not wait for pending communication to complete.

### Another Way to Establish MPI Communication

![[API/MPI_COMM_JOIN]]

[[MPI_COMM_JOIN]] is intended for MPI implementations that exist in an environment supporting the Berkeley Socket interface . Implementations that exist in an environment not supporting Berkeley Sockets should provide the entry point for [[MPI_COMM_JOIN]] and should return `MPI_COMM_NULL`.

This call creates an inter-communicator from the union of two MPI processes which are connected by a socket. [[MPI_COMM_JOIN]] should normally succeed if the local and remote processes have access to the same implementation-defined MPI communication universe.

> [!note] Advice to users

> An MPI implementation may require a specific communication medium for MPI communication, such as a shared memory segment or a special switch. In this case, it may not be possible for two processes to successfully join even if there is a socket connecting them and they are using the same MPI implementation.

> [!warning] Advice to implementors

> A high-quality implementation will attempt to establish communication over a slow medium if its preferred one is not available. If implementations do not do this, they must document why they cannot do MPI communication over the medium used by the socket (especially if the socket is a TCP connection).

`fd` is a file descriptor representing a socket of type `SOCK_STREAM` (a two-way reliable byte-stream connection). Nonblocking I/O and asynchronous notification via `SIGIO` must not be enabled for the socket. The socket must be in a connected state. The socket must be quiescent when [[MPI_COMM_JOIN]] is called (see below). It is the responsibility of the application to create the socket using standard socket API calls.

[[MPI_COMM_JOIN]] must be called by the process at each end of the socket. It does not return until both processes have called [[MPI_COMM_JOIN]] . The two processes are referred to as the local and remote processes.

MPI uses the socket to bootstrap creation of the inter-communicator, and for nothing else. Upon return from [[MPI_COMM_JOIN]] , the file descriptor will be open and quiescent (see below).

If MPI is unable to create an inter-communicator, but is able to leave the socket in its original state, with no pending communication, it succeeds and sets `intercomm` to `MPI_COMM_NULL`.

The socket must be quiescent before [[MPI_COMM_JOIN]] is called and after [[MPI_COMM_JOIN]] returns. More specifically, on entry to [[MPI_COMM_JOIN]] , a `read` on the socket will not read any data that was written to the socket before the remote process called [[MPI_COMM_JOIN]] . On exit from [[MPI_COMM_JOIN]] , a `read` will not read any data that was written to the socket before the remote process returned from [[MPI_COMM_JOIN]] . It is the responsibility of the application to ensure the first condition, and the responsibility of the MPI implementation to ensure the second. In a multithreaded application, the application must ensure that one thread does not access the socket while another is calling [[MPI_COMM_JOIN]] , or call [[MPI_COMM_JOIN]] concurrently.

> [!warning] Advice to implementors

> MPI is free to use any available communication path(s) for MPI messages in the new communicator; the socket is only used for the initial handshaking.

[[MPI_COMM_JOIN]] uses non-MPI communication to do its work. The interaction of non-MPI communication with pending MPI communication is not defined. Therefore, the result of calling [[MPI_COMM_JOIN]] on two connected processes (see [[dynamic#Releasing Connections|Releasing Connections]] for the definition of connected) is undefined.

The returned communicator may be used to establish MPI communication with additional processes, through the usual MPI communicator creation mechanisms.
