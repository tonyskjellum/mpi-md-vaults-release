---
title: "Starting MPI Processes"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Starting MPI Processes

Chapter **dynamic** · in [[versions/v40/sections/dynamic#Starting MPI Processes|MPI-4.0]], [[versions/v41/sections/dynamic#Starting MPI Processes|MPI-4.1]], [[versions/v50/sections/dynamic#Starting MPI Processes|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

[[versions/v21/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] starts MPI processes and establishes communication with them, returning an intercommunicator. [[versions/v21/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] starts several different binaries (or the same binary with different arguments), placing them in the same ~~[[MPI_COMM_WORLD]]~~ ==MPI_COMM_WORLD== and returning an intercommunicator.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

MPI applications may start new processes through an interface to an external process ~~manager, which can range from a parallel operating system (CMOST) to layered software (POE) to an `rsh` command (p4).~~ ==manager.==

[[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] starts MPI processes and establishes communication with them, returning an intercommunicator. [[versions/v22/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] starts several different binaries (or the same binary with different arguments), placing them in the same ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== and returning an intercommunicator.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

MPI uses the ~~existing~~ group abstraction to represent processes. A process is identified by a (group, rank) pair.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~MPI applications may start new processes through an interface to an external process manager.~~

~~[[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] starts MPI processes and establishes communication with them, returning an intercommunicator. [[versions/v40/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] starts several different binaries (or the same binary with different arguments), placing them in the same `MPI_COMM_WORLD` and returning an intercommunicator.~~

~~MPI uses the group abstraction to represent processes. A process is identified by a (group, rank) pair.~~

==When using the World Model, MPI is initialized by calling either [[versions/v40/API/MPI_INIT|MPI_INIT]] or [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] .==

==![[versions/v40/API/MPI_INIT]]==

==In the World Model, an MPI program must contain exactly one call to an MPI initialization routine: [[versions/v40/API/MPI_INIT|MPI_INIT]] or [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . `MPI_COMM_WORLD` and `MPI_COMM_SELF` are not valid for use as communicators prior to invocation of [[versions/v40/API/MPI_INIT|MPI_INIT]] or [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . Subsequent calls to either of these initialization routines are erroneous. A subset of MPI functions may be invoked before MPI initialization routines are called. See Section [[versions/v40/sections/dynamic#Common Elements of Both Process Models|Common Elements of Both Process Models]] . [[versions/v40/API/MPI_INIT|MPI_INIT]] accepts the `argc` and `argv` that are provided by the arguments to `main` or `NULL`:==

==    int main(int argc, char *argv[])     {         MPI_Init(&argc, &argv);==

==        /* parse arguments */         /* main program    */==

==        MPI_Finalize();     /* see below */         return 0;      }==

==The Fortran version takes only `IERROR`.==

==Conforming implementations of MPI are required to allow applications to pass `NULL` for both the `argc` and `argv` arguments of `main` in C.==

==Failures may disrupt the execution of the program before or during MPI initialization. A high-quality implementation shall not deadlock during MPI initialization, even in the presence of failures. Except for functions with the `MPI_T_` prefix, failures in MPI operations prior to or during MPI initialization are reported by invoking the initial error handler. Users can use the `mpi_initial_errhandler` info key during the launch of MPI processes (e.g., [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] / [[versions/v40/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] , or [[mpiexec]] ) to set a non-fatal initial error handler before MPI initialization. When the initial error handler is set to `MPI_ERRORS_ABORT`, raising an error before or during initialization aborts the local MPI process (i.e., it is similar to calling [[versions/v40/API/MPI_ABORT|MPI_ABORT]] on `MPI_COMM_SELF`).==

==An implementation may not always be capable of determining, before MPI initialization, what constitutes the local MPI process, or the set of connected processes. In this case, errors before initialization may cause a different set of MPI processes to abort than specified.==

==During MPI initialization, the initial error handler is associated with `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and the communicator returned by [[versions/v40/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] (if any).==

==> [!warning] Advice to implementors==

==> Some failures may leave MPI in an undefined state, or raise an error before the error handling capabilities are fully operational, in which cases the implementation may be incapable of providing the desired error handling behavior. Of note, in some implementations, the notion of an MPI process is not clearly established in the early stages of MPI initialization (for example, when the implementation considers threads that called [[versions/v40/API/MPI_INIT|MPI_INIT]] as independent MPI processes); in this case, before MPI is initialized, the `MPI_ERRORS_ABORT` error handler may abort what would have become multiple MPI processes. > > When a failure occurs during MPI initialization, the implementation may decide to return `MPI_SUCCESS` from the MPI initialization function instead of raising an error. It is recommended that an implementation masks an initialization error only when it expects that later MPI calls will result in well-specified behavior (i.e., barring additional failures, either the outcome of any call will be correct, or the call will raise an appropriate error). For example, it may be difficult for an implementation to avoid unspecified behavior when the group of `MPI_COMM_WORLD` does not contain the same set of MPI processes at all members of the communicator, or if the communicator returned from [[versions/v40/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] was not initialized correctly.==

==After MPI is initialized, the application can access information about the execution environment by querying the predefined info object `MPI_INFO_ENV`. The following keys are predefined for this object, corresponding to the arguments of [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] or of [[mpiexec]] :==

==`command`   Name of program executed.==

==`argv`   Space separated arguments to command.==

==`maxprocs`   Maximum number of MPI processes to start.==

==`mpi_initial_errhandler`   Name of the initial errhandler.==

==`soft`   Allowed values for number of processors.==

==`host`   Hostname.==

==`arch`   Architecture name.==

==`wdir`   Working directory of the MPI process.==

==`file`   Value is the name of a file in which additional information is specified.==

==`thread_level`   Requested level of thread support, if requested before the program started execution.==

==Note that all values are strings. Thus, the maximum number of processes is represented by a string such as `"1024"` and the requested level is represented by a string such as `"MPI_THREAD_SINGLE"`.==

==> [!note] Advice to users==

==> If one of the `argv` arguments contains a space, there is no way to tell from the value of the `argv` info key whether a space is part of the argument or is separating different arguments.==

==The info object `MPI_INFO_ENV` need not contain a (key,value) pair for each of these predefined keys; the set of (key,value) pairs provided is implementation-dependent. Implementations may provide additional, implementation specific, (key,value) pairs.==

==In cases where the MPI processes were started with [[versions/v40/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] or, equivalently, with a startup mechanism that supports multiple process specifications, then the values stored in the info object `MPI_INFO_ENV` at a process are those values that affect the local MPI process.==

==If MPI is started with a call to==

==        mpiexec -n 5 -arch x86_64 ocean : -n 10 -arch power9 atmos==

==Then the first 5 processes will have in their `MPI_INFO_ENV` object the pairs `(command, ocean)`, `(maxprocs, 5)`, and `(arch, x86_64)`. The next 10 processes will have in `MPI_INFO_ENV` `(command, atmos)`, `(maxprocs, 10)`, and `(arch, power9)`==

==> [!note] Advice to users==

==> The values passed in `MPI_INFO_ENV` are the values of the arguments passed to the mechanism that started the MPI execution—not the actual value provided. Thus, the value associated with `maxprocs` is the number of MPI processes requested; it can be larger than the actual number of processes obtained, if the `soft` option was used.==

==> [!warning] Advice to implementors==

==> High-quality implementations will provide a (key,value) pair for each parameter that can be passed to the command that starts an MPI program.==

==The following function may be used to initialize MPI, and to initialize the MPI thread environment, instead of [[versions/v40/API/MPI_INIT|MPI_INIT]] .==

==![[versions/v40/API/MPI_INIT_THREAD]]==

==This call initializes MPI in the same way that a call to [[versions/v40/API/MPI_INIT|MPI_INIT]] would. In addition, it initializes the thread environment. The argument `required` is used to specify the desired level of thread support. The possible values are listed in increasing order of thread support.==

==`MPI_THREAD_SINGLE`   Only one thread will execute.==

==`MPI_THREAD_FUNNELED`   The process may be multithreaded, but the application must ensure that only the main thread makes MPI calls (for the definition of main thread, see [[versions/v40/API/MPI_IS_THREAD_MAIN|MPI_IS_THREAD_MAIN]] on page [[function-mpiisthreadmain]] ).==

==`MPI_THREAD_SERIALIZED`   The process may be multithreaded, and multiple threads may make MPI calls, but only one at a time: MPI calls are not made concurrently from two distinct threads (all MPI calls are “serialized”).==

==`MPI_THREAD_MULTIPLE`   Multiple threads may call MPI, with no restrictions.==

==These values are monotonic; i.e., `MPI_THREAD_SINGLE` $`<`$ `MPI_THREAD_FUNNELED` $`<`$ `MPI_THREAD_SERIALIZED` $`<`$ `MPI_THREAD_MULTIPLE`.==

==Different processes in `MPI_COMM_WORLD` may require different levels of thread support.==

==The call returns in `provided` information about the actual level of thread support that will be provided by MPI. It can be one of the four values listed above.==

==The level(s) of thread support that can be provided by [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will depend on the implementation, and may depend on information provided by the user before the program started to execute (e.g., with==

==arguments to `mpiexec`). If possible, the call will return `provided``=``required`. Failing this, the call will return the least supported level such that `provided` $`>`$ `required` (thus providing a stronger level of support than required by the user). Finally, if the user requirement cannot be satisfied, then the call will return in `provided` the highest supported level.==

==A **thread compliant** MPI implementation will be able to return `provided` `=``MPI_THREAD_MULTIPLE`. Such an implementation may always return `provided` `=``MPI_THREAD_MULTIPLE`, irrespective of the value of `required`.==

==An MPI library that is not thread compliant must always return `provided``=``MPI_THREAD_SINGLE`, even if [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] is called on a multithreaded process. The library should also return correct values for the MPI calls that can be executed before initialization, even if multiple threads have been spawned.==

==> [!tip] Rationale==

==> Such code is erroneous, but if the MPI initialization is performed by a library, the error cannot be detected until [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] is called. The requirements in the previous paragraph ensure that the error can be properly detected.==

==A call to [[versions/v40/API/MPI_INIT|MPI_INIT]] has the same effect as a call to [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] with a `required``=``MPI_THREAD_SINGLE`.==

==Vendors may provide (implementation dependent) means to specify the level(s) of thread support available when the MPI==

==program is started, e.g., with arguments to `mpiexec`. This will affect the outcome of calls to [[versions/v40/API/MPI_INIT|MPI_INIT]] and [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . Suppose, for example, that an MPI program has been started so that only `MPI_THREAD_MULTIPLE` is available. Then [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided``=``MPI_THREAD_MULTIPLE`, irrespective of the value of `required`; a call to [[versions/v40/API/MPI_INIT|MPI_INIT]] will also initialize the MPI thread support level to `MPI_THREAD_MULTIPLE`. Suppose, instead, that an MPI program has been started so that all four levels of thread support are available. Then, a call to [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided``=``required`; alternatively, a call to [[versions/v40/API/MPI_INIT|MPI_INIT]] will initialize the MPI thread support level to `MPI_THREAD_SINGLE`.==

==> [!tip] Rationale==

==> Various optimizations are possible when MPI code is executed single-threaded, or is executed on multiple threads, but not concurrently: mutual exclusion code may be omitted. Furthermore, if only one thread executes, then the MPI library can use library functions that are not thread safe, without risking conflicts with user threads. Also, the model of one communication thread, multiple computation threads fits many applications well, e.g., if the process code is a sequential Fortran/C program with MPI calls that has been parallelized by a compiler for execution on an SMP node, in a cluster of SMPs, then the process computation is multithreaded, but MPI calls will likely execute on a single thread. > > The design accommodates a static specification of the thread support level, for environments that require static binding of libraries, and for compatibility for current multithreaded MPI codes.==

==> [!warning] Advice to implementors==

==> If `provided` is not `MPI_THREAD_SINGLE` then the MPI library should not invoke C or Fortran library calls that are not thread safe, e.g., in an environment where `malloc` is not thread safe, then `malloc` should not be used by the MPI library. > > Some implementors may want to use different MPI libraries for different levels of thread support. They can do so using dynamic linking and selecting which library will be linked when [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] is invoked. If this is not possible, then optimizations for lower levels of thread support will occur only when the level of thread support required is specified at link time. > > Note that `required` need not be the same value on all processes of `MPI_COMM_WORLD`.==

==As with [[versions/v40/API/MPI_INIT|MPI_INIT]] , discussed in Section [[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]] , the version for ISO C accepts the `argc` and `argv` that are provided by the arguments to `main` or `NULL` for both arguments.==

==The following function can be used to query the current level of thread support.==

==![[versions/v40/API/MPI_QUERY_THREAD]]==

==The call returns in `provided` the current level of thread support, which will be the value returned in `provided` by [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , if MPI was initialized by a call to [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . This function is only applicable when using the World Model to initialize MPI. In the case of applications using both the World Model and the Sessions Model, this function only returns the thread support level returned in `provided` by [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] .==

==![[versions/v40/API/MPI_IS_THREAD_MAIN]]==

==This function can be called by a thread to determine if it is the main thread (the thread that called [[versions/v40/API/MPI_INIT|MPI_INIT]] or [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] ). This function is only applicable when using the World Model to initialize MPI. In the case of applications using both the World Model and the Sessions Model, the behavior of this procedure is the same as if the application were only using the World Model.==

==All routines listed in this section must be supported by all MPI implementations.==

==> [!tip] Rationale==

==> MPI libraries are required to provide these calls even if they do not support threads, so that portable code that contains invocations to these functions can link correctly. [[versions/v40/API/MPI_INIT|MPI_INIT]] continues to be supported so as to provide compatibility with current MPI codes.==

==> [!note] Advice to users==

==> It is possible to spawn threads before MPI is initialized, but `MPI_COMM_WORLD` and `MPI_COMM_SELF` cannot be used until the World Model is active, *i.e.*, until [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] is invoked by one thread (which, thereby, becomes the main thread). In particular, it is possible to enter the MPI execution with a multithreaded process. > > In the World Model, the level of thread support provided is a global property of the MPI process that can be specified only once, when MPI is initialized on that process (or before). Portable third party libraries have to be written so as to accommodate any provided level of thread support. Otherwise, their usage will be restricted to specific level(s) of thread support. If such a library can run only with specific level(s) of thread support, e.g., only with `MPI_THREAD_MULTIPLE`, then [[versions/v40/API/MPI_QUERY_THREAD|MPI_QUERY_THREAD]] can be used to check whether the user initialized MPI to the correct level of thread support.==

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

~~In the World Model, an MPI program must contain exactly one call to an MPI initialization routine: [[versions/v41/API/MPI_INIT|MPI_INIT]] or [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . `MPI_COMM_WORLD` and `MPI_COMM_SELF` are not valid for use as communicators prior to invocation of [[versions/v41/API/MPI_INIT|MPI_INIT]] or [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . Subsequent calls to either of these initialization routines are erroneous. A subset of MPI functions may be invoked before MPI initialization routines are called. See Section [[versions/v41/sections/dynamic#Common Elements of Both Process Models|Common Elements of Both Process Models]] . [[versions/v41/API/MPI_INIT|MPI_INIT]] accepts the `argc` and `argv` that are provided by the arguments to `main` or `NULL`:~~

~~    int main(int argc, char *argv[])     {         MPI_Init(&argc, &argv);~~

~~        /* parse arguments */         /* main program    */~~

~~        MPI_Finalize();     /* see below */         return 0;      }~~

==In the World Model, an MPI program must contain exactly one call to an MPI initialization routine: [[versions/v41/API/MPI_INIT|MPI_INIT]] or [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . `MPI_COMM_WORLD` and `MPI_COMM_SELF` are not valid for use as communicators prior to invocation of [[versions/v41/API/MPI_INIT|MPI_INIT]] or [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . Subsequent calls to either of these initialization routines are erroneous. A subset of MPI functions may be invoked before MPI initialization routines are called, see [[versions/v41/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] . The procedures `MPI_INIT` and `MPI_INIT_THREAD` accept either the `argc` and `argv` that are provided by the arguments to `main` or `NULL`.==

==Initializing MPI using [[versions/v41/API/MPI_INIT|MPI_INIT]]==

==(code block added)==
``` [MPI]C
int main(int argc, char *argv[])
{
    MPI_Init(&argc, &argv);

    /* parse arguments */
    /* main program    */

    MPI_Finalize();     /* see below */
    return 0;
}
```

Failures may disrupt the execution of the program before or during MPI initialization. A high-quality implementation shall not deadlock during MPI initialization, even in the presence of failures. Except for functions with the `MPI_T_` prefix, failures in MPI operations prior to or during MPI initialization are reported by invoking the initial error handler. Users can use the `mpi_initial_errhandler` info key during the launch of MPI processes (e.g., [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] / [[versions/v41/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] , or [[mpiexec]] ) to set a ~~non-fatal~~ ==nonfatal== initial error handler before MPI initialization. When the initial error handler is set to `MPI_ERRORS_ABORT`, raising an error before or during initialization aborts the local MPI process (i.e., it is similar to calling [[versions/v41/API/MPI_ABORT|MPI_ABORT]] on `MPI_COMM_SELF`).

~~`command`   Name of program executed.~~

~~`argv`   Space separated arguments to command.~~

~~`maxprocs`   Maximum number of MPI processes to start.~~

~~`mpi_initial_errhandler`   Name of the initial errhandler.~~

~~`soft`   Allowed values for number of processors.~~

~~`host`   Hostname.~~

~~`arch`   Architecture name.~~

~~`wdir`   Working directory of the MPI process.~~

~~`file`   Value is the name of a file in which additional information is specified.~~

~~`thread_level`   Requested level of thread support, if requested before the program started execution.~~

==`command`:   Name of program executed.==

==`argv`:   Space separated arguments to command.==

==`maxprocs`:   Maximum number of MPI processes to start.==

==`mpi_initial_errhandler`:   Name of the initial errhandler.==

==`mpi_memory_alloc_kinds`:   Memory allocation kinds supported by the MPI library (see Section [[versions/v41/sections/dynamic#Memory Allocation Info|Memory Allocation Info]] ).==

==`soft`:   Allowed values for number of processors.==

==`host`:   Hostname.==

==`arch`:   Architecture name.==

==`wdir`:   Working directory of the MPI process.==

==`file`:   Value is the name of a file in which additional information is specified.==

==`thread_level`:   Requested level of thread support, if requested before the program started execution.==

~~`MPI_THREAD_SINGLE`~~ ==`MPI_THREAD_SINGLE`:== Only one thread will execute.

~~`MPI_THREAD_FUNNELED`~~ ==`MPI_THREAD_FUNNELED`:== The process may be multithreaded, but the application must ensure that only the main thread makes MPI calls (for the definition of main thread, see [[versions/v41/API/MPI_IS_THREAD_MAIN|MPI_IS_THREAD_MAIN]] on page [[function-mpiisthreadmain]] ).

~~`MPI_THREAD_SERIALIZED`~~ ==`MPI_THREAD_SERIALIZED`:== The process may be multithreaded, and multiple threads may make MPI calls, but only one at a time: MPI calls are not made concurrently from two distinct threads (all MPI calls are “serialized”).

~~`MPI_THREAD_MULTIPLE`~~ ==`MPI_THREAD_MULTIPLE`:== Multiple threads may call MPI, with no restrictions.

> It is possible to spawn threads before MPI is initialized, but `MPI_COMM_WORLD` and `MPI_COMM_SELF` cannot be used until the World Model is active, ~~*i.e.*,~~ ==i.e.,== until [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] is invoked by one thread (which, thereby, becomes the main thread). In particular, it is possible to enter the MPI execution with a multithreaded process. > > In the World Model, the level of thread support provided is a global property of the MPI process that can be specified only once, when MPI is initialized on that process (or before). Portable third party libraries have to be written so as to accommodate any provided level of thread support. Otherwise, their usage will be restricted to specific level(s) of thread support. If such a library can run only with specific level(s) of thread support, e.g., only with `MPI_THREAD_MULTIPLE`, then [[versions/v41/API/MPI_QUERY_THREAD|MPI_QUERY_THREAD]] can be used to check whether the user initialized MPI to the correct level of thread support.

### MPI-4.1 → MPI-5.0  (6 changed paragraphs)

Failures may disrupt the execution of the program before or during MPI initialization. A high-quality implementation shall not deadlock during MPI initialization, even in the presence of failures. Except for functions with the `MPI_T_` prefix, failures in MPI operations prior to or during MPI initialization are reported by invoking the initial error handler. Users can use the `mpi_initial_errhandler` info key during the launch of MPI processes (e.g., [[versions/v50/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] ~~/~~ ==,== [[versions/v50/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] , or ~~[[mpiexec]] )~~ ==`mpiexec`)== to set a nonfatal initial error handler before MPI initialization. When the initial error handler is set to `MPI_ERRORS_ABORT`, raising an error before or during initialization aborts the local MPI process (i.e., it is similar to calling [[versions/v50/API/MPI_ABORT|MPI_ABORT]] on `MPI_COMM_SELF`).

After MPI is initialized, the application can access information about the execution environment by querying the predefined info object `MPI_INFO_ENV`. The following keys are predefined for this object, corresponding to the arguments of [[versions/v50/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] or of ~~[[mpiexec]] :~~ ==`mpiexec`:==

`mpi_memory_alloc_kinds`: ~~Memory~~ ==Requested memory== allocation kinds ~~supported by the MPI library~~ (see Section [[versions/v50/sections/dynamic#Memory Allocation Info|Memory Allocation Info]] ).

Then the first 5 processes will have in their `MPI_INFO_ENV` object the pairs `(command, ocean)`, `(maxprocs, 5)`, and `(arch, x86_64)`. The next 10 processes will have in `MPI_INFO_ENV` `(command, atmos)`, `(maxprocs, 10)`, and `(arch, ~~power9)`~~ ==power9)`.==

~~The level(s) of thread support that can be provided by [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will depend on the implementation, and may depend on information provided by the user before the program started to execute (e.g., with~~

~~arguments to `mpiexec`). If possible, the call will return `provided``=``required`. Failing this, the call will return the least supported level such that `provided` $`>`$ `required` (thus providing a stronger level of support than required by the user). Finally, if the user requirement cannot be satisfied, then the call will return in `provided` the highest supported level.~~

==The level(s) of thread support that can be provided by [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will depend on the implementation, and may depend on information provided by the user before the program started to execute (e.g., with arguments to `mpiexec`). If possible, the call will return `provided``=``required`. Failing this, the call will return the least supported level such that `provided` $`>`$ `required` (thus providing a stronger level of support than required by the user). Finally, if the user requirement cannot be satisfied, then the call will return in `provided` the highest supported level.==

~~Vendors may provide (implementation dependent) means to specify the level(s) of thread support available when the MPI~~

~~program is started, e.g., with arguments to `mpiexec`. This will affect the outcome of calls to [[versions/v50/API/MPI_INIT|MPI_INIT]] and [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . Suppose, for example, that an MPI program has been started so that only `MPI_THREAD_MULTIPLE` is available. Then [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided``=``MPI_THREAD_MULTIPLE`, irrespective of the value of `required`; a call to [[versions/v50/API/MPI_INIT|MPI_INIT]] will also initialize the MPI thread support level to `MPI_THREAD_MULTIPLE`. Suppose, instead, that an MPI program has been started so that all four levels of thread support are available. Then, a call to [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided``=``required`; alternatively, a call to [[versions/v50/API/MPI_INIT|MPI_INIT]] will initialize the MPI thread support level to `MPI_THREAD_SINGLE`.~~

==Vendors may provide (implementation dependent) means to specify the level(s) of thread support available when the MPI program is started, e.g., with arguments to `mpiexec`. This will affect the outcome of calls to [[versions/v50/API/MPI_INIT|MPI_INIT]] and [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . Suppose, for example, that an MPI program has been started so that only `MPI_THREAD_MULTIPLE` is available. Then [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided``=``MPI_THREAD_MULTIPLE`, irrespective of the value of `required`; a call to [[versions/v50/API/MPI_INIT|MPI_INIT]] will also initialize the MPI thread support level to `MPI_THREAD_MULTIPLE`. Suppose, instead, that an MPI program has been started so that all four levels of thread support are available. Then, a call to [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided``=``required`; alternatively, a call to [[versions/v50/API/MPI_INIT|MPI_INIT]] will initialize the MPI thread support level to `MPI_THREAD_SINGLE`.==

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Starting MPI Processes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Starting MPI Processes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Starting MPI Processes]]
